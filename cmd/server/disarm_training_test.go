package main

import (
	"database/sql"
	"encoding/json"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestSQLiteDisarmTraining(t *testing.T) {
	original := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = original })
	_, err = db.Exec(`CREATE TABLE agents (id INTEGER, password_hash TEXT, salt TEXT, verified BOOLEAN);
CREATE TABLE lobbies (id INTEGER, dm_id INTEGER, status TEXT);
CREATE TABLE characters (id INTEGER PRIMARY KEY, name TEXT, str INTEGER, dex INTEGER, level INTEGER, lobby_id INTEGER, skill_proficiencies TEXT, expertise TEXT);
CREATE TABLE actions (lobby_id INTEGER, character_id INTEGER, action_type TEXT, description TEXT, result TEXT);
INSERT INTO lobbies VALUES (6,1,'active');
INSERT INTO characters VALUES (1,'Attacker',14,10,5,6,'','');
INSERT INTO characters VALUES (2,'Defender',14,16,5,6,'','');`)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := db.Exec("INSERT INTO agents VALUES (1,$1,'salt',true)", hashPassword("password", "salt")); err != nil {
		t.Fatal(err)
	}
	for _, tc := range []struct {
		name, skills, expertise, skill string
		modifier                       int
		bad                            bool
	}{
		{"CSV Acrobatics", "Acrobatics, Stealth", "", "Acrobatics", 6, false},
		{"CSV Athletics", "Athletics", "", "Athletics", 5, false},
		{"CSV expertise", "Athletics, Acrobatics", "Athletics, Acrobatics", "Acrobatics", 9, false},
		{"JSON Acrobatics", `["Acrobatics","Stealth"]`, `[]`, "Acrobatics", 6, false},
		{"JSON Athletics expertise", `["Athletics","Acrobatics"]`, `["Athletics"]`, "Athletics", 8, false},
		{"mixed formats", "Athletics, Acrobatics", `["Acrobatics"]`, "Acrobatics", 9, false},
		{"whitespace and case", ` [" ATHLETICS "] `, " athletics ", "Athletics", 8, false},
		{"orphan expertise", "", `["Acrobatics"]`, "Acrobatics", 3, false},
		{"no substring match", "Superathletics, AcrobaticsExtra", "", "Acrobatics", 3, false},
		{"empty", "", "", "Acrobatics", 3, false},
		{"malformed skills", `["Athletics"`, "", "", 0, true},
		{"malformed expertise", "Athletics", `["Athletics"`, "", 0, true},
	} {
		for _, twoHanded := range []bool{false, true} {
			name := tc.name + "/one-handed"
			if twoHanded {
				name = tc.name + "/two-handed"
			}
			t.Run(name, func(t *testing.T) {
				if _, err := db.Exec("DELETE FROM actions"); err != nil {
					t.Fatal(err)
				}
				if _, err := db.Exec("UPDATE characters SET skill_proficiencies=$1, expertise=$2 WHERE id=2", tc.skills, tc.expertise); err != nil {
					t.Fatal(err)
				}
				body, _ := json.Marshal(map[string]interface{}{"attacker_id": 1, "target_id": 2, "two_handed": twoHanded})
				r := httptest.NewRequest("POST", "/api/gm/disarm", strings.NewReader(string(body)))
				r.SetBasicAuth("1", "password")
				w := httptest.NewRecorder()
				handleGMDisarm(w, r)
				var response map[string]interface{}
				if err := json.Unmarshal(w.Body.Bytes(), &response); err != nil {
					t.Fatalf("%v: %s", err, w.Body.String())
				}
				var count int
				var skills, expertise string
				if err := db.QueryRow("SELECT COUNT(*) FROM actions").Scan(&count); err != nil {
					t.Fatal(err)
				}
				if err := db.QueryRow("SELECT skill_proficiencies, expertise FROM characters WHERE id=2").Scan(&skills, &expertise); err != nil {
					t.Fatal(err)
				}
				if skills != tc.skills || expertise != tc.expertise {
					t.Fatal("disarm rewrote stored training")
				}
				if tc.bad {
					if w.Code != 409 || response["error"] != "invalid_skill_state" || count != 0 || response["success"] != nil {
						t.Fatalf("malformed training produced a contest: %s actions=%d", w.Body.String(), count)
					}
					return
				}
				defender, ok := response["defender"].(map[string]interface{})
				if !ok || w.Code != 200 || count != 1 {
					t.Fatalf("missing contest: %s actions=%d", w.Body.String(), count)
				}
				roll := defender["roll"].(float64)
				if defender["modifier"] != float64(tc.modifier) || defender["skill"] != tc.skill || defender["total"] != roll+float64(tc.modifier) || defender["two_handed"] != twoHanded || roll < 1 || roll > 20 {
					t.Fatalf("wrong defense: %s", w.Body.String())
				}
				attacker := response["attacker"].(map[string]interface{})
				if attacker["modifier"] != float64(5) || response["success"] != (attacker["total"].(float64) > defender["total"].(float64)) {
					t.Fatalf("incorrect contest outcome: %s", w.Body.String())
				}
			})
		}
	}
}
