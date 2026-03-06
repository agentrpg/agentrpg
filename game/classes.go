// Package game provides core D&D 5e game mechanics.
//
// classes.go - Class features, resources, spell slots, and related calculations
package game

import "strings"

// ExtraAttackCount returns the number of attacks a character gets with the Attack action.
// Fighter scales: 2 at 5, 3 at 11, 4 at 20
// Barbarian/Monk/Paladin/Ranger: 2 at 5
// Others: 1
func ExtraAttackCount(class string, level int) int {
	classLower := strings.ToLower(class)

	switch classLower {
	case "fighter":
		if level >= 20 {
			return 4
		} else if level >= 11 {
			return 3
		} else if level >= 5 {
			return 2
		}
	case "barbarian", "monk", "paladin", "ranger":
		if level >= 5 {
			return 2
		}
	}

	// All other classes and lower levels get 1 attack
	return 1
}

// HitDie returns the hit die size for a class (e.g., 12 for Barbarian's d12)
func HitDie(class string) int {
	switch strings.ToLower(class) {
	case "barbarian":
		return 12
	case "fighter", "paladin", "ranger":
		return 10
	case "bard", "cleric", "druid", "monk", "rogue", "warlock":
		return 8
	case "sorcerer", "wizard":
		return 6
	default:
		return 8 // Default to d8
	}
}

// SpellSlots returns the spell slots available for a class at a given level.
// Returns a map of spell level -> number of slots.
func SpellSlots(class string, level int) map[int]int {
	class = strings.ToLower(class)

	switch class {
	case "bard", "cleric", "druid", "sorcerer", "wizard":
		return fullCasterSlots(level)
	case "paladin", "ranger":
		return halfCasterSlots(level)
	case "warlock":
		return warlockSlots(level)
	}

	return map[int]int{} // Non-casters have no slots
}

// fullCasterSlots returns spell slots for full casters (Bard, Cleric, Druid, Sorcerer, Wizard)
func fullCasterSlots(level int) map[int]int {
	slots := map[int]map[int]int{
		1:  {1: 2},
		2:  {1: 3},
		3:  {1: 4, 2: 2},
		4:  {1: 4, 2: 3},
		5:  {1: 4, 2: 3, 3: 2},
		6:  {1: 4, 2: 3, 3: 3},
		7:  {1: 4, 2: 3, 3: 3, 4: 1},
		8:  {1: 4, 2: 3, 3: 3, 4: 2},
		9:  {1: 4, 2: 3, 3: 3, 4: 3, 5: 1},
		10: {1: 4, 2: 3, 3: 3, 4: 3, 5: 2},
		11: {1: 4, 2: 3, 3: 3, 4: 3, 5: 2, 6: 1},
		12: {1: 4, 2: 3, 3: 3, 4: 3, 5: 2, 6: 1},
		13: {1: 4, 2: 3, 3: 3, 4: 3, 5: 2, 6: 1, 7: 1},
		14: {1: 4, 2: 3, 3: 3, 4: 3, 5: 2, 6: 1, 7: 1},
		15: {1: 4, 2: 3, 3: 3, 4: 3, 5: 2, 6: 1, 7: 1, 8: 1},
		16: {1: 4, 2: 3, 3: 3, 4: 3, 5: 2, 6: 1, 7: 1, 8: 1},
		17: {1: 4, 2: 3, 3: 3, 4: 3, 5: 2, 6: 1, 7: 1, 8: 1, 9: 1},
		18: {1: 4, 2: 3, 3: 3, 4: 3, 5: 3, 6: 1, 7: 1, 8: 1, 9: 1},
		19: {1: 4, 2: 3, 3: 3, 4: 3, 5: 3, 6: 2, 7: 1, 8: 1, 9: 1},
		20: {1: 4, 2: 3, 3: 3, 4: 3, 5: 3, 6: 2, 7: 2, 8: 1, 9: 1},
	}
	if s, ok := slots[level]; ok {
		return s
	}
	return map[int]int{}
}

// halfCasterSlots returns spell slots for half casters (Paladin, Ranger) - start at level 2
func halfCasterSlots(level int) map[int]int {
	slots := map[int]map[int]int{
		2:  {1: 2},
		3:  {1: 3},
		4:  {1: 3},
		5:  {1: 4, 2: 2},
		6:  {1: 4, 2: 2},
		7:  {1: 4, 2: 3},
		8:  {1: 4, 2: 3},
		9:  {1: 4, 2: 3, 3: 2},
		10: {1: 4, 2: 3, 3: 2},
		11: {1: 4, 2: 3, 3: 3},
		12: {1: 4, 2: 3, 3: 3},
		13: {1: 4, 2: 3, 3: 3, 4: 1},
		14: {1: 4, 2: 3, 3: 3, 4: 1},
		15: {1: 4, 2: 3, 3: 3, 4: 2},
		16: {1: 4, 2: 3, 3: 3, 4: 2},
		17: {1: 4, 2: 3, 3: 3, 4: 3, 5: 1},
		18: {1: 4, 2: 3, 3: 3, 4: 3, 5: 1},
		19: {1: 4, 2: 3, 3: 3, 4: 3, 5: 2},
		20: {1: 4, 2: 3, 3: 3, 4: 3, 5: 2},
	}
	if s, ok := slots[level]; ok {
		return s
	}
	return map[int]int{}
}

// warlockSlots returns Warlock pact magic slots (all slots are same level)
func warlockSlots(level int) map[int]int {
	slots := map[int]map[int]int{
		1:  {1: 1},
		2:  {1: 2},
		3:  {2: 2},
		4:  {2: 2},
		5:  {3: 2},
		6:  {3: 2},
		7:  {4: 2},
		8:  {4: 2},
		9:  {5: 2},
		10: {5: 2},
		11: {5: 3},
		12: {5: 3},
		13: {5: 3},
		14: {5: 3},
		15: {5: 3},
		16: {5: 3},
		17: {5: 4},
		18: {5: 4},
		19: {5: 4},
		20: {5: 4},
	}
	if s, ok := slots[level]; ok {
		return s
	}
	return map[int]int{}
}

// IsPreparedCaster returns true if the class prepares spells daily (Cleric, Druid, Paladin, Wizard)
func IsPreparedCaster(class string) bool {
	switch strings.ToLower(class) {
	case "cleric", "druid", "paladin", "wizard":
		return true
	default:
		return false
	}
}

// IsKnownCaster returns true if the class has fixed known spells (Bard, Ranger, Sorcerer, Warlock)
func IsKnownCaster(class string) bool {
	switch strings.ToLower(class) {
	case "bard", "ranger", "sorcerer", "warlock":
		return true
	default:
		return false
	}
}

