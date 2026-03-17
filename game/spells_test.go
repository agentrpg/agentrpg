package game

import (
	"reflect"
	"sort"
	"testing"
)

func TestScaledCantripDamage(t *testing.T) {
	// Fire Bolt scaling: 1d10 at 1, 2d10 at 5, 3d10 at 11, 4d10 at 17
	fireBolt := map[string]string{
		"1":  "1d10",
		"5":  "2d10",
		"11": "3d10",
		"17": "4d10",
	}

	tests := []struct {
		name     string
		damage   map[string]string
		level    int
		expected string
	}{
		{"Level 1 cantrip", fireBolt, 1, "1d10"},
		{"Level 4 cantrip", fireBolt, 4, "1d10"},
		{"Level 5 cantrip", fireBolt, 5, "2d10"},
		{"Level 10 cantrip", fireBolt, 10, "2d10"},
		{"Level 11 cantrip", fireBolt, 11, "3d10"},
		{"Level 16 cantrip", fireBolt, 16, "3d10"},
		{"Level 17 cantrip", fireBolt, 17, "4d10"},
		{"Level 20 cantrip", fireBolt, 20, "4d10"},
		{"Empty damage map", map[string]string{}, 5, ""},
		{"Only level 1 entry", map[string]string{"1": "1d6"}, 10, "1d6"},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := ScaledCantripDamage(tt.damage, tt.level)
			if result != tt.expected {
				t.Errorf("ScaledCantripDamage(%v, %d) = %q, want %q",
					tt.damage, tt.level, result, tt.expected)
			}
		})
	}
}

func TestMaxPreparedSpells(t *testing.T) {
	tests := []struct {
		name     string
		class    string
		level    int
		intl     int
		wis      int
		cha      int
		expected int
	}{
		// Wizard (INT-based, full level + INT mod)
		{"Wizard L1 INT 16", "wizard", 1, 16, 10, 10, 4},    // 1 + 3 = 4
		{"Wizard L5 INT 18", "wizard", 5, 18, 10, 10, 9},    // 5 + 4 = 9
		{"Wizard L10 INT 20", "wizard", 10, 20, 10, 10, 15}, // 10 + 5 = 15

		// Cleric (WIS-based, full level + WIS mod)
		{"Cleric L1 WIS 16", "cleric", 1, 10, 16, 10, 4}, // 1 + 3 = 4
		{"Cleric L5 WIS 18", "cleric", 5, 10, 18, 10, 9}, // 5 + 4 = 9

		// Druid (WIS-based, full level + WIS mod)
		{"Druid L3 WIS 14", "druid", 3, 10, 14, 10, 5}, // 3 + 2 = 5

		// Paladin (CHA-based, half level + CHA mod)
		{"Paladin L2 CHA 16", "paladin", 2, 10, 10, 16, 4},   // 1 + 3 = 4 (level/2 min 1)
		{"Paladin L4 CHA 16", "paladin", 4, 10, 10, 16, 5},   // 2 + 3 = 5
		{"Paladin L10 CHA 18", "paladin", 10, 10, 10, 18, 9}, // 5 + 4 = 9

		// Known casters return 0
		{"Bard returns 0", "bard", 5, 10, 10, 16, 0},
		{"Sorcerer returns 0", "sorcerer", 5, 10, 10, 16, 0},
		{"Warlock returns 0", "warlock", 5, 10, 10, 16, 0},
		{"Ranger returns 0", "ranger", 5, 10, 16, 10, 0},

		// Minimum 1 prepared
		{"Wizard L1 INT 6", "wizard", 1, 6, 10, 10, 1}, // 1 + (-2) = -1 -> 1

		// Non-casters
		{"Fighter returns 0", "fighter", 5, 10, 10, 10, 0},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := MaxPreparedSpells(tt.class, tt.level, tt.intl, tt.wis, tt.cha)
			if result != tt.expected {
				t.Errorf("MaxPreparedSpells(%q, %d, %d, %d, %d) = %d, want %d",
					tt.class, tt.level, tt.intl, tt.wis, tt.cha, result, tt.expected)
			}
		})
	}
}

func TestMulticlassSpellSlots(t *testing.T) {
	tests := []struct {
		name        string
		classLevels map[string]int
		expected    map[int]int
	}{
		{
			"Empty map",
			map[string]int{},
			map[int]int{},
		},
		{
			"Single class wizard 5",
			map[string]int{"wizard": 5},
			SpellSlots("wizard", 5),
		},
		{
			"Wizard 3 / Cleric 2 (combined level 5)",
			map[string]int{"wizard": 3, "cleric": 2},
			SpellSlots("wizard", 5), // Full casters add full level
		},
		{
			"Wizard 5 / Paladin 4 (combined level 7: 5 + 4/2)",
			map[string]int{"wizard": 5, "paladin": 4},
			SpellSlots("wizard", 7),
		},
		{
			"Fighter 5 only (non-caster)",
			map[string]int{"fighter": 5},
			map[int]int{},
		},
		{
			"Warlock 5 only (pact magic)",
			map[string]int{"warlock": 5},
			SpellSlots("warlock", 5),
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := MulticlassSpellSlots(tt.classLevels)
			if !reflect.DeepEqual(result, tt.expected) {
				t.Errorf("MulticlassSpellSlots(%v) = %v, want %v",
					tt.classLevels, result, tt.expected)
			}
		})
	}
}

