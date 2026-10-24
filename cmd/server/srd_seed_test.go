package main

import (
	"database/sql"
	"strings"
	"testing"

	_ "github.com/mattn/go-sqlite3"
)

func TestSRDNeedsSeed(t *testing.T) {
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	defer database.Close()
	database.SetMaxOpenConns(1)
	tables := []string{"monsters", "spells", "classes", "races", "weapons", "armor"}
	for _, table := range tables {
		if _, err := database.Exec("CREATE TABLE " + table + " (slug TEXT)"); err != nil {
			t.Fatal(err)
		}
		if table != "armor" {
			if _, err := database.Exec("INSERT INTO " + table + " (slug) VALUES ('test')"); err != nil {
				t.Fatal(err)
			}
		}
	}
	if needs, err := srdNeedsSeed(database); err != nil || !needs {
		t.Fatalf("empty armor table: needs=%v err=%v", needs, err)
	}
	if _, err := database.Exec("INSERT INTO armor (slug) VALUES ('test')"); err != nil {
		t.Fatal(err)
	}
	if needs, err := srdNeedsSeed(database); err != nil || needs {
		t.Fatalf("complete catalog: needs=%v err=%v", needs, err)
	}
	if _, err := database.Exec("DROP TABLE spells"); err != nil {
		t.Fatal(err)
	}
	if _, err := srdNeedsSeed(database); err == nil || !strings.Contains(err.Error(), "spells") {
		t.Fatalf("missing table: err=%v", err)
	}
}
