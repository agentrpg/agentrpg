// Package game provides core D&D 5e game mechanics.
//
// subclasses.go - subclass features and mechanics per PHB class chapters
package game

import "strings"

// SubclassFeature represents a single feature gained at a specific level
type SubclassFeature struct {
	Name        string            `json:"name"`
	Level       int               `json:"level"`
	Description string            `json:"description"`
	Mechanics   map[string]string `json:"mechanics,omitempty"` // Mechanical effects to track
}

// Subclass represents a character subclass from the SRD
type Subclass struct {
	Name          string            `json:"name"`
	Class         string            `json:"class"`          // Parent class (fighter, rogue, etc.)
	SubclassLevel int               `json:"subclass_level"` // Level when subclass is chosen (3 for most, 1-2 for some)
	Description   string            `json:"description"`
	Features      []SubclassFeature `json:"features"`
	DomainSpells  map[int][]string  `json:"domain_spells,omitempty"` // Always-prepared spells by character level
}

// AvailableSubclasses contains all 12 SRD subclasses
var AvailableSubclasses = map[string]Subclass{
	"berserker": {
		Name:          "Berserker",
		Class:         "barbarian",
		SubclassLevel: 3,
		Description:   "For some barbarians, rage is a means to an end—that end being violence. The Path of the Berserker is a path of untrammeled fury, slick with blood.",
		Features: []SubclassFeature{
			{
				Name:        "Frenzy",
				Level:       3,
				Description: "You can go into a frenzy when you rage. If you do so, for the duration of your rage you can make a single melee weapon attack as a bonus action on each of your turns after this one. When your rage ends, you suffer one level of exhaustion.",
				Mechanics: map[string]string{
					"frenzy_bonus_attack": "true",
					"frenzy_exhaustion":   "true",
				},
			},
			{
				Name:        "Mindless Rage",
				Level:       6,
				Description: "You can't be charmed or frightened while raging. If you are charmed or frightened when you enter your rage, the effect is suspended for the duration of the rage.",
				Mechanics: map[string]string{
					"rage_immune_charm":      "true",
					"rage_immune_frightened": "true",
				},
			},
			{
				Name:        "Intimidating Presence",
				Level:       10,
				Description: "You can use your action to frighten someone with your menacing presence. Choose one creature that you can see within 30 feet. The creature must succeed on a Wisdom saving throw (DC = 8 + prof + CHA mod) or be frightened of you until the end of your next turn.",
				Mechanics: map[string]string{
					"intimidating_presence": "true",
				},
			},
			{
				Name:        "Retaliation",
				Level:       14,
				Description: "When you take damage from a creature that is within 5 feet of you, you can use your reaction to make a melee weapon attack against that creature.",
				Mechanics: map[string]string{
					"retaliation_attack": "true",
				},
			},
		},
	},
	"champion": {
		Name:          "Champion",
		Class:         "fighter",
		SubclassLevel: 3,
		Description:   "The archetypal Champion focuses on the development of raw physical power honed to deadly perfection. Those who model themselves on this archetype combine rigorous training with physical excellence to deal devastating blows.",
		Features: []SubclassFeature{
			{
				Name:        "Improved Critical",
				Level:       3,
				Description: "Your weapon attacks score a critical hit on a roll of 19 or 20.",
				Mechanics: map[string]string{
					"crit_range": "19",
				},
			},
			{
				Name:        "Remarkable Athlete",
				Level:       7,
				Description: "You can add half your proficiency bonus (round up) to any Strength, Dexterity, or Constitution check you make that doesn't already use your proficiency bonus. In addition, when you make a running long jump, the distance you can cover increases by a number of feet equal to your Strength modifier.",
				Mechanics: map[string]string{
					"remarkable_athlete": "true",
					"jump_bonus":         "str_mod",
				},
			},
			{
				Name:        "Additional Fighting Style",
				Level:       10,
				Description: "You can choose a second option from the Fighting Style class feature.",
				Mechanics: map[string]string{
					"extra_fighting_style": "true",
				},
			},
			{
				Name:        "Superior Critical",
				Level:       15,
				Description: "Your weapon attacks score a critical hit on a roll of 18-20.",
				Mechanics: map[string]string{
					"crit_range": "18",
				},
			},
			{
				Name:        "Survivor",
				Level:       18,
				Description: "At the start of each of your turns, you regain hit points equal to 5 + your Constitution modifier if you have no more than half of your hit points left. You don't gain this benefit if you have 0 hit points.",
				Mechanics: map[string]string{
					"survivor_regen": "true",
				},
			},
		},
	},
	"thief": {
		Name:          "Thief",
		Class:         "rogue",
		SubclassLevel: 3,
		Description:   "You hone your skills in the larcenous arts. Burglars, bandits, cutpurses, and other criminals typically follow this archetype, but so do rogues who prefer to think of themselves as professional treasure seekers, explorers, delvers, and investigators.",
		Features: []SubclassFeature{
			{
				Name:        "Fast Hands",
				Level:       3,
				Description: "You can use the bonus action granted by your Cunning Action to make a Dexterity (Sleight of Hand) check, use your thieves' tools to disarm a trap or open a lock, or take the Use an Object action.",
				Mechanics: map[string]string{
					"fast_hands": "true",
				},
			},
			{
				Name:        "Second-Story Work",
				Level:       3,
				Description: "You gain the ability to climb faster than normal; climbing no longer costs you extra movement. In addition, when you make a running jump, the distance you cover increases by a number of feet equal to your Dexterity modifier.",
				Mechanics: map[string]string{
					"climb_speed": "full",
					"jump_bonus":  "dex_mod",
				},
			},
			{
				Name:        "Supreme Sneak",
				Level:       9,
				Description: "You have advantage on a Dexterity (Stealth) check if you move no more than half your speed on the same turn.",
				Mechanics: map[string]string{
					"supreme_sneak": "true",
				},
			},
			{
				Name:        "Use Magic Device",
				Level:       13,
				Description: "You have learned enough about the workings of magic that you can improvise the use of items even when they are not intended for you. You ignore all class, race, and level requirements on the use of magic items.",
				Mechanics: map[string]string{
					"ignore_magic_item_requirements": "true",
				},
			},
			{
				Name:        "Thief's Reflexes",
				Level:       17,
				Description: "You have become adept at laying ambushes and quickly escaping danger. You can take two turns during the first round of any combat. You take your first turn at your normal initiative and your second turn at your initiative minus 10.",
				Mechanics: map[string]string{
					"extra_first_round_turn": "true",
				},
			},
		},
	},
	"devotion": {
		Name:          "Devotion",
		Class:         "paladin",
		SubclassLevel: 3,
		Description:   "The Oath of Devotion binds a paladin to the loftiest ideals of justice, virtue, and order. Sometimes called cavaliers, white knights, or holy warriors, these paladins meet the ideal of the knight in shining armor.",
		Features: []SubclassFeature{
			{
				Name:        "Sacred Weapon",
				Level:       3,
				Description: "As an action, you can imbue one weapon that you are holding with positive energy. For 1 minute, you add your Charisma modifier to attack rolls made with that weapon (minimum bonus of +1). The weapon also emits bright light in a 20-foot radius and dim light 20 feet beyond that.",
				Mechanics: map[string]string{
					"sacred_weapon": "true",
				},
			},
			{
				Name:        "Turn the Unholy",
				Level:       3,
				Description: "As an action, you present your holy symbol and speak a prayer censuring fiends and undead. Each fiend or undead that can see or hear you within 30 feet must make a Wisdom saving throw.",
				Mechanics: map[string]string{
					"turn_unholy": "true",
				},
			},
			{
				Name:        "Aura of Devotion",
				Level:       7,
				Description: "You and friendly creatures within 10 feet of you can't be charmed while you are conscious. At 18th level, the range of this aura increases to 30 feet.",
				Mechanics: map[string]string{
					"aura_charm_immunity": "10ft",
				},
			},
			{
				Name:        "Purity of Spirit",
				Level:       15,
				Description: "You are always under the effects of a protection from evil and good spell.",
				Mechanics: map[string]string{
					"purity_of_spirit": "true",
				},
			},
			{
				Name:        "Holy Nimbus",
				Level:       20,
				Description: "As an action, you can emanate an aura of sunlight. For 1 minute, bright light shines from you in a 30-foot radius, and dim light shines 30 feet beyond that. Whenever an enemy creature starts its turn in the bright light, the creature takes 10 radiant damage.",
				Mechanics: map[string]string{
					"holy_nimbus": "true",
				},
			},
		},
		DomainSpells: map[int][]string{
			3:  {"protection-from-evil-and-good", "sanctuary"},
			5:  {"lesser-restoration", "zone-of-truth"},
			9:  {"beacon-of-hope", "dispel-magic"},
			13: {"freedom-of-movement", "guardian-of-faith"},
			17: {"commune", "flame-strike"},
		},
	},
	"hunter": {
		Name:          "Hunter",
		Class:         "ranger",
		SubclassLevel: 3,
		Description:   "Emulating the Hunter archetype means accepting your place as a bulwark between civilization and the terrors of the wilderness.",
		Features: []SubclassFeature{
			{
				Name:        "Hunter's Prey",
				Level:       3,
				Description: "Choose one of the following options: Colossus Slayer (extra 1d8 damage once per turn against wounded targets), Giant Killer (reaction attack against Large+ creatures that miss you), or Horde Breaker (attack a second creature within 5ft of the first).",
				Mechanics: map[string]string{
					"hunters_prey": "choice",
				},
			},
			{
				Name:        "Defensive Tactics",
				Level:       7,
				Description: "Choose one: Escape the Horde (opportunity attacks against you have disadvantage), Multiattack Defense (+4 AC after being hit by a creature), or Steel Will (advantage on saves vs. frightened).",
				Mechanics: map[string]string{
					"defensive_tactics": "choice",
				},
			},
			{
				Name:        "Multiattack",
				Level:       11,
				Description: "Choose one: Volley (attack any number of creatures within 10ft of a point in range) or Whirlwind Attack (melee attack against all creatures within 5ft).",
				Mechanics: map[string]string{
					"multiattack": "choice",
				},
			},
			{
				Name:        "Superior Hunter's Defense",
				Level:       15,
				Description: "Choose one: Evasion (DEX saves for half damage become no damage on success), Stand Against the Tide (force missed melee attacks to hit another creature), or Uncanny Dodge (halve damage from an attack you can see).",
				Mechanics: map[string]string{
					"superior_defense": "choice",
				},
			},
		},
	},
	"lore": {
		Name:          "Lore",
		Class:         "bard",
		SubclassLevel: 3,
		Description:   "Bards of the College of Lore know something about most things, collecting bits of knowledge from sources as diverse as scholarly tomes and peasant tales.",
		Features: []SubclassFeature{
			{
				Name:        "Bonus Proficiencies",
				Level:       3,
				Description: "You gain proficiency with three skills of your choice.",
				Mechanics: map[string]string{
					"bonus_skill_proficiencies": "3",
				},
			},
			{
				Name:        "Cutting Words",
				Level:       3,
				Description: "You can use your wit to distract, confuse, and otherwise sap the confidence and competence of others. When a creature that you can see within 60 feet makes an attack roll, ability check, or damage roll, you can use your reaction to expend one of your uses of Bardic Inspiration, rolling a Bardic Inspiration die and subtracting the number rolled from the creature's roll.",
				Mechanics: map[string]string{
					"cutting_words": "true",
				},
			},
			{
				Name:        "Additional Magical Secrets",
				Level:       6,
				Description: "You learn two spells of your choice from any class. A spell you choose must be of a level you can cast.",
				Mechanics: map[string]string{
					"additional_magical_secrets": "2",
				},
			},
			{
				Name:        "Peerless Skill",
				Level:       14,
				Description: "When you make an ability check, you can expend one use of Bardic Inspiration. Roll a Bardic Inspiration die and add the number rolled to your ability check.",
				Mechanics: map[string]string{
					"peerless_skill": "true",
				},
			},
		},
	},
	"life": {
		Name:          "Life",
		Class:         "cleric",
		SubclassLevel: 1,
		Description:   "The Life domain focuses on the vibrant positive energy—one of the fundamental forces of the universe—that sustains all life.",
		Features: []SubclassFeature{
			{
				Name:        "Bonus Proficiency",
				Level:       1,
				Description: "You gain proficiency with heavy armor.",
				Mechanics: map[string]string{
					"heavy_armor_proficiency": "true",
				},
			},
			{
				Name:        "Disciple of Life",
				Level:       1,
				Description: "Your healing spells are more effective. Whenever you use a spell of 1st level or higher to restore hit points to a creature, the creature regains additional hit points equal to 2 + the spell's level.",
				Mechanics: map[string]string{
					"bonus_healing": "2+spell_level",
				},
			},
			{
				Name:        "Channel Divinity: Preserve Life",
				Level:       2,
				Description: "You can use your Channel Divinity to heal the badly injured. As an action, you present your holy symbol and evoke healing energy that can restore a number of hit points equal to five times your cleric level. Choose any creatures within 30 feet of you, and divide those hit points among them.",
				Mechanics: map[string]string{
					"preserve_life": "true",
				},
			},
			{
				Name:        "Blessed Healer",
				Level:       6,
				Description: "The healing spells you cast on others heal you as well. When you cast a spell of 1st level or higher that restores hit points to a creature other than you, you regain hit points equal to 2 + the spell's level.",
				Mechanics: map[string]string{
					"blessed_healer": "true",
				},
			},
			{
				Name:        "Divine Strike",
				Level:       8,
				Description: "You gain the ability to infuse your weapon strikes with divine energy. Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 radiant damage to the target. When you reach 14th level, the extra damage increases to 2d8.",
				Mechanics: map[string]string{
					"divine_strike": "1d8",
				},
			},
			{
				Name:        "Supreme Healing",
				Level:       17,
				Description: "When you would normally roll one or more dice to restore hit points with a spell, you instead use the highest number possible for each die.",
				Mechanics: map[string]string{
					"supreme_healing": "true",
				},
			},
		},
		DomainSpells: map[int][]string{
			1: {"bless", "cure-wounds"},
			3: {"lesser-restoration", "spiritual-weapon"},
			5: {"beacon-of-hope", "revivify"},
			7: {"death-ward", "guardian-of-faith"},
			9: {"mass-cure-wounds", "raise-dead"},
		},
	},
	"land": {
		Name:          "Land",
		Class:         "druid",
		SubclassLevel: 2,
		Description:   "The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition.",
		Features: []SubclassFeature{
			{
				Name:        "Bonus Cantrip",
				Level:       2,
				Description: "You learn one additional druid cantrip of your choice.",
				Mechanics: map[string]string{
					"bonus_cantrip": "1",
				},
			},
			{
				Name:        "Circle Spells",
				Level:       2,
				Description: "Your mystical connection to the land infuses you with the ability to cast certain spells. Choose one land type: Arctic, Coast, Desert, Forest, Grassland, Mountain, Swamp, or Underdark. You gain access to circle spells connected to that land, which are always prepared and don't count against your prepared spells limit.",
				Mechanics: map[string]string{
					"circle_land": "choice",
				},
			},
			{
				Name:        "Natural Recovery",
				Level:       2,
				Description: "During a short rest, you can choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your druid level (rounded up), and none of the slots can be 6th level or higher.",
				Mechanics: map[string]string{
					"natural_recovery": "true",
				},
			},
			{
				Name:        "Land's Stride",
				Level:       6,
				Description: "Moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard. In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such as those created by the entangle spell.",
				Mechanics: map[string]string{
					"lands_stride": "true",
				},
			},
			{
				Name:        "Nature's Ward",
				Level:       10,
				Description: "You can't be charmed or frightened by elementals or fey, and you are immune to poison and disease.",
				Mechanics: map[string]string{
					"natures_ward": "true",
				},
			},
			{
				Name:        "Nature's Sanctuary",
				Level:       14,
				Description: "Creatures of the natural world sense your connection to nature and become hesitant to attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the attack automatically misses.",
				Mechanics: map[string]string{
					"natures_sanctuary": "true",
				},
			},
		},
	},
	"open-hand": {
		Name:          "Open Hand",
		Class:         "monk",
		SubclassLevel: 3,
		Description:   "Monks of the Way of the Open Hand are the ultimate masters of martial arts combat, whether armed or unarmed.",
		Features: []SubclassFeature{
			{
				Name:        "Open Hand Technique",
				Level:       3,
				Description: "Whenever you hit a creature with one of the attacks granted by your Flurry of Blows, you can impose one of the following effects: it must succeed on a DEX save or be knocked prone, make a STR save or be pushed up to 15 feet away, or it can't take reactions until the end of your next turn.",
				Mechanics: map[string]string{
					"open_hand_technique": "true",
				},
			},
			{
				Name:        "Wholeness of Body",
				Level:       6,
				Description: "You can use your action to regain hit points equal to three times your monk level. You must finish a long rest before you can use this feature again.",
				Mechanics: map[string]string{
					"wholeness_of_body": "true",
				},
			},
			{
				Name:        "Tranquility",
				Level:       11,
				Description: "At the end of a long rest, you gain the effect of a sanctuary spell that lasts until the start of your next long rest (the spell can end early as normal).",
				Mechanics: map[string]string{
					"tranquility": "true",
				},
			},
			{
				Name:        "Quivering Palm",
				Level:       17,
				Description: "You gain the ability to set up lethal vibrations in someone's body. When you hit a creature with an unarmed strike, you can spend 3 ki points to start these imperceptible vibrations, which last for a number of days equal to your monk level. You can then use your action to end the vibrations, forcing the target to make a CON save. If it fails, it is reduced to 0 hit points. If it succeeds, it takes 10d10 necrotic damage.",
				Mechanics: map[string]string{
					"quivering_palm": "true",
				},
			},
		},
	},
	"draconic": {
		Name:          "Draconic",
		Class:         "sorcerer",
		SubclassLevel: 1,
		Description:   "Your innate magic comes from draconic magic that was mingled with your blood or that of your ancestors.",
		Features: []SubclassFeature{
			{
				Name:        "Dragon Ancestor",
				Level:       1,
				Description: "You choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.",
				Mechanics: map[string]string{
					"dragon_ancestor": "choice",
				},
			},
			{
				Name:        "Draconic Resilience",
				Level:       1,
				Description: "Your hit point maximum increases by 1, and it increases by 1 again whenever you gain a level in this class. Additionally, parts of your skin are covered by a thin sheen of dragon-like scales. When you aren't wearing armor, your AC equals 13 + your Dexterity modifier.",
				Mechanics: map[string]string{
					"bonus_hp_per_level": "1",
					"natural_ac":         "13+dex",
				},
			},
			{
				Name:        "Elemental Affinity",
				Level:       6,
				Description: "When you cast a spell that deals damage of the type associated with your draconic ancestry, add your Charisma modifier to that damage. At the same time, you can spend 1 sorcery point to gain resistance to that damage type for 1 hour.",
				Mechanics: map[string]string{
					"elemental_affinity": "true",
				},
			},
			{
				Name:        "Dragon Wings",
				Level:       14,
				Description: "You gain the ability to sprout a pair of dragon wings from your back, gaining a flying speed equal to your current speed.",
				Mechanics: map[string]string{
					"dragon_wings": "true",
				},
			},
			{
				Name:        "Draconic Presence",
				Level:       18,
				Description: "As an action, you can spend 5 sorcery points to draw on this power and exude an aura of awe or fear (your choice) to a distance of 60 feet. Each hostile creature in that area must succeed on a WIS save or be charmed (if you chose awe) or frightened (if you chose fear) for 1 minute.",
				Mechanics: map[string]string{
					"draconic_presence": "true",
				},
			},
		},
	},
	"fiend": {
		Name:          "Fiend",
		Class:         "warlock",
		SubclassLevel: 1,
		Description:   "You have made a pact with a fiend from the lower planes of existence, a being whose aims are evil, even if you strive against those aims.",
		Features: []SubclassFeature{
			{
				Name:        "Dark One's Blessing",
				Level:       1,
				Description: "When you reduce a hostile creature to 0 hit points, you gain temporary hit points equal to your Charisma modifier + your warlock level (minimum of 1).",
				Mechanics: map[string]string{
					"dark_ones_blessing": "true",
				},
			},
			{
				Name:        "Dark One's Own Luck",
				Level:       6,
				Description: "You can call on your patron to alter fate in your favor. When you make an ability check or a saving throw, you can use this feature to add a d10 to your roll. You can do so after seeing the initial roll but before any of the roll's effects occur. Once you use this feature, you can't use it again until you finish a short or long rest.",
				Mechanics: map[string]string{
					"dark_ones_luck": "true",
				},
			},
			{
				Name:        "Fiendish Resilience",
				Level:       10,
				Description: "You can choose one damage type when you finish a short or long rest. You gain resistance to that damage type until you choose a different one with this feature.",
				Mechanics: map[string]string{
					"fiendish_resilience": "true",
				},
			},
			{
				Name:        "Hurl Through Hell",
				Level:       14,
				Description: "When you hit a creature with an attack, you can use this feature to instantly transport the target through the lower planes. The creature disappears and hurtles through a nightmare landscape. At the end of your next turn, the target returns to the space it previously occupied, or the nearest unoccupied space. If the target is not a fiend, it takes 10d10 psychic damage as it reels from its horrific experience. Once you use this feature, you can't use it again until you finish a long rest.",
				Mechanics: map[string]string{
					"hurl_through_hell": "true",
				},
			},
		},
		DomainSpells: map[int][]string{
			1: {"burning-hands", "command"},
			3: {"blindness-deafness", "scorching-ray"},
			5: {"fireball", "stinking-cloud"},
			7: {"fire-shield", "wall-of-fire"},
			9: {"flame-strike", "hallow"},
		},
	},
	"evocation": {
		Name:          "Evocation",
		Class:         "wizard",
		SubclassLevel: 2,
		Description:   "You focus your study on magic that creates powerful elemental effects such as bitter cold, searing flame, rolling thunder, crackling lightning, and burning acid.",
		Features: []SubclassFeature{
			{
				Name:        "Evocation Savant",
				Level:       2,
				Description: "The gold and time you must spend to copy an evocation spell into your spellbook is halved.",
				Mechanics: map[string]string{
					"evocation_savant": "true",
				},
			},
			{
				Name:        "Sculpt Spells",
				Level:       2,
				Description: "When you cast an evocation spell that affects other creatures that you can see, you can choose a number of them equal to 1 + the spell's level. The chosen creatures automatically succeed on their saving throws against the spell, and they take no damage if they would normally take half damage on a successful save.",
				Mechanics: map[string]string{
					"sculpt_spells": "true",
				},
			},
			{
				Name:        "Potent Cantrip",
				Level:       6,
				Description: "Your damaging cantrips affect even creatures that avoid the brunt of the effect. When a creature succeeds on a saving throw against your cantrip, the creature takes half the cantrip's damage (if any) but suffers no additional effect from the cantrip.",
				Mechanics: map[string]string{
					"potent_cantrip": "true",
				},
			},
			{
				Name:        "Empowered Evocation",
				Level:       10,
				Description: "You can add your Intelligence modifier to one damage roll of any wizard evocation spell you cast.",
				Mechanics: map[string]string{
					"empowered_evocation": "true",
				},
			},
			{
				Name:        "Overchannel",
				Level:       14,
				Description: "When you cast a wizard spell of 1st through 5th level that deals damage, you can deal maximum damage with that spell. The first time you do so, you suffer no adverse effect. If you use this feature again before you finish a long rest, you take 2d12 necrotic damage for each level of the spell, immediately after you cast it.",
				Mechanics: map[string]string{
					"overchannel": "true",
				},
			},
		},
	},
}

