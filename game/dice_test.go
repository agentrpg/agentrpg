package game

import (
	"testing"
)

func TestRollDie(t *testing.T) {
	// Roll d6 many times, verify results are in valid range
	for i := 0; i < 100; i++ {
		result := RollDie(6)
		if result < 1 || result > 6 {
			t.Errorf("RollDie(6) = %d, want 1-6", result)
		}
	}

	// Roll d20
	for i := 0; i < 100; i++ {
		result := RollDie(20)
		if result < 1 || result > 20 {
			t.Errorf("RollDie(20) = %d, want 1-20", result)
		}
	}
}

func TestRollDice(t *testing.T) {
	// Roll 2d6
	rolls, total := RollDice(2, 6)
	if len(rolls) != 2 {
		t.Errorf("RollDice(2, 6) returned %d rolls, want 2", len(rolls))
	}
	if total < 2 || total > 12 {
		t.Errorf("RollDice(2, 6) total = %d, want 2-12", total)
	}

	// Verify total matches sum of rolls
	sum := 0
	for _, r := range rolls {
		sum += r
	}
	if sum != total {
		t.Errorf("RollDice total %d doesn't match sum of rolls %d", total, sum)
	}
}

func TestRollWithAdvantage(t *testing.T) {
	for i := 0; i < 50; i++ {
		result, r1, r2 := RollWithAdvantage()
		// Result should be the higher roll
		expected := r1
		if r2 > r1 {
			expected = r2
		}
		if result != expected {
			t.Errorf("RollWithAdvantage() = %d, want max(%d, %d) = %d", result, r1, r2, expected)
		}
		// All values should be valid d20 rolls
		if result < 1 || result > 20 || r1 < 1 || r1 > 20 || r2 < 1 || r2 > 20 {
			t.Errorf("RollWithAdvantage() returned invalid d20 values: %d, %d, %d", result, r1, r2)
		}
	}
}

func TestRollWithDisadvantage(t *testing.T) {
	for i := 0; i < 50; i++ {
		result, r1, r2 := RollWithDisadvantage()
		// Result should be the lower roll
		expected := r1
		if r2 < r1 {
			expected = r2
		}
		if result != expected {
			t.Errorf("RollWithDisadvantage() = %d, want min(%d, %d) = %d", result, r1, r2, expected)
		}
	}
}

func TestParseDice(t *testing.T) {
	tests := []struct {
		input string
		count int
		sides int
	}{
		{"2d6", 2, 6},
		{"1d8", 1, 8},
		{"3d10", 3, 10},
		{"1d20", 1, 20},
		{"2d6+3", 2, 6}, // Modifier stripped
		{"4D4", 4, 4},   // Case insensitive
		{"invalid", 1, 6}, // Default fallback
		{"1d", 1, 6},    // Missing sides
		{"d6", 1, 6},    // Missing count parsed as 0, becomes 1
	}

	for _, tt := range tests {
		count, sides := ParseDice(tt.input)
		if count != tt.count || sides != tt.sides {
			t.Errorf("ParseDice(%q) = (%d, %d), want (%d, %d)", tt.input, count, sides, tt.count, tt.sides)
		}
	}
}

func TestRollDamage(t *testing.T) {
	// Roll 2d6 (not critical)
	for i := 0; i < 50; i++ {
		result := RollDamage("2d6", false)
		if result < 2 || result > 12 {
			t.Errorf("RollDamage(2d6, false) = %d, want 2-12", result)
		}
	}

	// Roll 2d6 critical (becomes 4d6)
	for i := 0; i < 50; i++ {
		result := RollDamage("2d6", true)
		if result < 4 || result > 24 {
			t.Errorf("RollDamage(2d6, true) = %d, want 4-24", result)
		}
	}
}

func TestRollDamageGWF(t *testing.T) {
	// GWF rerolls 1s and 2s - harder to test deterministically
	// but we can verify range is valid
	for i := 0; i < 50; i++ {
		result := RollDamageGWF("2d6", false)
		if result < 2 || result > 12 {
			t.Errorf("RollDamageGWF(2d6, false) = %d, want 2-12", result)
		}
	}
}

func TestRollDamageMax(t *testing.T) {
	tests := []struct {
		dice string
		max  int
	}{
		{"1d6", 6},
		{"2d6", 12},
		{"1d8", 8},
		{"4d6", 24},
		{"8d6", 48},
		{"1d8+3", 8}, // Modifier ignored
	}

	for _, tt := range tests {
		result := RollDamageMax(tt.dice)
		if result != tt.max {
			t.Errorf("RollDamageMax(%q) = %d, want %d", tt.dice, result, tt.max)
		}
	}
}

func TestModifier(t *testing.T) {
	tests := []struct {
		stat int
		mod  int
	}{
		{10, 0},
		{11, 0},
		{12, 1},
		{13, 1},
		{14, 2},
		{8, -1},
		{6, -2},
		{1, -5},
		{20, 5},
		{18, 4},
	}

	for _, tt := range tests {
		result := Modifier(tt.stat)
		if result != tt.mod {
			t.Errorf("Modifier(%d) = %d, want %d", tt.stat, result, tt.mod)
		}
	}
}

func TestRollD20(t *testing.T) {
	for i := 0; i < 100; i++ {
		result := RollD20()
		if result < 1 || result > 20 {
			t.Errorf("RollD20() = %d, want 1-20", result)
		}
	}
}
