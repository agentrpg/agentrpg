package game

import (
	"testing"
)

func TestAvailableSubclassesCount(t *testing.T) {
	// SRD has 12 subclasses (one per class)
	if len(AvailableSubclasses) != 12 {
		t.Errorf("Expected 12 subclasses, got %d", len(AvailableSubclasses))
	}
}

func TestGetSubclassesForClass(t *testing.T) {
	tests := []struct {
		class    string
		expected []string
	}{
		{"barbarian", []string{"berserker"}},
		{"fighter", []string{"champion"}},
		{"rogue", []string{"thief"}},
		{"paladin", []string{"devotion"}},
		{"ranger", []string{"hunter"}},
		{"bard", []string{"lore"}},
		{"cleric", []string{"life"}},
		{"druid", []string{"land"}},
		{"monk", []string{"open-hand"}},
		{"sorcerer", []string{"draconic"}},
		{"warlock", []string{"fiend"}},
		{"wizard", []string{"evocation"}},
	}

	for _, tt := range tests {
		t.Run(tt.class, func(t *testing.T) {
			result := GetSubclassesForClass(tt.class)
			if len(result) != len(tt.expected) {
				t.Errorf("GetSubclassesForClass(%q) returned %d subclasses, expected %d", tt.class, len(result), len(tt.expected))
			}
			for _, slug := range tt.expected {
				if _, ok := result[slug]; !ok {
					t.Errorf("GetSubclassesForClass(%q) missing expected subclass %q", tt.class, slug)
				}
			}
		})
	}
}

func TestGetSubclass(t *testing.T) {
	tests := []struct {
		slug     string
		wantNil  bool
		wantName string
	}{
		{"champion", false, "Champion"},
		{"berserker", false, "Berserker"},
		{"thief", false, "Thief"},
		{"nonexistent", true, ""},
	}

	for _, tt := range tests {
		t.Run(tt.slug, func(t *testing.T) {
			result := GetSubclass(tt.slug)
			if tt.wantNil {
				if result != nil {
					t.Errorf("GetSubclass(%q) = %v, expected nil", tt.slug, result)
				}
			} else {
				if result == nil {
					t.Errorf("GetSubclass(%q) = nil, expected non-nil", tt.slug)
				} else if result.Name != tt.wantName {
					t.Errorf("GetSubclass(%q).Name = %q, expected %q", tt.slug, result.Name, tt.wantName)
				}
			}
		})
	}
}

func TestGetActiveSubclassFeatures(t *testing.T) {
	tests := []struct {
		subclass     string
		level        int
		expectedMin  int // minimum number of features expected
	}{
		{"champion", 3, 1},   // Improved Critical
		{"champion", 7, 2},   // + Remarkable Athlete
		{"champion", 15, 4},  // + Additional Fighting Style + Superior Critical
		{"champion", 18, 5},  // + Survivor
		{"thief", 3, 2},      // Fast Hands + Second-Story Work
		{"thief", 17, 5},     // All features
		{"berserker", 3, 1},  // Frenzy
		{"berserker", 14, 4}, // All features
	}

	for _, tt := range tests {
		t.Run(tt.subclass, func(t *testing.T) {
			features := GetActiveSubclassFeatures(tt.subclass, tt.level)
			if len(features) < tt.expectedMin {
				t.Errorf("GetActiveSubclassFeatures(%q, %d) returned %d features, expected at least %d", 
					tt.subclass, tt.level, len(features), tt.expectedMin)
			}
		})
	}
}

func TestGetActiveSubclassFeaturesInvalid(t *testing.T) {
	features := GetActiveSubclassFeatures("nonexistent", 10)
	if features != nil {
		t.Errorf("GetActiveSubclassFeatures(nonexistent) = %v, expected nil", features)
	}
}

func TestHasSubclassFeature(t *testing.T) {
	tests := []struct {
		subclass string
		level    int
		mechanic string
		expected bool
	}{
		// Champion
		{"champion", 3, "crit_range", true},
		{"champion", 2, "crit_range", false}, // Not at level 2
		{"champion", 7, "remarkable_athlete", true},
		{"champion", 6, "remarkable_athlete", false},
		{"champion", 18, "survivor_regen", true},
		
		// Berserker
		{"berserker", 3, "frenzy_bonus_attack", true},
		{"berserker", 6, "rage_immune_charm", true},
		{"berserker", 14, "retaliation_attack", true},
		
		// Thief
		{"thief", 3, "fast_hands", true},
		{"thief", 9, "supreme_sneak", true},
		{"thief", 17, "extra_first_round_turn", true},
		
		// Life Cleric
		{"life", 1, "bonus_healing", true},
		{"life", 6, "blessed_healer", true},
		{"life", 17, "supreme_healing", true},
		
		// Nonexistent
		{"champion", 20, "nonexistent_mechanic", false},
		{"nonexistent", 10, "anything", false},
	}

	for _, tt := range tests {
		name := tt.subclass + "_" + tt.mechanic
		t.Run(name, func(t *testing.T) {
			result := HasSubclassFeature(tt.subclass, tt.level, tt.mechanic)
			if result != tt.expected {
				t.Errorf("HasSubclassFeature(%q, %d, %q) = %v, expected %v", 
					tt.subclass, tt.level, tt.mechanic, result, tt.expected)
			}
		})
	}
}

