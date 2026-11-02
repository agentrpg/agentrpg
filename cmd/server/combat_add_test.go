package main

import (
	"database/sql"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestSQLiteCombatAddPreservesHolderAndRejectsInvalidState(t *testing.T) {
	originalDB := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = originalDB })
	_, err = db.Exec(`CREATE TABLE agents (id INTEGER, password_hash TEXT, salt TEXT, verified BOOLEAN);
 CREATE TABLE lobbies (id INTEGER, dm_id INTEGER);
 CREATE TABLE combat_state (lobby_id INTEGER, round_number INTEGER, current_turn_index INTEGER, turn_order TEXT, active BOOLEAN);
 INSERT INTO lobbies VALUES (6, 1);`)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := db.Exec("INSERT INTO agents VALUES (1,$1,'test-salt',true)", hashPassword("test-password", "test-salt")); err != nil {
		t.Fatal(err)
	}
	for _, tc := range []struct {
		name, order, wantError string
		index                  int
	}{
		{"same name", `[{"id":-1,"name":"Goblin","initiative":20},{"id":-2,"name":"Goblin","initiative":10}]`, "", 1},
		{"negative index", `[{"id":-1,"name":"Goblin"}]`, "invalid_combat_turn", -1},
		{"past end", `[{"id":-1,"name":"Goblin"}]`, "invalid_combat_turn", 1},
		{"empty", `[]`, "no_combatants", 0},
		{"malformed", `{`, "no_combatants", 0},
	} {
		t.Run(tc.name, func(t *testing.T) {
			if _, err := db.Exec("DELETE FROM combat_state"); err != nil {
				t.Fatal(err)
			}
			if _, err := db.Exec("INSERT INTO combat_state VALUES (6,3,$1,$2,true)", tc.index, tc.order); err != nil {
				t.Fatal(err)
			}
			r := httptest.NewRequest(http.MethodPost, "/api/campaigns/6/combat/add", strings.NewReader(`{"combatants":[{"name":"Goblin","initiative":30}]}`))
			r.SetBasicAuth("1", "test-password")
			w := httptest.NewRecorder()
			handleCombatAdd(w, r, 6)
			var index int
			var order string
			if err := db.QueryRow("SELECT current_turn_index,turn_order FROM combat_state WHERE lobby_id=6").Scan(&index, &order); err != nil {
				t.Fatal(err)
			}
			if tc.wantError != "" {
				if w.Code != http.StatusConflict || !strings.Contains(w.Body.String(), tc.wantError) {
					t.Fatalf("status=%d body=%s", w.Code, w.Body.String())
				}
				if index != tc.index || order != tc.order {
					t.Fatalf("rejected addition mutated state: %d %s", index, order)
				}
			} else {
				var entries []struct {
					ID int `json:"id"`
				}
				if err := json.Unmarshal([]byte(order), &entries); err != nil {
					t.Fatal(err)
				}
				if w.Code != http.StatusOK || len(entries) != 3 || index < 0 || index >= len(entries) || entries[index].ID != -2 {
					t.Fatalf("addition changed current holder: index=%d order=%s body=%s", index, order, w.Body.String())
				}
			}
		})
	}
}
