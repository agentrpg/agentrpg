// Package game provides core D&D 5e game mechanics.
// combat.go - damage resolution, attack modifiers, and combat calculations
package game

import (
	"strings"
)

// DamageModResult holds the result of damage resistance/immunity/vulnerability calculations.
type DamageModResult struct {
	FinalDamage     int
	Resistances     []string
	Immunities      []string
	Vulnerabilities []string
	WasHalved       bool
	WasDoubled      bool
	WasNegated      bool
}

// MatchesDamageType checks if a damage type matches a resistance/immunity/vulnerability string.
// Handles both simple ("fire") and complex ("bludgeoning, piercing, and slashing from nonmagical attacks") entries.
//
// Parameters:
//   - damageType: the type of damage being dealt (e.g., "fire", "slashing")
//   - resistanceEntry: the resistance/immunity string to check against
//   - isMagical: true if the damage source is magical (spells, +1 weapons, etc.)
//   - isSilvered: true if the weapon is silvered
//
// Returns true if the damage type matches and isn't bypassed by magical/silvered status.
func MatchesDamageType(damageType, resistanceEntry string, isMagical, isSilvered bool) bool {
	damageType = strings.ToLower(strings.TrimSpace(damageType))
	resistanceEntry = strings.ToLower(strings.TrimSpace(resistanceEntry))

	// Simple exact match (no conditional modifiers)
	if damageType == resistanceEntry {
		return true
	}

	// Check if damage type is contained in the entry (for complex strings)
	// e.g., "bludgeoning, piercing, and slashing from nonmagical attacks"
	// e.g., "bludgeoning, piercing, and slashing from nonmagical attacks that aren't silvered"
	if strings.Contains(resistanceEntry, damageType) {
		// Check for "nonmagical" condition
		// Common phrasings: "from nonmagical attacks", "from nonmagical weapons"
		isNonmagicalOnly := strings.Contains(resistanceEntry, "nonmagical")

		// Check for "silvered" exception
		// Common phrasings: "that aren't silvered", "not silvered", "except silver"
		hasSilveredExemption := strings.Contains(resistanceEntry, "aren't silvered") ||
			strings.Contains(resistanceEntry, "not silvered") ||
			strings.Contains(resistanceEntry, "except silver")

		// If resistance only applies to nonmagical attacks and this IS magical, resistance doesn't apply
		if isNonmagicalOnly && isMagical {
			return false
		}

		// If resistance has a silvered exemption and weapon IS silvered, resistance doesn't apply
		if hasSilveredExemption && isSilvered {
			return false
		}

		return true
	}

	return false
}

// ApplyDamageModifiers calculates final damage after applying resistance, immunity, and vulnerability.
// This is pure logic with no database access - caller must provide the modifier lists.
//
// Parameters:
//   - damage: base damage amount
//   - damageType: type of damage (e.g., "fire", "slashing")
//   - resistances: list of resistance entries (e.g., ["fire", "bludgeoning from nonmagical attacks"])
//   - immunities: list of immunity entries
//   - vulnerabilities: list of vulnerability entries
//   - isMagical: true if damage source is magical
//   - isSilvered: true if weapon is silvered
//
// Returns DamageModResult with final damage and modification details.
// Order of application per PHB: vulnerability first, then resistance (they cancel out).
// Immunity always results in 0 damage.
func ApplyDamageModifiers(damage int, damageType string, resistances, immunities, vulnerabilities []string, isMagical, isSilvered bool) DamageModResult {
	result := DamageModResult{
		FinalDamage:     damage,
		Resistances:     []string{},
		Immunities:      []string{},
		Vulnerabilities: []string{},
	}

	if damage <= 0 {
		return result
	}

	// Check for immunity first (no damage)
	for _, immunity := range immunities {
		if MatchesDamageType(damageType, immunity, isMagical, isSilvered) {
			result.FinalDamage = 0
			result.Immunities = append(result.Immunities, immunity)
			result.WasNegated = true
			return result
		}
	}

	// Check for vulnerability (double damage) - applied before resistance
	for _, vulnerability := range vulnerabilities {
		if MatchesDamageType(damageType, vulnerability, isMagical, isSilvered) {
			result.FinalDamage = damage * 2
			result.Vulnerabilities = append(result.Vulnerabilities, vulnerability)
			result.WasDoubled = true
			break // Only apply once
		}
	}

	// Check for resistance (half damage)
	for _, resistance := range resistances {
		if MatchesDamageType(damageType, resistance, isMagical, isSilvered) {
			result.Resistances = append(result.Resistances, resistance)
			if result.WasDoubled {
				// Vulnerability + Resistance = normal damage (they cancel out)
				result.FinalDamage = damage
				result.WasDoubled = false
				// WasHalved stays false - they cancelled each other
			} else {
				result.FinalDamage = damage / 2
				result.WasHalved = true
			}
			break // Only apply once
		}
	}

	return result
}

