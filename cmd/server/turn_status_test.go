package main

import (
	"database/sql"
	"encoding/json"
	"reflect"
	"testing"
)

func TestSQLiteTurnStatusBoundsAndReadOnly(t *testing.T) {
	originalDB := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = originalDB })
	if _, err := db.Exec("CREATE TABLE combat_state (lobby_id INTEGER, round_number INTEGER, current_turn_index INTEGER, turn_order TEXT, active BOOLEAN)"); err != nil {
		t.Fatal(err)
	}
	for _, tc := range []struct {
		name, order      string
		index, character int
		wantName         string
		wantTurn         bool
		wantWaiting      []string
	}{
		{"negative player", `[{"id":32,"name":"Bramble"},{"id":33,"name":"Mira"}]`, -1, 33, "", false, []string{}},
		{"past end player", `[{"id":32,"name":"Bramble"},{"id":33,"name":"Mira"}]`, 2, 33, "", false, []string{}},
		{"negative GM", `[{"id":32,"name":"Bramble"}]`, -1, 0, "", false, []string{}},
		{"empty", "[]", 0, 33, "", false, []string{}},
		{"malformed", "[", 0, 33, "", false, []string{}},
		{"current player", `[{"id":32,"name":"Bramble"},{"id":33,"name":"Mira"}]`, 1, 33, "Mira", true, []string{}},
		{"waiting player", `[{"id":32,"name":"Bramble"},{"id":33,"name":"Mira"}]`, 0, 33, "Bramble", false, []string{"Bramble"}},
		{"wrapping wait", `[{"id":32,"name":"Bramble"},{"id":33,"name":"Mira"}]`, 1, 32, "Mira", false, []string{"Mira"}},
	} {
		t.Run(tc.name, func(t *testing.T) {
			if _, err := db.Exec("DELETE FROM combat_state"); err != nil {
				t.Fatal(err)
			}
			if _, err := db.Exec("INSERT INTO combat_state VALUES (6, 3, $1, $2, true)", tc.index, tc.order); err != nil {
				t.Fatal(err)
			}
			result := getTurnStatus(6, tc.character)
			// Compare via JSON so the initial empty waiting list and the populated
			// []string representation have identical semantics.
			encoded, err := json.Marshal(result)
			if err != nil {
				t.Fatal(err)
			}
			var got struct {
				InCombat bool     `json:"in_combat"`
				Round    int      `json:"round"`
				Name     string   `json:"current_turn"`
				Turn     bool     `json:"your_turn"`
				Waiting  []string `json:"waiting_on"`
			}
			if err := json.Unmarshal(encoded, &got); err != nil {
				t.Fatal(err)
			}
			if !got.InCombat || got.Round != 3 || got.Name != tc.wantName || got.Turn != tc.wantTurn || !reflect.DeepEqual(got.Waiting, tc.wantWaiting) {
				t.Fatalf("unexpected status: %s", encoded)
			}
			var index, round int
			var order string
			var active bool
			if err := db.QueryRow("SELECT current_turn_index, round_number, turn_order, active FROM combat_state WHERE lobby_id=6").Scan(&index, &round, &order, &active); err != nil {
				t.Fatal(err)
			}
			if index != tc.index || round != 3 || order != tc.order || !active {
				t.Fatal("status read mutated combat state")
			}
		})
	}
}
