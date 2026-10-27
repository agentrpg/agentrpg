package main

import (
	"database/sql"
	"testing"

	_ "github.com/mattn/go-sqlite3"
)

func TestRecordGMActionReportsInsertFailure(t *testing.T) {
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	defer database.Close()

	if err := recordGMAction(database, 6, "narration", "A scene", ""); err == nil {
		t.Fatal("missing actions table must not be reported as a recorded narration")
	}
	if _, err := database.Exec(`CREATE TABLE actions (
		lobby_id INTEGER, action_type TEXT, description TEXT, result TEXT
	)`); err != nil {
		t.Fatal(err)
	}
	if err := recordGMAction(database, 6, "narration", "A scene", ""); err != nil {
		t.Fatal(err)
	}
	var description string
	if err := database.QueryRow("SELECT description FROM actions WHERE lobby_id = 6 AND action_type = 'narration'").Scan(&description); err != nil {
		t.Fatal(err)
	}
	if description != "A scene" {
		t.Fatalf("recorded description = %q", description)
	}
}
