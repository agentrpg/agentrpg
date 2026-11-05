package main

import (
	"database/sql"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestSQLiteCombatStatusBoundsAndReadOnly(t *testing.T) {
	originalDB := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = originalDB })
	if _, err := db.Exec(`CREATE TABLE combat_state (lobby_id INTEGER, round_number INTEGER, current_turn_index INTEGER, turn_order TEXT, active BOOLEAN)`); err != nil {
		t.Fatal(err)
	}
	for _, tc := range []struct {
		name, order, wantName string
		index, wantID         int
	}{
		{"negative index", `[{"id":32,"name":"Bramble"}]`, "", -1, 0},
		{"empty negative index", `[]`, "", -1, 0},
		{"past end", `[{"id":32,"name":"Bramble"}]`, "", 1, 0},
		{"valid index", `[{"id":32,"name":"Bramble"}]`, "Bramble", 0, 32},
	} {
		t.Run(tc.name, func(t *testing.T) {
			if _, err := db.Exec("DELETE FROM combat_state"); err != nil {
				t.Fatal(err)
			}
			if _, err := db.Exec("INSERT INTO combat_state VALUES (6, 3, $1, $2, true)", tc.index, tc.order); err != nil {
				t.Fatal(err)
			}
			w := httptest.NewRecorder()
			handleCombatStatus(w, httptest.NewRequest(http.MethodGet, "/api/campaigns/6/combat/status", nil), 6)
			var result struct {
				Name  string `json:"current_turn"`
				ID    int    `json:"current_turn_id"`
				Index int    `json:"current_turn_index"`
			}
			if err := json.Unmarshal(w.Body.Bytes(), &result); err != nil {
				t.Fatal(err)
			}
			if w.Code != http.StatusOK || result.Name != tc.wantName || result.ID != tc.wantID || result.Index != tc.index {
				t.Fatalf("unexpected status response: %d %s", w.Code, w.Body.String())
			}
			var afterIndex, round int
			var afterOrder string
			var active bool
			if err := db.QueryRow("SELECT current_turn_index, round_number, turn_order, active FROM combat_state WHERE lobby_id=6").Scan(&afterIndex, &round, &afterOrder, &active); err != nil {
				t.Fatal(err)
			}
			if afterIndex != tc.index || afterOrder != tc.order || round != 3 || !active {
				t.Fatal("status read mutated combat state")
			}
		})
	}
}
