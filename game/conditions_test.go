package game

import "testing"

func TestHasCondition(t *testing.T) {
	tests := []struct {
		name       string
		conditions []string
		check      string
		want       bool
	}{
		{"empty list", []string{}, "blinded", false},
		{"has condition", []string{"blinded", "prone"}, "blinded", true},
		{"case insensitive", []string{"BLINDED"}, "blinded", true},
		{"no match", []string{"prone"}, "blinded", false},
		{"prefixed condition matches base", []string{"charmed:123"}, "charmed", true},
		{"prefixed exact", []string{"frightened:456"}, "frightened", true},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := HasCondition(tt.conditions, tt.check)
			if got != tt.want {
				t.Errorf("HasCondition(%v, %q) = %v, want %v", tt.conditions, tt.check, got, tt.want)
			}
		})
	}
}

func TestHasConditionExact(t *testing.T) {
	tests := []struct {
		name       string
		conditions []string
		check      string
		want       bool
	}{
		{"exact match", []string{"blinded"}, "blinded", true},
		{"prefixed no match", []string{"charmed:123"}, "charmed", false},
		{"exact charmed with id", []string{"charmed:123"}, "charmed:123", true},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := HasConditionExact(tt.conditions, tt.check)
			if got != tt.want {
				t.Errorf("HasConditionExact(%v, %q) = %v, want %v", tt.conditions, tt.check, got, tt.want)
			}
		})
	}
}

func TestIsIncapacitated(t *testing.T) {
	tests := []struct {
		name       string
		conditions []string
		want       bool
	}{
		{"no conditions", []string{}, false},
		{"stunned", []string{"stunned"}, true},
		{"paralyzed", []string{"paralyzed"}, true},
		{"unconscious", []string{"unconscious"}, true},
		{"petrified", []string{"petrified"}, true},
		{"incapacitated", []string{"incapacitated"}, true},
		{"prone only", []string{"prone"}, false},
		{"blinded only", []string{"blinded"}, false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := IsIncapacitated(tt.conditions)
			if got != tt.want {
				t.Errorf("IsIncapacitated(%v) = %v, want %v", tt.conditions, got, tt.want)
			}
		})
	}
}

func TestCanMove(t *testing.T) {
	tests := []struct {
		name       string
		conditions []string
		exhaustion int
		want       bool
	}{
		{"no conditions", []string{}, 0, true},
		{"grappled", []string{"grappled"}, 0, false},
		{"restrained", []string{"restrained"}, 0, false},
		{"stunned", []string{"stunned"}, 0, false},
		{"exhaustion 4", []string{}, 4, true},
		{"exhaustion 5", []string{}, 5, false},
		{"exhaustion 6", []string{}, 6, false},
		{"prone can move", []string{"prone"}, 0, true},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := CanMove(tt.conditions, tt.exhaustion)
			if got != tt.want {
				t.Errorf("CanMove(%v, %d) = %v, want %v", tt.conditions, tt.exhaustion, got, tt.want)
			}
		})
	}
}

func TestAutoFailsSave(t *testing.T) {
	tests := []struct {
		name       string
		conditions []string
		ability    string
		want       bool
	}{
		{"no conditions STR", []string{}, "STR", false},
		{"paralyzed STR", []string{"paralyzed"}, "STR", true},
		{"paralyzed DEX", []string{"paralyzed"}, "DEX", true},
		{"paralyzed WIS", []string{"paralyzed"}, "WIS", false},
		{"unconscious STR", []string{"unconscious"}, "STR", true},
		{"stunned DEX", []string{"stunned"}, "DEX", true},
		{"prone STR", []string{"prone"}, "STR", false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := AutoFailsSave(tt.conditions, tt.ability)
			if got != tt.want {
				t.Errorf("AutoFailsSave(%v, %q) = %v, want %v", tt.conditions, tt.ability, got, tt.want)
			}
		})
	}
}

func TestIsAutoCrit(t *testing.T) {
	tests := []struct {
		name       string
		conditions []string
		want       bool
	}{
		{"no conditions", []string{}, false},
		{"paralyzed", []string{"paralyzed"}, true},
		{"unconscious", []string{"unconscious"}, true},
		{"stunned", []string{"stunned"}, false},
		{"prone", []string{"prone"}, false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := IsAutoCrit(tt.conditions)
			if got != tt.want {
				t.Errorf("IsAutoCrit(%v) = %v, want %v", tt.conditions, got, tt.want)
			}
		})
	}
}

func TestGetSaveDisadvantage(t *testing.T) {
	tests := []struct {
		name       string
		conditions []string
		exhaustion int
		ability    string
		want       bool
	}{
		{"no conditions", []string{}, 0, "DEX", false},
		{"exhaustion 3 any save", []string{}, 3, "WIS", true},
		{"restrained DEX", []string{"restrained"}, 0, "DEX", true},
		{"restrained STR", []string{"restrained"}, 0, "STR", false},
		{"exhaustion 2 no disadv", []string{}, 2, "DEX", false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := GetSaveDisadvantage(tt.conditions, tt.exhaustion, tt.ability)
			if got != tt.want {
				t.Errorf("GetSaveDisadvantage(%v, %d, %q) = %v, want %v", tt.conditions, tt.exhaustion, tt.ability, got, tt.want)
			}
		})
	}
}

