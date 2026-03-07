// Package game provides core D&D 5e game mechanics.
// feats.go - feat definitions and mechanics (v0.9.73)
package game

import "fmt"

// Feat represents a character feat from the SRD/PHB
type Feat struct {
	Name         string            `json:"name"`
	Description  string            `json:"description"`
	Prerequisite string            `json:"prerequisite,omitempty"` // e.g., "str:13" or "spellcaster" or ""
	Benefits     []string          `json:"benefits"`
	AbilityBonus map[string]int    `json:"ability_bonus,omitempty"` // e.g., {"str": 1}
	Features     map[string]string `json:"features,omitempty"`      // Special features to track
}

// AvailableFeats contains all available feats - SRD only has Grappler, but we include common ones for gameplay
var AvailableFeats = map[string]Feat{
	"grappler": {
		Name:         "Grappler",
		Description:  "You've developed the skills necessary to hold your own in close-quarters grappling.",
		Prerequisite: "str:13",
		Benefits: []string{
			"You have advantage on attack rolls against a creature you are grappling",
			"You can use your action to try to pin a creature grappled by you. Make another grapple check. If you succeed, you and the creature are both restrained until the grapple ends",
		},
		Features: map[string]string{
			"grapple_advantage": "true",
			"can_pin":           "true",
		},
	},
	"alert": {
		Name:        "Alert",
		Description: "Always on the lookout for danger, you gain the following benefits.",
		Benefits: []string{
			"You gain a +5 bonus to initiative",
			"You can't be surprised while you are conscious",
			"Other creatures don't gain advantage on attack rolls against you as a result of being unseen by you",
		},
		Features: map[string]string{
			"initiative_bonus":   "5",
			"immune_to_surprise": "true",
		},
	},
	"lucky": {
		Name:        "Lucky",
		Description: "You have inexplicable luck that seems to kick in at just the right moment.",
		Benefits: []string{
			"You have 3 luck points. Whenever you make an attack roll, ability check, or saving throw, you can spend one luck point to roll an additional d20",
			"You can also spend one luck point when an attack roll is made against you to roll a d20 and choose whether to use your roll or the attacker's",
			"You regain all luck points after a long rest",
		},
		Features: map[string]string{
			"luck_points":     "3",
			"luck_points_max": "3",
		},
	},
	"tough": {
		Name:        "Tough",
		Description: "Your hit point maximum increases.",
		Benefits: []string{
			"Your hit point maximum increases by an amount equal to twice your level when you gain this feat",
			"Whenever you gain a level thereafter, your hit point maximum increases by an additional 2 hit points",
		},
		Features: map[string]string{
			"hp_bonus_per_level": "2",
		},
	},
	"sentinel": {
		Name:        "Sentinel",
		Description: "You have mastered techniques to take advantage of every drop in any enemy's guard.",
		Benefits: []string{
			"When you hit a creature with an opportunity attack, the creature's speed becomes 0 for the rest of the turn",
			"Creatures provoke opportunity attacks from you even if they take the Disengage action",
			"When a creature within 5 feet of you makes an attack against a target other than you, you can use your reaction to make a melee weapon attack against the attacking creature",
		},
		Features: map[string]string{
			"opportunity_stops_movement": "true",
			"ignore_disengage":           "true",
			"protect_allies_reaction":    "true",
		},
	},
	"war_caster": {
		Name:         "War Caster",
		Description:  "You have practiced casting spells in the midst of combat.",
		Prerequisite: "spellcaster",
		Benefits: []string{
			"You have advantage on Constitution saving throws that you make to maintain concentration on a spell when you take damage",
			"You can perform the somatic components of spells even when you have weapons or a shield in one or both hands",
			"When a hostile creature's movement provokes an opportunity attack from you, you can use your reaction to cast a spell at the creature rather than making an opportunity attack",
		},
		Features: map[string]string{
			"concentration_advantage": "true",
			"somatic_with_hands_full": "true",
			"spell_opportunity":       "true",
		},
	},
	"mobile": {
		Name:        "Mobile",
		Description: "You are exceptionally speedy and agile.",
		Benefits: []string{
			"Your speed increases by 10 feet",
			"When you use the Dash action, difficult terrain doesn't cost you extra movement",
			"When you make a melee attack against a creature, you don't provoke opportunity attacks from that creature for the rest of the turn, whether you hit or not",
		},
		Features: map[string]string{
			"speed_bonus":           "10",
			"ignore_difficult_dash": "true",
			"no_opportunity_melee":  "true",
		},
	},
	"observant": {
		Name:        "Observant",
		Description: "Quick to notice details of your environment, you gain the following benefits.",
		AbilityBonus: map[string]int{
			"int_or_wis": 1, // Player chooses INT or WIS
		},
		Benefits: []string{
			"Increase your Intelligence or Wisdom by 1, to a maximum of 20",
			"If you can see a creature's mouth while it is speaking a language you understand, you can interpret what it's saying by reading its lips",
			"You have a +5 bonus to your passive Wisdom (Perception) and passive Intelligence (Investigation) scores",
		},
		Features: map[string]string{
			"passive_bonus": "5",
			"read_lips":     "true",
		},
	},
	"resilient": {
		Name:        "Resilient",
		Description: "Choose one ability score. You gain proficiency in saving throws using that ability.",
		AbilityBonus: map[string]int{
			"chosen": 1, // Player chooses which ability
		},
		Benefits: []string{
			"Increase the chosen ability score by 1, to a maximum of 20",
			"You gain proficiency in saving throws using the chosen ability",
		},
		Features: map[string]string{
			"save_proficiency": "chosen", // Stored as actual ability when taken
		},
	},
	"savage_attacker": {
		Name:        "Savage Attacker",
		Description: "Once per turn when you roll damage for a melee weapon attack, you can reroll the weapon's damage dice and use either total.",
		Benefits: []string{
			"Once per turn when you roll damage for a melee weapon attack, you can reroll the weapon's damage dice and use either total",
		},
		Features: map[string]string{
			"reroll_melee_damage": "true",
		},
	},
}

