package main

import (
	"database/sql"
	"encoding/json"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestSQLiteGMToolCheckTraining(t *testing.T) {
	original := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = original })
	_, err = db.Exec(`CREATE TABLE agents (id INTEGER, password_hash TEXT, salt TEXT, verified BOOLEAN);
CREATE TABLE lobbies (id INTEGER, dm_id INTEGER, status TEXT);
CREATE TABLE characters (id INTEGER PRIMARY KEY, name TEXT, str INTEGER, dex INTEGER, con INTEGER, intl INTEGER, wis INTEGER, cha INTEGER, level INTEGER, lobby_id INTEGER, tool_proficiencies TEXT, expertise TEXT, inspiration BOOLEAN, subclass TEXT, class TEXT, class_levels TEXT, conditions TEXT, exhaustion_level INTEGER, race TEXT);
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
		{"CSV single", "thieves' tools", "Thieves' Tools", "", 3, true, false, false},
		{"CSV multiple", "thieves' tools", "Smith's Tools, Thieves' Tools", "", 3, true, false, false},
		{"CSV expertise", "thieves' tools", "Thieves' Tools", "Thieves' Tools", 6, true, true, false},
		{"CSV expertise alias", "thieves' tools", "Thieves' Tools", "thieves_tools", 6, true, true, false},
		{"JSON proficiency", "thieves' tools", `["Thieves' Tools"]`, "", 3, true, false, false},
		{"JSON multiple", "thieves' tools", `["Smith's Tools","Thieves' Tools"]`, "", 3, true, false, false},
		{"JSON expertise", "thieves' tools", `["Thieves' Tools"]`, `["Thieves' Tools"]`, 6, true, true, false},
		{"JSON expertise alias", "thieves' tools", `["Thieves' Tools"]`, `["thieves_tools"]`, 6, true, true, false},
		{"mixed formats", "thieves' tools", "Thieves' Tools", `["Thieves' Tools"]`, 6, true, true, false},
		{"whitespace", " Thieves' Tools ", " THIEVES' TOOLS , Smith's Tools ", " ThIeVeS' ToOlS ", 6, true, true, false},
		{"empty", "thieves' tools", "", "", 0, false, false, false},
		{"JSON empty", "thieves' tools", "[]", "[]", 0, false, false, false},
		{"no substring match", "thieves' tools", "Superthieves' tools", "", 0, false, false, false},
		{"expertise requires proficiency", "thieves' tools", "", "Thieves' Tools", 0, false, false, false},
		{"malformed tools", "thieves' tools", `["Thieves' Tools"`, "", 0, false, false, true},
		{"malformed expertise", "thieves' tools", "Thieves' Tools", `["Thieves' Tools"`, 0, false, false, true},
		{"invalid tools element", "thieves' tools", `[5]`, "", 0, false, false, true},
		{"invalid expertise element", "thieves' tools", "Thieves' Tools", `[5]`, 0, false, false, true},
	} {
		t.Run(tc.name, func(t *testing.T) {
			if _, err := db.Exec("DELETE FROM actions"); err != nil {
				t.Fatal(err)
			}
			if _, err := db.Exec("UPDATE characters SET tool_proficiencies=$1,expertise=$2,inspiration=true", tc.skills, tc.expertise); err != nil {
				t.Fatal(err)
			}
			body, _ := json.Marshal(map[string]interface{}{"character_id": 1, "tool": tc.skill, "dc": 14, "use_inspiration": tc.bad})
			r := httptest.NewRequest("POST", "/api/gm/tool-check", strings.NewReader(string(body)))
			r.SetBasicAuth("1", "password")
			w := httptest.NewRecorder()
			handleGMToolCheck(w, r)
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
			var tools, expertise string
			if err := db.QueryRow("SELECT tool_proficiencies, expertise FROM characters WHERE id=1").Scan(&tools, &expertise); err != nil {
				t.Fatal(err)
			}
			if tools != tc.skills || expertise != tc.expertise {
				t.Fatal("tool check rewrote stored training")
			}
			if tc.bad {
				if w.Code != 409 || response["error"] != "invalid_tool_state" || count != 0 || !inspiration {
					t.Fatalf("unsafe malformed state: %s actions=%d inspiration=%v", w.Body.String(), count, inspiration)
				}
				return
			}
			if w.Code != 200 || response["modifier"] != float64(3+tc.bonus) || response["proficient"] != tc.proficient || response["expertise"] != tc.expert || count != 1 || !inspiration {
				t.Fatalf("wrong trained tool check: %s actions=%d inspiration=%v", w.Body.String(), count, inspiration)
			}
			if response["total"] != response["roll"].(float64)+response["modifier"].(float64) || response["success"] != (response["total"].(float64) >= 14) {
				t.Fatalf("inconsistent check outcome: %s", w.Body.String())
			}
		})
	}
}
