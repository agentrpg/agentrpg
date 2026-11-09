package main

import (
	"database/sql"
	"encoding/json"
	"net/http/httptest"
	"reflect"
	"testing"
)

func TestSQLiteUniverseClassTraining(t *testing.T) {
	original := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = original })
	if _, err := db.Exec(`CREATE TABLE classes (slug TEXT, name TEXT, hit_die INTEGER, primary_ability TEXT, saving_throws TEXT, spellcasting_ability TEXT)`); err != nil {
		t.Fatal(err)
	}
	for slug, class := range srdClasses {
		if _, err := db.Exec(`INSERT INTO classes VALUES ($1,$2,$3,$4,'','')`, slug, class.Name, class.HitDie, class.Primary); err != nil {
			t.Fatal(err)
		}
		t.Run(slug, func(t *testing.T) {
			w := httptest.NewRecorder()
			handleUniverseClass(w, httptest.NewRequest("GET", "/api/universe/classes/"+slug, nil))
			var got struct {
				Armor   []string `json:"armor_proficiencies"`
				Weapons []string `json:"weapon_proficiencies"`
				Name    string   `json:"name"`
			}
			if err := json.Unmarshal(w.Body.Bytes(), &got); err != nil {
				t.Fatal(err)
			}
			if got.Armor == nil || got.Weapons == nil || !reflect.DeepEqual(got.Armor, class.ArmorProf) || !reflect.DeepEqual(got.Weapons, class.WeaponProf) || got.Name != class.Name {
				t.Fatalf("class training mismatch: %s", w.Body.String())
			}
		})
	}
	w := httptest.NewRecorder()
	handleUniverseClass(w, httptest.NewRequest("GET", "/api/universe/classes/not-a-class", nil))
	var got map[string]interface{}
	if err := json.Unmarshal(w.Body.Bytes(), &got); err != nil {
		t.Fatal(err)
	}
	if got["error"] != "class_not_found" {
		t.Fatalf("unknown class: %s", w.Body.String())
	}
}
