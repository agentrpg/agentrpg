package game

import "testing"

func TestGetMaxInvocations(t *testing.T) {
	tests := []struct {
		level    int
		expected int
	}{
		{1, 0},   // No invocations at level 1
		{2, 2},   // First invocations at level 2
		{3, 2},
		{4, 2},
		{5, 3},   // Third invocation at level 5
		{6, 3},
		{7, 4},
		{8, 4},
		{9, 5},
		{10, 5},
		{11, 5},
		{12, 6},
		{13, 6},
		{14, 6},
		{15, 7},
		{16, 7},
		{17, 7},
		{18, 8},
		{19, 8},
		{20, 8},
	}

	for _, tc := range tests {
		got := GetMaxInvocations(tc.level)
		if got != tc.expected {
			t.Errorf("GetMaxInvocations(%d) = %d, want %d", tc.level, got, tc.expected)
		}
	}
}

func TestAvailableInvocations(t *testing.T) {
	// Should have 26 invocations per PHB
	expectedCount := 26
	if len(AvailableInvocations) != expectedCount {
		t.Errorf("Expected %d invocations, got %d", expectedCount, len(AvailableInvocations))
	}

	// Test specific invocations exist
	requiredInvocations := []string{
		"agonizing-blast",
		"armor-of-shadows",
		"devils-sight",
		"eldritch-spear",
		"repelling-blast",
		"lifedrinker",
		"witch-sight",
	}

	for _, slug := range requiredInvocations {
		if _, ok := AvailableInvocations[slug]; !ok {
			t.Errorf("Missing invocation: %s", slug)
		}
	}
}

func TestInvocationPrerequisites(t *testing.T) {
	// Agonizing Blast requires eldritch blast
	ab := AvailableInvocations["agonizing-blast"]
	if ab.Prerequisites.RequiresSpell != "eldritch-blast" {
		t.Errorf("Agonizing Blast should require eldritch-blast, got %s", ab.Prerequisites.RequiresSpell)
	}

	// Lifedrinker requires level 12 and Pact of the Blade
	ld := AvailableInvocations["lifedrinker"]
	if ld.Prerequisites.Level != 12 {
		t.Errorf("Lifedrinker should require level 12, got %d", ld.Prerequisites.Level)
	}
	if ld.Prerequisites.Pact != "blade" {
		t.Errorf("Lifedrinker should require Pact of the Blade, got %s", ld.Prerequisites.Pact)
	}

	// Armor of Shadows has no prerequisites
	aos := AvailableInvocations["armor-of-shadows"]
	if aos.Prerequisites.Level != 0 || aos.Prerequisites.Pact != "" || aos.Prerequisites.RequiresSpell != "" {
		t.Error("Armor of Shadows should have no prerequisites")
	}
}

func TestInvocationMechanics(t *testing.T) {
	// Agonizing Blast should have agonizing_blast mechanic
	ab := AvailableInvocations["agonizing-blast"]
	if ab.Mechanics["agonizing_blast"] != "true" {
		t.Error("Agonizing Blast should have agonizing_blast mechanic")
	}

	// Armor of Shadows should grant at-will mage armor
	aos := AvailableInvocations["armor-of-shadows"]
	if aos.Mechanics["at_will_spell"] != "mage-armor" {
		t.Error("Armor of Shadows should grant at-will mage armor")
	}

	// Thief of Five Fates should grant once-per-rest bane
	toff := AvailableInvocations["thief-of-five-fates"]
	if toff.Mechanics["once_per_rest_spell"] != "bane" {
		t.Error("Thief of Five Fates should grant once-per-rest bane")
	}
}

func TestGetInvocation(t *testing.T) {
	// Should return invocation for valid slug
	inv := GetInvocation("agonizing-blast")
	if inv == nil {
		t.Fatal("GetInvocation should return non-nil for agonizing-blast")
	}
	if inv.Name != "Agonizing Blast" {
		t.Errorf("Expected 'Agonizing Blast', got '%s'", inv.Name)
	}

	// Should return nil for invalid slug
	inv = GetInvocation("not-a-real-invocation")
	if inv != nil {
		t.Error("GetInvocation should return nil for invalid slug")
	}
}

func TestListInvocations(t *testing.T) {
	invocations := ListInvocations()
	if len(invocations) != len(AvailableInvocations) {
		t.Errorf("ListInvocations returned %d, expected %d", len(invocations), len(AvailableInvocations))
	}
}

func TestAvailablePactBoons(t *testing.T) {
	// Should have exactly 3 pact boons
	expectedCount := 3
	if len(AvailablePactBoons) != expectedCount {
		t.Errorf("Expected %d pact boons, got %d", expectedCount, len(AvailablePactBoons))
	}

	// Test each pact boon exists
	requiredBoons := []string{"chain", "blade", "tome"}
	for _, slug := range requiredBoons {
		if _, ok := AvailablePactBoons[slug]; !ok {
			t.Errorf("Missing pact boon: %s", slug)
		}
	}
}

func TestPactBoonMechanics(t *testing.T) {
	// Pact of the Chain should grant find familiar
	chain := AvailablePactBoons["chain"]
	if chain.Mechanics["learn_spell"] != "find-familiar" {
		t.Error("Pact of the Chain should grant find familiar")
	}

	// Pact of the Blade should create magical weapon
	blade := AvailablePactBoons["blade"]
	if blade.Mechanics["weapon_magical"] != true {
		t.Error("Pact of the Blade should create magical weapon")
	}

	// Pact of the Tome should grant 3 extra cantrips
	tome := AvailablePactBoons["tome"]
	if tome.Mechanics["extra_cantrips"] != 3 {
		t.Error("Pact of the Tome should grant 3 extra cantrips")
	}
}

func TestGetPactBoon(t *testing.T) {
	// Should return pact boon for valid slug
	boon := GetPactBoon("blade")
	if boon == nil {
		t.Fatal("GetPactBoon should return non-nil for blade")
	}
	if boon.Name != "Pact of the Blade" {
		t.Errorf("Expected 'Pact of the Blade', got '%s'", boon.Name)
	}

	// Should return nil for invalid slug
	boon = GetPactBoon("not-a-pact")
	if boon != nil {
		t.Error("GetPactBoon should return nil for invalid slug")
	}
}

func TestListPactBoons(t *testing.T) {
	boons := ListPactBoons()
	if len(boons) != len(AvailablePactBoons) {
		t.Errorf("ListPactBoons returned %d, expected %d", len(boons), len(AvailablePactBoons))
	}
}

func TestLevelBasedInvocations(t *testing.T) {
	// Verify level prerequisites are correctly set
	levelRequirements := map[string]int{
		"agonizing-blast":         0, // No level requirement (just spell)
		"mire-the-mind":           5,
		"one-with-shadows":        5,
		"sign-of-ill-omen":        5,
		"sculptor-of-flesh":       7,
		"ascendant-step":          9,
		"minions-of-chaos":        9,
		"otherworldly-leap":       9,
		"whispers-of-the-grave":   9,
		"lifedrinker":             12,
		"master-of-myriad-forms":  15,
		"visions-of-distant-realms": 15,
		"witch-sight":             15,
	}

	for slug, expectedLevel := range levelRequirements {
		inv := AvailableInvocations[slug]
		if inv.Prerequisites.Level != expectedLevel {
			t.Errorf("%s: expected level %d, got %d", slug, expectedLevel, inv.Prerequisites.Level)
		}
	}
}
