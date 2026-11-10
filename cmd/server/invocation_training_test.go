package main

import (
	"database/sql"
	"encoding/json"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestSQLiteInvocationPreservesTraining(t *testing.T) {
	original := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = original })
	_, err = db.Exec(`CREATE TABLE agents (id INTEGER, password_hash TEXT, salt TEXT, verified BOOLEAN);
 CREATE TABLE characters (id INTEGER, agent_id INTEGER, name TEXT, class TEXT, level INTEGER, known_spells TEXT DEFAULT '[]', eldritch_invocations TEXT DEFAULT '[]', skill_proficiencies TEXT);
 INSERT INTO characters (id,agent_id,name,class,level) VALUES (1,1,'Test','warlock',2);`)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := db.Exec("INSERT INTO agents VALUES (1,$1,'salt',true)", hashPassword("password", "salt")); err != nil {
		t.Fatal(err)
	}
	for _, tc := range []struct {
		name, skills, invocation, want string
		fail                           bool
	}{
		{"CSV skills", "arcana, investigation", "beguiling-influence", "arcana, investigation, deception, persuasion", false},
		{"legacy JSON", `["arcana","investigation"]`, "beguiling-influence", "arcana, investigation, deception, persuasion", false},
		{"empty", "", "beguiling-influence", "deception, persuasion", false},
		{"existing proficiency", "Arcana, Deception", "beguiling-influence", "Arcana, Deception, persuasion", false},
		{"unrelated invocation", "arcana, investigation", "devils-sight", "arcana, investigation", false},
		{"malformed legacy data", `["arcana"`, "beguiling-influence", `["arcana"`, true},
	} {
		t.Run(tc.name, func(t *testing.T) {
			if _, err := db.Exec("UPDATE characters SET eldritch_invocations='[]',skill_proficiencies=$1 WHERE id=1", tc.skills); err != nil {
				t.Fatal(err)
			}
			r := httptest.NewRequest("POST", "/api/characters/invocations", strings.NewReader(`{"character_id":1,"invocation":"`+tc.invocation+`"}`))
			r.SetBasicAuth("1", "password")
			w := httptest.NewRecorder()
			handleCharacterInvocations(w, r)
			var skills, invocations string
			if err := db.QueryRow("SELECT skill_proficiencies,eldritch_invocations FROM characters WHERE id=1").Scan(&skills, &invocations); err != nil {
				t.Fatal(err)
			}
			var result map[string]interface{}
			if err := json.Unmarshal(w.Body.Bytes(), &result); err != nil {
				t.Fatal(err)
			}
			if skills != tc.want {
				t.Fatalf("skills=%q want=%q response=%s", skills, tc.want, w.Body.String())
			}
			if tc.fail {
				if result["error"] == nil || invocations != "[]" {
					t.Fatalf("unsafe failure: %s invocations=%s", w.Body.String(), invocations)
				}
			} else if w.Code != 200 || result["success"] != true || !strings.Contains(invocations, tc.invocation) {
				t.Fatalf("response=%s invocations=%s", w.Body.String(), invocations)
			}
		})
	}
	t.Run("malformed invocation data is retained", func(t *testing.T) {
		if _, err := db.Exec(`UPDATE characters SET eldritch_invocations='broken', skill_proficiencies='arcana' WHERE id=1`); err != nil {
			t.Fatal(err)
		}
		r := httptest.NewRequest("POST", "/api/characters/invocations", strings.NewReader(`{"character_id":1,"invocation":"beguiling-influence"}`))
		r.SetBasicAuth("1", "password")
		w := httptest.NewRecorder()
		handleCharacterInvocations(w, r)
		var skills, invocations string
		if err := db.QueryRow("SELECT skill_proficiencies,eldritch_invocations FROM characters WHERE id=1").Scan(&skills, &invocations); err != nil {
			t.Fatal(err)
		}
		if w.Code != 409 || invocations != "broken" || skills != "arcana" {
			t.Fatalf("unsafe failure: %s skills=%q invocations=%q", w.Body.String(), skills, invocations)
		}
	})
	t.Run("zero row update is not success", func(t *testing.T) {
		if _, err := db.Exec(`UPDATE characters SET eldritch_invocations='[]', skill_proficiencies='arcana' WHERE id=1;
CREATE TRIGGER skip_write BEFORE UPDATE ON characters BEGIN SELECT RAISE(IGNORE); END;`); err != nil {
			t.Fatal(err)
		}
		defer db.Exec("DROP TRIGGER skip_write")
		r := httptest.NewRequest("POST", "/api/characters/invocations", strings.NewReader(`{"character_id":1,"invocation":"beguiling-influence"}`))
		r.SetBasicAuth("1", "password")
		w := httptest.NewRecorder()
		handleCharacterInvocations(w, r)
		if w.Code != 409 || !strings.Contains(w.Body.String(), "character_state_changed") {
			t.Fatalf("response=%s", w.Body.String())
		}
	})
	t.Run("failed skill write does not learn invocation", func(t *testing.T) {
		if _, err := db.Exec(`UPDATE characters SET eldritch_invocations='[]',skill_proficiencies='arcana' WHERE id=1;
 CREATE TRIGGER reject_training BEFORE UPDATE OF skill_proficiencies ON characters BEGIN SELECT RAISE(ABORT, 'test failure'); END;`); err != nil {
			t.Fatal(err)
		}
		r := httptest.NewRequest("POST", "/api/characters/invocations", strings.NewReader(`{"character_id":1,"invocation":"beguiling-influence"}`))
		r.SetBasicAuth("1", "password")
		w := httptest.NewRecorder()
		handleCharacterInvocations(w, r)
		var skills, invocations string
		if err := db.QueryRow("SELECT skill_proficiencies,eldritch_invocations FROM characters WHERE id=1").Scan(&skills, &invocations); err != nil {
			t.Fatal(err)
		}
		if invocations != "[]" || skills != "arcana" || strings.Contains(w.Body.String(), `"success":true`) {
			t.Fatalf("partial write: skills=%q invocations=%q response=%s", skills, invocations, w.Body.String())
		}
	})
}