func TestGetAttackDisadvantage(t *testing.T) {
	tests := []struct {
		name                string
		conditions          []string
		exhaustion          int
		frightenedVisible   bool
		want                bool
	}{
		{"no conditions", []string{}, 0, false, false},
		{"blinded", []string{"blinded"}, 0, false, true},
		{"poisoned", []string{"poisoned"}, 0, false, true},
		{"prone", []string{"prone"}, 0, false, true},
		{"restrained", []string{"restrained"}, 0, false, true},
		{"exhaustion 3", []string{}, 3, false, true},
		{"frightened source visible", []string{"frightened"}, 0, true, true},
		{"frightened source not visible", []string{"frightened"}, 0, false, false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := GetAttackDisadvantage(tt.conditions, tt.exhaustion, tt.frightenedVisible)
			if got != tt.want {
				t.Errorf("GetAttackDisadvantage(%v, %d, %v) = %v, want %v", tt.conditions, tt.exhaustion, tt.frightenedVisible, got, tt.want)
			}
		})
	}
}

func TestGetAttackAdvantage(t *testing.T) {
	tests := []struct {
		name       string
		conditions []string
		isMelee    bool
		within5ft  bool
		want       bool
	}{
		{"no conditions", []string{}, true, true, false},
		{"blinded", []string{"blinded"}, true, true, true},
		{"paralyzed", []string{"paralyzed"}, true, true, true},
		{"stunned", []string{"stunned"}, true, true, true},
		{"unconscious", []string{"unconscious"}, true, true, true},
		{"prone melee within 5ft", []string{"prone"}, true, true, true},
		{"prone melee not within 5ft", []string{"prone"}, true, false, false},
		{"prone ranged", []string{"prone"}, false, false, false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := GetAttackAdvantage(tt.conditions, tt.isMelee, tt.within5ft)
			if got != tt.want {
				t.Errorf("GetAttackAdvantage(%v, %v, %v) = %v, want %v", tt.conditions, tt.isMelee, tt.within5ft, got, tt.want)
			}
		})
	}
}

func TestGetAttackDisadvantageVsTarget(t *testing.T) {
	tests := []struct {
		name       string
		conditions []string
		isRanged   bool
		within5ft  bool
		want       bool
	}{
		{"no conditions", []string{}, false, false, false},
		{"invisible", []string{"invisible"}, false, false, true},
		{"prone ranged not within 5ft", []string{"prone"}, true, false, true},
		{"prone ranged within 5ft", []string{"prone"}, true, true, false},
		{"prone melee", []string{"prone"}, false, true, false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := GetAttackDisadvantageVsTarget(tt.conditions, tt.isRanged, tt.within5ft)
			if got != tt.want {
				t.Errorf("GetAttackDisadvantageVsTarget(%v, %v, %v) = %v, want %v", tt.conditions, tt.isRanged, tt.within5ft, got, tt.want)
			}
		})
	}
}

func TestExhaustionEffects(t *testing.T) {
	tests := []struct {
		level int
		want  string
	}{
		{0, "No exhaustion"},
		{1, "Disadvantage on ability checks"},
		{6, "DEAD (exhaustion level 6)"},
	}

	for _, tt := range tests {
		got := ExhaustionEffects(tt.level)
		if got != tt.want {
			t.Errorf("ExhaustionEffects(%d) = %q, want %q", tt.level, got, tt.want)
		}
	}
}

func TestParseFrightenedSource(t *testing.T) {
	tests := []struct {
		condition string
		want      int
	}{
		{"frightened:123", 123},
		{"frightened:456", 456},
		{"frightened", 0},
		{"charmed:123", 0},
		{"blinded", 0},
	}

	for _, tt := range tests {
		got := ParseFrightenedSource(tt.condition)
		if got != tt.want {
			t.Errorf("ParseFrightenedSource(%q) = %d, want %d", tt.condition, got, tt.want)
		}
	}
}

func TestParseCharmedSource(t *testing.T) {
	tests := []struct {
		condition string
		want      int
	}{
		{"charmed:123", 123},
		{"charmed:789", 789},
		{"charmed", 0},
		{"frightened:123", 0},
	}

	for _, tt := range tests {
		got := ParseCharmedSource(tt.condition)
		if got != tt.want {
			t.Errorf("ParseCharmedSource(%q) = %d, want %d", tt.condition, got, tt.want)
		}
	}
}

func TestGetFrightenedSourceID(t *testing.T) {
	tests := []struct {
		name       string
		conditions []string
		want       int
	}{
		{"not frightened", []string{"blinded"}, 0},
		{"frightened with source", []string{"prone", "frightened:42"}, 42},
		{"frightened no source", []string{"frightened"}, 0},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := GetFrightenedSourceID(tt.conditions)
			if got != tt.want {
				t.Errorf("GetFrightenedSourceID(%v) = %d, want %d", tt.conditions, got, tt.want)
			}
		})
	}
}

func TestAllConditions(t *testing.T) {
	conditions := AllConditions()
	if len(conditions) != 14 {
		t.Errorf("AllConditions() returned %d conditions, want 14 (15 minus exhaustion which is separate)", len(conditions))
	}
	
	// Check a few known conditions are present
	found := make(map[string]bool)
	for _, c := range conditions {
		found[c.Name] = true
		if c.Description == "" {
			t.Errorf("Condition %q has empty description", c.Name)
		}
		if len(c.Effects) == 0 {
			t.Errorf("Condition %q has no effects listed", c.Name)
		}
	}
	
	expectedConditions := []string{"blinded", "charmed", "paralyzed", "prone", "stunned"}
	for _, exp := range expectedConditions {
		if !found[exp] {
			t.Errorf("Expected condition %q not found in AllConditions()", exp)
		}
	}
}
