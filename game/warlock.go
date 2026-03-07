// Package game provides core D&D 5e game mechanics.
//
// warlock.go - Eldritch Invocations and Pact Boons per PHB pp107-111
package game

// InvocationPrerequisites represents the requirements for an Eldritch Invocation
type InvocationPrerequisites struct {
	Level          int    `json:"level,omitempty"`           // Minimum warlock level
	Pact           string `json:"pact,omitempty"`            // Required pact boon (blade, chain, tome)
	RequiresSpell  string `json:"requires_spell,omitempty"`  // Must know a specific spell
	RequiresPatron string `json:"requires_patron,omitempty"` // Must have specific patron
}

// EldritchInvocation represents a Warlock Eldritch Invocation (PHB pp110-111)
type EldritchInvocation struct {
	Slug          string                  `json:"slug"`
	Name          string                  `json:"name"`
	Description   string                  `json:"description"`
	Prerequisites InvocationPrerequisites `json:"prerequisites,omitempty"`
	Mechanics     map[string]string       `json:"mechanics,omitempty"` // Mechanical effects
}

// AvailableInvocations contains all SRD Eldritch Invocations (PHB pp110-111)
var AvailableInvocations = map[string]EldritchInvocation{
	"agonizing-blast": {
		Slug:          "agonizing-blast",
		Name:          "Agonizing Blast",
		Description:   "When you cast eldritch blast, add your Charisma modifier to the damage it deals on a hit.",
		Prerequisites: InvocationPrerequisites{RequiresSpell: "eldritch-blast"},
		Mechanics:     map[string]string{"agonizing_blast": "true"},
	},
	"armor-of-shadows": {
		Slug:        "armor-of-shadows",
		Name:        "Armor of Shadows",
		Description: "You can cast mage armor on yourself at will, without expending a spell slot or material components.",
		Mechanics:   map[string]string{"at_will_spell": "mage-armor"},
	},
	"beast-speech": {
		Slug:        "beast-speech",
		Name:        "Beast Speech",
		Description: "You can cast speak with animals at will, without expending a spell slot.",
		Mechanics:   map[string]string{"at_will_spell": "speak-with-animals"},
	},
	"beguiling-influence": {
		Slug:        "beguiling-influence",
		Name:        "Beguiling Influence",
		Description: "You gain proficiency in the Deception and Persuasion skills.",
		Mechanics:   map[string]string{"grant_proficiency": "deception,persuasion"},
	},
	"devils-sight": {
		Slug:        "devils-sight",
		Name:        "Devil's Sight",
		Description: "You can see normally in darkness, both magical and nonmagical, to a distance of 120 feet.",
		Mechanics:   map[string]string{"devils_sight": "120"},
	},
	"eldritch-sight": {
		Slug:        "eldritch-sight",
		Name:        "Eldritch Sight",
		Description: "You can cast detect magic at will, without expending a spell slot.",
		Mechanics:   map[string]string{"at_will_spell": "detect-magic"},
	},
	"eldritch-spear": {
		Slug:          "eldritch-spear",
		Name:          "Eldritch Spear",
		Description:   "When you cast eldritch blast, its range is 300 feet.",
		Prerequisites: InvocationPrerequisites{RequiresSpell: "eldritch-blast"},
		Mechanics:     map[string]string{"eldritch_spear": "300"},
	},
	"eyes-of-the-rune-keeper": {
		Slug:        "eyes-of-the-rune-keeper",
		Name:        "Eyes of the Rune Keeper",
		Description: "You can read all writing.",
		Mechanics:   map[string]string{"read_all_writing": "true"},
	},
	"fiendish-vigor": {
		Slug:        "fiendish-vigor",
		Name:        "Fiendish Vigor",
		Description: "You can cast false life on yourself at will as a 1st-level spell, without expending a spell slot or material components.",
		Mechanics:   map[string]string{"at_will_spell": "false-life"},
	},
	"gaze-of-two-minds": {
		Slug:        "gaze-of-two-minds",
		Name:        "Gaze of Two Minds",
		Description: "You can use your action to touch a willing humanoid and perceive through its senses until the end of your next turn. As long as the creature is on the same plane of existence as you, you can use your action on subsequent turns to maintain this connection, extending the duration until the end of your next turn.",
		Mechanics:   map[string]string{"gaze_of_two_minds": "true"},
	},
	"mask-of-many-faces": {
		Slug:        "mask-of-many-faces",
		Name:        "Mask of Many Faces",
		Description: "You can cast disguise self at will, without expending a spell slot.",
		Mechanics:   map[string]string{"at_will_spell": "disguise-self"},
	},
	"misty-visions": {
		Slug:        "misty-visions",
		Name:        "Misty Visions",
		Description: "You can cast silent image at will, without expending a spell slot or material components.",
		Mechanics:   map[string]string{"at_will_spell": "silent-image"},
	},
	"repelling-blast": {
		Slug:          "repelling-blast",
		Name:          "Repelling Blast",
		Description:   "When you hit a creature with eldritch blast, you can push the creature up to 10 feet away from you in a straight line.",
		Prerequisites: InvocationPrerequisites{RequiresSpell: "eldritch-blast"},
		Mechanics:     map[string]string{"repelling_blast": "10"},
	},
	"thief-of-five-fates": {
		Slug:        "thief-of-five-fates",
		Name:        "Thief of Five Fates",
		Description: "You can cast bane once using a warlock spell slot. You can't do so again until you finish a long rest.",
		Mechanics:   map[string]string{"once_per_rest_spell": "bane"},
	},
	// Level 5+ invocations
	"mire-the-mind": {
		Slug:          "mire-the-mind",
		Name:          "Mire the Mind",
		Description:   "You can cast slow once using a warlock spell slot. You can't do so again until you finish a long rest.",
		Prerequisites: InvocationPrerequisites{Level: 5},
		Mechanics:     map[string]string{"once_per_rest_spell": "slow"},
	},
	"one-with-shadows": {
		Slug:          "one-with-shadows",
		Name:          "One with Shadows",
		Description:   "When you are in an area of dim light or darkness, you can use your action to become invisible until you move or take an action or a reaction.",
		Prerequisites: InvocationPrerequisites{Level: 5},
		Mechanics:     map[string]string{"one_with_shadows": "true"},
	},
	"sign-of-ill-omen": {
		Slug:          "sign-of-ill-omen",
		Name:          "Sign of Ill Omen",
		Description:   "You can cast bestow curse once using a warlock spell slot. You can't do so again until you finish a long rest.",
		Prerequisites: InvocationPrerequisites{Level: 5},
		Mechanics:     map[string]string{"once_per_rest_spell": "bestow-curse"},
	},
	// Level 7+ invocations
	"sculptor-of-flesh": {
		Slug:          "sculptor-of-flesh",
		Name:          "Sculptor of Flesh",
		Description:   "You can cast polymorph once using a warlock spell slot. You can't do so again until you finish a long rest.",
		Prerequisites: InvocationPrerequisites{Level: 7},
		Mechanics:     map[string]string{"once_per_rest_spell": "polymorph"},
	},
	// Level 9+ invocations
	"ascendant-step": {
		Slug:          "ascendant-step",
		Name:          "Ascendant Step",
		Description:   "You can cast levitate on yourself at will, without expending a spell slot or material components.",
		Prerequisites: InvocationPrerequisites{Level: 9},
		Mechanics:     map[string]string{"at_will_spell": "levitate"},
	},
	"minions-of-chaos": {
		Slug:          "minions-of-chaos",
		Name:          "Minions of Chaos",
		Description:   "You can cast conjure elemental once using a warlock spell slot. You can't do so again until you finish a long rest.",
		Prerequisites: InvocationPrerequisites{Level: 9},
		Mechanics:     map[string]string{"once_per_rest_spell": "conjure-elemental"},
	},
	"otherworldly-leap": {
		Slug:          "otherworldly-leap",
		Name:          "Otherworldly Leap",
		Description:   "You can cast jump on yourself at will, without expending a spell slot or material components.",
		Prerequisites: InvocationPrerequisites{Level: 9},
		Mechanics:     map[string]string{"at_will_spell": "jump"},
	},
	"whispers-of-the-grave": {
		Slug:          "whispers-of-the-grave",
		Name:          "Whispers of the Grave",
		Description:   "You can cast speak with dead at will, without expending a spell slot.",
		Prerequisites: InvocationPrerequisites{Level: 9},
		Mechanics:     map[string]string{"at_will_spell": "speak-with-dead"},
	},
	// Level 12+ invocations
	"lifedrinker": {
		Slug:          "lifedrinker",
		Name:          "Lifedrinker",
		Description:   "When you hit a creature with your pact weapon, the creature takes extra necrotic damage equal to your Charisma modifier (minimum 1).",
		Prerequisites: InvocationPrerequisites{Level: 12, Pact: "blade"},
		Mechanics:     map[string]string{"lifedrinker": "true"},
	},
	// Level 15+ invocations
	"master-of-myriad-forms": {
		Slug:          "master-of-myriad-forms",
		Name:          "Master of Myriad Forms",
		Description:   "You can cast alter self at will, without expending a spell slot.",
		Prerequisites: InvocationPrerequisites{Level: 15},
		Mechanics:     map[string]string{"at_will_spell": "alter-self"},
	},
	"visions-of-distant-realms": {
		Slug:          "visions-of-distant-realms",
		Name:          "Visions of Distant Realms",
		Description:   "You can cast arcane eye at will, without expending a spell slot.",
		Prerequisites: InvocationPrerequisites{Level: 15},
		Mechanics:     map[string]string{"at_will_spell": "arcane-eye"},
	},
	"witch-sight": {
		Slug:          "witch-sight",
		Name:          "Witch Sight",
		Description:   "You can see the true form of any shapechanger or creature concealed by illusion or transmutation magic while the creature is within 30 feet of you and within line of sight.",
		Prerequisites: InvocationPrerequisites{Level: 15},
		Mechanics:     map[string]string{"witch_sight": "30"},
	},
}

