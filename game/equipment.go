// Package game provides D&D 5e game mechanics as pure functions.
// equipment.go contains equipment-related calculations and lookups.
package game

import "strings"

// Armor type constants
const (
	ArmorTypeLight  = "light"
	ArmorTypeMedium = "medium"
	ArmorTypeHeavy  = "heavy"
	ArmorTypeShield = "shield"
)

// ArmorInfo contains the relevant stats for an armor piece
type ArmorInfo struct {
	AC                  int
	Type                string // light, medium, heavy, shield
	StealthDisadvantage bool
	StrengthRequirement int
}

// ArmorDonDoffTime returns donning and doffing times in minutes for an armor type (PHB p146)
// Shield: 0 minutes (actually 1 action, handled specially in combat)
// Light armor: 1 minute don, 1 minute doff
// Medium armor: 5 minutes don, 1 minute doff
// Heavy armor: 10 minutes don, 5 minutes doff
func ArmorDonDoffTime(armorType string) (donMinutes, doffMinutes int) {
	switch strings.ToLower(armorType) {
	case ArmorTypeShield:
		return 0, 0 // Handled as action in combat
	case ArmorTypeLight:
		return 1, 1
	case ArmorTypeMedium:
		return 5, 1
	case ArmorTypeHeavy:
		return 10, 5
	default:
		return 1, 1 // Default to light armor timing
	}
}

// CalculateArmorAC calculates AC based on equipped armor, shield, and DEX modifier
// Uses default natural AC base of 10 for unarmored characters.
// Rules:
// - Unarmored: 10 + DEX mod
// - Light armor: Armor AC + full DEX mod
// - Medium armor: Armor AC + DEX mod (max +2)
// - Heavy armor: Armor AC (no DEX mod)
// - Shield: +2 AC
func CalculateArmorAC(dexMod int, armor *ArmorInfo, hasShield bool) int {
	return CalculateArmorACWithNatural(dexMod, armor, hasShield, 10)
}

// CalculateArmorACWithNatural calculates AC with a custom natural AC base.
// Used for features like Draconic Resilience (13 + DEX) or Monk/Barbarian Unarmored Defense.
func CalculateArmorACWithNatural(dexMod int, armor *ArmorInfo, hasShield bool, naturalACBase int) int {
	baseAC := naturalACBase + dexMod // Unarmored with natural AC

	if armor != nil && armor.AC > 0 {
		switch strings.ToLower(armor.Type) {
		case ArmorTypeLight:
			baseAC = armor.AC + dexMod
		case ArmorTypeMedium:
			dexBonus := dexMod
			if dexBonus > 2 {
				dexBonus = 2
			}
			baseAC = armor.AC + dexBonus
		case ArmorTypeHeavy:
			baseAC = armor.AC
		}
	}

	if hasShield {
		baseAC += 2
	}

	return baseAC
}

// AmmoTypeForWeapon returns the ammunition type needed for a weapon, or "" if none.
// Standard 5e ammunition weapons: bows use arrows, crossbows use bolts,
// blowguns use needles, slings use bullets.
func AmmoTypeForWeapon(weaponKey string) string {
	ammoMap := map[string]string{
		"shortbow":       "arrows",
		"longbow":        "arrows",
		"light_crossbow": "bolts",
		"heavy_crossbow": "bolts",
		"hand_crossbow":  "bolts",
		"blowgun":        "needles",
		"sling":          "bullets",
	}
	return ammoMap[weaponKey]
}

// AmmoNames returns valid inventory names for an ammunition type.
// Used for matching ammunition in character inventory.
func AmmoNames(ammoType string) []string {
	ammoNames := map[string][]string{
		"arrows":  {"arrows", "arrow", "quiver of arrows"},
		"bolts":   {"bolts", "bolt", "crossbow bolts", "crossbow bolt"},
		"needles": {"needles", "needle", "blowgun needles", "blowgun needle"},
		"bullets": {"bullets", "bullet", "sling bullets", "sling bullet"},
	}
	if names, ok := ammoNames[ammoType]; ok {
		return names
	}
	return []string{ammoType}
}

