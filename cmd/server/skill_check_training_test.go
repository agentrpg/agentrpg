package main

import (
	"database/sql"
	"encoding/json"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestSQLiteGMSkillCheckTraining(t *testing.T) {
	original := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = original })
	_, err = db.Exec(`CREATE TABLE agents (id INTEGER, password_hash TEXT, salt TEXT, verified BOOLEAN);
CREATE TABLE lobbies (id INTEGER, dm_id INTEGER, status TEXT);
CREATE TABLE characters (id INTEGER PRIMARY KEY, name TEXT, str INTEGER, dex INTEGER, con INTEGER, intl INTEGER, wis INTEGER, cha INTEGER, level INTEGER, lobby_id INTEGER, skill_proficiencies TEXT, expertise TEXT, inspiration BOOLEAN, subclass TEXT, class TEXT, class_levels TEXT, conditions TEXT, exhaustion_level INTEGER, race TEXT);
CREATE TABLE actions (lobby_id INTEGER, character_id INTEGER, action_type TEXT, description TEXT, result TEXT);
INSERT INTO lobbies VALUES (6,1,'active');
INSERT INTO characters VALUES (1,'Scout',10,16,10,10,10,10,5,6,'','',true,'','rogue','{}','[]',0,'human');`)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := db.Exec("INSERT INTO agents VALUES (1,$1,'salt',true)", hashPassword("password", "salt")); err != nil {
		t.Fatal(err)
	}
	for _, tc := range []struct {
		name, skill, skills, expertise string
		bonus                          int
		proficient, expert, bad        bool
	}{
		{"CSV single", "stealth", "Stealth", "", 3, true, false, false},
		{"CSV spaced skill", "sleight_of_hand", "Stealth, Sleight of Hand", "", 3, true, false, false},
		{"CSV expertise", "Sleight of Hand", "Stealth, Sleight of Hand", "Sleight of Hand", 6, true, true, false},
		{"CSV underscore", "sleight of hand", "sleight_of_hand", "sleight_of_hand", 6, true, true, false},
		{"JSON proficiency", "stealth", `["Stealth"]`, "", 3, true, false, false},
		{"JSON expertise", "sleight_of_hand", `["Stealth","Sleight of Hand"]`, `["Sleight of Hand"]`, 6, true, true, false},
		{"whitespace", " Sleight of Hand ", " sLEight of Hand , Stealth ", " SLEIGHT OF HAND ", 6, true, true, false},
		{"empty", "stealth", "", "", 0, false, false, false},
		{"no substring match", "stealth", "Superstealth", "", 0, false, false, false},
		{"expertise requires proficiency", "stealth", "", "Stealth", 0, false, false, false},
		{"malformed skills", "stealth", `["Stealth"`, "", 0, false, false, true},
		{"malformed expertise", "stealth", "Stealth", `["Stealth"`, 0, false, false, true},
	} {
		t.Run(tc.name, func(t *testing.T) {
			if _, err := db.Exec("DELETE FROM actions"); err != nil {
				t.Fatal(err)
			}
			if _, err := db.Exec("UPDATE characters SET skill_proficiencies=$1,expertise=$2,inspiration=true", tc.skills, tc.expertise); err != nil {
				t.Fatal(err)
			}
			body, _ := json.Marshal(map[string]interface{}{"character_id": 1, "skill": tc.skill, "dc": 14, "use_inspiration": tc.bad})
			r := httptest.NewRequest("POST", "/api/gm/skill-check", strings.NewReader(string(body)))
			r.SetBasicAuth("1", "password")
			w := httptest.NewRecorder()
			handleGMSkillCheck(w, r)
			var response map[string]interface{}
			if err := json.Unmarshal(w.Body.Bytes(), &response); err != nil {
				t.Fatalf("%v: %s", err, w.Body.String())
			}
			var count int
			var inspiration bool
			if err := db.QueryRow("SELECT COUNT(*) FROM actions").Scan(&count); err != nil {
				t.Fatal(err)
			}
			if err := db.QueryRow("SELECT inspiration FROM characters WHERE id=1").Scan(&inspiration); err != nil {
				t.Fatal(err)
			}
			if tc.bad {
				if w.Code != 409 || response["error"] != "invalid_skill_state" || count != 0 || !inspiration {
					t.Fatalf("unsafe malformed state: %s actions=%d inspiration=%v", w.Body.String(), count, inspiration)
				}
				return
			}
			if w.Code != 200 || response["modifier"] != float64(3+tc.bonus) || response["proficient"] != tc.proficient || response["expertise"] != tc.expert || count != 1 || !inspiration {
				t.Fatalf("wrong trained check: %s actions=%d inspiration=%v", w.Body.String(), count, inspiration)
			}
		})
	}
}
