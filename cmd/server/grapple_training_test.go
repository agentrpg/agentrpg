package main

import (
	"database/sql"
	"encoding/json"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestSQLiteGrappleTraining(t *testing.T) {
	original := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = original })
	_, err = db.Exec(`CREATE TABLE agents (id INTEGER, password_hash TEXT, salt TEXT, verified BOOLEAN);
CREATE TABLE lobbies (id INTEGER, dm_id INTEGER, status TEXT);
CREATE TABLE characters (id INTEGER PRIMARY KEY, name TEXT, str INTEGER, dex INTEGER, level INTEGER, lobby_id INTEGER, conditions TEXT, skill_proficiencies TEXT, expertise TEXT);
CREATE TABLE actions (lobby_id INTEGER, character_id INTEGER, action_type TEXT, description TEXT, result TEXT);
INSERT INTO lobbies VALUES (6,1,'active');
INSERT INTO characters VALUES (1,'Grappler',14,10,5,6,'[]','','');
INSERT INTO characters VALUES (2,'Escaper',10,16,5,6,'[]','','');`)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := db.Exec("INSERT INTO agents VALUES (1,$1,'salt',true)", hashPassword("password", "salt")); err != nil {
		t.Fatal(err)
	}

	for _, tc := range []struct {
		name, skills, expertise string
		bonus                   int
		bad                     bool
	}{
		{"CSV", "Athletics, Acrobatics", "", 3, false},
		{"CSV expertise", "Athletics, Acrobatics", "Athletics, Acrobatics", 6, false},
		{"JSON expertise", `["Athletics","Acrobatics"]`, `["Athletics","Acrobatics"]`, 6, false},
		{"whitespace", " athletics , ACROBATICS ", " ATHLETICS , acrobatics ", 6, false},
		{"empty", "", "", 0, false},
		{"no substring match", "Superathletics, AcrobaticsExtra", "", 0, false},
		{"malformed JSON skills", `["Athletics"`, "", 0, true},
		{"malformed JSON expertise", "Athletics, Acrobatics", `["Athletics"`, 0, true},
	} {
		for _, escape := range []bool{false, true} {
			name := tc.name + "/grapple"
			if escape {
				name = tc.name + "/escape"
			}
			t.Run(name, func(t *testing.T) {
				conditions := "[]"
				if escape {
					conditions = `["grappled:1"]`
				}
				if _, err := db.Exec("DELETE FROM actions;"); err != nil {
					t.Fatal(err)
				}
				if _, err := db.Exec("UPDATE characters SET skill_proficiencies=$1,expertise=$2,conditions='[]'", tc.skills, tc.expertise); err != nil {
					t.Fatal(err)
				}
				if _, err := db.Exec("UPDATE characters SET conditions=$1 WHERE id=2", conditions); err != nil {
					t.Fatal(err)
				}
				body := `{"attacker_id":1,"target_id":2}`
				if escape {
					body = `{"character_id":2,"use_acrobatics":true}`
				}
				r := httptest.NewRequest("POST", "/test", strings.NewReader(body))
				r.SetBasicAuth("1", "password")
				w := httptest.NewRecorder()
				if escape {
					handleGMEscapeGrapple(w, r)
				} else {
					handleGMGrapple(w, r)
				}
				var response map[string]interface{}
				if err := json.Unmarshal(w.Body.Bytes(), &response); err != nil {
					t.Fatalf("%v: %s", err, w.Body.String())
				}
				if tc.bad {
					var after string
					var count int
					if err := db.QueryRow("SELECT conditions FROM characters WHERE id=2").Scan(&after); err != nil {
						t.Fatal(err)
					}
					if err := db.QueryRow("SELECT COUNT(*) FROM actions").Scan(&count); err != nil {
						t.Fatal(err)
					}
					if w.Code != 409 || response["error"] != "invalid_skill_state" || after != conditions || count != 0 {
						t.Fatalf("unsafe malformed-data result: %s conditions=%s actions=%d", w.Body.String(), after, count)
					}
					return
				}
				first, second := "attacker", "defender"
				if escape {
					first, second = "grappler", "escaper"
				}
				for key, want := range map[string]int{first: 2 + tc.bonus, second: 3 + tc.bonus} {
					stats, ok := response[key].(map[string]interface{})
					if w.Code != 200 || !ok || stats["modifier"] != float64(want) {
						t.Fatalf("%s modifier want %d: %s", key, want, w.Body.String())
					}
				}
			})
		}
	}
}
