package main

import (
	"database/sql"
	"testing"

	_ "github.com/mattn/go-sqlite3"
)

func setupSQLiteTestDB(t *testing.T) *sql.DB {
	t.Helper()

	originalDB := db
	testDB, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatalf("open sqlite db: %v", err)
	}

	schema := `
CREATE TABLE characters (
	id INTEGER PRIMARY KEY,
	name TEXT,
	conditions TEXT,
	exhaustion_level INTEGER DEFAULT 0
);`
	if _, err := testDB.Exec(schema); err != nil {
		t.Fatalf("create schema: %v", err)
	}

	db = testDB
	t.Cleanup(func() {
		_ = testDB.Close()
		db = originalDB
	})

	return testDB
}

func seedCharacter(t *testing.T, testDB *sql.DB, id int, name string, conditionsJSON string, exhaustion int) {
	t.Helper()
	_, err := testDB.Exec(
		`INSERT INTO characters (id, name, conditions, exhaustion_level) VALUES (?, ?, ?, ?)`,
		id, name, conditionsJSON, exhaustion,
	)
	if err != nil {
		t.Fatalf("insert character: %v", err)
	}
}

func TestSQLiteConditionHelpers(t *testing.T) {
	testDB := setupSQLiteTestDB(t)
	seedCharacter(t, testDB, 1, "Ariel", `["prone","restrained"]`, 0)

	if !hasCondition(1, "prone") {
		t.Fatal("expected prone condition")
	}
	if hasCondition(1, "blinded") {
		t.Fatal("did not expect blinded condition")
	}

	conditions := getCharConditions(1)
	if len(conditions) != 2 {
		t.Fatalf("expected 2 conditions, got %d", len(conditions))
	}

	if !removeCondition(1, "prone") {
		t.Fatal("expected removeCondition to remove prone")
	}
	if hasCondition(1, "prone") {
		t.Fatal("expected prone to be removed")
	}
	if removeCondition(1, "prone") {
		t.Fatal("expected removing missing condition to return false")
	}
}

func TestSQLiteIncapacitationAndMovement(t *testing.T) {
	testDB := setupSQLiteTestDB(t)
	seedCharacter(t, testDB, 2, "Bran", `["stunned"]`, 0)
	seedCharacter(t, testDB, 3, "Cleo", `["paralyzed"]`, 0)
	seedCharacter(t, testDB, 4, "Dain", `[]`, 5)

	if !isIncapacitated(2) {
		t.Fatal("expected stunned character to be incapacitated")
	}
	if canMove(2) {
		t.Fatal("expected stunned character to be unable to move")
	}
	if !autoFailsSave(2, "dex") {
		t.Fatal("expected stunned character to auto-fail dex save")
	}

	if !isAutoCrit(3) {
		t.Fatal("expected paralyzed target to be auto-crit eligible")
	}

	if canMove(4) {
		t.Fatal("expected exhaustion level 5 to prevent movement")
	}
}

func TestSQLiteSaveDisadvantageAndNames(t *testing.T) {
	testDB := setupSQLiteTestDB(t)
	seedCharacter(t, testDB, 5, "Eris", `["restrained"]`, 2)
	seedCharacter(t, testDB, 6, "Finn", `[]`, 3)

	if !getSaveDisadvantage(5, "dex") {
		t.Fatal("expected restrained character to have dex save disadvantage")
	}
	if getSaveDisadvantage(5, "wis") {
		t.Fatal("did not expect restrained character to have wis save disadvantage at exhaustion 2")
	}
	if !getSaveDisadvantage(6, "wis") {
		t.Fatal("expected exhaustion level 3 to impose save disadvantage")
	}

	if got := getCharacterName(5); got != "Eris" {
		t.Fatalf("getCharacterName(5) = %q, want %q", got, "Eris")
	}
	if got := getCharacterName(999); got != "" {
		t.Fatalf("getCharacterName(999) = %q, want empty string for missing character", got)
	}
}