func TestMulticlassSpellSlotsWarlockHybrid(t *testing.T) {
	// Wizard 5 / Warlock 3 should have:
	// - Wizard slots for level 5 (4 first, 3 second, 2 third)
	// - Plus Warlock slots for level 3 (2 second-level slots)
	classLevels := map[string]int{"wizard": 5, "warlock": 3}
	result := MulticlassSpellSlots(classLevels)

	// Wizard 5 slots
	wizardSlots := SpellSlots("wizard", 5)
	// Warlock 3 slots
	warlockSlots := SpellSlots("warlock", 3)

	// Combined should have both
	for level, count := range wizardSlots {
		if result[level] < count {
			t.Errorf("Expected at least %d slots at level %d from wizard, got %d",
				count, level, result[level])
		}
	}

	// Should also have warlock pact slots added
	for level, count := range warlockSlots {
		expectedMin := wizardSlots[level] + count
		if result[level] < expectedMin {
			t.Errorf("Expected at least %d slots at level %d (wizard + warlock), got %d",
				expectedMin, level, result[level])
		}
	}
}

func TestSlotRecoveryAbility(t *testing.T) {
	tests := []struct {
		name           string
		class          string
		subclass       string
		level          int
		expectAbility  string
		expectCombined int
		expectMaxLevel int
	}{
		{"Wizard L1", "wizard", "", 1, "arcane_recovery", 1, 5},
		{"Wizard L5", "wizard", "", 5, "arcane_recovery", 3, 5},         // (5+1)/2 = 3
		{"Wizard L10", "wizard", "", 10, "arcane_recovery", 5, 5},       // (10+1)/2 = 5
		{"Land Druid L2", "druid", "land", 2, "natural_recovery", 1, 5}, // (2+1)/2 = 1
		{"Land Druid L6", "druid", "land", 6, "natural_recovery", 3, 5}, // (6+1)/2 = 3
		{"Moon Druid L6 (no recovery)", "druid", "moon", 6, "", 0, 0},
		{"Land Druid L1 (too low)", "druid", "land", 1, "", 0, 0}, // Need level 2+
		{"Fighter (no recovery)", "fighter", "", 5, "", 0, 0},
		{"Cleric (no recovery)", "cleric", "life", 5, "", 0, 0},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			ability, combined, maxLevel := SlotRecoveryAbility(tt.class, tt.subclass, tt.level)
			if ability != tt.expectAbility {
				t.Errorf("SlotRecoveryAbility(%q, %q, %d) ability = %q, want %q",
					tt.class, tt.subclass, tt.level, ability, tt.expectAbility)
			}
			if combined != tt.expectCombined {
				t.Errorf("SlotRecoveryAbility(%q, %q, %d) combined = %d, want %d",
					tt.class, tt.subclass, tt.level, combined, tt.expectCombined)
			}
			if maxLevel != tt.expectMaxLevel {
				t.Errorf("SlotRecoveryAbility(%q, %q, %d) maxLevel = %d, want %d",
					tt.class, tt.subclass, tt.level, maxLevel, tt.expectMaxLevel)
			}
		})
	}
}

func TestLandCircleSpells(t *testing.T) {
	tests := []struct {
		name     string
		landType string
		level    int
		contains []string
		minCount int
	}{
		{"Arctic L3", "arctic", 3, []string{"hold-person", "spike-growth"}, 2},
		{"Arctic L5", "arctic", 5, []string{"hold-person", "sleet-storm"}, 4},
		{"Forest L9", "forest", 9, []string{"barkskin", "commune-with-nature"}, 8},
		{"Invalid land type", "ocean", 5, nil, 0},
		{"Level 1 (no spells yet)", "forest", 1, nil, 0},
		{"Case insensitive", "ARCTIC", 3, []string{"hold-person"}, 2},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := LandCircleSpells(tt.landType, tt.level)

			if tt.minCount == 0 {
				if result != nil && len(result) > 0 {
					t.Errorf("LandCircleSpells(%q, %d) = %v, want nil or empty",
						tt.landType, tt.level, result)
				}
				return
			}

			if len(result) < tt.minCount {
				t.Errorf("LandCircleSpells(%q, %d) has %d spells, want at least %d",
					tt.landType, tt.level, len(result), tt.minCount)
			}

			for _, spell := range tt.contains {
				found := false
				for _, s := range result {
					if s == spell {
						found = true
						break
					}
				}
				if !found {
					t.Errorf("LandCircleSpells(%q, %d) missing spell %q, got %v",
						tt.landType, tt.level, spell, result)
				}
			}
		})
	}
}

func TestValidLandTypes(t *testing.T) {
	types := ValidLandTypes()
	expected := []string{"arctic", "coast", "desert", "forest", "grassland", "mountain", "swamp", "underdark"}

	sort.Strings(types)
	sort.Strings(expected)

	if !reflect.DeepEqual(types, expected) {
		t.Errorf("ValidLandTypes() = %v, want %v", types, expected)
	}
}

func TestIsValidLandType(t *testing.T) {
	tests := []struct {
		landType string
		expected bool
	}{
		{"arctic", true},
		{"FOREST", true},
		{"Desert", true},
		{"ocean", false},
		{"", false},
		{"plains", false},
	}

	for _, tt := range tests {
		t.Run(tt.landType, func(t *testing.T) {
			result := IsValidLandType(tt.landType)
			if result != tt.expected {
				t.Errorf("IsValidLandType(%q) = %v, want %v",
					tt.landType, result, tt.expected)
			}
		})
	}
}

func TestIntToString(t *testing.T) {
	tests := []struct {
		n        int
		expected string
	}{
		{0, "0"},
		{1, "1"},
		{5, "5"},
		{11, "11"},
		{17, "17"},
		{100, "100"},
	}

	for _, tt := range tests {
		t.Run(tt.expected, func(t *testing.T) {
			result := intToString(tt.n)
			if result != tt.expected {
				t.Errorf("intToString(%d) = %q, want %q", tt.n, result, tt.expected)
			}
		})
	}
}