// DragonAncestryDamageTypes maps dragon ancestry to damage type (PHB p102)
var DragonAncestryDamageTypes = map[string]string{
	"black":  "acid",
	"blue":   "lightning",
	"brass":  "fire",
	"bronze": "lightning",
	"copper": "acid",
	"gold":   "fire",
	"green":  "poison",
	"red":    "fire",
	"silver": "cold",
	"white":  "cold",
}

// GetSubclassesForClass returns all subclasses for a given class
func GetSubclassesForClass(class string) map[string]Subclass {
	result := make(map[string]Subclass)
	classLower := strings.ToLower(class)
	for slug, sub := range AvailableSubclasses {
		if strings.ToLower(sub.Class) == classLower {
			result[slug] = sub
		}
	}
	return result
}

// GetSubclass returns a subclass by slug, or nil if not found
func GetSubclass(slug string) *Subclass {
	if sub, ok := AvailableSubclasses[slug]; ok {
		return &sub
	}
	return nil
}

// GetActiveSubclassFeatures returns the features a character has unlocked based on their level
func GetActiveSubclassFeatures(subclassSlug string, level int) []SubclassFeature {
	sub, ok := AvailableSubclasses[subclassSlug]
	if !ok {
		return nil
	}

	var active []SubclassFeature
	for _, feature := range sub.Features {
		if level >= feature.Level {
			active = append(active, feature)
		}
	}
	return active
}

