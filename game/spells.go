// Package game provides core D&D 5e game mechanics.
//
// spells.go - Spell mechanics, cantrip scaling, prepared spells, multiclass slots
package game

import (
	"strings"
)

// ScaledCantripDamage returns the scaled damage dice for a cantrip based on character level.
// damageAtCharLevel is a map from character level thresholds to damage dice (e.g., {"1": "1d10", "5": "2d10"}).
// Returns empty string if no damage data is available.
func ScaledCantripDamage(damageAtCharLevel map[string]string, charLevel int) string {
	// Find the highest threshold that doesn't exceed the character's level
	// Cantrips scale at levels 1, 5, 11, 17 per PHB
	thresholds := []int{17, 11, 5, 1}
	for _, threshold := range thresholds {
		if charLevel >= threshold {
			key := intToString(threshold)
			if dice, ok := damageAtCharLevel[key]; ok {
				return dice
			}
		}
	}
	// Fallback to level 1 damage if no match found
	if dice, ok := damageAtCharLevel["1"]; ok {
		return dice
	}
	return "" // No damage data available
}

// intToString converts an int to a string without using fmt
func intToString(n int) string {
	if n == 0 {
		return "0"
	}
	if n < 0 {
		return "-" + intToString(-n)
	}
	var digits []byte
	for n > 0 {
		digits = append([]byte{byte('0' + n%10)}, digits...)
		n /= 10
	}
	return string(digits)
}

// MaxPreparedSpells returns the maximum number of spells a prepared caster can have prepared.
// Returns 0 for known casters (Bard, Sorcerer, Ranger, Warlock) as they don't prepare spells.
// Uses the class's spellcasting ability modifier in the calculation.
func MaxPreparedSpells(class string, level, intl, wis, cha int) int {
	if !IsPreparedCaster(class) {
		return 0
	}

	mod := SpellcastingAbilityMod(class, intl, wis, cha)
	classLower := strings.ToLower(class)

	var preparedCount int
	switch classLower {
	case "paladin":
		// Paladins prepare: paladin level / 2 (round down) + CHA modifier (PHB p84)
		halfLevel := level / 2
		if halfLevel < 1 {
			halfLevel = 1
		}
		preparedCount = halfLevel + mod
	case "cleric", "druid", "wizard":
		// Full casters prepare: class level + spellcasting modifier (PHB p58, 66, 114)
		preparedCount = level + mod
	default:
		preparedCount = level + mod
	}

	// Minimum of 1 spell prepared (PHB errata)
	if preparedCount < 1 {
		preparedCount = 1
	}
	return preparedCount
}

// MulticlassSpellSlots calculates spell slots for multiclass characters.
// Uses the PHB multiclass spellcasting rules (PHB p164-165):
// - Full casters (Bard, Cleric, Druid, Sorcerer, Wizard): add full level
// - Half casters (Paladin, Ranger): add half level (round down)
// - Warlocks: separate Pact Magic, added on top of regular slots
// - Non-casters: don't contribute
func MulticlassSpellSlots(classLevels map[string]int) map[int]int {
	if len(classLevels) == 0 {
		return map[int]int{}
	}

	// Single class - use standard calculation
	if len(classLevels) == 1 {
		for class, level := range classLevels {
			return SpellSlots(class, level)
		}
	}

	// Multiclass spellcasting calculation
	fullCasters := map[string]bool{"bard": true, "cleric": true, "druid": true, "sorcerer": true, "wizard": true}
	halfCasters := map[string]bool{"paladin": true, "ranger": true}

	combinedLevel := 0
	warlockLevel := 0

	for class, level := range classLevels {
		class = strings.ToLower(class)
		if fullCasters[class] {
			combinedLevel += level
		} else if halfCasters[class] {
			combinedLevel += level / 2 // Round down
		} else if class == "warlock" {
			warlockLevel = level // Warlock pact magic is separate
		}
		// Note: Eldritch Knight and Arcane Trickster would need subclass checking
		// For now, non-caster classes don't contribute
	}

	// If no spellcasting levels, return empty
	if combinedLevel == 0 && warlockLevel == 0 {
		return map[int]int{}
	}

	// Get spell slots based on combined caster level
	// Use the full caster table for combined level
	result := map[int]int{}
	if combinedLevel > 0 {
		result = SpellSlots("wizard", combinedLevel) // Use wizard table for combined slots
	}

	// Warlock pact magic is separate - add those slots
	if warlockLevel > 0 {
		warlockSlotMap := SpellSlots("warlock", warlockLevel)
		for slotLevel, count := range warlockSlotMap {
			result[slotLevel] += count
		}
	}

	return result
}