// DivineSmiteDice calculates the number of d8s for Divine Smite.
// Base: 2d8 + (slotLevel - 1)d8, max 5d8
// +1d8 vs undead/fiend (can exceed cap)
// Doubled on critical hit.
//
// Returns the number of d8s to roll.
func DivineSmiteDice(slotLevel int, isUndeadOrFiend, isCrit bool) int {
	// Calculate number of d8s: 2 + (slotLevel - 1), max 5
	numDice := 2 + (slotLevel - 1)
	if numDice > 5 {
		numDice = 5
	}

	// Extra d8 vs undead/fiend (this can exceed the 5d8 cap)
	if isUndeadOrFiend {
		numDice++
	}

	// Double dice on crit
	if isCrit {
		numDice *= 2
	}

	return numDice
}

// AttackModifiers represents advantage/disadvantage state for an attack.
type AttackModifiers struct {
	HasAdvantage    bool
	HasDisadvantage bool
	Reasons         []string // Explanations for why each modifier applies
}

// GetAttackModifiersFromConditions determines advantage/disadvantage based on attacker and target conditions.
// This is pure logic - caller must provide the condition lists.
//
// Parameters:
//   - attackerConditions: conditions on the attacker
//   - targetConditions: conditions on the target
//   - isRanged: true if this is a ranged attack (affects prone handling)
//   - attackerCanSeeTarget: true if attacker can see the target (vision/lighting)
//   - targetCanSeeAttacker: true if target can see the attacker
//   - targetHasAlert: true if target has Alert feat (negates advantage from unseen attackers)
//   - flankingTargetID: if attacker has flanking condition against this specific target (0 for none)
//   - isWearingNonProficientArmor: true if attacker wearing armor they're not proficient with
//
// Returns AttackModifiers with advantage/disadvantage status and reasons.
func GetAttackModifiersFromConditions(
	attackerConditions, targetConditions []string,
	isRanged bool,
	attackerCanSeeTarget, targetCanSeeAttacker bool,
	targetHasAlert bool,
	flankingTargetID int,
	isWearingNonProficientArmor bool,
) AttackModifiers {
	result := AttackModifiers{
		Reasons: []string{},
	}

	// Vision-based modifiers
	if !attackerCanSeeTarget {
		result.HasDisadvantage = true
		result.Reasons = append(result.Reasons, "can't see target")
	}
	if !targetCanSeeAttacker {
		result.HasAdvantage = true
		result.Reasons = append(result.Reasons, "target can't see you")
	}

	// Attacker conditions
	for _, cond := range attackerConditions {
		condLower := strings.ToLower(strings.TrimSpace(cond))

		switch condLower {
		case "invisible", "hidden":
			// Invisible/hidden attacker gets advantage unless target has Alert feat
			// (or special senses - but that's handled by targetCanSeeAttacker)
			if !targetHasAlert && targetCanSeeAttacker {
				// Only grant advantage if target doesn't have Alert
				// (targetCanSeeAttacker being true means they have normal vision,
				// but can't see invisible creatures without special senses)
				// Actually, if targetCanSeeAttacker is false, we already granted advantage above
				// This case is for when target has normal vision but attacker is invisible
			}
			// The main.go logic handles this via targetCanSeeAttacker already

		case "blinded":
			result.HasDisadvantage = true
			result.Reasons = append(result.Reasons, "blinded")

		case "frightened":
			result.HasDisadvantage = true
			result.Reasons = append(result.Reasons, "frightened")

		case "poisoned":
			result.HasDisadvantage = true
			result.Reasons = append(result.Reasons, "poisoned")

		case "prone":
			result.HasDisadvantage = true
			result.Reasons = append(result.Reasons, "prone (attacker)")

		case "restrained":
			result.HasDisadvantage = true
			result.Reasons = append(result.Reasons, "restrained")
		}

		// Flanking check: "flanking:X" grants advantage on MELEE attacks against target X
		if strings.HasPrefix(condLower, "flanking:") && !isRanged && flankingTargetID > 0 {
			// Extract target ID from condition
			parts := strings.SplitN(condLower, ":", 2)
			if len(parts) == 2 {
				// Compare as strings since we already parsed the flanking target ID
				if parts[1] == strings.ToLower(strings.TrimSpace(string(rune(flankingTargetID)))) {
					result.HasAdvantage = true
					result.Reasons = append(result.Reasons, "flanking")
				}
			}
		}
	}

	// Target conditions
	for _, cond := range targetConditions {
		condLower := strings.ToLower(strings.TrimSpace(cond))

		switch condLower {
		case "blinded":
			result.HasAdvantage = true
			result.Reasons = append(result.Reasons, "target is blinded")

		case "paralyzed":
			result.HasAdvantage = true
			result.Reasons = append(result.Reasons, "target is paralyzed")

		case "stunned":
			result.HasAdvantage = true
			result.Reasons = append(result.Reasons, "target is stunned")

		case "unconscious":
			result.HasAdvantage = true
			result.Reasons = append(result.Reasons, "target is unconscious")

		case "restrained":
			result.HasAdvantage = true
			result.Reasons = append(result.Reasons, "target is restrained")

		case "invisible":
			// Attacker can't see invisible target (unless they have special senses)
			// This is handled by attackerCanSeeTarget parameter
			// If we reach here and attackerCanSeeTarget is true, they have blindsight/truesight

		case "prone":
			// Prone: advantage from within 5ft (melee), disadvantage from further (ranged)
			if isRanged {
				result.HasDisadvantage = true
				result.Reasons = append(result.Reasons, "target is prone (ranged)")
			} else {
				result.HasAdvantage = true
				result.Reasons = append(result.Reasons, "target is prone (melee)")
			}

		case "reckless":
			// Reckless Attack: attacks against the reckless character have advantage
			result.HasAdvantage = true
			result.Reasons = append(result.Reasons, "target used Reckless Attack")
		}
	}

	// Non-proficient armor penalty
	if isWearingNonProficientArmor {
		result.HasDisadvantage = true
		result.Reasons = append(result.Reasons, "non-proficient armor")
	}

	return result
}

// IsAutoCriticalHit checks if an attack automatically becomes a critical hit.
// Per PHB: attacks within 5ft against paralyzed or unconscious targets are auto-crits.
func IsAutoCriticalHit(targetConditions []string, isWithin5Feet bool) bool {
	if !isWithin5Feet {
		return false
	}

	for _, cond := range targetConditions {
		condLower := strings.ToLower(strings.TrimSpace(cond))
		if condLower == "paralyzed" || condLower == "unconscious" {
			return true
		}
	}
	return false
}

// CanCriticalHit checks if a d20 roll results in a critical hit.
// Takes into account features like Champion's Improved Critical.
//
// Parameters:
//   - roll: the natural d20 roll
//   - critRange: minimum roll for critical (20 normally, 19 for Champion level 3+, 18 for level 15+)
func CanCriticalHit(roll, critRange int) bool {
	return roll >= critRange
}

// IsCriticalMiss checks if a d20 roll is an automatic miss (natural 1).
func IsCriticalMiss(roll int) bool {
	return roll == 1
}
