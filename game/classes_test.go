package game

import (
	"testing"
)

func TestExtraAttackCount(t *testing.T) {
	tests := []struct {
		class string
		level int
		want  int
	}{
		{"fighter", 1, 1},
		{"fighter", 4, 1},
		{"fighter", 5, 2},
		{"fighter", 10, 2},
		{"fighter", 11, 3},
		{"fighter", 19, 3},
		{"fighter", 20, 4},
		{"barbarian", 4, 1},
		{"barbarian", 5, 2},
		{"barbarian", 20, 2},
		{"monk", 5, 2},
		{"paladin", 5, 2},
		{"ranger", 5, 2},
		{"wizard", 20, 1},
		{"rogue", 20, 1},
		{"FIGHTER", 5, 2}, // case insensitive
	}

	for _, tt := range tests {
		t.Run(tt.class+"_"+string(rune(tt.level)), func(t *testing.T) {
			got := ExtraAttackCount(tt.class, tt.level)
			if got != tt.want {
				t.Errorf("ExtraAttackCount(%q, %d) = %d, want %d", tt.class, tt.level, got, tt.want)
			}
		})
	}
}

func TestHitDie(t *testing.T) {
	tests := []struct {
		class string
		want  int
	}{
		{"barbarian", 12},
		{"fighter", 10},
		{"paladin", 10},
		{"ranger", 10},
		{"bard", 8},
		{"cleric", 8},
		{"druid", 8},
		{"monk", 8},
		{"rogue", 8},
		{"warlock", 8},
		{"sorcerer", 6},
		{"wizard", 6},
		{"unknown", 8}, // default
		{"BARBARIAN", 12}, // case insensitive
	}

	for _, tt := range tests {
		t.Run(tt.class, func(t *testing.T) {
			got := HitDie(tt.class)
			if got != tt.want {
				t.Errorf("HitDie(%q) = %d, want %d", tt.class, got, tt.want)
			}
		})
	}
}

func TestSpellSlots(t *testing.T) {
	// Full caster level 1
	slots := SpellSlots("wizard", 1)
	if slots[1] != 2 {
		t.Errorf("Wizard level 1 should have 2 first-level slots, got %d", slots[1])
	}

	// Full caster level 9
	slots = SpellSlots("cleric", 9)
	if slots[1] != 4 || slots[5] != 1 {
		t.Errorf("Cleric level 9 slots incorrect: %v", slots)
	}

	// Half caster level 2
	slots = SpellSlots("paladin", 2)
	if slots[1] != 2 {
		t.Errorf("Paladin level 2 should have 2 first-level slots, got %d", slots[1])
	}

	// Half caster level 1 (no spells yet)
	slots = SpellSlots("ranger", 1)
	if len(slots) != 0 {
		t.Errorf("Ranger level 1 should have no slots, got %v", slots)
	}

	// Warlock level 5
	slots = SpellSlots("warlock", 5)
	if slots[3] != 2 {
		t.Errorf("Warlock level 5 should have 2 third-level slots, got %v", slots)
	}

	// Non-caster
	slots = SpellSlots("fighter", 10)
	if len(slots) != 0 {
		t.Errorf("Fighter should have no slots, got %v", slots)
	}
}

func TestIsPreparedCaster(t *testing.T) {
	prepared := []string{"cleric", "druid", "paladin", "wizard"}
	notPrepared := []string{"bard", "ranger", "sorcerer", "warlock", "fighter", "rogue"}

	for _, c := range prepared {
		if !IsPreparedCaster(c) {
			t.Errorf("%s should be a prepared caster", c)
		}
	}

	for _, c := range notPrepared {
		if IsPreparedCaster(c) {
			t.Errorf("%s should not be a prepared caster", c)
		}
	}
}

func TestIsKnownCaster(t *testing.T) {
	known := []string{"bard", "ranger", "sorcerer", "warlock"}
	notKnown := []string{"cleric", "druid", "paladin", "wizard", "fighter", "rogue"}

	for _, c := range known {
		if !IsKnownCaster(c) {
			t.Errorf("%s should be a known caster", c)
		}
	}

	for _, c := range notKnown {
		if IsKnownCaster(c) {
			t.Errorf("%s should not be a known caster", c)
		}
	}
}

func TestSpellcastingAbility(t *testing.T) {
	tests := []struct {
		class string
		want  string
	}{
		{"wizard", "int"},
		{"cleric", "wis"},
		{"druid", "wis"},
		{"ranger", "wis"},
		{"bard", "cha"},
		{"paladin", "cha"},
		{"sorcerer", "cha"},
		{"warlock", "cha"},
		{"fighter", ""},
		{"rogue", ""},
	}

	for _, tt := range tests {
		t.Run(tt.class, func(t *testing.T) {
			got := SpellcastingAbility(tt.class)
			if got != tt.want {
				t.Errorf("SpellcastingAbility(%q) = %q, want %q", tt.class, got, tt.want)
			}
		})
	}
}

