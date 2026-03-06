package game

import (
	"testing"
)

func TestNormalizeRace(t *testing.T) {
	tests := []struct {
		input    string
		expected string
	}{
		{"Human", "human"},
		{"High Elf", "high_elf"},
		{"Half-Elf", "half_elf"},
		{"half_orc", "half_orc"},
		{"DWARF", "dwarf"},
	}
	
	for _, tt := range tests {
		got := normalizeRace(tt.input)
		if got != tt.expected {
			t.Errorf("normalizeRace(%q) = %q, want %q", tt.input, got, tt.expected)
		}
	}
}

func TestIsRaceChecks(t *testing.T) {
	tests := []struct {
		race     string
		checkFn  func(string) bool
		funcName string
		expected bool
	}{
		// Human
		{"Human", IsHuman, "IsHuman", true},
		{"human", IsHuman, "IsHuman", true},
		{"Elf", IsHuman, "IsHuman", false},
		
		// Elf (matches all elf variants)
		{"Elf", IsElf, "IsElf", true},
		{"High Elf", IsElf, "IsElf", true},
		{"Wood Elf", IsElf, "IsElf", true},
		{"Drow", IsElf, "IsElf", false}, // Drow doesn't contain "elf"
		{"Dark Elf", IsElf, "IsElf", true},
		{"Half-Elf", IsElf, "IsElf", true},
		{"half_elf", IsElf, "IsElf", true},
		{"Dwarf", IsElf, "IsElf", false},
		
		// Dwarf
		{"Dwarf", IsDwarf, "IsDwarf", true},
		{"Hill Dwarf", IsDwarf, "IsDwarf", true},
		{"Mountain Dwarf", IsDwarf, "IsDwarf", true},
		{"Elf", IsDwarf, "IsDwarf", false},
		
		// Halfling
		{"Halfling", IsHalfling, "IsHalfling", true},
		{"Lightfoot Halfling", IsHalfling, "IsHalfling", true},
		{"Stout Halfling", IsHalfling, "IsHalfling", true},
		{"Gnome", IsHalfling, "IsHalfling", false},
		
		// Gnome
		{"Gnome", IsGnome, "IsGnome", true},
		{"Rock Gnome", IsGnome, "IsGnome", true},
		{"Forest Gnome", IsGnome, "IsGnome", true},
		{"Halfling", IsGnome, "IsGnome", false},
		
		// Half-Orc
		{"Half-Orc", IsHalfOrc, "IsHalfOrc", true},
		{"half_orc", IsHalfOrc, "IsHalfOrc", true},
		{"HalfOrc", IsHalfOrc, "IsHalfOrc", true},
		{"Orc", IsHalfOrc, "IsHalfOrc", false},
		{"Human", IsHalfOrc, "IsHalfOrc", false},
		
		// Tiefling
		{"Tiefling", IsTiefling, "IsTiefling", true},
		{"tiefling", IsTiefling, "IsTiefling", true},
		{"Human", IsTiefling, "IsTiefling", false},
		
		// Dragonborn
		{"Dragonborn", IsDragonborn, "IsDragonborn", true},
		{"dragonborn", IsDragonborn, "IsDragonborn", true},
		{"Human", IsDragonborn, "IsDragonborn", false},
	}
	
	for _, tt := range tests {
		got := tt.checkFn(tt.race)
		if got != tt.expected {
			t.Errorf("%s(%q) = %v, want %v", tt.funcName, tt.race, got, tt.expected)
		}
	}
}

