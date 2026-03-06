// Package game provides core D&D 5e game mechanics.
// races.go handles 5e racial features and traits.
package game

import "strings"

// Race constants for the PHB/SRD races
const (
	RaceHuman       = "human"
	RaceElf         = "elf"
	RaceHighElf     = "high_elf"
	RaceWoodElf     = "wood_elf"
	RaceDarkElf     = "dark_elf" // Drow
	RaceDrow        = "drow"
	RaceHalfElf     = "half_elf"
	RaceDwarf       = "dwarf"
	RaceHillDwarf   = "hill_dwarf"
	RaceMountainDwarf = "mountain_dwarf"
	RaceHalfling    = "halfling"
	RaceLightfoot   = "lightfoot"
	RaceStout       = "stout"
	RaceGnome       = "gnome"
	RaceRockGnome   = "rock_gnome"
	RaceForestGnome = "forest_gnome"
	RaceHalfOrc     = "half_orc"
	RaceTiefling    = "tiefling"
	RaceDragonborn  = "dragonborn"
)

// Size constants
const (
	SizeTiny       = "Tiny"
	SizeSmall      = "Small"
	SizeMedium     = "Medium"
	SizeLarge      = "Large"
	SizeHuge       = "Huge"
	SizeGargantuan = "Gargantuan"
)

// RaceInfo contains basic racial statistics
type RaceInfo struct {
	Name  string
	Size  string
	Speed int
}

// normalizeRace converts a race string to a standard form for matching.
func normalizeRace(race string) string {
	race = strings.ToLower(race)
	race = strings.ReplaceAll(race, " ", "_")
	race = strings.ReplaceAll(race, "-", "_")
	return race
}

// IsHuman checks if a race is Human.
func IsHuman(race string) bool {
	return strings.Contains(normalizeRace(race), "human")
}

// IsElf checks if a race is any Elf variant or Half-Elf.
// Matches: elf, high_elf, wood_elf, drow, dark_elf, half_elf, etc.
func IsElf(race string) bool {
	return strings.Contains(normalizeRace(race), "elf")
}

// IsDwarf checks if a race is any Dwarf variant.
// Matches: dwarf, hill_dwarf, mountain_dwarf
func IsDwarf(race string) bool {
	return strings.Contains(normalizeRace(race), "dwarf")
}

// IsHalfling checks if a race is any Halfling variant.
// Matches: halfling, lightfoot, stout
func IsHalfling(race string) bool {
	return strings.Contains(normalizeRace(race), "halfling")
}

// IsGnome checks if a race is any Gnome variant.
// Matches: gnome, rock_gnome, forest_gnome
func IsGnome(race string) bool {
	return strings.Contains(normalizeRace(race), "gnome")
}

// IsHalfOrc checks if a race is Half-Orc.
// Matches: half-orc, halforc, half_orc
func IsHalfOrc(race string) bool {
	norm := normalizeRace(race)
	return strings.Contains(norm, "half_orc") || strings.Contains(norm, "halforc")
}

// IsTiefling checks if a race is Tiefling.
func IsTiefling(race string) bool {
	return strings.Contains(normalizeRace(race), "tiefling")
}

// IsDragonborn checks if a race is Dragonborn.
func IsDragonborn(race string) bool {
	return strings.Contains(normalizeRace(race), "dragonborn")
}

// HasFeyAncestry returns true if the race has the Fey Ancestry trait (PHB p23).
// Elf, Half-Elf (all variants) have this trait.
// Effects: Advantage on saves against being charmed, immune to magical sleep.
func HasFeyAncestry(race string) bool {
	return IsElf(race)
}

// HasGnomeCunning returns true if the race has the Gnome Cunning trait (PHB p37).
// All Gnome variants have this trait.
// Effects: Advantage on INT, WIS, and CHA saves against magic.
func HasGnomeCunning(race string) bool {
	return IsGnome(race)
}

// HasDwarvenResilience returns true if the race has the Dwarven Resilience trait (PHB p20).
// All Dwarf variants have this trait.
// Effects: Advantage on saves against poison, resistance to poison damage.
func HasDwarvenResilience(race string) bool {
	return IsDwarf(race)
}

// HasHalflingLucky returns true if the race has the Lucky trait (PHB p28).
// All Halfling variants have this trait.
// Effects: Reroll natural 1s on d20 for attacks, ability checks, and saves.
func HasHalflingLucky(race string) bool {
	return IsHalfling(race)
}