// PactBoon represents a Warlock Pact Boon (PHB pp107-108)
// Warlocks choose one at level 3
type PactBoon struct {
	Slug        string                 `json:"slug"`
	Name        string                 `json:"name"`
	Description string                 `json:"description"`
	Mechanics   map[string]interface{} `json:"mechanics,omitempty"`
}

// AvailablePactBoons contains the three SRD Pact Boons
var AvailablePactBoons = map[string]PactBoon{
	"chain": {
		Slug:        "chain",
		Name:        "Pact of the Chain",
		Description: "You learn the find familiar spell and can cast it as a ritual. The spell doesn't count against your number of spells known. When you cast the spell, you can choose one of the normal forms for your familiar or one of the following special forms: imp, pseudodragon, quasit, or sprite. Additionally, when you take the Attack action, you can forgo one of your own attacks to allow your familiar to make one attack with its reaction.",
		Mechanics: map[string]interface{}{
			"learn_spell":     "find-familiar",
			"familiar_forms":  []string{"imp", "pseudodragon", "quasit", "sprite"},
			"familiar_attack": true,
		},
	},
	"blade": {
		Slug:        "blade",
		Name:        "Pact of the Blade",
		Description: "You can use your action to create a pact weapon in your empty hand. You can choose the form that this melee weapon takes each time you create it. You are proficient with it while you wield it. This weapon counts as magical for the purpose of overcoming resistance and immunity to nonmagical attacks and damage. Your pact weapon disappears if it is more than 5 feet away from you for 1 minute or more. It also disappears if you use this feature again, if you dismiss the weapon (no action required), or if you die. You can transform one magic weapon into your pact weapon by performing a special ritual while you hold the weapon.",
		Mechanics: map[string]interface{}{
			"create_weapon":     true,
			"weapon_proficient": true,
			"weapon_magical":    true,
			"bond_magic_weapon": true,
		},
	},
	"tome": {
		Slug:        "tome",
		Name:        "Pact of the Tome",
		Description: "Your patron gives you a grimoire called a Book of Shadows. When you gain this feature, choose three cantrips from any class's spell list (the three needn't be from the same list). While the book is on your person, you can cast those cantrips at will. They don't count against your number of cantrips known. If they don't appear on the warlock spell list, they are nonetheless warlock spells for you. If you lose your Book of Shadows, you can perform a 1-hour ceremony to receive a replacement from your patron. This ceremony can be performed during a short or long rest, and it destroys the previous book.",
		Mechanics: map[string]interface{}{
			"extra_cantrips":     3,
			"cantrips_any_class": true,
			"book_of_shadows":    true,
		},
	},
}

