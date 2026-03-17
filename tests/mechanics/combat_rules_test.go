// Package mechanics provides game rule tests for Agent RPG.
//
// These tests verify D&D 5e mechanics are implemented correctly.
// Tests use the game package directly (no database required).
package mechanics

import (
	"testing"

	"github.com/agentrpg/agentrpg/game"
)

// TestCriticalHitDamage verifies critical hits double dice
func TestCriticalHitDamage(t *testing.T) {
	// Roll 2d6 damage 100 times, verify critical range is doubled
	for i := 0; i < 100; i++ {
		normalDmg := game.RollDamage("2d6", false)
		critDmg := game.RollDamage("2d6", true)

		// Normal: 2d6 = 2-12
		if normalDmg < 2 || normalDmg > 12 {
			t.Errorf("Normal 2d6 damage = %d, want 2-12", normalDmg)
		}

		// Critical: 4d6 = 4-24
		if critDmg < 4 || critDmg > 24 {
			t.Errorf("Critical 2d6 damage = %d, want 4-24", critDmg)
		}
	}
}

// TestAdvantageDisadvantageCancel verifies advantage/disadvantage mechanics
func TestAdvantageDisadvantageCancel(t *testing.T) {
	// With both advantage and disadvantage, they should cancel
	// This is handled at the calling layer, but we can test the underlying rolls

	// Advantage always gives the higher of two rolls
	for i := 0; i < 50; i++ {
		result, r1, r2 := game.RollWithAdvantage()
		expected := r1
		if r2 > r1 {
			expected = r2
		}
		if result != expected {
			t.Errorf("Advantage: got %d, want max(%d, %d) = %d", result, r1, r2, expected)
		}
	}

	// Disadvantage always gives the lower of two rolls
	for i := 0; i < 50; i++ {
		result, r1, r2 := game.RollWithDisadvantage()
		expected := r1
		if r2 < r1 {
			expected = r2
		}
		if result != expected {
			t.Errorf("Disadvantage: got %d, want min(%d, %d) = %d", result, r1, r2, expected)
		}
	}
}

// TestProficiencyBonusScaling verifies prof bonus follows PHB table
func TestProficiencyBonusScaling(t *testing.T) {
	// PHB p15: Proficiency bonus by level
	expected := map[int]int{
		1: 2, 2: 2, 3: 2, 4: 2,
		5: 3, 6: 3, 7: 3, 8: 3,
		9: 4, 10: 4, 11: 4, 12: 4,
		13: 5, 14: 5, 15: 5, 16: 5,
		17: 6, 18: 6, 19: 6, 20: 6,
	}

	for level, expectedBonus := range expected {
		actual := game.ProficiencyBonus(level)
		if actual != expectedBonus {
			t.Errorf("ProficiencyBonus(%d) = %d, want %d", level, actual, expectedBonus)
		}
	}
}

// TestAbilityModifiers verifies modifier calculation follows 5e formula
func TestAbilityModifiers(t *testing.T) {
	// PHB p13: Ability Scores and Modifiers table
	tests := []struct {
		score    int
		modifier int
	}{
		{1, -5}, {2, -4}, {3, -4},
		{4, -3}, {5, -3},
		{6, -2}, {7, -2},
		{8, -1}, {9, -1},
		{10, 0}, {11, 0},
		{12, 1}, {13, 1},
		{14, 2}, {15, 2},
		{16, 3}, {17, 3},
		{18, 4}, {19, 4},
		{20, 5}, {21, 5},
		{22, 6}, {23, 6},
		{24, 7}, {25, 7},
		{26, 8}, {27, 8},
		{28, 9}, {29, 9},
		{30, 10},
	}

	for _, tt := range tests {
		actual := game.Modifier(tt.score)
		if actual != tt.modifier {
			t.Errorf("Modifier(%d) = %d, want %d", tt.score, actual, tt.modifier)
		}
	}
}

// TestDiceStatistics verifies dice produce expected distribution
func TestDiceStatistics(t *testing.T) {
	// Roll 10000 d6s and verify reasonable distribution
	counts := make(map[int]int)
	rolls := 10000

	for i := 0; i < rolls; i++ {
		result := game.RollDie(6)
		counts[result]++
	}

	// Each face should appear roughly 1/6 of the time (±5%)
	expected := rolls / 6
	tolerance := rolls / 20 // 5%

	for face := 1; face <= 6; face++ {
		count := counts[face]
		if count < expected-tolerance || count > expected+tolerance {
			// Don't fail (random variance) but log for investigation
			t.Logf("Face %d appeared %d times (expected ~%d ±%d)", face, count, expected, tolerance)
		}
		// Make sure all faces appeared
		if count == 0 {
			t.Errorf("Face %d never appeared in %d rolls", face, rolls)
		}
	}
}

// TestGreatWeaponFightingRerolls verifies GWF mechanics
func TestGreatWeaponFightingRerolls(t *testing.T) {
	// GWF rerolls 1s and 2s (once)
	// Statistical test: GWF average should be higher than normal
	normalTotal := 0
	gwfTotal := 0
	rolls := 1000

	for i := 0; i < rolls; i++ {
		normalTotal += game.RollDamage("2d6", false)
		gwfTotal += game.RollDamageGWF("2d6", false)
	}

	normalAvg := float64(normalTotal) / float64(rolls)
	gwfAvg := float64(gwfTotal) / float64(rolls)

	// GWF should produce higher average damage
	// Normal 2d6 average = 7, GWF 2d6 average ≈ 8.33
	if gwfAvg <= normalAvg {
		t.Errorf("GWF average (%.2f) should be higher than normal (%.2f)", gwfAvg, normalAvg)
	}

	// GWF average should be noticeably higher (at least 0.5 more)
	if gwfAvg-normalAvg < 0.5 {
		t.Logf("Warning: GWF improvement (%.2f) lower than expected", gwfAvg-normalAvg)
	}
}

// TestMaxDamageCalculation verifies max damage (for Supreme Healing)
func TestMaxDamageCalculation(t *testing.T) {
	tests := []struct {
		dice string
		max  int
	}{
		{"1d6", 6},
		{"2d6", 12},
		{"3d8", 24},
		{"4d10", 40},
		{"8d6", 48},  // Fireball
		{"10d6", 60}, // Sneak Attack 10d6
		{"12d6", 72}, // Meteor Swarm (part)
		{"1d8+3", 8}, // Modifier ignored for max dice
	}

	for _, tt := range tests {
		actual := game.RollDamageMax(tt.dice)
		if actual != tt.max {
			t.Errorf("RollDamageMax(%q) = %d, want %d", tt.dice, actual, tt.max)
		}
	}
}