func TestRacialTraits(t *testing.T) {
	// Fey Ancestry - Elves and Half-Elves
	if !HasFeyAncestry("High Elf") {
		t.Error("High Elf should have Fey Ancestry")
	}
	if !HasFeyAncestry("Half-Elf") {
		t.Error("Half-Elf should have Fey Ancestry")
	}
	if HasFeyAncestry("Human") {
		t.Error("Human should not have Fey Ancestry")
	}
	
	// Gnome Cunning
	if !HasGnomeCunning("Gnome") {
		t.Error("Gnome should have Gnome Cunning")
	}
	if !HasGnomeCunning("Rock Gnome") {
		t.Error("Rock Gnome should have Gnome Cunning")
	}
	if HasGnomeCunning("Halfling") {
		t.Error("Halfling should not have Gnome Cunning")
	}
	
	// Dwarven Resilience
	if !HasDwarvenResilience("Dwarf") {
		t.Error("Dwarf should have Dwarven Resilience")
	}
	if HasDwarvenResilience("Elf") {
		t.Error("Elf should not have Dwarven Resilience")
	}
	
	// Halfling Lucky
	if !HasHalflingLucky("Halfling") {
		t.Error("Halfling should have Lucky trait")
	}
	if HasHalflingLucky("Gnome") {
		t.Error("Gnome should not have Lucky trait")
	}
	
	// Halfling Brave
	if !HasHalflingBrave("Stout Halfling") {
		t.Error("Stout Halfling should have Brave trait")
	}
	
	// Relentless Endurance (Half-Orc)
	if !HasRelentlessEndurance("Half-Orc") {
		t.Error("Half-Orc should have Relentless Endurance")
	}
	if HasRelentlessEndurance("Human") {
		t.Error("Human should not have Relentless Endurance")
	}
	
	// Savage Attacks (Half-Orc)
	if !HasSavageAttacks("half_orc") {
		t.Error("half_orc should have Savage Attacks")
	}
	
	// Hellish Resistance (Tiefling)
	if !HasHellishResistance("Tiefling") {
		t.Error("Tiefling should have Hellish Resistance")
	}
	if HasHellishResistance("Human") {
		t.Error("Human should not have Hellish Resistance")
	}
	
	// Breath Weapon (Dragonborn)
	if !HasBreathWeapon("Dragonborn") {
		t.Error("Dragonborn should have Breath Weapon")
	}
	if HasBreathWeapon("Human") {
		t.Error("Human should not have Breath Weapon")
	}
}

func TestGetRaceSize(t *testing.T) {
	tests := []struct {
		race     string
		expected string
	}{
		{"Human", SizeMedium},
		{"Elf", SizeMedium},
		{"Dwarf", SizeMedium},
		{"Half-Orc", SizeMedium},
		{"Halfling", SizeSmall},
		{"Lightfoot Halfling", SizeSmall},
		{"Gnome", SizeSmall},
		{"Rock Gnome", SizeSmall},
		{"Tiefling", SizeMedium},
		{"Dragonborn", SizeMedium},
	}
	
	for _, tt := range tests {
		got := GetRaceSize(tt.race)
		if got != tt.expected {
			t.Errorf("GetRaceSize(%q) = %q, want %q", tt.race, got, tt.expected)
		}
	}
}

func TestGetDefaultSpeed(t *testing.T) {
	tests := []struct {
		race     string
		expected int
	}{
		{"Human", 30},
		{"Elf", 30},
		{"Wood Elf", 35},
		{"Dwarf", 25},
		{"Hill Dwarf", 25},
		{"Halfling", 25},
		{"Gnome", 25},
		{"Half-Orc", 30},
		{"Tiefling", 30},
		{"Dragonborn", 30},
	}
	
	for _, tt := range tests {
		got := GetDefaultSpeed(tt.race)
		if got != tt.expected {
			t.Errorf("GetDefaultSpeed(%q) = %d, want %d", tt.race, got, tt.expected)
		}
	}
}

func TestSizeOrder(t *testing.T) {
	if SizeOrder(SizeTiny) >= SizeOrder(SizeSmall) {
		t.Error("Tiny should be smaller than Small")
	}
	if SizeOrder(SizeSmall) >= SizeOrder(SizeMedium) {
		t.Error("Small should be smaller than Medium")
	}
	if SizeOrder(SizeMedium) >= SizeOrder(SizeLarge) {
		t.Error("Medium should be smaller than Large")
	}
	if SizeOrder(SizeLarge) >= SizeOrder(SizeHuge) {
		t.Error("Large should be smaller than Huge")
	}
	if SizeOrder(SizeHuge) >= SizeOrder(SizeGargantuan) {
		t.Error("Huge should be smaller than Gargantuan")
	}
}

