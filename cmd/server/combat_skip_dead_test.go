package main

import (
	"database/sql"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"
	"time"
)

func TestSQLiteCombatSkipPastDeadCharacters(t *testing.T) {
	for _, tc := range []struct {
		name                           string
		order                          string
		oldIndex, wantIndex, wantRound int
	}{
		{"skip dead", `[{"id":32,"name":"Bramble"},{"id":34,"name":"Ilex"},{"id":33,"name":"Mira"}]`, 0, 2, 1},
		{"wrap past dead", `[{"id":34,"name":"Ilex"},{"id":33,"name":"Mira"},{"id":32,"name":"Bramble"}]`, 2, 1, 2},
		{"consecutive dead", `[{"id":32,"name":"Bramble"},{"id":34,"name":"Ilex"},{"id":35,"name":"Dead ally"},{"id":33,"name":"Mira"}]`, 0, 3, 1},
	} {
		t.Run(tc.name, func(t *testing.T) {
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
   CREATE TABLE characters (id INTEGER, lobby_id INTEGER, is_dead BOOLEAN, race TEXT, action_used BOOLEAN, bonus_action_used BOOLEAN, movement_remaining INTEGER, reaction_used BOOLEAN, multiattack_defense_hits TEXT);
   CREATE TABLE actions (lobby_id INTEGER, character_id INTEGER, action_type TEXT, description TEXT, result TEXT);
   INSERT INTO lobbies VALUES (6, 1);
   INSERT INTO characters (id, lobby_id, is_dead, race, action_used) VALUES (32,6,false,'human',true),(33,6,false,'human',true),(34,6,true,'human',true),(35,6,true,'human',true);`)
			if err != nil {
				t.Fatal(err)
			}
			if _, err := db.Exec("INSERT INTO agents VALUES (1, $1, 'test-salt', true)", hashPassword("test-password", "test-salt")); err != nil {
				t.Fatal(err)
			}
			started := time.Now().Add(-5 * time.Hour).UTC().Truncate(time.Second)
			if _, err := db.Exec("INSERT INTO combat_state VALUES (6,1,$1,$2,true,$3)", tc.oldIndex, tc.order, started); err != nil {
				t.Fatal(err)
			}
			r := httptest.NewRequest(http.MethodPost, "/api/campaigns/6/combat/skip", nil)
			r.SetBasicAuth("1", "test-password")
			w := httptest.NewRecorder()
			handleCombatSkip(w, r, 6)
			var response struct {
				Success     bool
				CurrentTurn string `json:"current_turn"`
			}
			if err := json.Unmarshal(w.Body.Bytes(), &response); err != nil {
				t.Fatal(err)
			}
			if w.Code != http.StatusOK || !response.Success || response.CurrentTurn != "Mira" {
				t.Fatalf("skip failed: status=%d body=%s", w.Code, w.Body.String())
			}
			var index, round, actions int
			var after time.Time
			if err := db.QueryRow("SELECT current_turn_index, round_number, turn_started_at FROM combat_state WHERE lobby_id=6").Scan(&index, &round, &after); err != nil {
				t.Fatal(err)
			}
			if index != tc.wantIndex || round != tc.wantRound || !after.After(started) {
				t.Fatalf("index=%d round=%d started=%v", index, round, after)
			}
			if err := db.QueryRow("SELECT COUNT(*) FROM actions WHERE action_type='turn_skipped' AND character_id=32").Scan(&actions); err != nil || actions != 1 {
				t.Fatalf("skip log count=%d err=%v", actions, err)
			}
			var used bool
			if err := db.QueryRow("SELECT action_used FROM characters WHERE id=33").Scan(&used); err != nil || used {
				t.Fatalf("Mira action reset=%v err=%v", !used, err)
			}
			// The fresh turn cannot immediately be skipped again.
			w = httptest.NewRecorder()
			handleCombatSkip(w, r, 6)
			if w.Code != http.StatusConflict {
				t.Fatalf("fresh turn skip: %d %s", w.Code, w.Body.String())
			}
		})
	}
}
