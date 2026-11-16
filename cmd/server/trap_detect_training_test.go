package main

import (
	"database/sql"
	"encoding/json"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestSQLiteGMTrapDetectTraining(t *testing.T) {
	original := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = original })
	_, err = db.Exec(`CREATE TABLE agents (id INTEGER, password_hash TEXT, salt TEXT, verified BOOLEAN);
CREATE TABLE lobbies (id INTEGER, dm_id INTEGER);
CREATE TABLE characters (id INTEGER PRIMARY KEY, lobby_id INTEGER, name TEXT, str INTEGER, dex INTEGER, int INTEGER, wis INTEGER, hp INTEGER, max_hp INTEGER, conditions TEXT, skill_proficiencies TEXT, expertise TEXT, tool_proficiencies TEXT, level INTEGER);
CREATE TABLE actions (lobby_id INTEGER, character_id INTEGER, action_type TEXT, description TEXT, result TEXT);
INSERT INTO lobbies VALUES (6,1);
INSERT INTO characters VALUES (1,6,'Scout',10,16,18,16,20,25,'[]','','','',5);`)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := db.Exec("INSERT INTO agents VALUES (1,$1,'salt',true)", hashPassword("password", "salt")); err != nil {
		t.Fatal(err)
	}
	for _, investigation := range []bool{false, true} {
		skill, ability := "perception", 3
		if investigation {
			skill, ability = "investigation", 4
		}
		for _, tc := range []struct {
			name, profs, expertise  string
			bonus                   int
			proficient, expert, bad bool
		}{
			{"CSV proficiency", skill, "", 3, true, false, false},
			{"CSV expertise", "history," + skill, skill, 6, true, true, false},
			{"JSON expertise", `["` + skill + `"]`, `["` + skill + `"]`, 6, true, true, false},
			{"mixed whitespace", " HISTORY, " + strings.ToUpper(skill) + " ", `[" ` + skill + ` "]`, 6, true, true, false},
			{"empty", "", "", 0, false, false, false},
			{"JSON empty", "[]", "[]", 0, false, false, false},
			{"substring proficiency", "super" + skill, "", 0, false, false, false},
			{"substring expertise", skill, "super" + skill, 3, true, false, false},
			{"orphan expertise", "", skill, 0, false, false, false},
			{"malformed proficiency", `["` + skill + `"`, "", 0, false, false, true},
			{"malformed expertise", skill, `["` + skill + `"`, 0, false, false, true},
			{"invalid proficiency element", `[5]`, "", 0, false, false, true},
			{"invalid expertise element", skill, `[5]`, 0, false, false, true},
		} {
			t.Run(skill+"/"+tc.name, func(t *testing.T) {
				if _, err := db.Exec("DELETE FROM actions"); err != nil {
					t.Fatal(err)
				}
				if _, err := db.Exec("UPDATE characters SET skill_proficiencies=$1,expertise=$2", tc.profs, tc.expertise); err != nil {
					t.Fatal(err)
				}
				body, _ := json.Marshal(map[string]interface{}{"character_id": 1, "action": "detect", "custom_detect_dc": 14, "use_investigation": investigation})
				r := httptest.NewRequest("POST", "/api/gm/trap", strings.NewReader(string(body)))
				r.SetBasicAuth("1", "password")
				w := httptest.NewRecorder()
				handleGMTrap(w, r)
				var response map[string]interface{}
				if err := json.Unmarshal(w.Body.Bytes(), &response); err != nil {
					t.Fatal(err)
				}
				var count, hp, maxHP int
				var profs, expertise, conditions string
				if err := db.QueryRow("SELECT COUNT(*) FROM actions").Scan(&count); err != nil {
					t.Fatal(err)
				}
				if err := db.QueryRow("SELECT hp,max_hp,skill_proficiencies,expertise,conditions FROM characters WHERE id=1").Scan(&hp, &maxHP, &profs, &expertise, &conditions); err != nil {
					t.Fatal(err)
				}
				if hp != 20 || maxHP != 25 || profs != tc.profs || expertise != tc.expertise || conditions != "[]" {
					t.Fatal("detect mutated character")
				}
				if tc.bad {
					if w.Code != 409 || response["error"] != "invalid_skill_state" || count != 0 {
						t.Fatalf("unsafe malformed training: %s actions=%d", w.Body.String(), count)
					}
					return
				}
				if w.Code != 200 || response["modifier"] != float64(ability+tc.bonus) || (response["proficient"] == true) != tc.proficient || (response["expertise"] == true) != tc.expert || response["skill"] != skill || count != 1 {
					t.Fatalf("wrong training result: %s actions=%d", w.Body.String(), count)
				}
				if response["total"] != response["roll"].(float64)+response["modifier"].(float64) || response["detected"] != (response["total"].(float64) >= 14) {
					t.Fatalf("inconsistent outcome: %s", w.Body.String())
				}
			})
		}
	}
}
