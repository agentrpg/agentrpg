package main

import (
	"database/sql"
	"fmt"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestSQLiteAwardXPGrowsHitPoints(t *testing.T) {
	original := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = original })
	_, err = db.Exec(`CREATE TABLE agents (id INTEGER, password_hash TEXT, salt TEXT, verified BOOLEAN);
 CREATE TABLE lobbies (id INTEGER, dm_id INTEGER);
 CREATE TABLE characters (id INTEGER, lobby_id INTEGER, name TEXT, xp INTEGER, level INTEGER, subclass TEXT, class TEXT, con INTEGER, hp INTEGER, max_hp INTEGER, pending_asi INTEGER DEFAULT 0, is_dead BOOLEAN DEFAULT false);
 CREATE TABLE actions (lobby_id INTEGER, action_type TEXT, description TEXT, result TEXT);
 INSERT INTO lobbies VALUES (6,1);`)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := db.Exec("INSERT INTO agents VALUES (1,$1,'salt',true)", hashPassword("password", "salt")); err != nil {
		t.Fatal(err)
	}
	for _, tc := range []struct {
		name, class                                             string
		con, hp, maxHP, xp, wantHP, wantMax, wantLevel, wantASI int
		dead                                                    bool
	}{
		{"reported rogue", "rogue", 12, 9, 9, 1150, 21, 21, 3, 0, false},
		{"injured fighter", "Fighter", 14, 7, 12, 300, 15, 20, 2, 0, false},
		{"minimum gain", "wizard", 1, 1, 1, 300, 2, 2, 2, 0, false},
		{"ASI threshold", "rogue", 12, 5, 9, 2700, 23, 27, 4, 2, false},
		{"no level up", "rogue", 12, 5, 9, 100, 5, 9, 1, 0, false},
		{"draconic bonus", "sorcerer", 12, 8, 8, 300, 14, 14, 2, 0, false},
		{"unconscious stays unconscious", "rogue", 12, 0, 9, 1150, 0, 21, 3, 0, false},
		{"dead stays dead", "rogue", 12, 0, 9, 1150, 0, 21, 3, 0, true},
	} {
		t.Run(tc.name, func(t *testing.T) {
			db.Exec("DELETE FROM characters")
			_, err := db.Exec("INSERT INTO characters (id,lobby_id,name,xp,level,class,con,hp,max_hp,is_dead) VALUES (1,6,'Test',0,1,$1,$2,$3,$4,$5)", tc.class, tc.con, tc.hp, tc.maxHP, tc.dead)
			if err != nil {
				t.Fatal(err)
			}
			if tc.name == "draconic bonus" {
				if _, err := db.Exec("UPDATE characters SET subclass='draconic' WHERE id=1"); err != nil {
					t.Fatal(err)
				}
			}
			r := httptest.NewRequest(http.MethodPost, "/api/gm/award-xp", strings.NewReader(fmt.Sprintf(`{"character_ids":[1],"xp":%d}`, tc.xp)))
			r.SetBasicAuth("1", "password")
			w := httptest.NewRecorder()
			handleGMAwardXP(w, r)
			var hp, maxHP, level, asi, xp int
			if err := db.QueryRow("SELECT hp,max_hp,level,pending_asi,xp FROM characters WHERE id=1").Scan(&hp, &maxHP, &level, &asi, &xp); err != nil {
				t.Fatal(err)
			}
			if w.Code != 200 || hp != tc.wantHP || maxHP != tc.wantMax || level != tc.wantLevel || asi != tc.wantASI || xp != tc.xp {
				t.Fatalf("status=%d hp=%d max=%d level=%d asi=%d xp=%d body=%s", w.Code, hp, maxHP, level, asi, xp, w.Body.String())
			}
		})
	}
}