// GetMaxInvocations returns how many invocations a Warlock can have at their level (PHB p106)
func GetMaxInvocations(warlockLevel int) int {
	switch {
	case warlockLevel >= 18:
		return 8
	case warlockLevel >= 15:
		return 7
	case warlockLevel >= 12:
		return 6
	case warlockLevel >= 9:
		return 5
	case warlockLevel >= 7:
		return 4
	case warlockLevel >= 5:
		return 3
	case warlockLevel >= 2:
		return 2
	default:
		return 0
	}
}

// GetInvocation returns an invocation by slug, or nil if not found
func GetInvocation(slug string) *EldritchInvocation {
	if inv, ok := AvailableInvocations[slug]; ok {
		return &inv
	}
	return nil
}

// GetPactBoon returns a pact boon by slug, or nil if not found
func GetPactBoon(slug string) *PactBoon {
	if boon, ok := AvailablePactBoons[slug]; ok {
		return &boon
	}
	return nil
}

// ListInvocations returns all available invocations as a slice
func ListInvocations() []EldritchInvocation {
	invocations := make([]EldritchInvocation, 0, len(AvailableInvocations))
	for _, inv := range AvailableInvocations {
		invocations = append(invocations, inv)
	}
	return invocations
}

// ListPactBoons returns all available pact boons as a slice
func ListPactBoons() []PactBoon {
	boons := make([]PactBoon, 0, len(AvailablePactBoons))
	for _, boon := range AvailablePactBoons {
		boons = append(boons, boon)
	}
	return boons
}