// SpellcastingAbility returns the spellcasting ability for a class ("int", "wis", or "cha")
func SpellcastingAbility(class string) string {
	switch strings.ToLower(class) {
	case "wizard":
		return "int"
	case "cleric", "druid", "ranger":
		return "wis"
	case "bard", "paladin", "sorcerer", "warlock":
		return "cha"
	default:
		return ""
	}
}

// SpellcastingAbilityMod returns the spellcasting ability modifier for a class
func SpellcastingAbilityMod(class string, intl, wis, cha int) int {
	switch strings.ToLower(class) {
	case "wizard":
		return Modifier(intl)
	case "cleric", "druid", "ranger":
		return Modifier(wis)
	case "bard", "paladin", "sorcerer", "warlock":
		return Modifier(cha)
	default:
		return 0
	}
}

// SpellSaveDC calculates spell save DC: 8 + proficiency bonus + spellcasting modifier
func SpellSaveDC(level int, spellcastingMod int) int {
	return 8 + ProficiencyBonus(level) + spellcastingMod
}

// ClassResource defines a class resource and its recovery behavior
type ClassResource struct {
	Name         string // Display name (e.g., "Ki Points")
	Key          string // JSON key (e.g., "ki")
	RecoverShort bool   // Recovers on short rest
	RecoverLong  bool   // Recovers on long rest
}

// ClassResources returns the resource types available for a class.
// Each class may have multiple resources (e.g., Fighter has Second Wind AND Action Surge).
func ClassResources(class string) []ClassResource {
	switch strings.ToLower(class) {
	case "monk":
		return []ClassResource{
			{Name: "Ki Points", Key: "ki", RecoverShort: true, RecoverLong: true},
		}
	case "barbarian":
		return []ClassResource{
			{Name: "Rage", Key: "rage", RecoverShort: false, RecoverLong: true},
		}
	case "sorcerer":
		return []ClassResource{
			{Name: "Sorcery Points", Key: "sorcery_points", RecoverShort: false, RecoverLong: true},
		}
	case "bard":
		return []ClassResource{
			{Name: "Bardic Inspiration", Key: "bardic_inspiration", RecoverShort: true, RecoverLong: true}, // Short rest at 5+
		}
	case "cleric":
		return []ClassResource{
			{Name: "Channel Divinity", Key: "channel_divinity", RecoverShort: true, RecoverLong: true},
		}
	case "paladin":
		return []ClassResource{
			{Name: "Channel Divinity", Key: "channel_divinity", RecoverShort: true, RecoverLong: true},
			{Name: "Lay on Hands", Key: "lay_on_hands", RecoverShort: false, RecoverLong: true},
		}
	case "fighter":
		return []ClassResource{
			{Name: "Second Wind", Key: "second_wind", RecoverShort: true, RecoverLong: true},
			{Name: "Action Surge", Key: "action_surge", RecoverShort: true, RecoverLong: true},
		}
	case "druid":
		return []ClassResource{
			{Name: "Wild Shape", Key: "wild_shape", RecoverShort: true, RecoverLong: true},
			{Name: "Natural Recovery", Key: "natural_recovery", RecoverShort: false, RecoverLong: true},
		}
	case "wizard":
		return []ClassResource{
			{Name: "Arcane Recovery", Key: "arcane_recovery", RecoverShort: false, RecoverLong: true},
		}
	}

	return nil
}

// MaxClassResource returns the maximum value for a specific resource based on class and level.
// chaMod is needed for Bard's Bardic Inspiration which scales with CHA.
func MaxClassResource(class string, level int, resourceKey string, chaMod int) int {
	classLower := strings.ToLower(class)

	switch resourceKey {
	case "ki":
		if classLower == "monk" {
			return level // Ki points equal monk level
		}
	case "rage":
		if classLower == "barbarian" {
			if level >= 20 {
				return 999 // Unlimited rages at 20
			} else if level >= 17 {
				return 6
			} else if level >= 12 {
				return 5
			} else if level >= 6 {
				return 4
			} else if level >= 3 {
				return 3
			}
			return 2
		}
	case "sorcery_points":
		if classLower == "sorcerer" {
			return level // Sorcery points equal sorcerer level
		}
	case "bardic_inspiration":
		if classLower == "bard" {
			if chaMod < 1 {
				return 1 // Minimum 1 use
			}
			return chaMod
		}
	case "channel_divinity":
		if classLower == "cleric" {
			if level >= 18 {
				return 3
			} else if level >= 6 {
				return 2
			} else if level >= 2 {
				return 1
			}
		} else if classLower == "paladin" {
			if level >= 3 {
				return 1
			}
		}
	case "lay_on_hands":
		if classLower == "paladin" {
			return level * 5 // Pool equals paladin level × 5
		}
	case "second_wind":
		if classLower == "fighter" && level >= 1 {
			return 1
		}
	case "action_surge":
		if classLower == "fighter" {
			if level >= 17 {
				return 2
			} else if level >= 2 {
				return 1
			}
		}
	case "wild_shape":
		if classLower == "druid" {
			if level >= 20 {
				return 999 // Archdruid: unlimited
			} else if level >= 2 {
				return 2
			}
		}
	case "arcane_recovery", "natural_recovery":
		if (classLower == "wizard" && resourceKey == "arcane_recovery") ||
			(classLower == "druid" && resourceKey == "natural_recovery") {
			if level >= 1 {
				return 1 // Once per day
			}
		}
	}

	return 0
}

// AllMaxClassResources returns all max resource values for a class at a given level.
func AllMaxClassResources(class string, level int, chaMod int) map[string]int {
	resources := ClassResources(class)
	if resources == nil {
		return nil
	}

	result := make(map[string]int)
	for _, r := range resources {
		result[r.Key] = MaxClassResource(class, level, r.Key, chaMod)
	}
	return result
}

// ClassFeature represents a core class feature granted at a specific level
type ClassFeature struct {
	Name        string            `json:"name"`
	Level       int               `json:"level"`
	Description string            `json:"description"`
	Mechanics   map[string]string `json:"mechanics,omitempty"`
}

// GetActiveClassFeatures returns the class features a character has unlocked based on their level
func GetActiveClassFeatures(class string, level int) []ClassFeature {
	features, ok := classFeatures[strings.ToLower(class)]
	if !ok {
		return nil
	}

	var active []ClassFeature
	for _, feature := range features {
		if level >= feature.Level {
			active = append(active, feature)
		}
	}
	return active
}

// HasClassFeature checks if a character has a specific class mechanic
func HasClassFeature(class string, level int, mechanic string) bool {
	features := GetActiveClassFeatures(class, level)
	for _, f := range features {
		if _, ok := f.Mechanics[mechanic]; ok {
			return true
		}
	}
	return false
}

// GetClassFeatureMechanic returns the value of a specific class mechanic if present.
// Returns the highest-level version of the mechanic (for scaling features).
func GetClassFeatureMechanic(class string, level int, mechanic string) (string, bool) {
	features := GetActiveClassFeatures(class, level)
	// Iterate backwards to get highest level version
	for i := len(features) - 1; i >= 0; i-- {
		if val, ok := features[i].Mechanics[mechanic]; ok {
			return val, true
		}
	}
	return "", false
}