// HasSubclassFeature checks if a character has a specific subclass mechanic at their level
func HasSubclassFeature(subclassSlug string, level int, mechanic string) bool {
	features := GetActiveSubclassFeatures(subclassSlug, level)
	for _, f := range features {
		if _, ok := f.Mechanics[mechanic]; ok {
			return true
		}
	}
	return false
}

// GetSubclassMechanic returns the value of a specific subclass mechanic if present
func GetSubclassMechanic(subclassSlug string, level int, mechanic string) (string, bool) {
	features := GetActiveSubclassFeatures(subclassSlug, level)
	for _, f := range features {
		if val, ok := f.Mechanics[mechanic]; ok {
			return val, true
		}
	}
	return "", false
}

// GetDomainSpells returns always-prepared spells for a subclass at a given level.
// For Circle of the Land druids, use LandCircleSpells instead.
func GetDomainSpells(subclassSlug string, level int) []string {
	sub, ok := AvailableSubclasses[subclassSlug]
	if !ok || sub.DomainSpells == nil {
		return nil
	}

	var spells []string
	for spellLevel, spellList := range sub.DomainSpells {
		if level >= spellLevel {
			spells = append(spells, spellList...)
		}
	}
	return spells
}

// AllSubclassSlugs returns all available subclass slugs
func AllSubclassSlugs() []string {
	slugs := make([]string, 0, len(AvailableSubclasses))
	for slug := range AvailableSubclasses {
		slugs = append(slugs, slug)
	}
	return slugs
}

// GetNaturalACBase returns the natural AC base for subclasses that grant unarmored defense
// Returns 0 if the subclass doesn't grant natural AC
func GetNaturalACBase(subclass string, level int) int {
	if subclass == "draconic" && level >= 1 {
		return 13 // Draconic Resilience: 13 + DEX
	}
	return 0
}

// GetDraconicBonusHP returns the bonus HP per level for Draconic Sorcerers
func GetDraconicBonusHP(subclass string) int {
	if subclass == "draconic" {
		return 1 // +1 HP per sorcerer level
	}
	return 0
}