// GetFeat returns a feat by slug, or nil if not found
func GetFeat(slug string) *Feat {
	if feat, ok := AvailableFeats[slug]; ok {
		return &feat
	}
	return nil
}

// HasFeatFeature checks if any of the character's feats grants a specific feature
// v0.9.13: Used for War Caster somatic component bypass, etc.
func HasFeatFeature(feats []string, feature string) bool {
	for _, slug := range feats {
		if feat, ok := AvailableFeats[slug]; ok {
			if _, hasFeature := feat.Features[feature]; hasFeature {
				return true
			}
		}
	}
	return false
}

// HasFeat checks if a specific feat slug is in the character's feat list
func HasFeat(feats []string, slug string) bool {
	for _, f := range feats {
		if f == slug {
			return true
		}
	}
	return false
}

// GetFeatFeatureValue returns the value of a specific feature from a feat
// Returns empty string if feat or feature not found
func GetFeatFeatureValue(slug, feature string) string {
	if feat, ok := AvailableFeats[slug]; ok {
		if value, hasFeature := feat.Features[feature]; hasFeature {
			return value
		}
	}
	return ""
}

// AllFeats returns a list of all feat slugs
func AllFeats() []string {
	slugs := make([]string, 0, len(AvailableFeats))
	for slug := range AvailableFeats {
		slugs = append(slugs, slug)
	}
	return slugs
}

// FeatMeetsPrerequisite checks if a character meets the prerequisite for a feat
// Prerequisites can be:
// - Empty string: no prerequisite
// - "str:13", "dex:13", etc.: minimum ability score
// - "spellcaster": must be a spellcasting class
func FeatMeetsPrerequisite(prereq string, abilityScores map[string]int, isSpellcaster bool) bool {
	if prereq == "" {
		return true
	}

	if prereq == "spellcaster" {
		return isSpellcaster
	}

	// Parse ability:score format (e.g., "str:13")
	if len(prereq) > 4 && prereq[3] == ':' {
		ability := prereq[:3]
		var required int
		_, err := fmt.Sscanf(prereq[4:], "%d", &required)
		if err != nil {
			return false
		}
		if score, ok := abilityScores[ability]; ok {
			return score >= required
		}
	}

	return false
}

// GetInitiativeBonus returns the initiative bonus from feats (e.g., Alert)
func GetInitiativeBonus(feats []string) int {
	bonus := 0
	for _, slug := range feats {
		if feat, ok := AvailableFeats[slug]; ok {
			if val, hasFeature := feat.Features["initiative_bonus"]; hasFeature {
				var b int
				fmt.Sscanf(val, "%d", &b)
				bonus += b
			}
		}
	}
	return bonus
}

// GetSpeedBonus returns the speed bonus from feats (e.g., Mobile)
func GetSpeedBonus(feats []string) int {
	bonus := 0
	for _, slug := range feats {
		if feat, ok := AvailableFeats[slug]; ok {
			if val, hasFeature := feat.Features["speed_bonus"]; hasFeature {
				var b int
				fmt.Sscanf(val, "%d", &b)
				bonus += b
			}
		}
	}
	return bonus
}

// GetPassiveBonus returns the passive perception/investigation bonus from feats (e.g., Observant)
func GetPassiveBonus(feats []string) int {
	bonus := 0
	for _, slug := range feats {
		if feat, ok := AvailableFeats[slug]; ok {
			if val, hasFeature := feat.Features["passive_bonus"]; hasFeature {
				var b int
				fmt.Sscanf(val, "%d", &b)
				bonus += b
			}
		}
	}
	return bonus
}

// GetHPBonusPerLevel returns the HP bonus per level from feats (e.g., Tough)
func GetHPBonusPerLevel(feats []string) int {
	bonus := 0
	for _, slug := range feats {
		if feat, ok := AvailableFeats[slug]; ok {
			if val, hasFeature := feat.Features["hp_bonus_per_level"]; hasFeature {
				var b int
				fmt.Sscanf(val, "%d", &b)
				bonus += b
			}
		}
	}
	return bonus
}

// HasAlertFeat returns true if character has the Alert feat (for hidden attacker immunity)
func HasAlertFeat(feats []string) bool {
	return HasFeat(feats, "alert")
}

// HasWarCasterFeat returns true if character has War Caster (concentration advantage, somatic with hands full)
func HasWarCasterFeat(feats []string) bool {
	return HasFeat(feats, "war_caster")
}

// HasSentinelFeat returns true if character has Sentinel (opportunity attack stops movement, etc.)
func HasSentinelFeat(feats []string) bool {
	return HasFeat(feats, "sentinel")
}

// HasMobileFeat returns true if character has Mobile (no opportunity attacks from melee targets)
func HasMobileFeat(feats []string) bool {
	return HasFeat(feats, "mobile")
}

// HasGrapplerFeat returns true if character has Grappler (advantage on grappled targets)
func HasGrapplerFeat(feats []string) bool {
	return HasFeat(feats, "grappler")
}

// HasSavageAttackerFeat returns true if character has Savage Attacker (reroll melee damage)
func HasSavageAttackerFeat(feats []string) bool {
	return HasFeat(feats, "savage_attacker")
}