// IsWeaponCategoryProficient checks if a proficiency category matches a weapon category.
// profCategory is "simple" or "martial"
// weaponCategory is "simple" or "martial" (from the weapon's actual category)
func IsWeaponCategoryProficient(profCategory, weaponCategory string) bool {
	profLower := strings.ToLower(strings.TrimSpace(profCategory))
	weaponLower := strings.ToLower(strings.TrimSpace(weaponCategory))
	return profLower == weaponLower
}

// IsArmorCategoryProficient checks if a character with given proficiencies is proficient
// with a specific armor category.
// profList is a list of proficiencies like ["light", "medium", "shields"]
// armorCategory is "light", "medium", "heavy", or "shield"
func IsArmorCategoryProficient(profList []string, armorCategory string) bool {
	categoryLower := strings.ToLower(strings.TrimSpace(armorCategory))

	for _, prof := range profList {
		prof = strings.ToLower(strings.TrimSpace(prof))

		// "all armor" covers light, medium, and heavy (but not shields)
		if prof == "all armor" && (categoryLower == "light" || categoryLower == "medium" || categoryLower == "heavy") {
			return true
		}

		// Direct match (including "shields" for shield category)
		if prof == categoryLower {
			return true
		}

		// Handle "shields" matching "shield"
		if prof == "shields" && categoryLower == "shield" {
			return true
		}
	}

	return false
}

// ParseProficiencyList parses a comma-separated proficiency string into a slice.
// E.g., "simple, martial, shields" -> ["simple", "martial", "shields"]
func ParseProficiencyList(profStr string) []string {
	if profStr == "" {
		return nil
	}
	parts := strings.Split(profStr, ",")
	result := make([]string, 0, len(parts))
	for _, p := range parts {
		trimmed := strings.TrimSpace(p)
		if trimmed != "" {
			result = append(result, trimmed)
		}
	}
	return result
}

// NormalizeWeaponName normalizes a weapon name for comparison.
// Converts underscores and hyphens to spaces, lowercases.
// E.g., "light_crossbow" -> "light crossbow"
func NormalizeWeaponName(name string) string {
	normalized := strings.ToLower(name)
	normalized = strings.ReplaceAll(normalized, "_", " ")
	normalized = strings.ReplaceAll(normalized, "-", " ")
	return strings.TrimSpace(normalized)
}

// IsUnderwaterExemptWeapon checks if a weapon doesn't have disadvantage underwater.
// Crossbows, nets, and some thrown weapons (dagger, dart, javelin, spear, trident)
// can be used without disadvantage underwater within normal range (PHB p198).
// Supports both underscore and hyphen formats (e.g., "light_crossbow" and "crossbow-light").
func IsUnderwaterExemptWeapon(weaponKey string) bool {
	// Normalize the weapon key for consistent matching
	normalized := strings.ToLower(weaponKey)

	exemptWeapons := map[string]bool{
		// Underscore format (SRD style)
		"light_crossbow": true,
		"heavy_crossbow": true,
		"hand_crossbow":  true,
		// Hyphen format (alternative)
		"crossbow-light": true,
		"crossbow-heavy": true,
		"crossbow-hand":  true,
		// Other exempt weapons
		"net":     true,
		"dagger":  true,
		"dart":    true,
		"javelin": true,
		"spear":   true,
		"trident": true,
	}
	return exemptWeapons[normalized]
}

// MeetsArmorStrengthRequirement checks if a character's STR meets an armor's requirement.
// If the requirement is not met, the character's speed is reduced by 10 feet.
// Returns true if requirement is met (or armor has no requirement).
func MeetsArmorStrengthRequirement(strength int, armor *ArmorInfo) bool {
	if armor == nil {
		return true
	}
	return strength >= armor.StrengthRequirement
}

// HasStealthDisadvantage returns whether armor imposes disadvantage on Stealth checks.
func HasStealthDisadvantage(armor *ArmorInfo) bool {
	if armor == nil {
		return false
	}
	return armor.StealthDisadvantage
}
