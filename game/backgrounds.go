// Package game provides core D&D 5e game mechanics.
// backgrounds.go handles 5e character backgrounds (PHB).
package game

// Background represents a character background with its mechanical benefits (PHB)
type Background struct {
	Name               string   `json:"name"`
	SkillProficiencies []string `json:"skill_proficiencies"` // 2 skills
	ToolProficiencies  []string `json:"tool_proficiencies"`  // 0-2 tools
	Languages          int      `json:"languages"`           // Number of bonus languages
	Equipment          []string `json:"equipment"`           // Starting equipment
	Feature            string   `json:"feature"`             // Feature name
	FeatureDesc        string   `json:"feature_description"` // Feature description
	Gold               int      `json:"gold"`                // Starting gold
}

// backgrounds contains all PHB backgrounds with their mechanical benefits
var backgrounds = map[string]Background{
	"acolyte": {
		Name:               "Acolyte",
		SkillProficiencies: []string{"insight", "religion"},
		ToolProficiencies:  []string{},
		Languages:          2,
		Equipment:          []string{"holy symbol", "prayer book", "5 sticks of incense", "vestments", "common clothes"},
		Feature:            "Shelter of the Faithful",
		FeatureDesc:        "As an acolyte, you command the respect of those who share your faith. You and your companions can expect free healing and care at temples of your faith, and you can call upon priests for assistance.",
		Gold:               15,
	},
	"charlatan": {
		Name:               "Charlatan",
		SkillProficiencies: []string{"deception", "sleight of hand"},
		ToolProficiencies:  []string{"disguise kit", "forgery kit"},
		Languages:          0,
		Equipment:          []string{"fine clothes", "disguise kit", "con tools"},
		Feature:            "False Identity",
		FeatureDesc:        "You have created a second identity including documentation, established acquaintances, and disguises that allow you to assume that persona.",
		Gold:               15,
	},
	"criminal": {
		Name:               "Criminal",
		SkillProficiencies: []string{"deception", "stealth"},
		ToolProficiencies:  []string{"thieves' tools", "gaming set"},
		Languages:          0,
		Equipment:          []string{"crowbar", "dark common clothes with hood"},
		Feature:            "Criminal Contact",
		FeatureDesc:        "You have a reliable and trustworthy contact who acts as your liaison to a criminal network.",
		Gold:               15,
	},
	"entertainer": {
		Name:               "Entertainer",
		SkillProficiencies: []string{"acrobatics", "performance"},
		ToolProficiencies:  []string{"disguise kit", "musical instrument"},
		Languages:          0,
		Equipment:          []string{"musical instrument", "favor from admirer", "costume"},
		Feature:            "By Popular Demand",
		FeatureDesc:        "You can always find a place to perform. You receive free lodging and food of a modest or comfortable standard, as long as you perform each night.",
		Gold:               15,
	},
	"folk_hero": {
		Name:               "Folk Hero",
		SkillProficiencies: []string{"animal handling", "survival"},
		ToolProficiencies:  []string{"artisan's tools", "land vehicles"},
		Languages:          0,
		Equipment:          []string{"artisan's tools", "shovel", "iron pot", "common clothes"},
		Feature:            "Rustic Hospitality",
		FeatureDesc:        "Common folk will provide you with food and lodging and shield you from the law or anyone searching for you, as long as you do not pose a danger.",
		Gold:               10,
	},
	"guild_artisan": {
		Name:               "Guild Artisan",
		SkillProficiencies: []string{"insight", "persuasion"},
		ToolProficiencies:  []string{"artisan's tools"},
		Languages:          1,
		Equipment:          []string{"artisan's tools", "letter of introduction from guild", "traveler's clothes"},
		Feature:            "Guild Membership",
		FeatureDesc:        "Your guild offers lodging and food if necessary. You can call upon guild members for assistance. The guild will pay for your funeral and support your dependents.",
		Gold:               15,
	},
	"hermit": {
		Name:               "Hermit",
		SkillProficiencies: []string{"medicine", "religion"},
		ToolProficiencies:  []string{"herbalism kit"},
		Languages:          1,
		Equipment:          []string{"scroll case with notes", "winter blanket", "common clothes", "herbalism kit"},
		Feature:            "Discovery",
		FeatureDesc:        "In your hermitage, you discovered a unique and powerful truth—a rare herb, a secret about the gods, or some other significant discovery.",
		Gold:               5,
	},
	"noble": {
		Name:               "Noble",
		SkillProficiencies: []string{"history", "persuasion"},
		ToolProficiencies:  []string{"gaming set"},
		Languages:          1,
		Equipment:          []string{"fine clothes", "signet ring", "scroll of pedigree"},
		Feature:            "Position of Privilege",
		FeatureDesc:        "People assume you have the right to be wherever you are. Commoners make every effort to accommodate you and avoid your displeasure.",
		Gold:               25,
	},
	"outlander": {
		Name:               "Outlander",
		SkillProficiencies: []string{"athletics", "survival"},
		ToolProficiencies:  []string{"musical instrument"},
		Languages:          1,
		Equipment:          []string{"staff", "hunting trap", "trophy from animal", "traveler's clothes"},
		Feature:            "Wanderer",
		FeatureDesc:        "You have an excellent memory for maps and geography. You can always recall the general layout of terrain, settlements, and other features. You can find food and fresh water for yourself and up to five others each day.",
		Gold:               10,
	},
	"sage": {
		Name:               "Sage",
		SkillProficiencies: []string{"arcana", "history"},
		ToolProficiencies:  []string{},
		Languages:          2,
		Equipment:          []string{"bottle of black ink", "quill", "small knife", "letter with unanswered question", "common clothes"},
		Feature:            "Researcher",
		FeatureDesc:        "When you attempt to learn or recall a piece of lore, if you do not know it, you often know where and from whom you can obtain it.",
		Gold:               10,
	},
	"sailor": {
		Name:               "Sailor",
		SkillProficiencies: []string{"athletics", "perception"},
		ToolProficiencies:  []string{"navigator's tools", "water vehicles"},
		Languages:          0,
		Equipment:          []string{"belaying pin (club)", "50 feet of silk rope", "lucky charm", "common clothes"},
		Feature:            "Ship's Passage",
		FeatureDesc:        "When you need to, you can secure free passage on a sailing ship for yourself and your adventuring companions.",
		Gold:               10,
	},
	"soldier": {
		Name:               "Soldier",
		SkillProficiencies: []string{"athletics", "intimidation"},
		ToolProficiencies:  []string{"gaming set", "land vehicles"},
		Languages:          0,
		Equipment:          []string{"insignia of rank", "trophy from fallen enemy", "bone dice or deck of cards", "common clothes"},
		Feature:            "Military Rank",
		FeatureDesc:        "Soldiers loyal to your former military organization still recognize your authority and influence. You can invoke your rank to exert influence over other soldiers.",
		Gold:               10,
	},
	"urchin": {
		Name:               "Urchin",
		SkillProficiencies: []string{"sleight of hand", "stealth"},
		ToolProficiencies:  []string{"disguise kit", "thieves' tools"},
		Languages:          0,
		Equipment:          []string{"small knife", "map of home city", "pet mouse", "token from parents", "common clothes"},
		Feature:            "City Secrets",
		FeatureDesc:        "You know the secret patterns and flow to cities. You can find twice as fast the route to any place in the city, and you can lead others through the city with ease.",
		Gold:               10,
	},
}

// GetBackground returns background info by slug, or nil if not found.
func GetBackground(slug string) *Background {
	bg, ok := backgrounds[slug]
	if !ok {
		return nil
	}
	return &bg
}

// GetAllBackgrounds returns all available backgrounds.
func GetAllBackgrounds() map[string]Background {
	return backgrounds
}

// GetAllBackgroundSlugs returns a sorted slice of all background slugs.
func GetAllBackgroundSlugs() []string {
	slugs := make([]string, 0, len(backgrounds))
	for slug := range backgrounds {
		slugs = append(slugs, slug)
	}
	// Sort for consistent ordering
	for i := 0; i < len(slugs)-1; i++ {
		for j := i + 1; j < len(slugs); j++ {
			if slugs[i] > slugs[j] {
				slugs[i], slugs[j] = slugs[j], slugs[i]
			}
		}
	}
	return slugs
}

// IsValidBackground checks if a background slug is valid.
func IsValidBackground(slug string) bool {
	_, ok := backgrounds[slug]
	return ok
}

// BackgroundCount returns the number of available backgrounds.
func BackgroundCount() int {
	return len(backgrounds)
}
