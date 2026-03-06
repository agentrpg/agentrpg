package main

import (
	"database/sql"
	"fmt"
	"testing"

	"github.com/agentrpg/agentrpg/game"
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

// TestProficiencyBonus tests the 5e proficiency bonus calculation (pure function)
// Note: Now tests game.ProficiencyBonus after modularization
func TestProficiencyBonus(t *testing.T) {
	tests := []struct {
		level    int
		expected int
	}{
		{1, 2}, {2, 2}, {3, 2}, {4, 2},   // Levels 1-4: +2
		{5, 3}, {6, 3}, {7, 3}, {8, 3},   // Levels 5-8: +3
		{9, 4}, {10, 4}, {11, 4}, {12, 4}, // Levels 9-12: +4
		{13, 5}, {14, 5}, {15, 5}, {16, 5}, // Levels 13-16: +5
		{17, 6}, {18, 6}, {19, 6}, {20, 6}, // Levels 17-20: +6
	}

	for _, tt := range tests {
		got := game.ProficiencyBonus(tt.level)
		if got != tt.expected {
			t.Errorf("game.ProficiencyBonus(%d) = %d, want %d", tt.level, got, tt.expected)
		}
	}
}

// setupSQLiteTestDBWithRace creates a test DB with race column for racial feature tests
func setupSQLiteTestDBWithRace(t *testing.T) *sql.DB {
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
	race TEXT,
	conditions TEXT,
	exhaustion_level INTEGER DEFAULT 0,
	lobby_id INTEGER DEFAULT 0
);
CREATE TABLE campaigns (
	id INTEGER PRIMARY KEY,
	combat_state TEXT DEFAULT '{}'
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

func seedCharacterWithRace(t *testing.T, testDB *sql.DB, id int, name, race, conditionsJSON string, exhaustion int) {
	t.Helper()
	_, err := testDB.Exec(
		`INSERT INTO characters (id, name, race, conditions, exhaustion_level) VALUES (?, ?, ?, ?, ?)`,
		id, name, race, conditionsJSON, exhaustion,
	)
	if err != nil {
		t.Fatalf("insert character: %v", err)
	}
}

// TestSQLiteRaceDetection tests race detection helpers for racial features
func TestSQLiteRaceDetection(t *testing.T) {
	testDB := setupSQLiteTestDBWithRace(t)
	seedCharacterWithRace(t, testDB, 1, "Bilbo", "Halfling", `[]`, 0)
	seedCharacterWithRace(t, testDB, 2, "Frodo", "Lightfoot Halfling", `[]`, 0)
	seedCharacterWithRace(t, testDB, 3, "Gimli", "Dwarf", `[]`, 0)
	seedCharacterWithRace(t, testDB, 4, "Durkon", "Mountain Dwarf", `[]`, 0)
	seedCharacterWithRace(t, testDB, 5, "Gromm", "Half-Orc", `[]`, 0)
	seedCharacterWithRace(t, testDB, 6, "Gnimble", "Forest Gnome", `[]`, 0)
	seedCharacterWithRace(t, testDB, 7, "Legolas", "Elf", `[]`, 0)
	seedCharacterWithRace(t, testDB, 8, "Mordai", "Tiefling", `[]`, 0)
	seedCharacterWithRace(t, testDB, 9, "Human", "Human", `[]`, 0)

	// Test Halfling detection
	if !isHalfling(1) {
		t.Error("expected Bilbo (Halfling) to be detected as halfling")
	}
	if !isHalfling(2) {
		t.Error("expected Frodo (Lightfoot Halfling) to be detected as halfling")
	}
	if isHalfling(9) {
		t.Error("expected Human to NOT be detected as halfling")
	}

	// Test Dwarf detection
	if !isDwarf(3) {
		t.Error("expected Gimli (Dwarf) to be detected as dwarf")
	}
	if !isDwarf(4) {
		t.Error("expected Durkon (Mountain Dwarf) to be detected as dwarf")
	}

	// Test Half-Orc detection
	if !isHalfOrc(5) {
		t.Error("expected Gromm (Half-Orc) to be detected as half-orc")
	}

	// Test Gnome detection
	if !isGnome(6) {
		t.Error("expected Gnimble (Forest Gnome) to be detected as gnome")
	}

	// Test Elf detection
	if !isElf(7) {
		t.Error("expected Legolas (Elf) to be detected as elf")
	}

	// Test Tiefling detection
	if !isTiefling(8) {
		t.Error("expected Mordai (Tiefling) to be detected as tiefling")
	}
}

// TestSQLiteDamageResistance tests damage resistance from conditions
func TestSQLiteDamageResistance(t *testing.T) {
	testDB := setupSQLiteTestDBWithRace(t)
	seedCharacterWithRace(t, testDB, 1, "Stony", "Human", `["petrified"]`, 0)
	seedCharacterWithRace(t, testDB, 2, "Normal", "Human", `[]`, 0)
	seedCharacterWithRace(t, testDB, 3, "Rocky", "Dwarf", `[]`, 0) // Dwarven Resilience: poison resistance
	seedCharacterWithRace(t, testDB, 4, "Fiery", "Tiefling", `[]`, 0) // Hellish Resistance: fire resistance

	// Test petrified resistance (halves ALL damage)
	result := applyDamageResistance(1, 20, "fire")
	if result.FinalDamage != 10 {
		t.Errorf("petrified damage resistance: got %d, want 10", result.FinalDamage)
	}
	if !result.WasHalved {
		t.Error("expected WasHalved to be true for petrified")
	}

	// Test normal character (no resistance)
	result = applyDamageResistance(2, 20, "fire")
	if result.FinalDamage != 20 {
		t.Errorf("normal character: got %d damage, want 20", result.FinalDamage)
	}

	// Test Dwarven Resilience (poison resistance)
	result = applyDamageResistance(3, 20, "poison")
	if result.FinalDamage != 10 {
		t.Errorf("dwarven poison resistance: got %d, want 10", result.FinalDamage)
	}

	// Test Tiefling Hellish Resistance (fire resistance)
	result = applyDamageResistance(4, 20, "fire")
	if result.FinalDamage != 10 {
		t.Errorf("tiefling fire resistance: got %d, want 10", result.FinalDamage)
	}

	// Test zero damage (edge case)
	result = applyDamageResistance(1, 0, "fire")
	if result.FinalDamage != 0 {
		t.Errorf("zero damage: got %d, want 0", result.FinalDamage)
	}
}

// TestSQLiteHalflingBrave tests the Halfling Brave racial feature (PHB p28)
func TestSQLiteHalflingBrave(t *testing.T) {
	testDB := setupSQLiteTestDBWithRace(t)
	seedCharacterWithRace(t, testDB, 1, "Merry", "Halfling", `[]`, 0)
	seedCharacterWithRace(t, testDB, 2, "Aragorn", "Human", `[]`, 0)

	// Halfling should get advantage on frighten saves
	if !checkHalflingBrave(1, "Save against the dragon's frightening presence") {
		t.Error("expected Halfling Brave to apply to frightening presence save")
	}
	if !checkHalflingBrave(1, "Save against being frightened") {
		t.Error("expected Halfling Brave to apply to being frightened")
	}
	if !checkHalflingBrave(1, "Fear effect from the vampire") {
		t.Error("expected Halfling Brave to apply to fear effect")
	}
	if !checkHalflingBrave(1, "The lich casts cause fear") {
		t.Error("expected Halfling Brave to apply to cause fear spell")
	}

	// Non-frighten saves should not trigger
	if checkHalflingBrave(1, "Save against fireball") {
		t.Error("did not expect Halfling Brave to apply to fireball save")
	}

	// Non-halflings should not get Halfling Brave
	if checkHalflingBrave(2, "Save against being frightened") {
		t.Error("did not expect Human to have Halfling Brave")
	}
}

// TestSQLiteFeyAncestry tests Elf/Half-Elf Fey Ancestry (charm advantage)
func TestSQLiteFeyAncestry(t *testing.T) {
	testDB := setupSQLiteTestDBWithRace(t)
	seedCharacterWithRace(t, testDB, 1, "Legolas", "Elf", `[]`, 0)
	seedCharacterWithRace(t, testDB, 2, "Elrond", "Half-Elf", `[]`, 0)
	seedCharacterWithRace(t, testDB, 3, "Boromir", "Human", `[]`, 0)

	// Elves have Fey Ancestry
	if !hasFeyAncestry(1) {
		t.Error("expected Elf to have Fey Ancestry")
	}
	if !hasFeyAncestry(2) {
		t.Error("expected Half-Elf to have Fey Ancestry")
	}
	if hasFeyAncestry(3) {
		t.Error("did not expect Human to have Fey Ancestry")
	}

	// Fey Ancestry gives charm save advantage
	if !checkFeyAncestryCharm(1, "Save against the vampire's charm") {
		t.Error("expected Fey Ancestry to apply to charm save")
	}
	if checkFeyAncestryCharm(1, "Save against fireball") {
		t.Error("did not expect Fey Ancestry to apply to non-charm save")
	}
}

// TestSQLiteGnomeCunning tests Gnome Cunning (magic INT/WIS/CHA save advantage)
func TestSQLiteGnomeCunning(t *testing.T) {
	testDB := setupSQLiteTestDBWithRace(t)
	seedCharacterWithRace(t, testDB, 1, "Gnimble", "Gnome", `[]`, 0)
	seedCharacterWithRace(t, testDB, 2, "Not-Gnome", "Human", `[]`, 0)

	// Gnome Cunning applies to INT/WIS/CHA saves against magic (from_magic=true)
	if !checkGnomeCunning(1, "int", true) {
		t.Error("expected Gnome Cunning to apply to INT saves vs magic")
	}
	if !checkGnomeCunning(1, "wis", true) {
		t.Error("expected Gnome Cunning to apply to WIS saves vs magic")
	}
	if !checkGnomeCunning(1, "cha", true) {
		t.Error("expected Gnome Cunning to apply to CHA saves vs magic")
	}

	// Does NOT apply to STR/DEX/CON (even against magic)
	if checkGnomeCunning(1, "str", true) {
		t.Error("did not expect Gnome Cunning to apply to STR saves")
	}
	if checkGnomeCunning(1, "dex", true) {
		t.Error("did not expect Gnome Cunning to apply to DEX saves")
	}
	if checkGnomeCunning(1, "con", true) {
		t.Error("did not expect Gnome Cunning to apply to CON saves")
	}

	// Does NOT apply to non-magic saves (from_magic=false)
	if checkGnomeCunning(1, "int", false) {
		t.Error("did not expect Gnome Cunning for non-magic INT save")
	}

	// Non-gnomes don't get it
	if checkGnomeCunning(2, "int", true) {
		t.Error("did not expect Human to have Gnome Cunning")
	}
}

// TestSQLiteDwarvenResilience tests Dwarf poison save advantage
func TestSQLiteDwarvenResilience(t *testing.T) {
	testDB := setupSQLiteTestDBWithRace(t)
	seedCharacterWithRace(t, testDB, 1, "Thorin", "Dwarf", `[]`, 0)
	seedCharacterWithRace(t, testDB, 2, "Human", "Human", `[]`, 0)

	// Dwarf gets advantage on poison saves
	if !checkDwarvenResilience(1, "Save against the poison") {
		t.Error("expected Dwarven Resilience to apply to poison save")
	}
	if !checkDwarvenResilience(1, "poisoned") {
		t.Error("expected Dwarven Resilience to apply to 'poisoned' keyword")
	}

	// Non-poison saves don't trigger
	if checkDwarvenResilience(1, "Save against fireball") {
		t.Error("did not expect Dwarven Resilience for fireball")
	}

	// Humans don't get it
	if checkDwarvenResilience(2, "Save against poison") {
		t.Error("did not expect Human to have Dwarven Resilience")
	}
}

// setupSQLiteTestDBWithClassAndSubclass creates a test DB with class, subclass, and subclass_choices columns for Hunter tests
func setupSQLiteTestDBWithClassAndSubclass(t *testing.T) *sql.DB {
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
	race TEXT,
	class TEXT,
	subclass TEXT,
	level INTEGER DEFAULT 1,
	conditions TEXT DEFAULT '[]',
	exhaustion_level INTEGER DEFAULT 0,
	subclass_choices TEXT DEFAULT '{}',
	lobby_id INTEGER DEFAULT 0
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

func seedHunterRanger(t *testing.T, testDB *sql.DB, id int, name string, level int, defensiveTactics string) {
	t.Helper()
	choicesJSON := "{}"
	if defensiveTactics != "" {
		choicesJSON = fmt.Sprintf(`{"defensive_tactics":"%s"}`, defensiveTactics)
	}
	_, err := testDB.Exec(
		`INSERT INTO characters (id, name, race, class, subclass, level, subclass_choices) VALUES (?, ?, ?, ?, ?, ?, ?)`,
		id, name, "Human", "ranger", "hunter", level, choicesJSON,
	)
	if err != nil {
		t.Fatalf("insert hunter ranger: %v", err)
	}
}

// TestSQLiteHunterDefensiveTactics tests Hunter Ranger Defensive Tactics (v0.9.58 PHB p93)
func TestSQLiteHunterDefensiveTactics(t *testing.T) {
	testDB := setupSQLiteTestDBWithClassAndSubclass(t)
	// Level 7+ Hunter with Escape the Horde
	seedHunterRanger(t, testDB, 1, "Strider", 7, "escape_the_horde")
	// Level 7+ Hunter with Steel Will
	seedHunterRanger(t, testDB, 2, "Aragorn", 7, "steel_will")
	// Level 7+ Hunter with Multiattack Defense
	seedHunterRanger(t, testDB, 3, "Drizzt", 8, "multiattack_defense")
	// Level 6 Hunter (too low for Defensive Tactics)
	seedHunterRanger(t, testDB, 4, "Newbie", 6, "escape_the_horde")
	// Non-hunter Ranger
	_, err := testDB.Exec(`INSERT INTO characters (id, name, race, class, subclass, level) VALUES (5, 'Beast Master', 'Human', 'ranger', 'beast_master', 10)`)
	if err != nil {
		t.Fatalf("insert beast master: %v", err)
	}
	// Non-ranger
	_, err = testDB.Exec(`INSERT INTO characters (id, name, race, class, level) VALUES (6, 'Fighter', 'Human', 'fighter', 10)`)
	if err != nil {
		t.Fatalf("insert fighter: %v", err)
	}

	// Test Escape the Horde
	t.Run("EscapeTheHorde", func(t *testing.T) {
		if !hasEscapeTheHorde(1) {
			t.Error("expected Strider (Level 7 Hunter with escape_the_horde) to have Escape the Horde")
		}
		if hasEscapeTheHorde(2) {
			t.Error("Aragorn chose steel_will, should not have Escape the Horde")
		}
		if hasEscapeTheHorde(4) {
			t.Error("Newbie is level 6, should not have Escape the Horde yet")
		}
		if hasEscapeTheHorde(5) {
			t.Error("Beast Master is not a Hunter, should not have Escape the Horde")
		}
		if hasEscapeTheHorde(6) {
			t.Error("Fighter should not have Escape the Horde")
		}
	})

	// Test Steel Will
	t.Run("SteelWill", func(t *testing.T) {
		if !hasSteelWill(2) {
			t.Error("expected Aragorn (Level 7 Hunter with steel_will) to have Steel Will")
		}
		if hasSteelWill(1) {
			t.Error("Strider chose escape_the_horde, should not have Steel Will")
		}
		// Check that Steel Will grants advantage on frighten saves
		if !checkSteelWill(2, "Save against the dragon's frightening presence") {
			t.Error("Steel Will should apply to frightening presence save")
		}
		if checkSteelWill(2, "Save against fireball") {
			t.Error("Steel Will should not apply to non-frighten saves")
		}
	})

	// Test Multiattack Defense
	t.Run("MultiattackDefense", func(t *testing.T) {
		if !hasMultiattackDefense(3) {
			t.Error("expected Drizzt (Level 8 Hunter with multiattack_defense) to have Multiattack Defense")
		}
		if hasMultiattackDefense(1) {
			t.Error("Strider chose escape_the_horde, should not have Multiattack Defense")
		}
	})

	// Test isHunterRangerWithDefensiveTactics helper
	t.Run("HunterRangerWithDefensiveTactics", func(t *testing.T) {
		if !isHunterRangerWithDefensiveTactics(1) {
			t.Error("Strider should be a Hunter Ranger with Defensive Tactics")
		}
		if isHunterRangerWithDefensiveTactics(4) {
			t.Error("Newbie is level 6, should not qualify for Defensive Tactics")
		}
		if isHunterRangerWithDefensiveTactics(5) {
			t.Error("Beast Master is not a Hunter")
		}
		if isHunterRangerWithDefensiveTactics(6) {
			t.Error("Fighter is not a Ranger")
		}
	})
}
