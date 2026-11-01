package main

import (
	"database/sql"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestSQLiteCombatRemoveValidatesIndexAndClearsLastCombatant(t *testing.T) {
	originalDB := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = originalDB })
	_, err = db.Exec(`CREATE TABLE agents (id INTEGER, password_hash TEXT, salt TEXT, verified BOOLEAN);
 CREATE TABLE lobbies (id INTEGER, dm_id INTEGER);
 CREATE TABLE combat_state (lobby_id INTEGER, round_number INTEGER, current_turn_index INTEGER, turn_order TEXT, active BOOLEAN, turn_started_at TIMESTAMP);
 INSERT INTO lobbies VALUES (6, 1);`)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := db.Exec("INSERT INTO agents VALUES (1, $1, 'test-salt', true)", hashPassword("test-password", "test-salt")); err != nil {
		t.Fatal(err)
	}
	for _, tc := range []struct {
		name, order, body, wantError string
		index                        int
	}{
		{"negative index", `[{"id":-1,"name":"Goblin"},{"id":32,"name":"Bramble"}]`, `{"combatant_id":-1}`, "invalid_combat_turn", -1},
		{"past end", `[{"id":-1,"name":"Goblin"},{"id":32,"name":"Bramble"}]`, `{"combatant_id":-1}`, "invalid_combat_turn", 2},
		{"empty order", `[]`, `{"combatant_id":-1}`, "no_combatants", 0},
		{"malformed order", `{`, `{"combatant_id":-1}`, "no_combatants", 0},
		{"last combatant", `[{"id":-1,"name":"Goblin"}]`, `{"combatant_id":-1}`, "", 0},
	} {
		t.Run(tc.name, func(t *testing.T) {
			if _, err := db.Exec("DELETE FROM combat_state"); err != nil {
				t.Fatal(err)
			}
			if _, err := db.Exec("INSERT INTO combat_state VALUES (6,3,$1,$2,true,'2020-01-01 00:00:00')", tc.index, tc.order); err != nil {
				t.Fatal(err)
			}
			r := httptest.NewRequest(http.MethodPost, "/api/campaigns/6/combat/remove", strings.NewReader(tc.body))
			r.SetBasicAuth("1", "test-password")
			w := httptest.NewRecorder()
			// A corrupt index must be rejected, not panic after persisting a removal.
			handleCombatRemove(w, r, 6)
			var active bool
			var round, index int
			var order string
			if err := db.QueryRow("SELECT active, round_number, current_turn_index, turn_order FROM combat_state WHERE lobby_id=6").Scan(&active, &round, &index, &order); err != nil {
				t.Fatal(err)
			}
			if tc.wantError != "" {
				if w.Code != http.StatusConflict || !strings.Contains(w.Body.String(), tc.wantError) {
					t.Fatalf("status=%d body=%s", w.Code, w.Body.String())
				}
				if !active || round != 3 || index != tc.index || order != tc.order {
					t.Fatalf("rejected removal mutated state: active=%v round=%d index=%d order=%s", active, round, index, order)
				}
			} else {
				if w.Code != http.StatusOK || !strings.Contains(w.Body.String(), `"combat_ended":true`) {
					t.Fatalf("status=%d body=%s", w.Code, w.Body.String())
				}
				if active || round != 0 || index != 0 || order != "[]" {
					t.Fatalf("stale finished initiative: active=%v round=%d index=%d order=%s", active, round, index, order)
				}
			}
		})
	}
}
