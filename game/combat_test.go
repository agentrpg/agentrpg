package game

import (
	"testing"
)

func TestMatchesDamageType(t *testing.T) {
	tests := []struct {
		name            string
		damageType      string
		resistanceEntry string
		isMagical       bool
		isSilvered      bool
		expected        bool
	}{
		// Simple matches
		{"fire matches fire", "fire", "fire", false, false, true},
		{"fire doesn't match cold", "fire", "cold", false, false, false},
		{"case insensitive", "Fire", "fire", false, false, true},

		// Complex resistance strings
		{"slashing in bps list", "slashing", "bludgeoning, piercing, and slashing from nonmagical attacks", false, false, true},
		{"fire not in bps list", "fire", "bludgeoning, piercing, and slashing from nonmagical attacks", false, false, false},

		// Nonmagical bypass
		{"magical bypasses nonmagical resistance", "slashing", "bludgeoning, piercing, and slashing from nonmagical attacks", true, false, false},
		{"nonmagical blocked by nonmagical resistance", "slashing", "bludgeoning, piercing, and slashing from nonmagical attacks", false, false, true},

		// Silvered bypass
		{"silvered bypasses aren't silvered", "slashing", "bludgeoning, piercing, and slashing from nonmagical attacks that aren't silvered", false, true, false},
		{"non-silvered blocked", "slashing", "bludgeoning, piercing, and slashing from nonmagical attacks that aren't silvered", false, false, true},

		// Combined
		{"magical AND silvered bypasses both", "piercing", "bludgeoning, piercing, and slashing from nonmagical attacks that aren't silvered", true, true, false},
		{"magical bypasses nonmagical (silvered irrelevant)", "bludgeoning", "bludgeoning, piercing, and slashing from nonmagical attacks that aren't silvered", true, false, false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := MatchesDamageType(tt.damageType, tt.resistanceEntry, tt.isMagical, tt.isSilvered)
			if result != tt.expected {
				t.Errorf("MatchesDamageType(%q, %q, %v, %v) = %v, want %v",
					tt.damageType, tt.resistanceEntry, tt.isMagical, tt.isSilvered, result, tt.expected)
			}
		})
	}
}

func TestApplyDamageModifiers(t *testing.T) {
	tests := []struct {
		name            string
		damage          int
		damageType      string
		resistances     []string
		immunities      []string
		vulnerabilities []string
		isMagical       bool
		isSilvered      bool
		wantDamage      int
		wantNegated     bool
		wantHalved      bool
		wantDoubled     bool
	}{
		{
			name:       "no modifiers",
			damage:     10,
			damageType: "fire",
			wantDamage: 10,
		},
		{
			name:        "immunity negates damage",
			damage:      10,
			damageType:  "fire",
			immunities:  []string{"fire"},
			wantDamage:  0,
			wantNegated: true,
		},
		{
			name:        "resistance halves damage",
			damage:      10,
			damageType:  "fire",
			resistances: []string{"fire"},
			wantDamage:  5,
			wantHalved:  true,
		},
		{
			name:            "vulnerability doubles damage",
			damage:          10,
			damageType:      "fire",
			vulnerabilities: []string{"fire"},
			wantDamage:      20,
			wantDoubled:     true,
		},
		{
			name:            "vulnerability and resistance cancel out",
			damage:          10,
			damageType:      "fire",
			vulnerabilities: []string{"fire"},
			resistances:     []string{"fire"},
			wantDamage:      10,
			wantDoubled:     false, // Cancelled out
			wantHalved:      false, // Cancelled out
		},
		{
			name:        "immunity takes precedence over vulnerability",
			damage:      10,
			damageType:  "fire",
			immunities:  []string{"fire"},
			vulnerabilities: []string{"fire"},
			wantDamage:  0,
			wantNegated: true,
		},
		{
			name:        "magical damage bypasses nonmagical resistance",
			damage:      10,
			damageType:  "slashing",
			resistances: []string{"bludgeoning, piercing, and slashing from nonmagical attacks"},
			isMagical:   true,
			wantDamage:  10,
		},
		{
			name:        "nonmagical damage blocked by nonmagical resistance",
			damage:      10,
			damageType:  "slashing",
			resistances: []string{"bludgeoning, piercing, and slashing from nonmagical attacks"},
			isMagical:   false,
			wantDamage:  5,
			wantHalved:  true,
		},
		{
			name:       "zero damage returns immediately",
			damage:     0,
			damageType: "fire",
			immunities: []string{"fire"},
			wantDamage: 0,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := ApplyDamageModifiers(
				tt.damage,
				tt.damageType,
				tt.resistances,
				tt.immunities,
				tt.vulnerabilities,
				tt.isMagical,
				tt.isSilvered,
			)
			if result.FinalDamage != tt.wantDamage {
				t.Errorf("FinalDamage = %d, want %d", result.FinalDamage, tt.wantDamage)
			}
			if result.WasNegated != tt.wantNegated {
				t.Errorf("WasNegated = %v, want %v", result.WasNegated, tt.wantNegated)
			}
			if result.WasHalved != tt.wantHalved {
				t.Errorf("WasHalved = %v, want %v", result.WasHalved, tt.wantHalved)
			}
			if result.WasDoubled != tt.wantDoubled {
				t.Errorf("WasDoubled = %v, want %v", result.WasDoubled, tt.wantDoubled)
			}
		})
	}
}