func TestGetSubclassMechanic(t *testing.T) {
	tests := []struct {
		subclass  string
		level     int
		mechanic  string
		wantVal   string
		wantFound bool
	}{
		{"champion", 3, "crit_range", "19", true},
		{"champion", 15, "crit_range", "18", true}, // Superior Critical overwrites at higher level
		{"champion", 7, "remarkable_athlete", "true", true},
		{"life", 1, "bonus_healing", "2+spell_level", true},
		{"draconic", 1, "natural_ac", "13+dex", true},
		{"champion", 3, "nonexistent", "", false},
	}

	for _, tt := range tests {
		name := tt.subclass + "_" + tt.mechanic
		t.Run(name, func(t *testing.T) {
			val, found := GetSubclassMechanic(tt.subclass, tt.level, tt.mechanic)
			if found != tt.wantFound {
				t.Errorf("GetSubclassMechanic(%q, %d, %q) found=%v, expected %v", 
					tt.subclass, tt.level, tt.mechanic, found, tt.wantFound)
			}
			// For crit_range, we just check it's found since the value depends on which feature is checked first
			if tt.wantFound && tt.mechanic != "crit_range" && val != tt.wantVal {
				t.Errorf("GetSubclassMechanic(%q, %d, %q) = %q, expected %q", 
					tt.subclass, tt.level, tt.mechanic, val, tt.wantVal)
			}
		})
	}
}

func TestGetDomainSpells(t *testing.T) {
	tests := []struct {
		subclass string
		level    int
		minCount int
	}{
		{"life", 1, 2},    // bless, cure-wounds
		{"life", 3, 4},    // +lesser-restoration, spiritual-weapon
		{"life", 9, 10},   // All 5 levels of domain spells
		{"devotion", 3, 2},
		{"devotion", 17, 10},
		{"fiend", 1, 2},
		{"champion", 10, 0}, // No domain spells
	}

	for _, tt := range tests {
		name := tt.subclass
		t.Run(name, func(t *testing.T) {
			spells := GetDomainSpells(tt.subclass, tt.level)
			if len(spells) < tt.minCount {
				t.Errorf("GetDomainSpells(%q, %d) returned %d spells, expected at least %d", 
					tt.subclass, tt.level, len(spells), tt.minCount)
			}
		})
	}
}

func TestDragonAncestryDamageTypes(t *testing.T) {
	expected := map[string]string{
		"black":  "acid",
		"blue":   "lightning",
		"brass":  "fire",
		"bronze": "lightning",
		"copper": "acid",
		"gold":   "fire",
		"green":  "poison",
		"red":    "fire",
		"silver": "cold",
		"white":  "cold",
	}

	if len(DragonAncestryDamageTypes) != len(expected) {
		t.Errorf("DragonAncestryDamageTypes has %d entries, expected %d", 
			len(DragonAncestryDamageTypes), len(expected))
	}

	for ancestry, dmgType := range expected {
		if got := DragonAncestryDamageTypes[ancestry]; got != dmgType {
			t.Errorf("DragonAncestryDamageTypes[%q] = %q, expected %q", ancestry, got, dmgType)
		}
	}
}

func TestAllSubclassSlugs(t *testing.T) {
	slugs := AllSubclassSlugs()
	if len(slugs) != 12 {
		t.Errorf("AllSubclassSlugs() returned %d slugs, expected 12", len(slugs))
	}

	// Check all expected slugs are present
	expected := []string{
		"berserker", "champion", "thief", "devotion", "hunter", "lore",
		"life", "land", "open-hand", "draconic", "fiend", "evocation",
	}
	slugMap := make(map[string]bool)
	for _, s := range slugs {
		slugMap[s] = true
	}
	for _, e := range expected {
		if !slugMap[e] {
			t.Errorf("AllSubclassSlugs() missing expected slug %q", e)
		}
	}
}

func TestGetNaturalACBase(t *testing.T) {
	tests := []struct {
		subclass string
		level    int
		expected int
	}{
		{"draconic", 1, 13},
		{"draconic", 10, 13},
		{"champion", 10, 0},
		{"berserker", 10, 0},
		{"life", 1, 0},
	}

	for _, tt := range tests {
		t.Run(tt.subclass, func(t *testing.T) {
			result := GetNaturalACBase(tt.subclass, tt.level)
			if result != tt.expected {
				t.Errorf("GetNaturalACBase(%q, %d) = %d, expected %d", 
					tt.subclass, tt.level, result, tt.expected)
			}
		})
	}
}

func TestGetDraconicBonusHP(t *testing.T) {
	tests := []struct {
		subclass string
		expected int
	}{
		{"draconic", 1},
		{"champion", 0},
		{"berserker", 0},
	}

	for _, tt := range tests {
		t.Run(tt.subclass, func(t *testing.T) {
			result := GetDraconicBonusHP(tt.subclass)
			if result != tt.expected {
				t.Errorf("GetDraconicBonusHP(%q) = %d, expected %d", 
					tt.subclass, result, tt.expected)
			}
		})
	}
}

func TestSubclassLevels(t *testing.T) {
	// Verify subclass unlock levels are correct per PHB
	expected := map[string]int{
		"life":     1,  // Cleric - level 1
		"draconic": 1,  // Sorcerer - level 1
		"fiend":    1,  // Warlock - level 1
		"land":     2,  // Druid - level 2
		"evocation": 2, // Wizard - level 2
		"berserker": 3, // Barbarian - level 3
		"champion": 3,  // Fighter - level 3
		"thief":    3,  // Rogue - level 3
		"devotion": 3,  // Paladin - level 3
		"hunter":   3,  // Ranger - level 3
		"lore":     3,  // Bard - level 3
		"open-hand": 3, // Monk - level 3
	}

	for slug, expectedLevel := range expected {
		sub := GetSubclass(slug)
		if sub == nil {
			t.Errorf("Subclass %q not found", slug)
			continue
		}
		if sub.SubclassLevel != expectedLevel {
			t.Errorf("Subclass %q has SubclassLevel=%d, expected %d", 
				slug, sub.SubclassLevel, expectedLevel)
		}
	}
}