func TestIsSizeAtLeastOneLarger(t *testing.T) {
	// Horse (Large) can carry Medium rider
	if !IsSizeAtLeastOneLarger(SizeLarge, SizeMedium) {
		t.Error("Large should be at least one size larger than Medium")
	}
	
	// Mastiff (Medium) can carry Small rider
	if !IsSizeAtLeastOneLarger(SizeMedium, SizeSmall) {
		t.Error("Medium should be at least one size larger than Small")
	}
	
	// Medium cannot carry Medium
	if IsSizeAtLeastOneLarger(SizeMedium, SizeMedium) {
		t.Error("Medium is not larger than Medium")
	}
	
	// Small cannot carry Medium
	if IsSizeAtLeastOneLarger(SizeSmall, SizeMedium) {
		t.Error("Small is not larger than Medium")
	}
}

func TestKeywordChecks(t *testing.T) {
	// Frighten keywords
	if !CheckFrightenKeywords("The dragon's terrifying presence") {
		t.Error("Should match 'terrifying'")
	}
	if !CheckFrightenKeywords("Save against being frightened") {
		t.Error("Should match 'frightened'")
	}
	if CheckFrightenKeywords("A normal attack") {
		t.Error("Should not match normal attack")
	}
	
	// Charm keywords
	if !CheckCharmKeywords("You are charmed by the vampire") {
		t.Error("Should match 'charmed'")
	}
	if !CheckCharmKeywords("The suggestion spell") {
		t.Error("Should match 'suggestion'")
	}
	if CheckCharmKeywords("A fire attack") {
		t.Error("Should not match fire attack")
	}
	
	// Poison keywords
	if !CheckPoisonKeywords("You are poisoned") {
		t.Error("Should match 'poisoned'")
	}
	if !CheckPoisonKeywords("Venomous bite") {
		t.Error("Should match 'venomous'")
	}
	if CheckPoisonKeywords("A slashing attack") {
		t.Error("Should not match slashing attack")
	}
}

func TestRacialSaveAdvantages(t *testing.T) {
	// Halfling Brave
	if !CheckHalflingBrave("Halfling", "dragon's frightening presence") {
		t.Error("Halfling should get Brave advantage vs frightening presence")
	}
	if CheckHalflingBrave("Human", "dragon's frightening presence") {
		t.Error("Human should not get Halfling Brave")
	}
	if CheckHalflingBrave("Halfling", "fire damage") {
		t.Error("Halfling Brave only applies to frighten saves")
	}
	
	// Fey Ancestry (Charm)
	if !CheckFeyAncestryCharm("High Elf", "vampire's charm") {
		t.Error("High Elf should get Fey Ancestry advantage vs charm")
	}
	if !CheckFeyAncestryCharm("Half-Elf", "dominate person") {
		t.Error("Half-Elf should get Fey Ancestry advantage vs dominate")
	}
	if CheckFeyAncestryCharm("Dwarf", "vampire's charm") {
		t.Error("Dwarf should not get Fey Ancestry")
	}
	
	// Dwarven Resilience (Poison)
	if !CheckDwarvenResiliencePoison("Dwarf", "poisoned blade") {
		t.Error("Dwarf should get advantage vs poison")
	}
	if CheckDwarvenResiliencePoison("Elf", "poisoned blade") {
		t.Error("Elf should not get Dwarven Resilience")
	}
	
	// Gnome Cunning (Magic + INT/WIS/CHA)
	if !CheckGnomeCunningMagic("Gnome", "wis", true) {
		t.Error("Gnome should get advantage on WIS save vs magic")
	}
	if !CheckGnomeCunningMagic("Rock Gnome", "int", true) {
		t.Error("Rock Gnome should get advantage on INT save vs magic")
	}
	if CheckGnomeCunningMagic("Gnome", "str", true) {
		t.Error("Gnome Cunning doesn't apply to STR saves")
	}
	if CheckGnomeCunningMagic("Gnome", "wis", false) {
		t.Error("Gnome Cunning only applies to magic effects")
	}
	if CheckGnomeCunningMagic("Human", "wis", true) {
		t.Error("Human should not get Gnome Cunning")
	}
}