func TestDivineSmiteDice(t *testing.T) {
	tests := []struct {
		name            string
		slotLevel       int
		isUndeadOrFiend bool
		isCrit          bool
		expected        int
	}{
		{"1st level slot", 1, false, false, 2},
		{"2nd level slot", 2, false, false, 3},
		{"3rd level slot", 3, false, false, 4},
		{"4th level slot", 4, false, false, 5},
		{"5th level slot (max)", 5, false, false, 5},
		{"6th level slot (still max 5)", 6, false, false, 5},

		// Undead/Fiend bonus
		{"1st level vs undead", 1, true, false, 3},
		{"5th level vs fiend (exceeds cap)", 5, true, false, 6},

		// Critical hits
		{"1st level crit", 1, false, true, 4},
		{"3rd level crit", 3, false, true, 8},
		{"5th level crit vs undead", 5, true, true, 12},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := DivineSmiteDice(tt.slotLevel, tt.isUndeadOrFiend, tt.isCrit)
			if result != tt.expected {
				t.Errorf("DivineSmiteDice(%d, %v, %v) = %d, want %d",
					tt.slotLevel, tt.isUndeadOrFiend, tt.isCrit, result, tt.expected)
			}
		})
	}
}

func TestIsAutoCriticalHit(t *testing.T) {
	tests := []struct {
		name             string
		targetConditions []string
		isWithin5Feet    bool
		expected         bool
	}{
		{"paralyzed within 5ft", []string{"paralyzed"}, true, true},
		{"unconscious within 5ft", []string{"unconscious"}, true, true},
		{"paralyzed beyond 5ft", []string{"paralyzed"}, false, false},
		{"stunned within 5ft", []string{"stunned"}, true, false}, // Stunned is not auto-crit
		{"no conditions", []string{}, true, false},
		{"multiple conditions including paralyzed", []string{"poisoned", "paralyzed"}, true, true},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := IsAutoCriticalHit(tt.targetConditions, tt.isWithin5Feet)
			if result != tt.expected {
				t.Errorf("IsAutoCriticalHit(%v, %v) = %v, want %v",
					tt.targetConditions, tt.isWithin5Feet, result, tt.expected)
			}
		})
	}
}

func TestCanCriticalHit(t *testing.T) {
	tests := []struct {
		name      string
		roll      int
		critRange int
		expected  bool
	}{
		{"nat 20 normal range", 20, 20, true},
		{"nat 19 normal range", 19, 20, false},
		{"nat 19 champion", 19, 19, true},
		{"nat 18 champion", 18, 19, false},
		{"nat 18 superior champion", 18, 18, true},
		{"nat 1", 1, 20, false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := CanCriticalHit(tt.roll, tt.critRange)
			if result != tt.expected {
				t.Errorf("CanCriticalHit(%d, %d) = %v, want %v",
					tt.roll, tt.critRange, result, tt.expected)
			}
		})
	}
}