// SlotRecoveryAbility returns information about a class's spell slot recovery ability.
// Returns the ability name, maximum combined slot levels to recover, and maximum slot level.
// Returns empty values if the class/subclass doesn't have a slot recovery ability.
//
// Abilities:
//   - Wizard Arcane Recovery (PHB p115): all wizards, level 1+
//   - Druid Natural Recovery (PHB p68): Circle of the Land druids only, level 2+
func SlotRecoveryAbility(class, subclass string, level int) (abilityName string, maxCombined int, maxSlotLevel int) {
	classLower := strings.ToLower(class)
	subclassLower := strings.ToLower(subclass)

	// Wizard's Arcane Recovery (PHB p115) - all wizards get this at level 1
	// Recover slots with combined level ≤ half wizard level (rounded up), max 5th level
	if classLower == "wizard" {
		maxCombined = (level + 1) / 2 // Round up
		return "arcane_recovery", maxCombined, 5
	}

	// Druid's Natural Recovery (PHB p68) - Circle of the Land druids only, level 2+
	// Same mechanics as Arcane Recovery
	if classLower == "druid" && subclassLower == "land" && level >= 2 {
		maxCombined = (level + 1) / 2 // Round up
		return "natural_recovery", maxCombined, 5
	}

	return "", 0, 0
}

// LandCircleSpells returns the circle spells for a Circle of the Land druid.
// Circle spells are unlocked at druid levels 3, 5, 7, 9 (for 2nd, 3rd, 4th, 5th level spells).
// Returns nil if landType is not recognized.
func LandCircleSpells(landType string, level int) []string {
	circleSpells := map[string]map[int][]string{
		"arctic": {
			3: {"hold-person", "spike-growth"},
			5: {"sleet-storm", "slow"},
			7: {"freedom-of-movement", "ice-storm"},
			9: {"commune-with-nature", "cone-of-cold"},
		},
		"coast": {
			3: {"mirror-image", "misty-step"},
			5: {"water-breathing", "water-walk"},
			7: {"control-water", "freedom-of-movement"},
			9: {"conjure-elemental", "scrying"},
		},
		"desert": {
			3: {"blur", "silence"},
			5: {"create-food-and-water", "protection-from-energy"},
			7: {"blight", "hallucinatory-terrain"},
			9: {"insect-plague", "wall-of-stone"},
		},
		"forest": {
			3: {"barkskin", "spider-climb"},
			5: {"call-lightning", "plant-growth"},
			7: {"divination", "freedom-of-movement"},
			9: {"commune-with-nature", "tree-stride"},
		},
		"grassland": {
			3: {"invisibility", "pass-without-trace"},
			5: {"daylight", "haste"},
			7: {"divination", "freedom-of-movement"},
			9: {"dream", "insect-plague"},
		},
		"mountain": {
			3: {"spider-climb", "spike-growth"},
			5: {"lightning-bolt", "meld-into-stone"},
			7: {"stone-shape", "stoneskin"},
			9: {"passwall", "wall-of-stone"},
		},
		"swamp": {
			3: {"darkness", "acid-arrow"}, // Melf's Acid Arrow in SRD
			5: {"water-walk", "stinking-cloud"},
			7: {"freedom-of-movement", "locate-creature"},
			9: {"insect-plague", "scrying"},
		},
		"underdark": {
			3: {"spider-climb", "web"},
			5: {"gaseous-form", "stinking-cloud"},
			7: {"greater-invisibility", "stone-shape"},
			9: {"cloudkill", "insect-plague"},
		},
	}

	landSpells, ok := circleSpells[strings.ToLower(landType)]
	if !ok {
		return nil
	}

	var spells []string
	for spellLevel, spellList := range landSpells {
		if level >= spellLevel {
			spells = append(spells, spellList...)
		}
	}
	return spells
}

// ValidLandTypes returns all valid land types for Circle of the Land druids.
func ValidLandTypes() []string {
	return []string{
		"arctic",
		"coast",
		"desert",
		"forest",
		"grassland",
		"mountain",
		"swamp",
		"underdark",
	}
}

// IsValidLandType checks if a land type is valid for Circle of the Land druids.
func IsValidLandType(landType string) bool {
	for _, valid := range ValidLandTypes() {
		if strings.ToLower(landType) == valid {
			return true
		}
	}
	return false
}