// classFeatures contains all core class features from the SRD, organized by class
var classFeatures = map[string][]ClassFeature{
	"barbarian": {
		{Name: "Rage", Level: 1, Description: "In battle, you fight with primal ferocity. On your turn, you can enter a rage as a bonus action. While raging, you gain advantage on STR checks/saves, +2 damage on STR melee attacks, and resistance to bludgeoning, piercing, and slashing damage.", Mechanics: map[string]string{"rage": "true"}},
		{Name: "Unarmored Defense", Level: 1, Description: "While not wearing armor, your AC equals 10 + DEX mod + CON mod. You can use a shield and still gain this benefit.", Mechanics: map[string]string{"unarmored_defense": "con"}},
		{Name: "Reckless Attack", Level: 2, Description: "You can throw aside all concern for defense to attack with fierce desperation. When you make your first attack on your turn, you can decide to attack recklessly. Doing so gives you advantage on melee weapon attack rolls using STR during this turn, but attack rolls against you have advantage until your next turn.", Mechanics: map[string]string{"reckless_attack": "true"}},
		{Name: "Danger Sense", Level: 2, Description: "You have advantage on DEX saving throws against effects that you can see, such as traps and spells. To gain this benefit, you can't be blinded, deafened, or incapacitated.", Mechanics: map[string]string{"danger_sense": "true"}},
		{Name: "Extra Attack", Level: 5, Description: "You can attack twice, instead of once, whenever you take the Attack action on your turn.", Mechanics: map[string]string{"extra_attack": "1"}},
		{Name: "Fast Movement", Level: 5, Description: "Your speed increases by 10 feet while you aren't wearing heavy armor.", Mechanics: map[string]string{"fast_movement": "10"}},
		{Name: "Feral Instinct", Level: 7, Description: "Your instincts are so honed that you have advantage on initiative rolls. Additionally, if you are surprised at the beginning of combat and aren't incapacitated, you can act normally on your first turn, but only if you enter your rage before doing anything else.", Mechanics: map[string]string{"feral_instinct": "true"}},
		{Name: "Brutal Critical", Level: 9, Description: "You can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack. This increases to two additional dice at 13th level and three additional dice at 17th level.", Mechanics: map[string]string{"brutal_critical": "1"}},
		{Name: "Relentless Rage", Level: 11, Description: "Your rage can keep you fighting despite grievous wounds. If you drop to 0 HP while you're raging and don't die outright, you can make a DC 10 CON save. If you succeed, you drop to 1 HP instead. Each time you use this feature after the first, the DC increases by 5.", Mechanics: map[string]string{"relentless_rage": "true"}},
		{Name: "Brutal Critical (2 dice)", Level: 13, Description: "You can roll two additional weapon damage dice when determining the extra damage for a critical hit with a melee attack.", Mechanics: map[string]string{"brutal_critical": "2"}},
		{Name: "Persistent Rage", Level: 15, Description: "Your rage is so fierce that it ends early only if you fall unconscious or if you choose to end it.", Mechanics: map[string]string{"persistent_rage": "true"}},
		{Name: "Brutal Critical (3 dice)", Level: 17, Description: "You can roll three additional weapon damage dice when determining the extra damage for a critical hit with a melee attack.", Mechanics: map[string]string{"brutal_critical": "3"}},
		{Name: "Indomitable Might", Level: 18, Description: "If your total for a STR check is less than your STR score, you can use that score in place of the total.", Mechanics: map[string]string{"indomitable_might": "true"}},
		{Name: "Primal Champion", Level: 20, Description: "You embody the power of the wilds. Your STR and CON scores increase by 4. Your maximum for those scores is now 24.", Mechanics: map[string]string{"primal_champion": "true"}},
	},
	"bard": {
		{Name: "Spellcasting", Level: 1, Description: "You have learned to untangle and reshape the fabric of reality in harmony with your wishes and music. Your spells are part of your vast repertoire.", Mechanics: map[string]string{"spellcasting": "cha"}},
		{Name: "Bardic Inspiration", Level: 1, Description: "You can inspire others through stirring words or music. As a bonus action, you can choose one creature other than yourself within 60 feet who can hear you. That creature gains one Bardic Inspiration die (d6). Once within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes.", Mechanics: map[string]string{"bardic_inspiration": "d6"}},
		{Name: "Jack of All Trades", Level: 2, Description: "You can add half your proficiency bonus, rounded down, to any ability check you make that doesn't already include your proficiency bonus.", Mechanics: map[string]string{"jack_of_all_trades": "true"}},
		{Name: "Song of Rest", Level: 2, Description: "You can use soothing music or oration to help revitalize your wounded allies during a short rest. If you or any friendly creatures who can hear your performance regain HP at the end of the short rest by spending one or more Hit Dice, each of those creatures regains an extra 1d6 HP.", Mechanics: map[string]string{"song_of_rest": "d6"}},
		{Name: "Expertise", Level: 3, Description: "Choose two of your skill proficiencies. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies. At 10th level, you can choose another two skill proficiencies to gain this benefit.", Mechanics: map[string]string{"expertise": "2"}},
		{Name: "Font of Inspiration", Level: 5, Description: "You regain all of your expended uses of Bardic Inspiration when you finish a short or long rest.", Mechanics: map[string]string{"font_of_inspiration": "true"}},
		{Name: "Bardic Inspiration (d8)", Level: 5, Description: "Your Bardic Inspiration die becomes a d8.", Mechanics: map[string]string{"bardic_inspiration": "d8"}},
		{Name: "Countercharm", Level: 6, Description: "You can use musical notes or words of power to disrupt mind-influencing effects. As an action, you can start a performance that lasts until the end of your next turn. During that time, you and any friendly creatures within 30 feet of you have advantage on saving throws against being frightened or charmed.", Mechanics: map[string]string{"countercharm": "true"}},
		{Name: "Bardic Inspiration (d10)", Level: 10, Description: "Your Bardic Inspiration die becomes a d10.", Mechanics: map[string]string{"bardic_inspiration": "d10"}},
		{Name: "Expertise (Additional)", Level: 10, Description: "Choose two more of your skill proficiencies to gain expertise.", Mechanics: map[string]string{"expertise": "4"}},
		{Name: "Magical Secrets", Level: 10, Description: "You have plundered magical knowledge from a wide spectrum of disciplines. Choose two spells from any class, including this one. A spell you choose must be of a level you can cast. The chosen spells count as bard spells for you.", Mechanics: map[string]string{"magical_secrets": "2"}},
		{Name: "Bardic Inspiration (d12)", Level: 15, Description: "Your Bardic Inspiration die becomes a d12.", Mechanics: map[string]string{"bardic_inspiration": "d12"}},
		{Name: "Magical Secrets (Additional)", Level: 14, Description: "Choose two more spells from any class.", Mechanics: map[string]string{"magical_secrets": "4"}},
		{Name: "Magical Secrets (More)", Level: 18, Description: "Choose two more spells from any class.", Mechanics: map[string]string{"magical_secrets": "6"}},
		{Name: "Superior Inspiration", Level: 20, Description: "When you roll initiative and have no uses of Bardic Inspiration left, you regain one use.", Mechanics: map[string]string{"superior_inspiration": "true"}},
	},
	"cleric": {
		{Name: "Spellcasting", Level: 1, Description: "As a conduit for divine power, you can cast cleric spells. Wisdom is your spellcasting ability.", Mechanics: map[string]string{"spellcasting": "wis"}},
		{Name: "Divine Domain", Level: 1, Description: "Choose one domain related to your deity. Your choice grants you domain spells and other features.", Mechanics: map[string]string{"divine_domain": "true"}},
		{Name: "Channel Divinity", Level: 2, Description: "You gain the ability to channel divine energy directly from your deity, using that energy to fuel magical effects. You start with Turn Undead. You can use Channel Divinity once between rests, increasing to twice at 6th level and three times at 18th level.", Mechanics: map[string]string{"channel_divinity": "1"}},
		{Name: "Turn Undead", Level: 2, Description: "As an action, you present your holy symbol and speak a prayer censuring the undead. Each undead within 30 feet that can see or hear you must make a WIS save. On failure, the creature is turned for 1 minute or until it takes damage.", Mechanics: map[string]string{"turn_undead": "true"}},
		{Name: "Destroy Undead (CR 1/2)", Level: 5, Description: "When an undead of CR 1/2 or lower fails its save against Turn Undead, the creature is instantly destroyed.", Mechanics: map[string]string{"destroy_undead": "0.5"}},
		{Name: "Channel Divinity (2/rest)", Level: 6, Description: "You can use Channel Divinity twice between rests.", Mechanics: map[string]string{"channel_divinity": "2"}},
		{Name: "Destroy Undead (CR 1)", Level: 8, Description: "When an undead of CR 1 or lower fails its save against Turn Undead, the creature is instantly destroyed.", Mechanics: map[string]string{"destroy_undead": "1"}},
		{Name: "Divine Intervention", Level: 10, Description: "You can call on your deity to intervene on your behalf when your need is great. Describe the assistance you seek, and roll a d100. If you roll a number equal to or lower than your cleric level, your deity intervenes.", Mechanics: map[string]string{"divine_intervention": "true"}},
		{Name: "Destroy Undead (CR 2)", Level: 11, Description: "Destroy Undead works on CR 2 or lower.", Mechanics: map[string]string{"destroy_undead": "2"}},
		{Name: "Destroy Undead (CR 3)", Level: 14, Description: "Destroy Undead works on CR 3 or lower.", Mechanics: map[string]string{"destroy_undead": "3"}},
		{Name: "Destroy Undead (CR 4)", Level: 17, Description: "Destroy Undead works on CR 4 or lower.", Mechanics: map[string]string{"destroy_undead": "4"}},
		{Name: "Channel Divinity (3/rest)", Level: 18, Description: "You can use Channel Divinity three times between rests.", Mechanics: map[string]string{"channel_divinity": "3"}},
		{Name: "Divine Intervention Improved", Level: 20, Description: "Your call for divine intervention succeeds automatically, no roll required.", Mechanics: map[string]string{"divine_intervention_auto": "true"}},
	},
	"druid": {
		{Name: "Druidic", Level: 1, Description: "You know Druidic, the secret language of druids. You can speak the language and use it to leave hidden messages.", Mechanics: map[string]string{"druidic": "true"}},
		{Name: "Spellcasting", Level: 1, Description: "Drawing on the divine essence of nature itself, you can cast spells to shape that essence to your will. Wisdom is your spellcasting ability.", Mechanics: map[string]string{"spellcasting": "wis"}},
		{Name: "Wild Shape", Level: 2, Description: "You can use your action to magically assume the shape of a beast that you have seen before. You can use this feature twice between rests. Your druid level determines the beasts you can transform into.", Mechanics: map[string]string{"wild_shape": "true"}},
		{Name: "Wild Shape (CR 1/4, no swim)", Level: 2, Description: "You can transform into beasts with CR 1/4 or lower with no flying or swimming speed.", Mechanics: map[string]string{"wild_shape_cr": "0.25"}},
		{Name: "Wild Shape (CR 1/2, no fly)", Level: 4, Description: "You can transform into beasts with CR 1/2 or lower with no flying speed.", Mechanics: map[string]string{"wild_shape_cr": "0.5"}},
		{Name: "Wild Shape (CR 1)", Level: 8, Description: "You can transform into beasts with CR 1 or lower.", Mechanics: map[string]string{"wild_shape_cr": "1"}},
		{Name: "Timeless Body", Level: 18, Description: "The primal magic that you wield causes you to age more slowly. For every 10 years that pass, your body ages only 1 year.", Mechanics: map[string]string{"timeless_body": "true"}},
		{Name: "Beast Spells", Level: 18, Description: "You can cast many of your druid spells in any shape you assume using Wild Shape. You can perform the somatic and verbal components of a druid spell while in a beast shape.", Mechanics: map[string]string{"beast_spells": "true"}},
		{Name: "Archdruid", Level: 20, Description: "You can use your Wild Shape an unlimited number of times. Additionally, you can ignore the verbal and somatic components of your druid spells, as well as any material components that lack a cost and aren't consumed by a spell.", Mechanics: map[string]string{"archdruid": "true"}},
	},
	"fighter": {
		{Name: "Fighting Style", Level: 1, Description: "You adopt a particular style of fighting as your specialty. Choose one fighting style: Archery (+2 ranged), Defense (+1 AC in armor), Dueling (+2 damage one-handed), Great Weapon Fighting (reroll 1-2 on two-handed damage), Protection (impose disadvantage on attacks vs. adjacent allies), or Two-Weapon Fighting (add ability mod to off-hand damage).", Mechanics: map[string]string{"fighting_style": "choice"}},
		{Name: "Second Wind", Level: 1, Description: "You have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain HP equal to 1d10 + your fighter level. Once you use this feature, you must finish a short or long rest before you can use it again.", Mechanics: map[string]string{"second_wind": "true"}},
		{Name: "Action Surge", Level: 2, Description: "You can push yourself beyond your normal limits for a moment. On your turn, you can take one additional action on top of your regular action and a possible bonus action. Once you use this feature, you must finish a short or long rest before you can use it again. Starting at 17th level, you can use it twice before a rest.", Mechanics: map[string]string{"action_surge": "1"}},
		{Name: "Extra Attack", Level: 5, Description: "You can attack twice, instead of once, whenever you take the Attack action on your turn.", Mechanics: map[string]string{"extra_attack": "1"}},
		{Name: "Extra Attack (2)", Level: 11, Description: "You can attack three times whenever you take the Attack action on your turn.", Mechanics: map[string]string{"extra_attack": "2"}},
		{Name: "Indomitable", Level: 9, Description: "You can reroll a saving throw that you fail. If you do so, you must use the new roll. You can use this feature once between long rests, twice starting at 13th level, and three times starting at 17th level.", Mechanics: map[string]string{"indomitable": "1"}},
		{Name: "Indomitable (2 uses)", Level: 13, Description: "You can use Indomitable twice between long rests.", Mechanics: map[string]string{"indomitable": "2"}},
		{Name: "Action Surge (2 uses)", Level: 17, Description: "You can use Action Surge twice before a rest.", Mechanics: map[string]string{"action_surge": "2"}},
		{Name: "Indomitable (3 uses)", Level: 17, Description: "You can use Indomitable three times between long rests.", Mechanics: map[string]string{"indomitable": "3"}},
		{Name: "Extra Attack (3)", Level: 20, Description: "You can attack four times whenever you take the Attack action on your turn.", Mechanics: map[string]string{"extra_attack": "3"}},
	},
	"monk": {
		{Name: "Unarmored Defense", Level: 1, Description: "While you are wearing no armor and not wielding a shield, your AC equals 10 + DEX mod + WIS mod.", Mechanics: map[string]string{"unarmored_defense": "wis"}},
		{Name: "Martial Arts", Level: 1, Description: "Your practice of martial arts gives you mastery of combat styles that use unarmed strikes and monk weapons. You gain benefits: use DEX for unarmed strikes/monk weapons, roll d4 for unarmed damage (scales with level), make one unarmed strike as bonus action after Attack action.", Mechanics: map[string]string{"martial_arts": "d4"}},
		{Name: "Ki", Level: 2, Description: "Your training allows you to harness the mystic energy of ki. You have a number of ki points equal to your monk level. You can spend these points to fuel Flurry of Blows, Patient Defense, and Step of the Wind.", Mechanics: map[string]string{"ki": "true"}},
		{Name: "Unarmored Movement", Level: 2, Description: "Your speed increases by 10 feet while you are not wearing armor or wielding a shield. This bonus increases at higher levels.", Mechanics: map[string]string{"unarmored_movement": "10"}},
		{Name: "Deflect Missiles", Level: 3, Description: "You can use your reaction to deflect or catch the missile when you are hit by a ranged weapon attack. When you do so, the damage you take from the attack is reduced by 1d10 + DEX mod + monk level.", Mechanics: map[string]string{"deflect_missiles": "true"}},
		{Name: "Slow Fall", Level: 4, Description: "You can use your reaction when you fall to reduce any falling damage you take by an amount equal to five times your monk level.", Mechanics: map[string]string{"slow_fall": "true"}},
		{Name: "Extra Attack", Level: 5, Description: "You can attack twice, instead of once, whenever you take the Attack action on your turn.", Mechanics: map[string]string{"extra_attack": "1"}},
		{Name: "Martial Arts (d6)", Level: 5, Description: "Your Martial Arts damage die becomes d6.", Mechanics: map[string]string{"martial_arts": "d6"}},
		{Name: "Stunning Strike", Level: 5, Description: "When you hit another creature with a melee weapon attack, you can spend 1 ki point to attempt a stunning strike. The target must succeed on a CON save or be stunned until the end of your next turn.", Mechanics: map[string]string{"stunning_strike": "true"}},
		{Name: "Ki-Empowered Strikes", Level: 6, Description: "Your unarmed strikes count as magical for the purpose of overcoming resistance and immunity to nonmagical attacks and damage.", Mechanics: map[string]string{"ki_empowered_strikes": "true"}},
		{Name: "Unarmored Movement (+15 ft)", Level: 6, Description: "Your unarmored speed bonus increases to 15 feet.", Mechanics: map[string]string{"unarmored_movement": "15"}},
		{Name: "Evasion", Level: 7, Description: "When you are subjected to an effect that allows you to make a DEX save to take only half damage, you instead take no damage if you succeed on the save, and only half damage if you fail.", Mechanics: map[string]string{"evasion": "true"}},
		{Name: "Stillness of Mind", Level: 7, Description: "You can use your action to end one effect on yourself that is causing you to be charmed or frightened.", Mechanics: map[string]string{"stillness_of_mind": "true"}},
		{Name: "Unarmored Movement (+20 ft)", Level: 10, Description: "Your unarmored speed bonus increases to 20 feet.", Mechanics: map[string]string{"unarmored_movement": "20"}},
		{Name: "Purity of Body", Level: 10, Description: "You are immune to disease and poison.", Mechanics: map[string]string{"purity_of_body": "true"}},
		{Name: "Martial Arts (d8)", Level: 11, Description: "Your Martial Arts damage die becomes d8.", Mechanics: map[string]string{"martial_arts": "d8"}},
		{Name: "Tongue of the Sun and Moon", Level: 13, Description: "You learn to touch the ki of other minds so that you understand all spoken languages. Moreover, any creature that can understand a language can understand what you say.", Mechanics: map[string]string{"tongue_of_sun_moon": "true"}},
		{Name: "Unarmored Movement (+25 ft)", Level: 14, Description: "Your unarmored speed bonus increases to 25 feet.", Mechanics: map[string]string{"unarmored_movement": "25"}},
		{Name: "Diamond Soul", Level: 14, Description: "You gain proficiency in all saving throws. Additionally, whenever you make a saving throw and fail, you can spend 1 ki point to reroll it and take the second result.", Mechanics: map[string]string{"diamond_soul": "true"}},
		{Name: "Timeless Body", Level: 15, Description: "Your ki sustains you so that you suffer none of the frailty of old age, and you can't be aged magically. You can still die of old age, however. You also no longer need food or water.", Mechanics: map[string]string{"timeless_body": "true"}},
		{Name: "Martial Arts (d10)", Level: 17, Description: "Your Martial Arts damage die becomes d10.", Mechanics: map[string]string{"martial_arts": "d10"}},
		{Name: "Unarmored Movement (+30 ft)", Level: 18, Description: "Your unarmored speed bonus increases to 30 feet.", Mechanics: map[string]string{"unarmored_movement": "30"}},
		{Name: "Empty Body", Level: 18, Description: "You can use your action to spend 4 ki points to become invisible for 1 minute. During that time, you also have resistance to all damage but force damage.", Mechanics: map[string]string{"empty_body": "true"}},
		{Name: "Perfect Self", Level: 20, Description: "When you roll for initiative and have no ki points remaining, you regain 4 ki points.", Mechanics: map[string]string{"perfect_self": "true"}},
	},
	"paladin": {
		{Name: "Divine Sense", Level: 1, Description: "You can open your awareness to detect evil and good. As an action, until the end of your next turn, you know the location of any celestial, fiend, or undead within 60 feet that is not behind total cover.", Mechanics: map[string]string{"divine_sense": "true"}},
		{Name: "Lay on Hands", Level: 1, Description: "You have a pool of healing power equal to your paladin level x 5 HP. As an action, you can touch a creature and draw power from the pool to restore HP or cure disease/poison (5 HP per disease/poison).", Mechanics: map[string]string{"lay_on_hands": "true"}},
		{Name: "Fighting Style", Level: 2, Description: "You adopt a particular style of fighting as your specialty (Defense, Dueling, Great Weapon Fighting, or Protection).", Mechanics: map[string]string{"fighting_style": "choice"}},
		{Name: "Spellcasting", Level: 2, Description: "You have learned to draw on divine magic through meditation and prayer to cast spells. Charisma is your spellcasting ability.", Mechanics: map[string]string{"spellcasting": "cha"}},
		{Name: "Divine Smite", Level: 2, Description: "When you hit a creature with a melee weapon attack, you can expend one spell slot to deal radiant damage to the target, in addition to the weapon's damage. The extra damage is 2d8 for a 1st-level slot, plus 1d8 for each spell level higher than 1st, to a maximum of 5d8. The damage increases by 1d8 if the target is an undead or a fiend.", Mechanics: map[string]string{"divine_smite": "true"}},
		{Name: "Divine Health", Level: 3, Description: "The divine magic flowing through you makes you immune to disease.", Mechanics: map[string]string{"divine_health": "true"}},
		{Name: "Sacred Oath", Level: 3, Description: "You swear the oath that binds you as a paladin forever. Choose an oath that grants you features at 3rd level and again at 7th, 15th, and 20th level.", Mechanics: map[string]string{"sacred_oath": "true"}},
		{Name: "Extra Attack", Level: 5, Description: "You can attack twice, instead of once, whenever you take the Attack action on your turn.", Mechanics: map[string]string{"extra_attack": "1"}},
		{Name: "Aura of Protection", Level: 6, Description: "Whenever you or a friendly creature within 10 feet of you must make a saving throw, the creature gains a bonus to the saving throw equal to your CHA modifier (minimum of +1). You must be conscious to grant this bonus.", Mechanics: map[string]string{"aura_of_protection": "10"}},
		{Name: "Aura of Courage", Level: 10, Description: "You and friendly creatures within 10 feet of you can't be frightened while you are conscious.", Mechanics: map[string]string{"aura_of_courage": "10"}},
		{Name: "Improved Divine Smite", Level: 11, Description: "Whenever you hit a creature with a melee weapon, the creature takes an extra 1d8 radiant damage. If you also use your Divine Smite, you add this damage to the extra damage of your Divine Smite.", Mechanics: map[string]string{"improved_divine_smite": "true"}},
		{Name: "Cleansing Touch", Level: 14, Description: "You can use your action to end one spell on yourself or on one willing creature that you touch. You can use this feature a number of times equal to your CHA modifier (minimum once).", Mechanics: map[string]string{"cleansing_touch": "true"}},
		{Name: "Aura of Protection (30 ft)", Level: 18, Description: "The range of your Aura of Protection increases to 30 feet.", Mechanics: map[string]string{"aura_of_protection": "30"}},
		{Name: "Aura of Courage (30 ft)", Level: 18, Description: "The range of your Aura of Courage increases to 30 feet.", Mechanics: map[string]string{"aura_of_courage": "30"}},
	},
	"ranger": {
		{Name: "Favored Enemy", Level: 1, Description: "You have significant experience studying, tracking, hunting, and even talking to a certain type of enemy. Choose a type of favored enemy. You have advantage on WIS (Survival) checks to track them and INT checks to recall information about them. You also learn one language of your choice spoken by them.", Mechanics: map[string]string{"favored_enemy": "1"}},
		{Name: "Natural Explorer", Level: 1, Description: "You are particularly familiar with one type of natural environment and are adept at traveling and surviving in such regions. Choose one type of favored terrain.", Mechanics: map[string]string{"natural_explorer": "1"}},
		{Name: "Fighting Style", Level: 2, Description: "You adopt a particular style of fighting as your specialty (Archery, Defense, Dueling, or Two-Weapon Fighting).", Mechanics: map[string]string{"fighting_style": "choice"}},
		{Name: "Spellcasting", Level: 2, Description: "You have learned to use the magical essence of nature to cast spells. Wisdom is your spellcasting ability.", Mechanics: map[string]string{"spellcasting": "wis"}},
		{Name: "Primeval Awareness", Level: 3, Description: "You can use your action and expend one ranger spell slot to focus your awareness on the region around you. For 1 minute per level of the spell slot you expend, you can sense whether aberrations, celestials, dragons, elementals, fey, fiends, and undead are present within 1 mile (or 6 miles in favored terrain).", Mechanics: map[string]string{"primeval_awareness": "true"}},
		{Name: "Extra Attack", Level: 5, Description: "You can attack twice, instead of once, whenever you take the Attack action on your turn.", Mechanics: map[string]string{"extra_attack": "1"}},
		{Name: "Favored Enemy (Additional)", Level: 6, Description: "Choose an additional favored enemy, as well as another language.", Mechanics: map[string]string{"favored_enemy": "2"}},
		{Name: "Natural Explorer (Additional)", Level: 6, Description: "Choose an additional favored terrain.", Mechanics: map[string]string{"natural_explorer": "2"}},
		{Name: "Land's Stride", Level: 8, Description: "Moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them.", Mechanics: map[string]string{"lands_stride": "true"}},
		{Name: "Hide in Plain Sight", Level: 10, Description: "You can spend 1 minute creating camouflage for yourself. You must have access to fresh mud, dirt, plants, soot, and other naturally occurring materials. Once you are camouflaged, you can try to hide by pressing yourself up against a solid surface that is at least as tall and wide as you are.", Mechanics: map[string]string{"hide_in_plain_sight": "true"}},
		{Name: "Natural Explorer (Additional)", Level: 10, Description: "Choose an additional favored terrain.", Mechanics: map[string]string{"natural_explorer": "3"}},
		{Name: "Vanish", Level: 14, Description: "You can use the Hide action as a bonus action on your turn. Also, you can't be tracked by nonmagical means, unless you choose to leave a trail.", Mechanics: map[string]string{"vanish": "true"}},
		{Name: "Favored Enemy (Additional)", Level: 14, Description: "Choose an additional favored enemy, as well as another language.", Mechanics: map[string]string{"favored_enemy": "3"}},
		{Name: "Feral Senses", Level: 18, Description: "You gain preternatural senses that help you fight creatures you can't see. When you attack a creature you can't see, your inability to see it doesn't impose disadvantage on your attack rolls against it. You are also aware of the location of any invisible creature within 30 feet of you.", Mechanics: map[string]string{"feral_senses": "true"}},
		{Name: "Foe Slayer", Level: 20, Description: "You become an unparalleled hunter of your enemies. Once on each of your turns, you can add your WIS modifier to the attack roll or the damage roll of an attack you make against one of your favored enemies.", Mechanics: map[string]string{"foe_slayer": "true"}},
	},
	"rogue": {
		{Name: "Expertise", Level: 1, Description: "Choose two of your skill proficiencies, or one of your skill proficiencies and your proficiency with thieves' tools. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies.", Mechanics: map[string]string{"expertise": "2"}},
		{Name: "Sneak Attack", Level: 1, Description: "You know how to strike subtly and exploit a foe's distraction. Once per turn, you can deal an extra 1d6 damage to one creature you hit with an attack if you have advantage on the attack roll. The attack must use a finesse or a ranged weapon. You don't need advantage if another enemy of the target is within 5 feet of it and that enemy isn't incapacitated.", Mechanics: map[string]string{"sneak_attack": "1d6"}},
		{Name: "Thieves' Cant", Level: 1, Description: "You have learned thieves' cant, a secret mix of dialect, jargon, and code that allows you to hide messages in seemingly normal conversation.", Mechanics: map[string]string{"thieves_cant": "true"}},
		{Name: "Cunning Action", Level: 2, Description: "Your quick thinking and agility allow you to move and act quickly. You can take a bonus action on each of your turns in combat to take the Dash, Disengage, or Hide action.", Mechanics: map[string]string{"cunning_action": "true"}},
		{Name: "Sneak Attack (2d6)", Level: 3, Description: "Your Sneak Attack damage increases to 2d6.", Mechanics: map[string]string{"sneak_attack": "2d6"}},
		{Name: "Uncanny Dodge", Level: 5, Description: "When an attacker that you can see hits you with an attack, you can use your reaction to halve the attack's damage against you.", Mechanics: map[string]string{"uncanny_dodge": "true"}},
		{Name: "Sneak Attack (3d6)", Level: 5, Description: "Your Sneak Attack damage increases to 3d6.", Mechanics: map[string]string{"sneak_attack": "3d6"}},
		{Name: "Expertise (Additional)", Level: 6, Description: "Choose two more of your skill proficiencies to gain expertise.", Mechanics: map[string]string{"expertise": "4"}},
		{Name: "Evasion", Level: 7, Description: "When you are subjected to an effect that allows you to make a DEX save to take only half damage, you instead take no damage if you succeed on the save, and only half damage if you fail.", Mechanics: map[string]string{"evasion": "true"}},
		{Name: "Sneak Attack (4d6)", Level: 7, Description: "Your Sneak Attack damage increases to 4d6.", Mechanics: map[string]string{"sneak_attack": "4d6"}},
		{Name: "Sneak Attack (5d6)", Level: 9, Description: "Your Sneak Attack damage increases to 5d6.", Mechanics: map[string]string{"sneak_attack": "5d6"}},
		{Name: "Reliable Talent", Level: 11, Description: "Whenever you make an ability check that lets you add your proficiency bonus, you can treat a d20 roll of 9 or lower as a 10.", Mechanics: map[string]string{"reliable_talent": "true"}},
		{Name: "Sneak Attack (6d6)", Level: 11, Description: "Your Sneak Attack damage increases to 6d6.", Mechanics: map[string]string{"sneak_attack": "6d6"}},
		{Name: "Sneak Attack (7d6)", Level: 13, Description: "Your Sneak Attack damage increases to 7d6.", Mechanics: map[string]string{"sneak_attack": "7d6"}},
		{Name: "Blindsense", Level: 14, Description: "If you are able to hear, you are aware of the location of any hidden or invisible creature within 10 feet of you.", Mechanics: map[string]string{"blindsense": "true"}},
		{Name: "Slippery Mind", Level: 15, Description: "You have acquired greater mental strength. You gain proficiency in WIS saving throws.", Mechanics: map[string]string{"slippery_mind": "true"}},
		{Name: "Sneak Attack (8d6)", Level: 15, Description: "Your Sneak Attack damage increases to 8d6.", Mechanics: map[string]string{"sneak_attack": "8d6"}},
		{Name: "Sneak Attack (9d6)", Level: 17, Description: "Your Sneak Attack damage increases to 9d6.", Mechanics: map[string]string{"sneak_attack": "9d6"}},
		{Name: "Elusive", Level: 18, Description: "You are so evasive that attackers rarely gain the upper hand against you. No attack roll has advantage against you while you aren't incapacitated.", Mechanics: map[string]string{"elusive": "true"}},
		{Name: "Sneak Attack (10d6)", Level: 19, Description: "Your Sneak Attack damage increases to 10d6.", Mechanics: map[string]string{"sneak_attack": "10d6"}},
		{Name: "Stroke of Luck", Level: 20, Description: "If your attack misses a target within range, you can turn the miss into a hit. Alternatively, if you fail an ability check, you can treat the d20 roll as a 20. Once you use this feature, you can't use it again until you finish a short or long rest.", Mechanics: map[string]string{"stroke_of_luck": "true"}},
	},
	"sorcerer": {
		{Name: "Spellcasting", Level: 1, Description: "An event in your past, or in the life of a parent or ancestor, left an indelible mark on you, infusing you with arcane magic. Charisma is your spellcasting ability.", Mechanics: map[string]string{"spellcasting": "cha"}},
		{Name: "Sorcerous Origin", Level: 1, Description: "Choose a sorcerous origin, which describes the source of your innate magical power. Your choice grants you features at 1st level and additional features at 6th, 14th, and 18th level.", Mechanics: map[string]string{"sorcerous_origin": "true"}},
		{Name: "Font of Magic", Level: 2, Description: "You tap into a deep wellspring of magic within yourself. You have a number of sorcery points equal to your sorcerer level. You can use sorcery points to gain additional spell slots or sacrifice spell slots to gain additional sorcery points.", Mechanics: map[string]string{"font_of_magic": "true"}},
		{Name: "Metamagic", Level: 3, Description: "You gain the ability to twist your spells to suit your needs. You gain two Metamagic options of your choice. You can use only one Metamagic option on a spell when you cast it.", Mechanics: map[string]string{"metamagic": "2"}},
		{Name: "Metamagic (Additional)", Level: 10, Description: "You learn an additional Metamagic option.", Mechanics: map[string]string{"metamagic": "3"}},
		{Name: "Metamagic (Additional)", Level: 17, Description: "You learn an additional Metamagic option.", Mechanics: map[string]string{"metamagic": "4"}},
		{Name: "Sorcerous Restoration", Level: 20, Description: "You regain 4 expended sorcery points whenever you finish a short rest.", Mechanics: map[string]string{"sorcerous_restoration": "true"}},
	},
	"warlock": {
		{Name: "Otherworldly Patron", Level: 1, Description: "You have struck a bargain with an otherworldly being of your choice. Your choice grants you features at 1st level and additional features at 6th, 10th, and 14th level.", Mechanics: map[string]string{"otherworldly_patron": "true"}},
		{Name: "Pact Magic", Level: 1, Description: "Your arcane research and the magic bestowed on you by your patron have given you facility with spells. Charisma is your spellcasting ability. You have a limited number of spell slots that all recover on a short rest.", Mechanics: map[string]string{"pact_magic": "cha"}},
		{Name: "Eldritch Invocations", Level: 2, Description: "In your study of occult lore, you have unearthed eldritch invocations, fragments of forbidden knowledge that imbue you with an abiding magical ability. You gain two eldritch invocations of your choice.", Mechanics: map[string]string{"eldritch_invocations": "2"}},
		{Name: "Pact Boon", Level: 3, Description: "Your otherworldly patron bestows a gift upon you for your loyal service. You gain one of the following features of your choice: Pact of the Chain, Pact of the Blade, or Pact of the Tome.", Mechanics: map[string]string{"pact_boon": "choice"}},
		{Name: "Eldritch Invocations (3)", Level: 5, Description: "You learn an additional eldritch invocation.", Mechanics: map[string]string{"eldritch_invocations": "3"}},
		{Name: "Eldritch Invocations (4)", Level: 7, Description: "You learn an additional eldritch invocation.", Mechanics: map[string]string{"eldritch_invocations": "4"}},
		{Name: "Eldritch Invocations (5)", Level: 9, Description: "You learn an additional eldritch invocation.", Mechanics: map[string]string{"eldritch_invocations": "5"}},
		{Name: "Mystic Arcanum (6th)", Level: 11, Description: "Your patron bestows upon you a magical secret called an arcanum. Choose one 6th-level spell from the warlock spell list as this arcanum. You can cast it once without expending a spell slot.", Mechanics: map[string]string{"mystic_arcanum_6": "true"}},
		{Name: "Eldritch Invocations (6)", Level: 12, Description: "You learn an additional eldritch invocation.", Mechanics: map[string]string{"eldritch_invocations": "6"}},
		{Name: "Mystic Arcanum (7th)", Level: 13, Description: "Choose one 7th-level spell from the warlock spell list as this arcanum.", Mechanics: map[string]string{"mystic_arcanum_7": "true"}},
		{Name: "Eldritch Invocations (7)", Level: 15, Description: "You learn an additional eldritch invocation.", Mechanics: map[string]string{"eldritch_invocations": "7"}},
		{Name: "Mystic Arcanum (8th)", Level: 15, Description: "Choose one 8th-level spell from the warlock spell list as this arcanum.", Mechanics: map[string]string{"mystic_arcanum_8": "true"}},
		{Name: "Mystic Arcanum (9th)", Level: 17, Description: "Choose one 9th-level spell from the warlock spell list as this arcanum.", Mechanics: map[string]string{"mystic_arcanum_9": "true"}},
		{Name: "Eldritch Invocations (8)", Level: 18, Description: "You learn an additional eldritch invocation.", Mechanics: map[string]string{"eldritch_invocations": "8"}},
		{Name: "Eldritch Master", Level: 20, Description: "You can draw on your inner reserve of mystical power while entreating your patron to regain expended spell slots. You can spend 1 minute entreating your patron for aid to regain all your expended spell slots from your Pact Magic feature. Once you regain spell slots with this feature, you must finish a long rest before you can do so again.", Mechanics: map[string]string{"eldritch_master": "true"}},
	},
	"wizard": {
		{Name: "Spellcasting", Level: 1, Description: "As a student of arcane magic, you have a spellbook containing spells that show the first glimmerings of your true power. Intelligence is your spellcasting ability.", Mechanics: map[string]string{"spellcasting": "int"}},
		{Name: "Arcane Recovery", Level: 1, Description: "You have learned to regain some of your magical energy by studying your spellbook. Once per day when you finish a short rest, you can choose expended spell slots to recover. The spell slots can have a combined level equal to or less than half your wizard level (rounded up), and none of the slots can be 6th level or higher.", Mechanics: map[string]string{"arcane_recovery": "true"}},
		{Name: "Arcane Tradition", Level: 2, Description: "You choose an arcane tradition, shaping your practice of magic through one of eight schools. Your choice grants you features at 2nd level and again at 6th, 10th, and 14th level.", Mechanics: map[string]string{"arcane_tradition": "true"}},
		{Name: "Spell Mastery", Level: 18, Description: "You have achieved such mastery over certain spells that you can cast them at will. Choose a 1st-level wizard spell and a 2nd-level wizard spell from your spellbook. You can cast those spells at their lowest level without expending a spell slot when you have them prepared.", Mechanics: map[string]string{"spell_mastery": "true"}},
		{Name: "Signature Spells", Level: 20, Description: "You gain mastery over two powerful spells and can cast them with little effort. Choose two 3rd-level wizard spells in your spellbook as your signature spells. You always have these spells prepared, they don't count against your number of prepared spells, and you can cast each of them once at 3rd level without expending a spell slot.", Mechanics: map[string]string{"signature_spells": "true"}},
	},
}