func TestApplyHalflingLucky(t *testing.T) {
	// When a Halfling rolls a 1, they reroll
	// We can't predict the reroll, but we can verify the behavior
	
	// Non-1 rolls should pass through unchanged
	final, rerolled, orig := ApplyHalflingLucky(15, true)
	if rerolled {
		t.Error("Should not reroll non-1")
	}
	if final != 15 || orig != 15 {
		t.Errorf("Expected 15/15, got %d/%d", final, orig)
	}
	
	// Non-Halfling rolling 1 should not reroll
	final, rerolled, orig = ApplyHalflingLucky(1, false)
	if rerolled {
		t.Error("Non-Halfling should not reroll")
	}
	if final != 1 {
		t.Errorf("Expected 1, got %d", final)
	}
	
	// Halfling rolling 1 should reroll (result is random but should be 1-20)
	final, rerolled, orig = ApplyHalflingLucky(1, true)
	if !rerolled {
		t.Error("Halfling should reroll a 1")
	}
	if orig != 1 {
		t.Errorf("Original roll should be 1, got %d", orig)
	}
	if final < 1 || final > 20 {
		t.Errorf("Reroll should be 1-20, got %d", final)
	}
}

func TestBreathWeaponDamage(t *testing.T) {
	tests := []struct {
		level    int
		expected string
	}{
		{1, "2d6"},
		{5, "2d6"},
		{6, "3d6"},
		{10, "3d6"},
		{11, "4d6"},
		{15, "4d6"},
		{16, "5d6"},
		{20, "5d6"},
	}
	
	for _, tt := range tests {
		got := BreathWeaponDamage(tt.level)
		if got != tt.expected {
			t.Errorf("BreathWeaponDamage(%d) = %q, want %q", tt.level, got, tt.expected)
		}
	}
}

func TestDragonAncestries(t *testing.T) {
	// Test all 10 dragon types exist
	colors := []string{"black", "blue", "brass", "bronze", "copper", "gold", "green", "red", "silver", "white"}
	for _, color := range colors {
		ancestry := GetDragonAncestry(color)
		if ancestry == nil {
			t.Errorf("Missing dragon ancestry for %s", color)
			continue
		}
		if ancestry.DamageType == "" {
			t.Errorf("Dragon %s has no damage type", color)
		}
		if ancestry.BreathArea == "" {
			t.Errorf("Dragon %s has no breath area", color)
		}
		if ancestry.SaveAbility != "dex" && ancestry.SaveAbility != "con" {
			t.Errorf("Dragon %s has invalid save ability: %s", color, ancestry.SaveAbility)
		}
	}
	
	// Test case insensitivity
	red := GetDragonAncestry("RED")
	if red == nil {
		t.Error("Should find RED dragon ancestry")
	}
	
	// Test invalid color
	invalid := GetDragonAncestry("purple")
	if invalid != nil {
		t.Error("Should not find purple dragon ancestry")
	}
	
	// Verify specific ancestries
	gold := GetDragonAncestry("gold")
	if gold.DamageType != "fire" || gold.BreathArea != "15ft cone" {
		t.Errorf("Gold dragon should be fire/15ft cone, got %s/%s", gold.DamageType, gold.BreathArea)
	}
	
	black := GetDragonAncestry("black")
	if black.DamageType != "acid" || black.BreathArea != "5x30ft line" {
		t.Errorf("Black dragon should be acid/5x30ft line, got %s/%s", black.DamageType, black.BreathArea)
	}
}