// HasHalflingBrave returns true if the race has the Brave trait (PHB p28).
// All Halfling variants have this trait.
// Effects: Advantage on saves against being frightened.
func HasHalflingBrave(race string) bool {
	return IsHalfling(race)
}

// HasRelentlessEndurance returns true if the race has the Relentless Endurance trait (PHB p41).
// Half-Orcs have this trait.
// Effects: Drop to 1 HP instead of 0 (once per long rest).
func HasRelentlessEndurance(race string) bool {
	return IsHalfOrc(race)
}

// HasSavageAttacks returns true if the race has the Savage Attacks trait (PHB p41).
// Half-Orcs have this trait.
// Effects: Roll one extra weapon damage die on melee critical hits.
func HasSavageAttacks(race string) bool {
	return IsHalfOrc(race)
}

// HasHellishResistance returns true if the race has the Hellish Resistance trait (PHB p43).
// Tieflings have this trait.
// Effects: Resistance to fire damage.
func HasHellishResistance(race string) bool {
	return IsTiefling(race)
}

// HasInfernalLegacy returns true if the race has the Infernal Legacy trait (PHB p43).
// Tieflings have this trait.
// Effects: Know Thaumaturgy, cast Hellish Rebuke (3+), cast Darkness (5+).
func HasInfernalLegacy(race string) bool {
	return IsTiefling(race)
}

// HasBreathWeapon returns true if the race has the Breath Weapon trait (PHB p34).
// Dragonborn have this trait.
// Effects: Breath weapon attack based on draconic ancestry.
func HasBreathWeapon(race string) bool {
	return IsDragonborn(race)
}

// GetRaceSize returns the size category for a race (PHB sizes).
// Returns "Small" for Halflings and Gnomes, "Medium" for all others.
func GetRaceSize(race string) string {
	if IsHalfling(race) || IsGnome(race) {
		return SizeSmall
	}
	return SizeMedium
}

// GetDefaultSpeed returns the base walking speed for a race.
// Most races have 30ft, but some have different speeds.
func GetDefaultSpeed(race string) int {
	norm := normalizeRace(race)
	
	// Small races typically have 25ft speed
	if IsHalfling(race) || IsGnome(race) {
		return 25
	}
	
	// Dwarves have 25ft speed
	if IsDwarf(race) {
		return 25
	}
	
	// Wood elves have 35ft speed
	if strings.Contains(norm, "wood") && strings.Contains(norm, "elf") {
		return 35
	}
	
	// Default speed for most races
	return 30
}

// SizeOrder returns the numeric order for a size category.
// Higher numbers mean larger creatures.
func SizeOrder(size string) int {
	order := map[string]int{
		SizeTiny:       1,
		SizeSmall:      2,
		SizeMedium:     3,
		SizeLarge:      4,
		SizeHuge:       5,
		SizeGargantuan: 6,
	}
	if o, ok := order[size]; ok {
		return o
	}
	return 3 // Default to Medium
}

// IsSizeLargerThan returns true if sizeA is larger than sizeB.
func IsSizeLargerThan(sizeA, sizeB string) bool {
	return SizeOrder(sizeA) > SizeOrder(sizeB)
}

// IsSizeAtLeastOneLarger returns true if sizeA is at least one size category larger than sizeB.
// Used for mount eligibility (mounts must be at least one size larger than rider).
func IsSizeAtLeastOneLarger(sizeA, sizeB string) bool {
	return SizeOrder(sizeA) > SizeOrder(sizeB)
}

// Keyword lists for racial save advantages

var frightenKeywords = []string{
	"frighten", "frightened", "frightening", "fear", "feared", "fearful",
	"terrify", "terrified", "terror", "scare", "scared", "dread", "panic",
}

var charmKeywords = []string{
	"charm", "charmed", "charming", "dominate", "suggestion",
	"command", "compulsion", "enthrall",
}

var poisonKeywords = []string{
	"poison", "poisoned", "poisoning", "toxic", "venom", "venomous",
}

// CheckFrightenKeywords returns true if the description contains frighten-related keywords.
// Used for Halfling Brave, Fey Ancestry (elves/half-elves), etc.
func CheckFrightenKeywords(description string) bool {
	descLower := strings.ToLower(description)
	for _, keyword := range frightenKeywords {
		if strings.Contains(descLower, keyword) {
			return true
		}
	}
	return false
}

// CheckCharmKeywords returns true if the description contains charm-related keywords.
// Used for Fey Ancestry (elves/half-elves).
func CheckCharmKeywords(description string) bool {
	descLower := strings.ToLower(description)
	for _, keyword := range charmKeywords {
		if strings.Contains(descLower, keyword) {
			return true
		}
	}
	return false
}