// MartialArtsDie returns the martial arts damage die size for a monk at a given level
func MartialArtsDie(level int) int {
	if level >= 17 {
		return 10 // d10
	} else if level >= 11 {
		return 8 // d8
	} else if level >= 5 {
		return 6 // d6
	}
	return 4 // d4
}

// SneakAttackDice returns the number of Sneak Attack dice for a rogue at a given level
func SneakAttackDice(level int) int {
	// 1d6 at 1, increases by 1d6 every odd level
	return (level + 1) / 2
}

// BardicInspirationDie returns the Bardic Inspiration die size for a bard at a given level
func BardicInspirationDie(level int) int {
	if level >= 15 {
		return 12 // d12
	} else if level >= 10 {
		return 10 // d10
	} else if level >= 5 {
		return 8 // d8
	}
	return 6 // d6
}

// BrutalCriticalDice returns the number of extra damage dice for Barbarian's Brutal Critical
func BrutalCriticalDice(level int) int {
	if level >= 17 {
		return 3
	} else if level >= 13 {
		return 2
	} else if level >= 9 {
		return 1
	}
	return 0
}

// RageDamageBonus returns the bonus damage while raging for a barbarian at a given level
func RageDamageBonus(level int) int {
	if level >= 16 {
		return 4
	} else if level >= 9 {
		return 3
	}
	return 2
}

// UnarmoredMovementBonus returns the speed bonus for an unarmored monk at a given level
func UnarmoredMovementBonus(level int) int {
	if level >= 18 {
		return 30
	} else if level >= 14 {
		return 25
	} else if level >= 10 {
		return 20
	} else if level >= 6 {
		return 15
	} else if level >= 2 {
		return 10
	}
	return 0
}