func TestIsCriticalMiss(t *testing.T) {
	tests := []struct {
		roll     int
		expected bool
	}{
		{1, true},
		{2, false},
		{20, false},
	}

	for _, tt := range tests {
		t.Run("", func(t *testing.T) {
			result := IsCriticalMiss(tt.roll)
			if result != tt.expected {
				t.Errorf("IsCriticalMiss(%d) = %v, want %v", tt.roll, result, tt.expected)
			}
		})
	}
}

func TestGetAttackModifiersFromConditions(t *testing.T) {
	tests := []struct {
		name                        string
		attackerConditions          []string
		targetConditions            []string
		isRanged                    bool
		attackerCanSeeTarget        bool
		targetCanSeeAttacker        bool
		targetHasAlert              bool
		flankingTargetID            int
		isWearingNonProficientArmor bool
		wantAdvantage               bool
		wantDisadvantage            bool
	}{
		{
			name:                 "normal attack",
			attackerCanSeeTarget: true,
			targetCanSeeAttacker: true,
			wantAdvantage:        false,
			wantDisadvantage:     false,
		},
		{
			name:                 "attacker can't see target",
			attackerCanSeeTarget: false,
			targetCanSeeAttacker: true,
			wantAdvantage:        false,
			wantDisadvantage:     true,
		},
		{
			name:                 "target can't see attacker",
			attackerCanSeeTarget: true,
			targetCanSeeAttacker: false,
			wantAdvantage:        true,
			wantDisadvantage:     false,
		},
		{
			name:                 "attacker blinded",
			attackerConditions:   []string{"blinded"},
			attackerCanSeeTarget: true,
			targetCanSeeAttacker: true,
			wantAdvantage:        false,
			wantDisadvantage:     true,
		},
		{
			name:                 "target paralyzed",
			targetConditions:     []string{"paralyzed"},
			attackerCanSeeTarget: true,
			targetCanSeeAttacker: true,
			wantAdvantage:        true,
			wantDisadvantage:     false,
		},
		{
			name:                 "target prone melee",
			targetConditions:     []string{"prone"},
			isRanged:             false,
			attackerCanSeeTarget: true,
			targetCanSeeAttacker: true,
			wantAdvantage:        true,
			wantDisadvantage:     false,
		},
		{
			name:                 "target prone ranged",
			targetConditions:     []string{"prone"},
			isRanged:             true,
			attackerCanSeeTarget: true,
			targetCanSeeAttacker: true,
			wantAdvantage:        false,
			wantDisadvantage:     true,
		},
		{
			name:                 "target reckless",
			targetConditions:     []string{"reckless"},
			attackerCanSeeTarget: true,
			targetCanSeeAttacker: true,
			wantAdvantage:        true,
			wantDisadvantage:     false,
		},
		{
			name:                        "non-proficient armor",
			attackerCanSeeTarget:        true,
			targetCanSeeAttacker:        true,
			isWearingNonProficientArmor: true,
			wantAdvantage:               false,
			wantDisadvantage:            true,
		},
		{
			name:                 "advantage and disadvantage cancel",
			attackerConditions:   []string{"poisoned"},
			targetConditions:     []string{"stunned"},
			attackerCanSeeTarget: true,
			targetCanSeeAttacker: true,
			wantAdvantage:        true,  // From stunned
			wantDisadvantage:     true,  // From poisoned
			// Note: They don't cancel in the struct, but the caller handles that
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := GetAttackModifiersFromConditions(
				tt.attackerConditions,
				tt.targetConditions,
				tt.isRanged,
				tt.attackerCanSeeTarget,
				tt.targetCanSeeAttacker,
				tt.targetHasAlert,
				tt.flankingTargetID,
				tt.isWearingNonProficientArmor,
			)
			if result.HasAdvantage != tt.wantAdvantage {
				t.Errorf("HasAdvantage = %v, want %v", result.HasAdvantage, tt.wantAdvantage)
			}
			if result.HasDisadvantage != tt.wantDisadvantage {
				t.Errorf("HasDisadvantage = %v, want %v", result.HasDisadvantage, tt.wantDisadvantage)
			}
		})
	}
}