// CheckPoisonKeywords returns true if the description contains poison-related keywords.
// Used for Dwarven Resilience.
func CheckPoisonKeywords(description string) bool {
	descLower := strings.ToLower(description)
	for _, keyword := range poisonKeywords {
		if strings.Contains(descLower, keyword) {
			return true
		}
	}
	return false
}

// CheckHalflingBrave returns true if Halfling Brave grants advantage on this save.
// Requires the race to be Halfling AND the save to be against frightened effects.
func CheckHalflingBrave(race, description string) bool {
	if !HasHalflingBrave(race) {
		return false
	}
	return CheckFrightenKeywords(description)
}

// CheckFeyAncestryCharm returns true if Fey Ancestry grants advantage on this charm save.
// Requires the race to have Fey Ancestry AND the save to be against charm effects.
func CheckFeyAncestryCharm(race, description string) bool {
	if !HasFeyAncestry(race) {
		return false
	}
	return CheckCharmKeywords(description)
}

// CheckDwarvenResiliencePoison returns true if Dwarven Resilience grants advantage on this save.
// Requires the race to be Dwarf AND the save to be against poison effects.
func CheckDwarvenResiliencePoison(race, description string) bool {
	if !HasDwarvenResilience(race) {
		return false
	}
	return CheckPoisonKeywords(description)
}

// CheckGnomeCunningMagic returns true if Gnome Cunning grants advantage on this save.
// Requires: race is Gnome, save is INT/WIS/CHA, and the effect is magical.
func CheckGnomeCunningMagic(race, abilityShort string, fromMagic bool) bool {
	if !HasGnomeCunning(race) {
		return false
	}
	if !fromMagic {
		return false
	}
	switch strings.ToLower(abilityShort) {
	case "int", "wis", "cha":
		return true
	default:
		return false
	}
}

// ApplyHalflingLucky implements the Halfling Lucky racial trait (PHB p28):
// When you roll a 1 on the d20, you can reroll and must use the new roll.
// Returns: (finalRoll, wasRerolled, originalRoll)
// Note: Caller must check HasHalflingLucky before calling this for correct behavior,
// OR this will apply the logic regardless (it checks the roll value, not the race).
func ApplyHalflingLucky(d20Roll int, isHalfling bool) (finalRoll int, wasRerolled bool, originalRoll int) {
	if d20Roll == 1 && isHalfling {
		newRoll := RollDie(20)
		return newRoll, true, d20Roll
	}
	return d20Roll, false, d20Roll
}

// BreathWeaponDamage returns the damage dice for a Dragonborn breath weapon at a given level.
// Scales: 2d6 (1-5), 3d6 (6-10), 4d6 (11-15), 5d6 (16+) per PHB p34.
func BreathWeaponDamage(level int) string {
	switch {
	case level >= 16:
		return "5d6"
	case level >= 11:
		return "4d6"
	case level >= 6:
		return "3d6"
	default:
		return "2d6"
	}
}

// DragonAncestry maps dragon types to their damage types and breath weapon shapes.
type DragonAncestry struct {
	Color      string
	DamageType string
	BreathArea string // "15ft cone" or "5x30ft line"
	SaveAbility string // "dex" or "con"
}

// DragonAncestries contains all draconic ancestry options from PHB p34.
var DragonAncestries = map[string]DragonAncestry{
	"black":  {"Black", "acid", "5x30ft line", "dex"},
	"blue":   {"Blue", "lightning", "5x30ft line", "dex"},
	"brass":  {"Brass", "fire", "5x30ft line", "dex"},
	"bronze": {"Bronze", "lightning", "5x30ft line", "dex"},
	"copper": {"Copper", "acid", "5x30ft line", "dex"},
	"gold":   {"Gold", "fire", "15ft cone", "dex"},
	"green":  {"Green", "poison", "15ft cone", "con"},
	"red":    {"Red", "fire", "15ft cone", "dex"},
	"silver": {"Silver", "cold", "15ft cone", "con"},
	"white":  {"White", "cold", "15ft cone", "con"},
}

// GetDragonAncestry returns the ancestry info for a dragon color.
// Returns nil if the color is not found.
func GetDragonAncestry(color string) *DragonAncestry {
	color = strings.ToLower(color)
	if ancestry, ok := DragonAncestries[color]; ok {
		return &ancestry
	}
	return nil
}
