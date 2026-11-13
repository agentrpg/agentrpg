package main

import (
	"database/sql"
	"fmt"
	"strings"
	"testing"
)

func TestSQLiteStabilizeTraining(t *testing.T) {
	original := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = original })
	_, err = db.Exec(`CREATE TABLE characters (
 id INTEGER PRIMARY KEY, wis INTEGER, level INTEGER, skill_proficiencies TEXT, expertise TEXT,
 hp INTEGER, is_stable BOOLEAN DEFAULT false, is_dead BOOLEAN DEFAULT false,
 death_save_successes INTEGER DEFAULT 0, death_save_failures INTEGER DEFAULT 0);
 INSERT INTO characters (id,wis,level,hp) VALUES (1,16,5,10),(2,10,1,0);`)
	if err != nil {
		t.Fatal(err)
	}
	for _, tc := range []struct {
		name, skills, expertise string
		bonus                   int
		invalid                 bool
	}{
		{"CSV", "Medicine, Survival", "", 6, false},
		{"CSV expertise", "Medicine, Survival", "Medicine", 9, false},
		{"JSON", `["Medicine","Survival"]`, `[]`, 6, false},
		{"JSON expertise", `["Medicine"]`, `["Medicine"]`, 9, false},
		{"case and whitespace", ` [" MEDICINE "] `, " medicine ", 9, false},
		{"empty", "", "", 3, false},
		{"orphan expertise", "Survival", "Medicine", 3, false},
		{"exact matching", "Supermedicine", "Supermedicine", 3, false},
		{"invalid skills", `["Medicine"`, "", 0, true},
		{"invalid expertise", "Medicine", `["Medicine"`, 0, true},
	} {
		t.Run(tc.name, func(t *testing.T) {
			if _, err := db.Exec("UPDATE characters SET skill_proficiencies=$1, expertise=$2 WHERE id=1", tc.skills, tc.expertise); err != nil {
				t.Fatal(err)
			}
			if _, err := db.Exec("UPDATE characters SET is_stable=false, hp=0, death_save_successes=2, death_save_failures=1 WHERE id=2"); err != nil {
				t.Fatal(err)
			}
			result, err := resolveStabilizeAction(1, 2, "Patient")
			var stable bool
			var hp, successes, failures int
			if scanErr := db.QueryRow("SELECT is_stable,hp,death_save_successes,death_save_failures FROM characters WHERE id=2").Scan(&stable, &hp, &successes, &failures); scanErr != nil {
				t.Fatal(scanErr)
			}
			if hp != 0 || successes != 2 || failures != 1 {
				t.Fatalf("first aid changed HP or saves: %d %d/%d", hp, successes, failures)
			}
			if tc.invalid {
				if err == nil || result != "" || stable {
					t.Fatalf("invalid training: result=%q err=%v stable=%v", result, err, stable)
				}
				return
			}
			if err != nil {
				t.Fatal(err)
			}
			var roll, bonus, total int
			if _, err := fmt.Sscanf(result, "Medicine check for Patient: %d %d = %d vs DC 10;", &roll, &bonus, &total); err != nil {
				t.Fatalf("parse %q: %v", result, err)
			}
			if bonus != tc.bonus || total != roll+bonus {
				t.Fatalf("modifier=%d want %d: %s", bonus, tc.bonus, result)
			}
			if stable != (total >= 10) || strings.Contains(result, "success.") != stable {
				t.Fatalf("check disagrees with patient: %s stable=%v", result, stable)
			}
		})
	}
}