func TestSpellcastingAbilityMod(t *testing.T) {
	// INT 16 = +3, WIS 14 = +2, CHA 18 = +4
	intl, wis, cha := 16, 14, 18

	tests := []struct {
		class string
		want  int
	}{
		{"wizard", 3},  // INT
		{"cleric", 2},  // WIS
		{"bard", 4},    // CHA
		{"fighter", 0}, // non-caster
	}

	for _, tt := range tests {
		t.Run(tt.class, func(t *testing.T) {
			got := SpellcastingAbilityMod(tt.class, intl, wis, cha)
			if got != tt.want {
				t.Errorf("SpellcastingAbilityMod(%q, %d, %d, %d) = %d, want %d", tt.class, intl, wis, cha, got, tt.want)
			}
		})
	}
}

func TestSpellSaveDC(t *testing.T) {
	// Level 5 (+3 prof) with +4 mod = 8 + 3 + 4 = 15
	if dc := SpellSaveDC(5, 4); dc != 15 {
		t.Errorf("SpellSaveDC(5, 4) = %d, want 15", dc)
	}

	// Level 1 (+2 prof) with +2 mod = 8 + 2 + 2 = 12
	if dc := SpellSaveDC(1, 2); dc != 12 {
		t.Errorf("SpellSaveDC(1, 2) = %d, want 12", dc)
	}
}

func TestClassResources(t *testing.T) {
	// Monk has Ki
	monk := ClassResources("monk")
	if len(monk) != 1 || monk[0].Key != "ki" {
		t.Errorf("Monk resources incorrect: %v", monk)
	}

	// Fighter has Second Wind and Action Surge
	fighter := ClassResources("fighter")
	if len(fighter) != 2 {
		t.Errorf("Fighter should have 2 resources, got %d", len(fighter))
	}

	// Paladin has Channel Divinity and Lay on Hands
	paladin := ClassResources("paladin")
	if len(paladin) != 2 {
		t.Errorf("Paladin should have 2 resources, got %d", len(paladin))
	}

	// Rogue has no resources
	rogue := ClassResources("rogue")
	if rogue != nil {
		t.Errorf("Rogue should have no resources, got %v", rogue)
	}
}

func TestMaxClassResource(t *testing.T) {
	tests := []struct {
		class    string
		level    int
		resource string
		chaMod   int
		want     int
	}{
		// Ki equals monk level
		{"monk", 5, "ki", 0, 5},
		{"monk", 10, "ki", 0, 10},
		// Rage scales with level
		{"barbarian", 1, "rage", 0, 2},
		{"barbarian", 6, "rage", 0, 4},
		{"barbarian", 20, "rage", 0, 999}, // unlimited
		// Bardic Inspiration scales with CHA mod
		{"bard", 5, "bardic_inspiration", 3, 3},
		{"bard", 5, "bardic_inspiration", 0, 1}, // min 1
		// Lay on Hands pool
		{"paladin", 5, "lay_on_hands", 0, 25},
		{"paladin", 10, "lay_on_hands", 0, 50},
		// Channel Divinity for cleric
		{"cleric", 2, "channel_divinity", 0, 1},
		{"cleric", 6, "channel_divinity", 0, 2},
		{"cleric", 18, "channel_divinity", 0, 3},
	}

	for _, tt := range tests {
		t.Run(tt.class+"_"+tt.resource, func(t *testing.T) {
			got := MaxClassResource(tt.class, tt.level, tt.resource, tt.chaMod)
			if got != tt.want {
				t.Errorf("MaxClassResource(%q, %d, %q, %d) = %d, want %d",
					tt.class, tt.level, tt.resource, tt.chaMod, got, tt.want)
			}
		})
	}
}

func TestGetActiveClassFeatures(t *testing.T) {
	// Fighter level 1 should have Fighting Style and Second Wind
	features := GetActiveClassFeatures("fighter", 1)
	if len(features) != 2 {
		t.Errorf("Fighter level 1 should have 2 features, got %d", len(features))
	}

	// Fighter level 5 should have Extra Attack
	features = GetActiveClassFeatures("fighter", 5)
	hasExtraAttack := false
	for _, f := range features {
		if f.Name == "Extra Attack" {
			hasExtraAttack = true
			break
		}
	}
	if !hasExtraAttack {
		t.Error("Fighter level 5 should have Extra Attack")
	}

	// Unknown class should return nil
	features = GetActiveClassFeatures("unknown", 10)
	if features != nil {
		t.Errorf("Unknown class should return nil, got %v", features)
	}
}

func TestHasClassFeature(t *testing.T) {
	// Fighter level 2 has action_surge
	if !HasClassFeature("fighter", 2, "action_surge") {
		t.Error("Fighter level 2 should have action_surge")
	}

	// Fighter level 1 does not have action_surge
	if HasClassFeature("fighter", 1, "action_surge") {
		t.Error("Fighter level 1 should not have action_surge")
	}

	// Rogue has sneak_attack at level 1
	if !HasClassFeature("rogue", 1, "sneak_attack") {
		t.Error("Rogue level 1 should have sneak_attack")
	}

	// Monk has evasion at level 7
	if !HasClassFeature("monk", 7, "evasion") {
		t.Error("Monk level 7 should have evasion")
	}
	if HasClassFeature("monk", 6, "evasion") {
		t.Error("Monk level 6 should not have evasion")
	}
}

