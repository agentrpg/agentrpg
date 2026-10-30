package main

import (
	"database/sql"
	"net/http"
	"net/http/httptest"
	"strconv"
	"strings"
	"testing"
	"time"

	_ "github.com/mattn/go-sqlite3"
)

func TestInvalidCombatIndexDoesNotAdvanceOrMutate(t *testing.T) {
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
 INSERT INTO lobbies VALUES (6, 1);
 INSERT INTO combat_state VALUES (6, 1, -1, '[{"id":32,"name":"Bramble"}]', true);`)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := db.Exec("INSERT INTO agents VALUES (1, $1, 'test-salt', true)", hashPassword("test-password", "test-salt")); err != nil {
		t.Fatal(err)
	}
	for _, index := range []int{-1, 1, 9} {
		if _, err := db.Exec("UPDATE combat_state SET current_turn_index = $1", index); err != nil {
			t.Fatal(err)
		}
		t.Run(strconv.Itoa(index), func(t *testing.T) {
			r := httptest.NewRequest(http.MethodPost, "/api/campaigns/6/combat/next", nil)
			r.SetBasicAuth("1", "test-password")
			w := httptest.NewRecorder()
			handleCombatNext(w, r, 6)
			if w.Code != http.StatusConflict || !strings.Contains(w.Body.String(), "invalid_combat_turn") {
				t.Fatalf("index %d: status=%d body=%s", index, w.Code, w.Body.String())
			}
			if got := validateGMNarratedCombatAdvance(6); got != "invalid_combat_turn" {
				t.Fatalf("narration validation = %q", got)
			}
			if got := autoAdvanceCombat(6, "test", 1, index, []byte(`[{"id":32,"name":"Bramble"}]`), sql.NullTime{Time: time.Now().Add(-5 * time.Hour), Valid: true}); got != 0 {
				t.Fatalf("auto advance = %d", got)
			}
			var after int
			if err := db.QueryRow("SELECT current_turn_index FROM combat_state WHERE lobby_id = 6").Scan(&after); err != nil {
				t.Fatal(err)
			}
			if after != index {
				t.Fatalf("invalid index mutated from %d to %d", index, after)
			}
		})
	}
	if _, err := db.Exec("UPDATE combat_state SET current_turn_index = 0"); err != nil {
		t.Fatal(err)
	}
	if got := validateGMNarratedCombatAdvance(6); got != "" {
		t.Fatalf("valid index rejected: %s", got)
	}
}