func TestGetClassFeatureMechanic(t *testing.T) {
	// Barbarian brutal_critical scales
	val, ok := GetClassFeatureMechanic("barbarian", 9, "brutal_critical")
	if !ok || val != "1" {
		t.Errorf("Barbarian level 9 brutal_critical should be 1, got %q", val)
	}

	val, ok = GetClassFeatureMechanic("barbarian", 13, "brutal_critical")
	if !ok || val != "2" {
		t.Errorf("Barbarian level 13 brutal_critical should be 2, got %q", val)
	}

	val, ok = GetClassFeatureMechanic("barbarian", 17, "brutal_critical")
	if !ok || val != "3" {
		t.Errorf("Barbarian level 17 brutal_critical should be 3, got %q", val)
	}

	// Non-existent mechanic
	_, ok = GetClassFeatureMechanic("fighter", 20, "nonexistent")
	if ok {
		t.Error("Non-existent mechanic should return false")
	}
}

func TestMartialArtsDie(t *testing.T) {
	tests := []struct {
		level int
		want  int
	}{
		{1, 4},
		{4, 4},
		{5, 6},
		{10, 6},
		{11, 8},
		{16, 8},
		{17, 10},
		{20, 10},
	}

	for _, tt := range tests {
		t.Run("level_"+string(rune(tt.level)), func(t *testing.T) {
			got := MartialArtsDie(tt.level)
			if got != tt.want {
				t.Errorf("MartialArtsDie(%d) = %d, want %d", tt.level, got, tt.want)
			}
		})
	}
}

func TestSneakAttackDice(t *testing.T) {
	tests := []struct {
		level int
		want  int
	}{
		{1, 1},
		{2, 1},
		{3, 2},
		{4, 2},
		{5, 3},
		{19, 10},
		{20, 10},
	}

	for _, tt := range tests {
		t.Run("level_"+string(rune(tt.level)), func(t *testing.T) {
			got := SneakAttackDice(tt.level)
			if got != tt.want {
				t.Errorf("SneakAttackDice(%d) = %d, want %d", tt.level, got, tt.want)
			}
		})
	}
}

func TestBardicInspirationDie(t *testing.T) {
	tests := []struct {
		level int
		want  int
	}{
		{1, 6},
		{4, 6},
		{5, 8},
		{9, 8},
		{10, 10},
		{14, 10},
		{15, 12},
		{20, 12},
	}

	for _, tt := range tests {
		t.Run("level_"+string(rune(tt.level)), func(t *testing.T) {
			got := BardicInspirationDie(tt.level)
			if got != tt.want {
				t.Errorf("BardicInspirationDie(%d) = %d, want %d", tt.level, got, tt.want)
			}
		})
	}
}

func TestBrutalCriticalDice(t *testing.T) {
	tests := []struct {
		level int
		want  int
	}{
		{1, 0},
		{8, 0},
		{9, 1},
		{12, 1},
		{13, 2},
		{16, 2},
		{17, 3},
		{20, 3},
	}

	for _, tt := range tests {
		t.Run("level_"+string(rune(tt.level)), func(t *testing.T) {
			got := BrutalCriticalDice(tt.level)
			if got != tt.want {
				t.Errorf("BrutalCriticalDice(%d) = %d, want %d", tt.level, got, tt.want)
			}
		})
	}
}

func TestRageDamageBonus(t *testing.T) {
	tests := []struct {
		level int
		want  int
	}{
		{1, 2},
		{8, 2},
		{9, 3},
		{15, 3},
		{16, 4},
		{20, 4},
	}

	for _, tt := range tests {
		t.Run("level_"+string(rune(tt.level)), func(t *testing.T) {
			got := RageDamageBonus(tt.level)
			if got != tt.want {
				t.Errorf("RageDamageBonus(%d) = %d, want %d", tt.level, got, tt.want)
			}
		})
	}
}

func TestUnarmoredMovementBonus(t *testing.T) {
	tests := []struct {
		level int
		want  int
	}{
		{1, 0},
		{2, 10},
		{5, 10},
		{6, 15},
		{9, 15},
		{10, 20},
		{13, 20},
		{14, 25},
		{17, 25},
		{18, 30},
		{20, 30},
	}

	for _, tt := range tests {
		t.Run("level_"+string(rune(tt.level)), func(t *testing.T) {
			got := UnarmoredMovementBonus(tt.level)
			if got != tt.want {
				t.Errorf("UnarmoredMovementBonus(%d) = %d, want %d", tt.level, got, tt.want)
			}
		})
	}
}
