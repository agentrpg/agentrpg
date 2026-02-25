-- 5e SRD Class Features (CC-BY-4.0)
-- Generated: 2026-02-25T09:32:00.176Z
-- Source: https://www.dnd5eapi.co

INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'action-surge-1-use', 'Action Surge (1 use)', 'fighter', '',
  2, 'Starting at 2nd level, you can push yourself beyond your normal limits for a moment. On your turn, you can take one additional action on top of your regular action and a possible bonus action. Once you use this feature, you must finish a short or long rest before you can use it again. Starting at 17th level, you can use it twice before a rest, but only once on the same turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'action-surge-2-uses', 'Action Surge (2 uses)', 'fighter', '',
  17, 'Starting at 2nd level, you can push yourself beyond your normal limits for a moment. On your turn, you can take one additional action on top of your regular action and a possible bonus action. Once you use this feature, you must finish a short or long rest before you can use it again. Starting at 17th level, you can use it twice before a rest, but only once on the same turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'additional-fighting-style', 'Additional Fighting Style', 'fighter', 'champion',
  10, 'At 10th level, you can choose a second option from the Fighting Style class feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'additional-magical-secrets', 'Additional Magical Secrets', 'bard', 'lore',
  6, 'At 6th level, you learn two spells of your choice from any class. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip. The chosen spells count as bard spells for you but don''t count against the number of bard spells you know.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'arcane-recovery', 'Arcane Recovery', 'wizard', '',
  1, 'You have learned to regain some of your magical energy by studying your spellbook. Once per day when you finish a short rest, you can choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your wizard level (rounded up), and none of the slots can be 6th level or higher. For example, if you''re a 4th-level wizard, you can recover up to two levels worth of spell slots. You can recover either a 2nd-level spell slot or two 1st-level spell slots.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'arcane-tradition', 'Arcane Tradition', 'wizard', '',
  2, 'When you reach 2nd level, you choose an arcane tradition, shaping your practice of magic through one of eight schools, such as Evocation. Your choice grants you features at 2nd level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'arcane-tradition-improvement-1', 'Arcane Tradition feature', 'wizard', '',
  6, 'When you reach 2nd level, you choose an arcane tradition, shaping your practice of magic through one of eight schools, such as Evocation. Your choice grants you features at 2nd level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'arcane-tradition-improvement-2', 'Arcane Tradition feature', 'wizard', '',
  10, 'When you reach 2nd level, you choose an arcane tradition, shaping your practice of magic through one of eight schools, such as Evocation. Your choice grants you features at 2nd level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'arcane-tradition-improvement-3', 'Arcane Tradition feature', 'wizard', '',
  14, 'When you reach 2nd level, you choose an arcane tradition, shaping your practice of magic through one of eight schools, such as Evocation. Your choice grants you features at 2nd level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'archdruid', 'Archdruid', 'druid', '',
  20, 'At 20th level, you can use your Wild Shape an unlimited number of times. Additionally, you can ignore the verbal and somatic components of your druid spells, as well as any material components that lack a cost and aren''t consumed by a spell. You gain this benefit in both your normal shape and your beast shape from Wild Shape.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'aura-improvements', 'Aura improvements', 'paladin', '',
  18, 'At 18th level, the range of your auras increase to 30 feet.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'aura-of-courage', 'Aura of Courage', 'paladin', '',
  10, 'Starting at 10th level, you and friendly creatures within 10 feet of you can''t be frightened while you are conscious. At 18th level, the range of this aura increases to 30 feet.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'aura-of-devotion', 'Aura of Devotion', 'paladin', 'devotion',
  7, 'Starting at 7th level, you and friendly creatures within 10 feet of you can''t be charmed while you are conscious. At 18th level, the range of this aura increases to 30 feet.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'aura-of-protection', 'Aura of Protection', 'paladin', '',
  6, 'Starting at 6th level, whenever you or a friendly creature within 10 feet of you must make a saving throw, the creature gains a bonus to the saving throw equal to your Charisma modifier (with a minimum bonus of +1). You must be conscious to grant this bonus. At 18th level, the range of this aura increases to 30 feet.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'barbarian-ability-score-improvement-1', 'Ability Score Improvement', 'barbarian', '',
  4, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'barbarian-ability-score-improvement-2', 'Ability Score Improvement', 'barbarian', '',
  8, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'barbarian-ability-score-improvement-3', 'Ability Score Improvement', 'barbarian', '',
  12, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'barbarian-ability-score-improvement-4', 'Ability Score Improvement', 'barbarian', '',
  16, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'barbarian-ability-score-improvement-5', 'Ability Score Improvement', 'barbarian', '',
  19, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'barbarian-extra-attack', 'Extra Attack', 'barbarian', '',
  5, 'Beginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'barbarian-unarmored-defense', 'Unarmored Defense', 'barbarian', '',
  1, 'While you are not wearing any armor, your Armor Class equals 10 + your Dexterity modifier + your Constitution modifier. You can use a shield and still gain this benefit.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bard-ability-score-improvement-1', 'Ability Score Improvement', 'bard', '',
  4, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bard-ability-score-improvement-2', 'Ability Score Improvement', 'bard', '',
  8, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bard-ability-score-improvement-3', 'Ability Score Improvement', 'bard', '',
  12, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bard-ability-score-improvement-4', 'Ability Score Improvement', 'bard', '',
  16, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bard-ability-score-improvement-5', 'Ability Score Improvement', 'bard', '',
  19, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bard-college', 'Bard College', 'bard', '',
  3, 'At 3rd level, you delve into the advanced techniques of a bard college of your choice, such as the College of Lore. Your choice grants you features at 3rd level and again at 6th and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bard-college-improvement-1', 'Bard College feature', 'bard', '',
  6, 'At 3rd level, you delve into the advanced techniques of a bard college of your choice, such as the College of Lore. Your choice grants you features at 3rd level and again at 6th and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bard-college-improvement-2', 'Bard College feature', 'bard', '',
  14, 'At 3rd level, you delve into the advanced techniques of a bard college of your choice, such as the College of Lore. Your choice grants you features at 3rd level and again at 6th and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bard-expertise-1', 'Expertise', 'bard', '',
  3, 'At 3rd level, choose two of your skill proficiencies. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies. At 10th level, you can choose another two skill proficiencies to gain this benefit.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bard-expertise-2', 'Expertise', 'bard', '',
  10, 'At 3rd level, choose two of your skill proficiencies. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies. At 10th level, you can choose another two skill proficiencies to gain this benefit.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bardic-inspiration-d10', 'Bardic Inspiration (d10)', 'bard', '',
  10, 'You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6. Once within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes. The creature can wait until after it rolls the d20 before deciding to use the Bardic Inspiration die, but must decide before the GM says whether the roll succeeds or fails. Once the Bardic Inspiration die is rolled, it is lost. A creature can have only one Bardic Inspiration die at a time. You can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain any expended uses when you finish a long rest.  Your Bardic Inspiration die changes when you reach certain levels in this class. The die becomes a d8 at 5th level, a d10 at 10th level, and a d12 at 15th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bardic-inspiration-d12', 'Bardic Inspiration (d12)', 'bard', '',
  15, 'You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6. Once within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes. The creature can wait until after it rolls the d20 before deciding to use the Bardic Inspiration die, but must decide before the GM says whether the roll succeeds or fails. Once the Bardic Inspiration die is rolled, it is lost. A creature can have only one Bardic Inspiration die at a time. You can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain any expended uses when you finish a long rest.  Your Bardic Inspiration die changes when you reach certain levels in this class. The die becomes a d8 at 5th level, a d10 at 10th level, and a d12 at 15th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bardic-inspiration-d6', 'Bardic Inspiration (d6)', 'bard', '',
  1, 'You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6. Once within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes. The creature can wait until after it rolls the d20 before deciding to use the Bardic Inspiration die, but must decide before the GM says whether the roll succeeds or fails. Once the Bardic Inspiration die is rolled, it is lost. A creature can have only one Bardic Inspiration die at a time. You can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain any expended uses when you finish a long rest.  Your Bardic Inspiration die changes when you reach certain levels in this class. The die becomes a d8 at 5th level, a d10 at 10th level, and a d12 at 15th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bardic-inspiration-d8', 'Bardic Inspiration (d8)', 'bard', '',
  5, 'You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6. Once within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes. The creature can wait until after it rolls the d20 before deciding to use the Bardic Inspiration die, but must decide before the GM says whether the roll succeeds or fails. Once the Bardic Inspiration die is rolled, it is lost. A creature can have only one Bardic Inspiration die at a time. You can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain any expended uses when you finish a long rest.  Your Bardic Inspiration die changes when you reach certain levels in this class. The die becomes a d8 at 5th level, a d10 at 10th level, and a d12 at 15th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'beast-spells', 'Beast Spells', 'druid', '',
  18, 'Beginning at 18th level, you can cast many of your druid spells in any shape you assume using Wild Shape. You can perform the somatic and verbal components of a druid spell while in a beast shape, but you aren''t able to provide material components.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'blessed-healer', 'Blessed Healer', 'cleric', 'life',
  6, 'Beginning at 6th level, the healing spells you cast on others heal you as well. When you cast a spell of 1st level or higher that restores hit points to a creature other than you, you regain hit points equal to 2 + the spell''s level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'blindsense', 'Blindsense', 'rogue', '',
  14, 'Starting at 14th level, if you are able to hear, you are aware of the location of any hidden or invisible creature within 10 feet of you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bonus-cantrip', 'Bonus Cantrip', 'druid', 'land',
  2, 'When you choose this circle at 2nd level, you learn one additional druid cantrip of your choice.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bonus-proficiencies', 'Bonus Proficiencies', 'bard', 'lore',
  3, 'When you join the College of Lore at 3rd level, you gain proficiency with three skills of your choice.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'bonus-proficiency', 'Bonus Proficiency', 'cleric', 'life',
  1, 'When you choose this domain at 1st level, you gain proficiency with heavy armor.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'brutal-critical-1-die', 'Brutal Critical (1 die)', 'barbarian', '',
  9, 'Beginning at 9th level, you can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack. This increases to two additional dice at 13th level and three additional dice at 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'brutal-critical-2-dice', 'Brutal Critical (2 dice)', 'barbarian', '',
  13, 'Beginning at 9th level, you can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack. This increases to two additional dice at 13th level and three additional dice at 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'brutal-critical-3-dice', 'Brutal Critical (3 dice)', 'barbarian', '',
  17, 'Beginning at 9th level, you can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack. This increases to two additional dice at 13th level and three additional dice at 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'channel-divinity', 'Channel Divinity', 'paladin', '',
  3, 'Your oath allows you to channel divine energy to fuel magical effects. Each Channel Divinity option provided by your oath explains how to use it. When you use your Channel Divinity, you choose which option to use. You must then finish a short or long rest to use your Channel Divinity again. Some Channel Divinity effects require saving throws. When you use such an effect from this class, the DC equals your paladin spell save DC.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'channel-divinity-1-rest', 'Channel Divinity (1/rest)', 'cleric', '',
  2, 'At 2nd level, you gain the ability to channel divine energy directly from your deity, using that energy to fuel magical effects. You start with two such effects: Turn Undead and an effect determined by your domain. Some domains grant you additional effects as you advance in levels, as noted in the domain description. When you use your Channel Divinity, you choose which effect to create. You must then finish a short or long rest to use your Channel Divinity again. Some Channel Divinity effects require saving throws. When you use such an effect from this class, the DC equals your cleric spell save DC. Beginning at 6th level, you can use your Channel Divinity twice between rests, and beginning at 18th level, you can use it three times between rests. When you finish a short or long rest, you regain your expended uses.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'channel-divinity-2-rest', 'Channel Divinity (2/rest)', 'cleric', '',
  6, 'Beginning at 6th level, you can use your Channel Divinity twice between rests, and beginning at 18th level, you can use it three times between rests. When you finish a short or long rest, you regain your expended uses.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'channel-divinity-3-rest', 'Channel Divinity (3/rest)', 'cleric', '',
  18, 'Beginning at 6th level, you can use your Channel Divinity twice between rests, and beginning at 18th level, you can use it three times between rests. When you finish a short or long rest, you regain your expended uses.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'channel-divinity-preserve-life', 'Channel Divinity: Preserve Life', 'cleric', 'life',
  2, 'Starting at 2nd level, you can use your Channel Divinity to heal the badly injured. As an action, you present your holy symbol and evoke healing energy that can restore a number of hit points equal to five times your cleric level. Choose any creatures within 30 feet of you, and divide those hit points among them. This feature can restore a creature to no more than half of its hit point maximum. You can''t use this feature on an undead or a construct.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'channel-divinity-sacred-weapon', 'Channel Divinity: Sacred Weapon', 'paladin', 'devotion',
  3, 'As an action, you can imbue one weapon that you are holding with positive energy, using your Channel Divinity. For 1 minute, you add your Charisma modifier to attack rolls made with that weapon (with a minimum bonus of +1). The weapon also emits bright light in a 20-foot radius and dim light 20 feet beyond that. If the weapon is not already magical, it becomes magical for the duration. You can end this effect on your turn as part of any other action. If you are no longer holding or carrying this weapon, or if you fall unconscious, this effect ends.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'channel-divinity-turn-the-unholy', 'Channel Divinity: Turn the Unholy', 'paladin', 'devotion',
  3, 'As an action, you present your holy symbol and speak a prayer censuring fiends and undead, using your Channel Divinity. Each fiend or undead that can see or hear you within 30 feet of you must make a Wisdom saving throw. If the creature fails its saving throw, it is turned for 1 minute or until it takes damage. A turned creature must spend its turns trying to move as far away from you as it can, and it can''t willingly move to a space within 30 feet of you. It also can''t take reactions. For its action, it can use only the Dash action or try to escape from an effect that prevents it from moving. If there''s nowhere to move, the creature can use the Dodge action.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'channel-divinity-turn-undead', 'Channel Divinity: Turn Undead', 'cleric', '',
  2, 'As an action, you present your holy symbol and speak a prayer censuring the undead. Each undead that can see or hear you within 30 feet of you must make a Wisdom saving throw. If the creature fails its saving throw, it is turned for 1 minute or until it takes any damage. A turned creature must spend its turns trying to move as far away from you as it can, and it can''t willingly move to a space within 30 feet of you. It also can''t take reactions. For its action, it can use only the Dash action or try to escape from an effect that prevents it from moving. If there''s nowhere to move, the creature can use the Dodge action.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-of-the-land', 'Circle of the Land', 'druid', 'land',
  2, 'The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle''s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle''s mysterious rites.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-of-the-land-arctic', 'Circle of the Land: Arctic', 'druid', 'land',
  2, 'The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle''s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle''s mysterious rites.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-of-the-land-coast', 'Circle of the Land: Coast', 'druid', 'land',
  2, 'The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle''s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle''s mysterious rites.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-of-the-land-desert', 'Circle of the Land: Desert', 'druid', 'land',
  2, 'The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle''s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle''s mysterious rites.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-of-the-land-forest', 'Circle of the Land: Forest', 'druid', 'land',
  2, 'The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle''s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle''s mysterious rites.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-of-the-land-grassland', 'Circle of the Land: Grassland', 'druid', 'land',
  2, 'The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle''s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle''s mysterious rites.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-of-the-land-mountain', 'Circle of the Land: Mountain', 'druid', 'land',
  2, 'The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle''s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle''s mysterious rites.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-of-the-land-swamp', 'Circle of the Land: Swamp', 'druid', 'land',
  2, 'The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle''s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle''s mysterious rites.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-spells-1', 'Circle Spells', 'druid', 'land',
  3, 'Your mystical connection to the land infuses you with the ability to cast certain spells. At 3rd, 5th, 7th, and 9th level you gain access to circle spells connected to the land where you became a druid. Choose that land--arctic, coast, desert, forest, grassland, mountain, or swamp--and consult the associated list of spells. Once you gain access to a circle spell, you always have it prepared, and it doesn''t count against the number of spells you can prepare each day. If you gain access to a spell that doesn''t appear on the druid spell list, the spell is nonetheless a druid spell for you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-spells-2', 'Circle Spells', 'druid', 'land',
  5, 'Your mystical connection to the land infuses you with the ability to cast certain spells. At 3rd, 5th, 7th, and 9th level you gain access to circle spells connected to the land where you became a druid. Choose that land--arctic, coast, desert, forest, grassland, mountain, or swamp--and consult the associated list of spells. Once you gain access to a circle spell, you always have it prepared, and it doesn''t count against the number of spells you can prepare each day. If you gain access to a spell that doesn''t appear on the druid spell list, the spell is nonetheless a druid spell for you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-spells-3', 'Circle Spells', 'druid', 'land',
  7, 'Your mystical connection to the land infuses you with the ability to cast certain spells. At 3rd, 5th, 7th, and 9th level you gain access to circle spells connected to the land where you became a druid. Choose that land--arctic, coast, desert, forest, grassland, mountain, or swamp--and consult the associated list of spells. Once you gain access to a circle spell, you always have it prepared, and it doesn''t count against the number of spells you can prepare each day. If you gain access to a spell that doesn''t appear on the druid spell list, the spell is nonetheless a druid spell for you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'circle-spells-4', 'Circle Spells', 'druid', 'land',
  9, 'Your mystical connection to the land infuses you with the ability to cast certain spells. At 3rd, 5th, 7th, and 9th level you gain access to circle spells connected to the land where you became a druid. Choose that land--arctic, coast, desert, forest, grassland, mountain, or swamp--and consult the associated list of spells. Once you gain access to a circle spell, you always have it prepared, and it doesn''t count against the number of spells you can prepare each day. If you gain access to a spell that doesn''t appear on the druid spell list, the spell is nonetheless a druid spell for you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'cleansing-touch', 'Cleansing Touch', 'paladin', '',
  14, 'Beginning at 14th level, you can use your action to end one spell on yourself or on one willing creature that you touch. You can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain expended uses when you finish a long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'cleric-ability-score-improvement-1', 'Ability Score Improvement', 'cleric', '',
  4, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'cleric-ability-score-improvement-2', 'Ability Score Improvement', 'cleric', '',
  8, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'cleric-ability-score-improvement-3', 'Ability Score Improvement', 'cleric', '',
  12, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'cleric-ability-score-improvement-4', 'Ability Score Improvement', 'cleric', '',
  16, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'cleric-ability-score-improvement-5', 'Ability Score Improvement', 'cleric', '',
  19, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'countercharm', 'Countercharm', 'bard', '',
  6, 'At 6th level, you gain the ability to use musical notes or words of power to disrupt mind-influencing effects. As an action, you can start a performance that lasts until the end of your next turn. During that time, you and any friendly creatures within 30 feet of you have advantage on saving throws against being frightened or charmed. A creature must be able to hear you to gain this benefit. The performance ends early if you are incapacitated or silenced or if you voluntarily end it (no action required).', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'cunning-action', 'Cunning Action', 'rogue', '',
  2, 'Starting at 2nd level, your quick thinking and agility allow you to move and act quickly. You can take a bonus action on each of your turns in combat. This action can be used only to take the Dash, Disengage, or Hide action.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'cutting-words', 'Cutting Words', 'bard', 'lore',
  3, 'Also at 3rd level, you learn how to use your wit to distract, confuse, and otherwise sap the confidence and competence of others. When a creature that you can see within 60 feet of you makes an attack roll, an ability check, or a damage roll, you can use your reaction to expend one of your uses of Bardic Inspiration, rolling a Bardic Inspiration die and subtracting the number rolled from the creature''s roll. You can choose to use this feature after the creature makes its roll, but before the GM determines whether the attack roll or ability check succeeds or fails, or before the creature deals its damage. The creature is immune if it can''t hear you or if it''s immune to being charmed.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'danger-sense', 'Danger Sense', 'barbarian', '',
  2, 'At 2nd level, you gain an uncanny sense of when things nearby aren''t as they should be, giving you an edge when you dodge away from danger. You have advantage on Dexterity saving throws against effects that you can see, such as traps and spells. To gain this benefit, you can''t be blinded, deafened, or incapacitated.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dark-ones-blessing', 'Dark One''s Blessing', 'warlock', 'fiend',
  1, 'Starting at 1st level, when you reduce a hostile creature to 0 hit points, you gain temporary hit points equal to your Charisma modifier + your warlock level (minimum of 1).', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dark-ones-own-luck', 'Dark One''s Own Luck', 'warlock', 'fiend',
  6, 'Starting at 6th level, you can call on your patron to alter fate in your favor. When you make an ability check or a saving throw, you can use this feature to add a d10 to your roll. You can do so after seeing the initial roll but before any of the roll''s effects occur. Once you use this feature, you can''t use it again until you finish a short or long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'defensive-tactics', 'Defensive Tactics', 'ranger', 'hunter',
  7, 'At 7th level, you gain one of the following features of your choice. Escape the Horde Multiattack Defense Steel Will', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'defensive-tactics-escape-the-horde', 'Defensive Tactics: Escape the Horde', 'ranger', 'hunter',
  7, 'Opportunity attacks against you are made with disadvantage.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'defensive-tactics-multiattack-defense', 'Defensive Tactics: Multiattack Defense', 'ranger', 'hunter',
  7, 'When a creature hits you with an attack, you gain a +4 bonus to AC against all subsequent attacks made by that creature for the rest of the turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'defensive-tactics-steel-will', 'Defensive Tactics: Steel Will', 'ranger', 'hunter',
  7, 'You have advantage on saving throws against being frightened.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'deflect-missiles', 'Deflect Missiles', 'monk', '',
  3, 'Starting at 3rd level, you can use your reaction to deflect or catch the missile when you are hit by a ranged weapon attack. When you do so, the damage you take from the attack is reduced by 1d10 + your Dexterity modifier + your monk level. If you reduce the damage to 0, you can catch the missile if it is small enough for you to hold in one hand and you have at least one hand free. If you catch a missile in this way, you can spend 1 ki point to make a ranged attack with the weapon or piece of ammunition you just caught, as part of the same reaction. You make this attack with proficiency, regardless of your weapon proficiencies, and the missile counts as a monk weapon for the attack, which has a normal range of 20 feet and a long range of 60 feet.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'destroy-undead-cr-1-2-or-below', 'Destroy Undead (CR 1/2 or below)', 'cleric', '',
  5, 'Starting at 5th level, when an undead fails its saving throw against your Turn Undead feature, the creature is instantly destroyed if its challenge rating is at or below a certain threshold.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'destroy-undead-cr-1-or-below', 'Destroy Undead (CR 1 or below)', 'cleric', '',
  8, 'Starting at 5th level, when an undead fails its saving throw against your Turn Undead feature, the creature is instantly destroyed if its challenge rating is at or below a certain threshold.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'destroy-undead-cr-2-or-below', 'Destroy Undead (CR 2 or below)', 'cleric', '',
  11, 'Starting at 5th level, when an undead fails its saving throw against your Turn Undead feature, the creature is instantly destroyed if its challenge rating is at or below a certain threshold.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'destroy-undead-cr-3-or-below', 'Destroy Undead (CR 3 or below)', 'cleric', '',
  14, 'Starting at 5th level, when an undead fails its saving throw against your Turn Undead feature, the creature is instantly destroyed if its challenge rating is at or below a certain threshold.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'destroy-undead-cr-4-or-below', 'Destroy Undead (CR 4 or below)', 'cleric', '',
  17, 'Starting at 5th level, when an undead fails its saving throw against your Turn Undead feature, the creature is instantly destroyed if its challenge rating is at or below a certain threshold.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'diamond-soul', 'Diamond Soul', 'monk', '',
  14, 'Beginning at 14th level, your mastery of ki grants you proficiency in all saving throws. Additionally, whenever you make a saving throw and fail, you can spend 1 ki point to reroll it and take the second result.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'disciple-of-life', 'Disciple of Life', 'cleric', 'life',
  1, 'Also starting at 1st level, your healing spells are more effective. Whenever you use a spell of 1st level or higher to restore hit points to a creature, the creature regains additional hit points equal to 2 + the spell''s level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'divine-domain', 'Divine Domain', 'cleric', '',
  1, 'Choose one domain related to your deity, such as Knowledge, Life, Light, Nature, Tempest, Trickery, or War. Only the Life domain is detailed in the Open Game Licensed SRD. Additional Domains are described in the official rulebooks or products from other publishers. Your domain grants you domain spells and other features when you choose it at 1st level. It also grants you additional ways to use Channel Divinity when you gain that feature at 2nd level, and additional benefits at 6th, 8th, and 17th levels.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'divine-domain-improvement-1', 'Divine Domain feature', 'cleric', '',
  2, 'Choose one domain related to your deity, such as Knowledge, Life, Light, Nature, Tempest, Trickery, or War. Only the Life domain is detailed in the Open Game Licensed SRD. Additional Domains are described in the official rulebooks or products from other publishers. Your domain grants you domain spells and other features when you choose it at 1st level. It also grants you additional ways to use Channel Divinity when you gain that feature at 2nd level, and additional benefits at 6th, 8th, and 17th levels.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'divine-domain-improvement-2', 'Divine Domain feature', 'cleric', '',
  6, 'Choose one domain related to your deity, such as Knowledge, Life, Light, Nature, Tempest, Trickery, or War. Only the Life domain is detailed in the Open Game Licensed SRD. Additional Domains are described in the official rulebooks or products from other publishers. Your domain grants you domain spells and other features when you choose it at 1st level. It also grants you additional ways to use Channel Divinity when you gain that feature at 2nd level, and additional benefits at 6th, 8th, and 17th levels.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'divine-domain-improvement-3', 'Divine Domain feature', 'cleric', '',
  8, 'Choose one domain related to your deity, such as Knowledge, Life, Light, Nature, Tempest, Trickery, or War. Only the Life domain is detailed in the Open Game Licensed SRD. Additional Domains are described in the official rulebooks or products from other publishers. Your domain grants you domain spells and other features when you choose it at 1st level. It also grants you additional ways to use Channel Divinity when you gain that feature at 2nd level, and additional benefits at 6th, 8th, and 17th levels.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'divine-domain-improvement-4', 'Divine Domain feature', 'cleric', '',
  17, 'Choose one domain related to your deity, such as Knowledge, Life, Light, Nature, Tempest, Trickery, or War. Only the Life domain is detailed in the Open Game Licensed SRD. Additional Domains are described in the official rulebooks or products from other publishers. Your domain grants you domain spells and other features when you choose it at 1st level. It also grants you additional ways to use Channel Divinity when you gain that feature at 2nd level, and additional benefits at 6th, 8th, and 17th levels.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'divine-health', 'Divine Health', 'paladin', '',
  3, 'By 3rd level, the divine magic flowing through you makes you immune to disease.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'divine-intervention', 'Divine Intervention', 'cleric', '',
  10, 'Beginning at 10th level, you can call on your deity to intervene on your behalf when your need is great. Imploring your deity''s aid requires you to use your action. Describe the assistance you seek, and roll percentile dice. If you roll a number equal to or lower than your cleric level, your deity intervenes. The GM chooses the nature of the intervention; the effect of any cleric spell or cleric domain spell would be appropriate. If your deity intervenes, you can''t use this feature again for 7 days. Otherwise, you can use it again after you finish a long rest. At 20th level, your call for intervention succeeds automatically, no roll required.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'divine-intervention-improvement', 'Divine Intervention Improvement', 'cleric', '',
  20, 'At 20th level, your call for intervention succeeds automatically, no roll required.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'divine-sense', 'Divine Sense', 'paladin', '',
  1, 'The presence of strong evil registers on your senses like a noxious odor, and powerful good rings like heavenly music in your ears. As an action, you can open your awareness to detect such forces. Until the end of your next turn, you know the location of any celestial, fiend, or undead within 60 feet of you that is not behind total cover. You know the type (celestial, fiend, or undead) of any being whose presence you sense, but not its identity. Within the same radius, you also detect the presence of any place or object that has been consecrated or desecrated, as with the hallow spell. You can use this feature a number of times equal to 1 + your Charisma modifier. When you finish a long rest, you regain all expended uses.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'divine-smite', 'Divine Smite', 'paladin', '',
  2, 'Starting at 2nd level, when you hit a creature with a melee weapon attack, you can expend one spell slot to deal radiant damage to the target, in addition to the weapon''s damage. The extra damage is 2d8 for a 1st-level spell slot, plus 1d8 for each spell level higher than 1st, to a maximum of 5d8. The damage increases by 1d8 if the target is an undead or a fiend.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'divine-strike', 'Divine Strike', 'cleric', 'life',
  8, 'At 8th level, you gain the ability to infuse your weapon strikes with divine energy. Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 radiant damage to the target. When you reach 14th level, the extra damage increases to 2d8.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'domain-spells-1', 'Domain Spells', 'cleric', '',
  1, 'Each domain has a list of spells--its domain spells--that you gain at the cleric levels noted in the domain description. Once you gain a domain spell, you always have it prepared, and it doesn''t count against the number of spells you can prepare each day. If you have a domain spell that doesn''t appear on the cleric spell list, the spell is nonetheless a cleric spell for you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'domain-spells-2', 'Domain Spells', 'cleric', '',
  3, 'Each domain has a list of spells--its domain spells--that you gain at the cleric levels noted in the domain description. Once you gain a domain spell, you always have it prepared, and it doesn''t count against the number of spells you can prepare each day. If you have a domain spell that doesn''t appear on the cleric spell list, the spell is nonetheless a cleric spell for you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'domain-spells-3', 'Domain Spells', 'cleric', '',
  5, 'Each domain has a list of spells--its domain spells--that you gain at the cleric levels noted in the domain description. Once you gain a domain spell, you always have it prepared, and it doesn''t count against the number of spells you can prepare each day. If you have a domain spell that doesn''t appear on the cleric spell list, the spell is nonetheless a cleric spell for you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'domain-spells-4', 'Domain Spells', 'cleric', '',
  7, 'Each domain has a list of spells--its domain spells--that you gain at the cleric levels noted in the domain description. Once you gain a domain spell, you always have it prepared, and it doesn''t count against the number of spells you can prepare each day. If you have a domain spell that doesn''t appear on the cleric spell list, the spell is nonetheless a cleric spell for you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'domain-spells-5', 'Domain Spells', 'cleric', '',
  9, 'Each domain has a list of spells--its domain spells--that you gain at the cleric levels noted in the domain description. Once you gain a domain spell, you always have it prepared, and it doesn''t count against the number of spells you can prepare each day. If you have a domain spell that doesn''t appear on the cleric spell list, the spell is nonetheless a cleric spell for you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'draconic-presence', 'Draconic Presence', 'sorcerer', 'draconic',
  18, 'Beginning at 18th level, you can channel the dread presence of your dragon ancestor, causing those around you to become awestruck or frightened. As an action, you can spend 5 sorcery points to draw on this power and exude an aura of awe or fear (your choice) to a distance of 60 feet. For 1 minute or until you lose your concentration (as if you were casting a concentration spell), each hostile creature that starts its turn in this aura must succeed on a Wisdom saving throw or be charmed (if you chose awe) or frightened (if you chose fear) until the aura ends. A creature that succeeds on this saving throw is immune to your aura for 24 hours.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'draconic-resilience', 'Draconic Resilience', 'sorcerer', 'draconic',
  1, 'As magic flows through your body, it causes physical traits of your dragon ancestors to emerge. At 1st level, your hit point maximum increases by 1 and increases by 1 again whenever you gain a level in this class. Additionally, parts of your skin are covered by a thin sheen of dragon-like scales. When you aren''t wearing armor, your AC equals 13 + your Dexterity modifier.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-ancestor', 'Dragon Ancestor', 'sorcerer', 'draconic',
  1, 'At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-ancestor-black---acid-damage', 'Dragon Ancestor: Black - Acid Damage', 'sorcerer', 'draconic',
  1, 'At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-ancestor-blue---lightning-damage', 'Dragon Ancestor: Blue - Lightning Damage', 'sorcerer', 'draconic',
  1, 'At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-ancestor-brass---fire-damage', 'Dragon Ancestor: Brass - Fire Damage', 'sorcerer', 'draconic',
  1, 'At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-ancestor-bronze---lightning-damage', 'Dragon Ancestor: Bronze - Lightning Damage', 'sorcerer', 'draconic',
  1, 'At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-ancestor-copper---acid-damage', 'Dragon Ancestor: Copper - Acid Damage', 'sorcerer', 'draconic',
  1, 'At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-ancestor-gold---fire-damage', 'Dragon Ancestor: Gold - Fire Damage', 'sorcerer', 'draconic',
  1, 'At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-ancestor-green---poison-damage', 'Dragon Ancestor: Green - Poison Damage', 'sorcerer', 'draconic',
  1, 'At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-ancestor-red---fire-damage', 'Dragon Ancestor: Red - Fire Damage', 'sorcerer', 'draconic',
  1, 'At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-ancestor-silver---cold-damage', 'Dragon Ancestor: Silver - Cold Damage', 'sorcerer', 'draconic',
  1, 'At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-ancestor-white---cold-damage', 'Dragon Ancestor: White - Cold Damage', 'sorcerer', 'draconic',
  1, 'At 1st level, you choose one type of dragon as your ancestor. The damage type associated with each dragon is used by features you gain later. You can speak, read, and write Draconic. Additionally, whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'dragon-wings', 'Dragon Wings', 'sorcerer', 'draconic',
  14, 'At 14th level, you gain the ability to sprout a pair of dragon wings from your back, gaining a flying speed equal to your current speed. You can create these wings as a bonus action on your turn. They last until you dismiss them as a bonus action on your turn. You can''t manifest your wings while wearing armor unless the armor is made to accommodate them, and clothing not made to accommodate your wings might be destroyed when you manifest them.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druid-ability-score-improvement-1', 'Ability Score Improvement', 'druid', '',
  4, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druid-ability-score-improvement-2', 'Ability Score Improvement', 'druid', '',
  8, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druid-ability-score-improvement-3', 'Ability Score Improvement', 'druid', '',
  12, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druid-ability-score-improvement-4', 'Ability Score Improvement', 'druid', '',
  16, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druid-ability-score-improvement-5', 'Ability Score Improvement', 'druid', '',
  19, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druid-circle', 'Druid Circle', 'druid', '',
  2, 'At 2nd level, you choose to identify with a circle of druids, such as the Circle of the Land. Your choice grants you features at 2nd level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druid-circle-improvement-1', 'Druid Circle feature', 'druid', '',
  6, 'At 2nd level, you choose to identify with a circle of druids, such as the Circle of the Land. Your choice grants you features at 2nd level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druid-circle-improvement-2', 'Druid Circle feature', 'druid', '',
  10, 'At 2nd level, you choose to identify with a circle of druids, such as the Circle of the Land. Your choice grants you features at 2nd level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druid-circle-improvement-3', 'Druid Circle feature', 'druid', '',
  14, 'At 2nd level, you choose to identify with a circle of druids, such as the Circle of the Land. Your choice grants you features at 2nd level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druid-lands-stride', 'Land''s Stride', 'druid', 'land',
  6, 'Starting at 6th level, moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard. In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such those created by the entangle spell.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druid-timeless-body', 'Timeless Body', 'druid', '',
  18, 'Starting at 18th level, the primal magic that you wield causes you to age more slowly. For every 10 years that pass, your body ages only 1 year.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'druidic', 'Druidic', 'druid', '',
  1, 'You know Druidic, the secret language of druids. You can speak the language and use it to leave hidden messages. You and others who know this language automatically spot such a message. Others spot the message''s presence with a successful DC 15 Wisdom (Perception) check but can''t decipher it without magic.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-agonizing-blast', 'Eldritch Invocation: Agonizing Blast', 'warlock', '',
  2, 'When you cast eldritch blast, add your Charisma modifier to the damage it deals on a hit.', '[{"type":"spell"}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-armor-of-shadows', 'Eldritch Invocation: Armor of Shadows', 'warlock', '',
  2, 'You can cast mage armor on yourself at will, without expending a spell slot or material components.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-ascendant-step', 'Eldritch Invocation: Ascendant Step', 'warlock', '',
  9, 'You can cast levitate on yourself at will, without expending a spell slot or material components.', '[{"type":"level","level":9}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-beast-speech', 'Eldritch Invocation: Beast Speech', 'warlock', '',
  2, 'You can cast speak with animals at will, without expending a spell slot.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-beguiling-influence', 'Eldritch Invocation: Beguiling Influence', 'warlock', '',
  2, 'You gain proficiency in the Deception and Persuasion skills.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-bewitching-whispers', 'Eldritch Invocation: Bewitching Whispers', 'warlock', '',
  7, 'You can cast compulsion once using a warlock spell slot. You can''t do so again until you finish a long rest.', '[{"type":"level","level":7}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-book-of-ancient-secrets', 'Eldritch Invocation: Book of Ancient Secrets', 'warlock', '',
  2, 'You can now inscribe magical rituals in your Book of Shadows. Choose two 1st-level spells that have the ritual tag from any class''s spell list (the two needn''t be from the same list). The spells appear in the book and don''t count against the number of spells you know. With your Book of Shadows in hand, you can cast the chosen spells as rituals. You can''t cast the spells except as rituals, unless you''ve learned them by some other means. You can also cast a warlock spell you know as a ritual if it has the ritual tag. On your adventures, you can add other ritual spells to your Book of Shadows. When you find such a spell, you can add it to the book if the spell''s level is equal to or less than half your warlock level (rounded up) and if you can spare the time to transcribe the spell. For each level of the spell, the transcription process takes 2 hours and costs 50 gp for the rare inks needed to inscribe it.', '[{"type":"feature"}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-chains-of-carceri', 'Eldritch Invocation: Chains of Carceri', 'warlock', '',
  15, 'You can cast hold monster at will--targeting a celestial, fiend, or elemental--without expending a spell slot or material components. You must finish a long rest before you can use this invocation on the same creature again.', '[{"type":"level","level":15},{"type":"feature"}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-devils-sight', 'Eldritch Invocation: Devil''s Sight', 'warlock', '',
  2, 'You can see normally in darkness, both magical and nonmagical, to a distance of 120 feet.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-dreadful-word', 'Eldritch Invocation: Dreadful Word', 'warlock', '',
  7, 'You can cast confusion once using a warlock spell slot. You can''t do so again until you finish a long rest.', '[{"type":"level","level":7}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-eldritch-sight', 'Eldritch Invocation: Eldritch Sight', 'warlock', '',
  2, 'You can cast detect magic at will, without expending a spell slot.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-eldritch-spear', 'Eldritch Invocation: Eldritch Spear', 'warlock', '',
  2, 'When you cast eldritch blast, its range is 300 feet.', '[{"type":"spell"}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-eyes-of-the-rune-keeper', 'Eldritch Invocation: Eyes of the Rune Keeper', 'warlock', '',
  2, 'You can read all writing.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-fiendish-vigor', 'Eldritch Invocation: Fiendish Vigor', 'warlock', '',
  2, 'You can cast false life on yourself at will as a 1st-level spell, without expending a spell slot or material components.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-gaze-of-two-minds', 'Eldritch Invocation: Gaze of Two Minds', 'warlock', '',
  2, 'You can use your action to touch a willing humanoid and perceive through its senses until the end of your next turn. As long as the creature is on the same plane of existence as you, you can use your action on subsequent turns to maintain this connection, extending the duration until the end of your next turn. While perceiving through the other creature''s senses, you benefit from any special senses possessed by that creature, and you are blinded and deafened to your own surroundings.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-lifedrinker', 'Eldritch Invocation: Lifedrinker', 'warlock', '',
  12, 'When you hit a creature with your pact weapon, the creature takes extra necrotic damage equal to your Charisma modifier (minimum 1).', '[{"type":"level","level":12},{"type":"feature"}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-mask-of-many-faces', 'Eldritch Invocation: Mask of Many Faces', 'warlock', '',
  2, 'You can cast disguise self at will, without expending a spell slot.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-master-of-myriad-forms', 'Eldritch Invocation: Master of Myriad Forms', 'warlock', '',
  15, 'You can cast alter self at will, without expending a spell slot.', '[{"type":"level","level":15}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-minions-of-chaos', 'Eldritch Invocation: Minions of Chaos', 'warlock', '',
  9, 'You can cast conjure elemental once using a warlock spell slot. You can''t do so again until you finish a long rest.', '[{"type":"level","level":9}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-mire-the-mind', 'Eldritch Invocation: Mire the Mind', 'warlock', '',
  5, 'You can cast slow once using a warlock spell slot. You can''t do so again until you finish a long rest.', '[{"type":"level","level":5}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-misty-visions', 'Eldritch Invocation: Misty Visions', 'warlock', '',
  2, 'You can cast silent image at will, without expending a spell slot or material components.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-one-with-shadows', 'Eldritch Invocation: One with Shadows', 'warlock', '',
  5, 'When you are in an area of dim light or darkness, you can use your action to become invisible until you move or take an action or a reaction.', '[{"type":"level","level":5}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-otherworldly-leap', 'Eldritch Invocation: Otherworldly Leap', 'warlock', '',
  9, 'You can cast jump on yourself at will, without expending a spell slot or material components.', '[{"type":"level","level":9}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-repelling-blast', 'Eldritch Invocation: Repelling Blast', 'warlock', '',
  2, 'When you hit a creature with eldritch blast, you can push the creature up to 10 feet away from you in a straight line.', '[{"type":"spell"}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-sculptor-of-flesh', 'Eldritch Invocation: Sculptor of Flesh', 'warlock', '',
  7, 'You can cast polymorph once using a warlock spell slot. You can''t do so again until you finish a long rest.', '[{"type":"level","level":7}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-sign-of-ill-omen', 'Eldritch Invocation: Sign of Ill Omen', 'warlock', '',
  5, 'You can cast bestow curse once using a warlock spell slot. You can''t do so again until you finish a long rest.', '[{"type":"level","level":5}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-thief-of-five-fates', 'Eldritch Invocation: Thief of Five Fates', 'warlock', '',
  2, 'You can cast bane once using a warlock spell slot. You can''t do so again until you finish a long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-thirsting-blade', 'Eldritch Invocation: Thirsting Blade', 'warlock', '',
  5, 'You can attack with your pact weapon twice, instead of once, whenever you take the Attack action on your turn.', '[{"type":"level","level":5},{"type":"feature"}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-visions-of-distant-realms', 'Eldritch Invocation: Visions of Distant Realms', 'warlock', '',
  15, 'You can cast arcane eye at will, without expending a spell slot.', '[{"type":"level","level":15}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-voice-of-the-chain-master', 'Eldritch Invocation: Voice of the Chain Master', 'warlock', '',
  2, 'You can communicate telepathically with your familiar and perceive through your familiar''s senses as long as you are on the same plane of existence. Additionally, while perceiving through your familiar''s senses, you can also speak through your familiar in your own voice, even if your familiar is normally incapable of speech.', '[{"type":"feature"}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-whispers-of-the-grave', 'Eldritch Invocation: Whispers of the Grave', 'warlock', '',
  9, 'You can cast speak with dead at will, without expending a spell slot.', '[{"type":"level","level":9}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocation-witch-sight', 'Eldritch Invocation: Witch Sight', 'warlock', '',
  15, 'You can see the true form of any shapechanger or creature concealed by illusion or transmutation magic while the creature is within 30 feet of you and within line of sight.', '[{"type":"level","level":15}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-invocations', 'Eldritch Invocations', 'warlock', '',
  2, 'In your study of occult lore, you have unearthed eldritch invocations, fragments of forbidden knowledge that imbue you with an abiding magical ability. At 2nd level, you gain two eldritch invocations of your choice. Your invocation options are detailed at the end of the class description. When you gain certain warlock levels, you gain additional invocations of your choice, as shown in the Invocations Known column of the Warlock table. Additionally, when you gain a level in this class, you can choose one of the invocations you know and replace it with another invocation that you could learn at that level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'eldritch-master', 'Eldritch Master', 'warlock', '',
  20, 'At 20th level, you can draw on your inner reserve of mystical power while entreating your patron to regain expended spell slots. You can spend 1 minute entreating your patron for aid to regain all your expended spell slots from your Pact Magic feature. Once you regain spell slots with this feature, you must finish a long rest before you can do so again.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'elemental-affinity', 'Elemental Affinity', 'sorcerer', 'draconic',
  6, 'Starting at 6th level, when you cast a spell that deals damage of the type associated with your draconic ancestry, you can add your Charisma modifier to one damage roll of that spell. At the same time, you can spend 1 sorcery point to gain resistance to that damage type for 1 hour.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'elusive', 'Elusive', 'rogue', '',
  18, 'Beginning at 18th level, you are so evasive that attackers rarely gain the upper hand against you. No attack roll has advantage against you while you aren''t incapacitated.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'empowered-evocation', 'Empowered Evocation', 'wizard', 'evocation',
  10, 'Beginning at 10th level, you can add your Intelligence modifier to one damage roll of any wizard evocation spell you cast.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'empty-body', 'Empty Body', 'monk', '',
  18, 'Beginning at 18th level, you can use your action to spend 4 ki points to become invisible for 1 minute. During that time, you also have resistance to all damage but force damage. Additionally, you can spend 8 ki points to cast the astral projection spell, without needing material components. When you do so, you can''t take any other creatures with you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'evocation-savant', 'Evocation Savant', 'wizard', 'evocation',
  2, 'Beginning when you select this school at 2nd level, the gold and time you must spend to copy an evocation spell into your spellbook is halved.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'extra-attack-1', 'Extra Attack', 'fighter', '',
  5, 'Beginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn. The number of attacks increases to three when you reach 11th level in this class and to four when you reach 20th level in this class.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'extra-attack-2', 'Extra Attack (2)', 'fighter', '',
  11, 'Beginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn. The number of attacks increases to three when you reach 11th level in this class and to four when you reach 20th level in this class.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'extra-attack-3', 'Extra Attack (3)', 'fighter', '',
  20, 'Beginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn. The number of attacks increases to three when you reach 11th level in this class and to four when you reach 20th level in this class.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fast-hands', 'Fast Hands', 'rogue', 'thief',
  3, 'Starting at 3rd level, you can use the bonus action granted by your Cunning Action to make a Dexterity (Sleight of Hand) check, use your thieves'' tools to disarm a trap or open a lock, or take the Use an Object action.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fast-movement', 'Fast Movement', 'barbarian', '',
  5, 'Starting at 5th level, your speed increases by 10 feet while you aren''t wearing heavy armor.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'favored-enemy-1-type', 'Favored Enemy (1 type)', 'ranger', '',
  1, 'Beginning at 1st level, you have significant experience studying, tracking, hunting, and even talking to a certain type of enemy. Choose a type of favored enemy: aberrations, beasts, celestials, constructs, dragons, elementals, fey, fiends, giants, monstrosities, oozes, plants, or undead. Alternatively, you can select two races of humanoid (such as gnolls and orcs) as favored enemies. You have advantage on Wisdom (Survival) checks to track your favored enemies, as well as on Intelligence checks to recall information about them. When you gain this feature, you also learn one language of your choice that is spoken by your favored enemies, if they speak one at all. You choose one additional favored enemy, as well as an associated language, at 6th and 14th level. As you gain levels, your choices should reflect the types of monsters you have encountered on your adventures.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'favored-enemy-2-types', 'Favored Enemy (2 types)', 'ranger', '',
  6, 'Beginning at 1st level, you have significant experience studying, tracking, hunting, and even talking to a certain type of enemy. Choose a type of favored enemy: aberrations, beasts, celestials, constructs, dragons, elementals, fey, fiends, giants, monstrosities, oozes, plants, or undead. Alternatively, you can select two races of humanoid (such as gnolls and orcs) as favored enemies. You have advantage on Wisdom (Survival) checks to track your favored enemies, as well as on Intelligence checks to recall information about them. When you gain this feature, you also learn one language of your choice that is spoken by your favored enemies, if they speak one at all. You choose one additional favored enemy, as well as an associated language, at 6th and 14th level. As you gain levels, your choices should reflect the types of monsters you have encountered on your adventures.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'favored-enemy-3-enemies', 'Favored Enemy (3 enemies)', 'ranger', '',
  14, 'Beginning at 1st level, you have significant experience studying, tracking, hunting, and even talking to a certain type of enemy. Choose a type of favored enemy: aberrations, beasts, celestials, constructs, dragons, elementals, fey, fiends, giants, monstrosities, oozes, plants, or undead. Alternatively, you can select two races of humanoid (such as gnolls and orcs) as favored enemies. You have advantage on Wisdom (Survival) checks to track your favored enemies, as well as on Intelligence checks to recall information about them. When you gain this feature, you also learn one language of your choice that is spoken by your favored enemies, if they speak one at all. You choose one additional favored enemy, as well as an associated language, at 6th and 14th level. As you gain levels, your choices should reflect the types of monsters you have encountered on your adventures.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'feral-instinct', 'Feral Instinct', 'barbarian', '',
  7, 'By 7th level, your instincts are so honed that you have advantage on initiative rolls. Additionally, if you are surprised at the beginning of combat and aren''t incapacitated, you can act normally on your first turn, but only if you enter your rage before doing anything else on that turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'feral-senses', 'Feral Senses', 'ranger', '',
  18, 'At 18th level, you gain preternatural senses that help you fight creatures you can''t see. When you attack a creature you can''t see, your inability to see it doesn''t impose disadvantage on your attack rolls against it. You are also aware of the location of any invisible creature within 30 feet of you, provided that the creature isn''t hidden from you and you aren''t blinded or deafened.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fiendish-resilience', 'Fiendish Resilience', 'warlock', 'fiend',
  10, 'Starting at 10th level, you can choose one damage type when you finish a short or long rest. You gain resistance to that damage type until you choose a different one with this feature. Damage from magical weapons or silver weapons ignores this resistance.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-ability-score-improvement-1', 'Ability Score Improvement', 'fighter', '',
  4, 'When you reach 4th level, and again at 6th, 8th, 12th, 14th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-ability-score-improvement-2', 'Ability Score Improvement', 'fighter', '',
  6, 'When you reach 4th level, and again at 6th, 8th, 12th, 14th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-ability-score-improvement-3', 'Ability Score Improvement', 'fighter', '',
  8, 'When you reach 4th level, and again at 6th, 8th, 12th, 14th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-ability-score-improvement-4', 'Ability Score Improvement', 'fighter', '',
  12, 'When you reach 4th level, and again at 6th, 8th, 12th, 14th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-ability-score-improvement-5', 'Ability Score Improvement', 'fighter', '',
  14, 'When you reach 4th level, and again at 6th, 8th, 12th, 14th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-ability-score-improvement-6', 'Ability Score Improvement', 'fighter', '',
  16, 'When you reach 4th level, and again at 6th, 8th, 12th, 14th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-ability-score-improvement-7', 'Ability Score Improvement', 'fighter', '',
  19, 'When you reach 4th level, and again at 6th, 8th, 12th, 14th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-fighting-style', 'Fighting Style', 'fighter', '',
  1, 'You adopt a particular style of fighting as your specialty. Choose one of the following options. You can''t take a Fighting Style option more than once, even if you later get to choose again.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-fighting-style-archery', 'Fighting Style: Archery', 'fighter', '',
  1, 'You gain a +2 bonus to attack rolls you make with ranged weapons.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-fighting-style-defense', 'Fighting Style: Defense', 'fighter', '',
  1, 'While you are wearing armor, you gain a +1 bonus to AC.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-fighting-style-dueling', 'Fighting Style: Dueling', 'fighter', '',
  1, 'When you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-fighting-style-great-weapon-fighting', 'Fighting Style: Great Weapon Fighting', 'fighter', '',
  1, 'When you roll a 1 or 2 on a damage die for an attack you make with a melee weapon that you are wielding with two hands, you can reroll the die and must use the new roll, even if the new roll is a 1 or a 2. The weapon must have the two-handed or versatile property for you to gain this benefit.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-fighting-style-protection', 'Fighting Style: Protection', 'fighter', '',
  1, 'When a creature you can see attacks a target other than you that is within 5 feet of you, you can use your reaction to impose disadvantage on the attack roll. You must be wielding a shield.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighter-fighting-style-two-weapon-fighting', 'Fighting Style: Two-Weapon Fighting', 'fighter', '',
  1, 'When you engage in two-weapon fighting, you can add your ability modifier to the damage of the second attack.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighting-style-defense', 'Fighting Style: Defense', 'paladin', '',
  2, 'While you are wearing armor, you gain a +1 bonus to AC.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighting-style-dueling', 'Fighting Style: Dueling', 'paladin', '',
  2, 'When you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighting-style-great-weapon-fighting', 'Fighting Style: Great Weapon Fighting', 'paladin', '',
  2, 'When you roll a 1 or 2 on a damage die for an attack you make with a melee weapon that you are wielding with two hands, you can reroll the die and must use the new roll. The weapon must have the two-handed or versatile property for you to gain this benefit.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'fighting-style-protection', 'Fighting Style: Protection', 'paladin', '',
  2, 'When a creature you can see attacks a target other than you that is within 5 feet of you, you can use your reaction to impose disadvantage on the attack roll. You must be wielding a shield.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'flexible-casting-converting-spell-slot', 'Flexible Casting: Converting Spell Slot', 'sorcerer', '',
  2, 'As a bonus action on your turn, you can expend one spell slot and gain a number of sorcery points equal to the slot''s level..', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'flexible-casting-creating-spell-slots', 'Flexible Casting: Creating Spell Slots', 'sorcerer', '',
  2, 'You can transform unexpended sorcery points into one spell slot as a bonus action on your turn. The Creating Spell Slots table shows the cost of creating a spell slot of a given level. You can create spell slots no higher in level than 5th.  Any spell slot you create with this feature vanishes when you finish a long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'flurry-of-blows', 'Flurry of Blows', 'monk', '',
  2, 'Immediately after you take the Attack action on your turn, you can spend 1 ki point to make two unarmed strikes as a bonus action.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'foe-slayer', 'Foe Slayer', 'ranger', '',
  20, 'At 20th level, you become an unparalleled hunter of your enemies. Once on each of your turns, you can add your Wisdom modifier to the attack roll or the damage roll of an attack you make against one of your favored enemies. You can choose to use this feature before or after the roll, but before any effects of the roll are applied.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'font-of-inspiration', 'Font of Inspiration', 'bard', '',
  5, 'Beginning when you reach 5th level, you regain all of your expended uses of Bardic Inspiration when you finish a short or long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'font-of-magic', 'Font of Magic', 'sorcerer', '',
  2, 'At 2nd level, you tap into a deep wellspring of magic within yourself. This wellspring is represented by sorcery points, which allow you to create a variety of magical effects. Sorcery Points You have 2 sorcery points, and you gain more as you reach higher levels, as shown in the Sorcery Points column of the Sorcerer table. You can never have more sorcery points than shown on the table for your level. You regain all spent sorcery points when you finish a long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'frenzy', 'Frenzy', 'barbarian', 'berserker',
  3, 'Starting when you choose this path at 3rd level, you can go into a frenzy when you rage. If you do so, for the duration of your rage you can make a single melee weapon attack as a bonus action on each of your turns after this one. When your rage ends, you suffer one level of exhaustion (as described in appendix A).', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'hide-in-plain-sight', 'Hide in Plain Sight', 'ranger', '',
  10, 'Starting at 10th level, you can spend 1 minute creating camouflage for yourself. You must have access to fresh mud, dirt, plants, soot, and other naturally occurring materials with which to create your camouflage. Once you are camouflaged in this way, you can try to hide by pressing yourself up against a solid surface, such as a tree or wall, that is at least as tall and wide as you are. You gain a +10 bonus to Dexterity (Stealth) checks as long as you remain there without moving or taking actions. Once you move or take an action or a reaction, you must camouflage yourself again to gain this benefit.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'holy-nimbus', 'Holy Nimbus', 'paladin', 'devotion',
  20, 'At 20th level, as an action, you can emanate an aura of sunlight. For 1 minute, bright light shines from you in a 30-foot radius, and dim light shines 30 feet beyond that. Whenever an enemy creature starts its turn in the bright light, the creature takes 10 radiant damage. In addition, for the duration, you have advantage on saving throws against spells cast by fiends or undead.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'hunters-prey', 'Hunter''s Prey', 'ranger', 'hunter',
  3, 'At 3rd level, you gain one of the following features of your choice. Colossus Slayer Giant Killer Horde Breaker', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'hunters-prey-colossus-slayer', 'Hunter''s Prey: Colossus Slayer', 'ranger', 'hunter',
  3, 'Your tenacity can wear down the most potent foes. When you hit a creature with a weapon attack, the creature takes an extra 1d8 damage if it''s below its hit point maximum. You can deal this extra damage only once per turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'hunters-prey-giant-killer', 'Hunter''s Prey: Giant Killer', 'ranger', 'hunter',
  3, 'When a Large or larger creature within 5 feet of you hits or misses you with an attack, you can use your reaction to attack that creature immediately after its attack, provided that you can see the creature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'hunters-prey-horde-breaker', 'Hunter''s Prey: Horde Breaker', 'ranger', 'hunter',
  3, 'Once on each of your turns when you make a weapon attack, you can make another attack with the same weapon against a different creature that is within 5 feet of the original target and within range of your weapon.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'hurl-through-hell', 'Hurl Through Hell', 'warlock', 'fiend',
  14, 'Starting at 14th level, when you hit a creature with an attack, you can use this feature to instantly transport the target through the lower planes. The creature disappears and hurtles through a nightmare landscape. At the end of your next turn, the target returns to the space it previously occupied, or the nearest unoccupied space. If the target is not a fiend, it takes 10d10 psychic damage as it reels from its horrific experience. Once you use this feature, you can''t use it again until you finish a long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'improved-critical', 'Improved Critical', 'fighter', 'champion',
  3, 'Beginning when you choose this archetype at 3rd level, your weapon attacks score a critical hit on a roll of 19 or 20.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'improved-divine-smite', 'Improved Divine Smite', 'paladin', '',
  11, 'By 11th level, you are so suffused with righteous might that all your melee weapon strikes carry divine power with them. Whenever you hit a creature with a melee weapon, the creature takes an extra 1d8 radiant damage. If you also use your Divine Smite with an attack, you add this damage to the extra damage of your Divine Smite.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'indomitable-1-use', 'Indomitable (1 use)', 'fighter', '',
  9, 'Beginning at 9th level, you can reroll a saving throw that you fail. If you do so, you must use the new roll, and you can''t use this feature again until you finish a long rest. You can use this feature twice between long rests starting at 13th level and three times between long rests starting at 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'indomitable-2-uses', 'Indomitable (2 uses)', 'fighter', '',
  13, 'Beginning at 9th level, you can reroll a saving throw that you fail. If you do so, you must use the new roll, and you can''t use this feature again until you finish a long rest. You can use this feature twice between long rests starting at 13th level and three times between long rests starting at 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'indomitable-3-uses', 'Indomitable (3 uses)', 'fighter', '',
  17, 'Beginning at 9th level, you can reroll a saving throw that you fail. If you do so, you must use the new roll, and you can''t use this feature again until you finish a long rest. You can use this feature twice between long rests starting at 13th level and three times between long rests starting at 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'indomitable-might', 'Indomitable Might', 'barbarian', '',
  18, 'Beginning at 18th level, if your total for a Strength check is less than your Strength score, you can use that score in place of the total.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'intimidating-presence', 'Intimidating Presence', 'barbarian', 'berserker',
  10, 'Beginning at 10th level, you can use your action to frighten someone with your menacing presence. When you do so, choose one creature that you can see within 30 feet of you. If the creature can see or hear you, it must succeed on a Wisdom saving throw (DC equal to 8 + your proficiency bonus + your Charisma modifier) or be frightened of you until the end of your next turn. On subsequent turns, you can use your action to extend the duration of this effect on the frightened creature until the end of your next turn. This effect ends if the creature ends its turn out of line of sight or more than 60 feet away from you.  If the creature succeeds on its saving throw, you can''t use this feature on that creature again for 24 hours.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'jack-of-all-trades', 'Jack of All Trades', 'bard', '',
  2, 'Starting at 2nd level, you can add half your proficiency bonus, rounded down, to any ability check you make that doesn''t already include your proficiency bonus.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ki', 'Ki', 'monk', '',
  2, 'Starting at 2nd level, your training allows you to harness the mystic energy of ki. Your access to this energy is represented by a number of ki points. Your monk level determines the number of points you have, as shown in the Ki Points column of Table: The Monk. You can spend these points to fuel various ki features. You start knowing three such features: Flurry of Blows, Patient Defense, and Step of the Wind. You learn more ki features as you gain levels in this class. When you spend a ki point, it is unavailable until you finish a short or long rest, at the end of which you draw all of your expended ki back into yourself. You must spend at least 30 minutes of the rest meditating to regain your ki points. Some of your ki features require your target to make a saving throw to resist the feature''s effects. The saving throw DC is calculated as follows: Ki save DC = 8 + your proficiency bonus + your Wisdom modifier', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ki-empowered-strikes', 'Ki Empowered Strikes', 'monk', '',
  6, 'Starting at 6th level, your unarmed strikes count as magical for the purpose of overcoming resistance and immunity to nonmagical attacks and damage.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'lay-on-hands', 'Lay on Hands', 'paladin', '',
  1, 'Your blessed touch can heal wounds. You have a pool of healing power that replenishes when you take a long rest. With that pool, you can restore a total number of hit points equal to your paladin level x 5. As an action, you can touch a creature and draw power from the pool to restore a number of hit points to that creature, up to the maximum amount remaining in your pool. Alternatively, you can expend 5 hit points from your pool of healing to cure the target of one disease or neutralize one poison affecting it. You can cure multiple diseases and neutralize multiple poisons with a single use of Lay on Hands, expending hit points separately for each one. This feature has no effect on undead and constructs.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'magical-secrets-1', 'Magical Secrets', 'bard', '',
  10, 'By 10th level, you have plundered magical knowledge from a wide spectrum of disciplines. Choose two spells from any class, including this one. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip.  The chosen spells count as bard spells for you and are included in the number in the Spells Known column of the Bard table.  You learn two additional spells from any class at 14th level and again at 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'magical-secrets-2', 'Magical Secrets', 'bard', '',
  14, 'By 10th level, you have plundered magical knowledge from a wide spectrum of disciplines. Choose two spells from any class, including this one. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip.  The chosen spells count as bard spells for you and are included in the number in the Spells Known column of the Bard table.  You learn two additional spells from any class at 14th level and again at 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'magical-secrets-3', 'Magical Secrets', 'bard', '',
  18, 'By 10th level, you have plundered magical knowledge from a wide spectrum of disciplines. Choose two spells from any class, including this one. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip.  The chosen spells count as bard spells for you and are included in the number in the Spells Known column of the Bard table.  You learn two additional spells from any class at 14th level and again at 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'martial-archetype', 'Martial Archetype', 'fighter', '',
  3, 'At 3rd level, you choose an archetype that you strive to emulate in your combat styles and techniques, such as Champion. The archetype you choose grants you features at 3rd level and again at 7th, 10th, 15th, and 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'martial-archetype-improvement-1', 'Martial Archetype feature', 'fighter', '',
  7, 'At 3rd level, you choose an archetype that you strive to emulate in your combat styles and techniques, such as Champion. The archetype you choose grants you features at 3rd level and again at 7th, 10th, 15th, and 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'martial-archetype-improvement-2', 'Martial Archetype feature', 'fighter', '',
  10, 'At 3rd level, you choose an archetype that you strive to emulate in your combat styles and techniques, such as Champion. The archetype you choose grants you features at 3rd level and again at 7th, 10th, 15th, and 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'martial-archetype-improvement-3', 'Martial Archetype feature', 'fighter', '',
  15, 'At 3rd level, you choose an archetype that you strive to emulate in your combat styles and techniques, such as Champion. The archetype you choose grants you features at 3rd level and again at 7th, 10th, 15th, and 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'martial-archetype-improvement-4', 'Martial Archetype feature', 'fighter', '',
  18, 'At 3rd level, you choose an archetype that you strive to emulate in your combat styles and techniques, such as Champion. The archetype you choose grants you features at 3rd level and again at 7th, 10th, 15th, and 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'martial-arts', 'Martial Arts', 'monk', '',
  1, 'At 1st level, your practice of martial arts gives you mastery of combat styles that use unarmed strikes and monk weapons, which are shortswords and any simple melee weapons that don''t have the two- handed or heavy property. You gain the following benefits while you are unarmed or wielding only monk weapons and you aren''t wearing armor or wielding a shield: - You can use Dexterity instead of Strength for the attack and damage rolls of your unarmed strikes and monk weapons. - You can roll a d4 in place of the normal damage of your unarmed strike or monk weapon. This die changes as you gain monk levels, as shown in the Martial Arts column of Table: The Monk. - When you use the Attack action with an unarmed strike or a monk weapon on your turn, you can make one unarmed strike as a bonus action. For example, if you take the Attack action and attack with a quarterstaff, you can also make an unarmed strike as a bonus action, assuming you haven''t already taken a bonus action this turn. Certain monasteries use specialized forms of the monk weapons. For example, you might use a club that is two lengths of wood connected by a short chain (called a nunchaku) or a sickle with a shorter, straighter blade (called a kama). Whatever name you use for a monk weapon, you can use the game statistics provided for the weapon.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'metamagic-1', 'Metamagic', 'sorcerer', '',
  3, 'At 3rd level, you gain the ability to twist your spells to suit your needs. You gain two of the following Metamagic options of your choice. You gain another one at 10th and 17th level. You can use only one Metamagic option on a spell when you cast it, unless otherwise noted.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'metamagic-2', 'Metamagic', 'sorcerer', '',
  10, 'At 3rd level, you gain the ability to twist your spells to suit your needs. You gain two of the following Metamagic options of your choice. You gain another one at 10th and 17th level. You can use only one Metamagic option on a spell when you cast it, unless otherwise noted.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'metamagic-3', 'Metamagic', 'sorcerer', '',
  17, 'At 3rd level, you gain the ability to twist your spells to suit your needs. You gain two of the following Metamagic options of your choice. You gain another one at 10th and 17th level. You can use only one Metamagic option on a spell when you cast it, unless otherwise noted.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'metamagic-careful-spell', 'Metamagic: Careful Spell', 'sorcerer', '',
  3, 'When you cast a spell that forces other creatures to make a saving throw, you can protect some of those creatures from the spell''s full force. To do so, you spend 1 sorcery point and choose a number of those creatures up to your Charisma modifier (minimum of one creature). A chosen creature automatically succeeds on its saving throw against the spell.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'metamagic-distant-spell', 'Metamagic: Distant Spell', 'sorcerer', '',
  3, 'When you cast a spell that has a range of 5 feet or greater, you can spend 1 sorcery point to double the range of the spell. When you cast a spell that has a range of touch, you can spend 1 sorcery point to make the range of the spell 30 feet.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'metamagic-empowered-spell', 'Metamagic: Empowered Spell', 'sorcerer', '',
  3, 'When you roll damage for a spell, you can spend 1 sorcery point to reroll a number of the damage dice up to your Charisma modifier (minimum of one). You must use the new rolls. You can use Empowered Spell even if you have already used a different Metamagic option during the casting of the spell.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'metamagic-extended-spell', 'Metamagic: Extended Spell', 'sorcerer', '',
  3, 'When you cast a spell that has a duration of 1 minute or longer, you can spend 1 sorcery point to double its duration, to a maximum duration of 24 hours.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'metamagic-heightened-spell', 'Metamagic: Heightened Spell', 'sorcerer', '',
  3, 'When you cast a spell that forces a creature to make a saving throw to resist its effects, you can spend 3 sorcery points to give one target of the spell disadvantage on its first saving throw made against the spell.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'metamagic-quickened-spell', 'Metamagic: Quickened Spell', 'sorcerer', '',
  3, 'When you cast a spell that has a casting time of 1 action, you can spend 2 sorcery points to change the casting time to 1 bonus action for this casting.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'metamagic-subtle-spell', 'Metamagic: Subtle Spell', 'sorcerer', '',
  3, 'When you cast a spell, you can spend 1 sorcery point to cast it without any somatic or verbal components.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'metamagic-twinned-spell', 'Metamagic: Twinned Spell', 'sorcerer', '',
  3, 'When you cast a spell that targets only one creature and doesn''t have a range of self, you can spend a number of sorcery points equal to the spell''s level to target a second creature in range with the same spell (1 sorcery point if the spell is a cantrip). To be eligible, a spell must be incapable of targeting more than one creature at the spell''s current level. For example, magic missile and scorching ray aren''t eligible, but ray of frost is.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'mindless-rage', 'Mindless Rage', 'barbarian', 'berserker',
  6, 'Beginning at 6th level, you can''t be charmed or frightened while raging. If you are charmed or frightened when you enter your rage, the effect is suspended for the duration of the rage.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monastic-tradition', 'Monastic Tradition', 'monk', '',
  3, 'When you reach 3rd level, you commit yourself to a monastic tradition, such as the Way of the Open Hand. Your tradition grants you features at 3rd level and again at 6th, 11th, and 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monastic-tradition-improvement-1', 'Monastic Tradition feature', 'monk', '',
  6, 'When you reach 3rd level, you commit yourself to a monastic tradition, such as the Way of the Open Hand. Your tradition grants you features at 3rd level and again at 6th, 11th, and 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monastic-tradition-improvement-2', 'Monastic Tradition feature', 'monk', '',
  11, 'When you reach 3rd level, you commit yourself to a monastic tradition, such as the Way of the Open Hand. Your tradition grants you features at 3rd level and again at 6th, 11th, and 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monastic-tradition-improvement-3', 'Monastic Tradition feature', 'monk', '',
  17, 'When you reach 3rd level, you commit yourself to a monastic tradition, such as the Way of the Open Hand. Your tradition grants you features at 3rd level and again at 6th, 11th, and 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monk-ability-score-improvement-1', 'Ability Score Improvement', 'monk', '',
  4, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monk-ability-score-improvement-2', 'Ability Score Improvement', 'monk', '',
  8, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monk-ability-score-improvement-3', 'Ability Score Improvement', 'monk', '',
  12, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monk-ability-score-improvement-4', 'Ability Score Improvement', 'monk', '',
  16, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monk-ability-score-improvement-5', 'Ability Score Improvement', 'monk', '',
  19, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monk-evasion', 'Evasion', 'monk', '',
  7, 'At 7th level, your instinctive agility lets you dodge out of the way of certain area effects, such as a blue dragon''s lightning breath or a fireball spell. When you are subjected to an effect that allows you to make a Dexterity saving throw to take only half damage, you instead take no damage if you succeed on the saving throw, and only half damage if you fail.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monk-extra-attack', 'Extra Attack', 'monk', '',
  5, 'Beginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monk-timeless-body', 'Timeless Body', 'monk', '',
  15, 'At 15th level, your ki sustains you so that you suffer none of the frailty of old age, and you can''t be aged magically. You can still die of old age, however. In addition, you no longer need food or water.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'monk-unarmored-defense', 'Unarmored Defense', 'monk', '',
  1, 'Beginning at 1st level, while you are wearing no armor and not wielding a shield, your AC equals 10 + your Dexterity modifier + your Wisdom modifier.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'multiattack', 'Multiattack', 'ranger', 'hunter',
  11, 'At 11th level, you gain one of the following features of your choice. Volley Whirlwind Attack', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'multiattack-volley', 'Multiattack: Volley', 'ranger', 'hunter',
  11, 'You can use your action to make a ranged attack against any number of creatures within 10 feet of a point you can see within your weapon''s range. You must have ammunition for each target, as normal, and you make a separate attack roll for each target.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'multiattack-whirlwind-attack', 'Multiattack: Whirlwind Attack', 'ranger', 'hunter',
  11, 'You can use your action to make a melee attack against any number of creatures within 5 feet of you, with a separate attack roll for each target.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'mystic-arcanum-6th-level', 'Mystic Arcanum (6th level)', 'warlock', '',
  11, 'At 11th level, your patron bestows upon you a magical secret called an arcanum. Choose one 6th- level spell from the warlock spell list as this arcanum. You can cast your arcanum spell once without expending a spell slot. You must finish a long rest before you can do so again. At higher levels, you gain more warlock spells of your choice that can be cast in this way: one 7th- level spell at 13th level, one 8th-level spell at 15th level, and one 9th-level spell at 17th level. You regain all uses of your Mystic Arcanum when you finish a long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'mystic-arcanum-7th-level', 'Mystic Arcanum (7th level)', 'warlock', '',
  13, 'At 11th level, your patron bestows upon you a magical secret called an arcanum. Choose one 6th- level spell from the warlock spell list as this arcanum. You can cast your arcanum spell once without expending a spell slot. You must finish a long rest before you can do so again. At higher levels, you gain more warlock spells of your choice that can be cast in this way: one 7th- level spell at 13th level, one 8th-level spell at 15th level, and one 9th-level spell at 17th level. You regain all uses of your Mystic Arcanum when you finish a long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'mystic-arcanum-8th-level', 'Mystic Arcanum (8th level)', 'warlock', '',
  15, 'At 11th level, your patron bestows upon you a magical secret called an arcanum. Choose one 6th- level spell from the warlock spell list as this arcanum. You can cast your arcanum spell once without expending a spell slot. You must finish a long rest before you can do so again. At higher levels, you gain more warlock spells of your choice that can be cast in this way: one 7th- level spell at 13th level, one 8th-level spell at 15th level, and one 9th-level spell at 17th level. You regain all uses of your Mystic Arcanum when you finish a long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'mystic-arcanum-9th-level', 'Mystic Arcanum (9th level)', 'warlock', '',
  17, 'At 11th level, your patron bestows upon you a magical secret called an arcanum. Choose one 6th- level spell from the warlock spell list as this arcanum. You can cast your arcanum spell once without expending a spell slot. You must finish a long rest before you can do so again. At higher levels, you gain more warlock spells of your choice that can be cast in this way: one 7th- level spell at 13th level, one 8th-level spell at 15th level, and one 9th-level spell at 17th level. You regain all uses of your Mystic Arcanum when you finish a long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'natural-explorer-1-terrain-type', 'Natural Explorer (1 terrain type)', 'ranger', '',
  1, 'You are particularly familiar with one type of natural environment and are adept at traveling and surviving in such regions. Choose one type of favored terrain: arctic, coast, desert, forest, grassland, mountain, or swamp. When you make an Intelligence or Wisdom check related to your favored terrain, your proficiency bonus is doubled if you are using a skill that you''re proficient in. While traveling for an hour or more in your favored terrain, you gain the following benefits: - Difficult terrain doesn''t slow your group''s travel. - Your group can''t become lost except by magical means. - Even when you are engaged in another activity while traveling (such as foraging, navigating, or tracking), you remain alert to danger. - If you are traveling alone, you can move stealthily at a normal pace. - When you forage, you find twice as much food as you normally would. - While tracking other creatures, you also learn their exact number, their sizes, and how long ago they passed through the area. You choose additional favored terrain types at 6th and 10th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'natural-explorer-2-terrain-types', 'Natural Explorer (2 terrain types)', 'ranger', '',
  6, 'You are particularly familiar with one type of natural environment and are adept at traveling and surviving in such regions. Choose one type of favored terrain: arctic, coast, desert, forest, grassland, mountain, or swamp. When you make an Intelligence or Wisdom check related to your favored terrain, your proficiency bonus is doubled if you are using a skill that you''re proficient in. While traveling for an hour or more in your favored terrain, you gain the following benefits: - Difficult terrain doesn''t slow your group''s travel. - Your group can''t become lost except by magical means. - Even when you are engaged in another activity while traveling (such as foraging, navigating, or tracking), you remain alert to danger. - If you are traveling alone, you can move stealthily at a normal pace. - When you forage, you find twice as much food as you normally would. - While tracking other creatures, you also learn their exact number, their sizes, and how long ago they passed through the area. You choose additional favored terrain types at 6th and 10th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'natural-explorer-3-terrain-types', 'Natural Explorer (3 terrain types)', 'ranger', '',
  10, 'You are particularly familiar with one type of natural environment and are adept at traveling and surviving in such regions. Choose one type of favored terrain: arctic, coast, desert, forest, grassland, mountain, or swamp. When you make an Intelligence or Wisdom check related to your favored terrain, your proficiency bonus is doubled if you are using a skill that you''re proficient in. While traveling for an hour or more in your favored terrain, you gain the following benefits: - Difficult terrain doesn''t slow your group''s travel. - Your group can''t become lost except by magical means. - Even when you are engaged in another activity while traveling (such as foraging, navigating, or tracking), you remain alert to danger. - If you are traveling alone, you can move stealthily at a normal pace. - When you forage, you find twice as much food as you normally would. - While tracking other creatures, you also learn their exact number, their sizes, and how long ago they passed through the area. You choose additional favored terrain types at 6th and 10th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'natural-recovery', 'Natural Recovery', 'druid', 'land',
  2, 'Starting at 2nd level, you can regain some of your magical energy by sitting in meditation and communing with nature. During a short rest, you choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your druid level (rounded up), and none of the slots can be 6th level or higher. You can''t use this feature again until you finish a long rest. For example, when you are a 4th-level druid, you can recover up to two levels worth of spell slots. You can recover either a 2nd-level slot or two 1st-level slots.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'natures-sanctuary', 'Nature''s Sanctuary', 'druid', 'land',
  14, 'When you reach 14th level, creatures of the natural world sense your connection to nature and become hesitant to attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the attack automatically misses. On a successful save, the creature is immune to this effect for 24 hours. The creature is aware of this effect before it makes its attack against you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'natures-ward', 'Nature''s Ward', 'druid', 'land',
  10, 'When you reach 10th level, you can''t be charmed or frightened by elementals or fey, and you are immune to poison and disease.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'oath-spells', 'Oath Spells', 'paladin', '',
  3, 'Each oath has a list of associated spells. You gain access to these spells at the levels specified in the oath description. Once you gain access to an oath spell, you always have it prepared. Oath spells don''t count against the number of spells you can prepare each day. If you gain an oath spell that doesn''t appear on the paladin spell list, the spell is nonetheless a paladin spell for you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'open-hand-technique', 'Open Hand Technique', 'monk', 'open-hand',
  3, 'Starting when you choose this tradition at 3rd level, you can manipulate your enemy''s ki when you harness your own. Whenever you hit a creature with one of the attacks granted by your Flurry of Blows, you can impose one of the following effects on that target: - It must succeed on a Dexterity saving throw or be knocked prone. - It must make a Strength saving throw. If it fails, you can push it up to 15 feet away from you. - It can''t take reactions until the end of your next turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'otherworldly-patron', 'Otherworldly Patron', 'warlock', '',
  1, 'At 1st level, you have struck a bargain with an otherworldly being of your choice, such as the Fiend. Your choice grants you features at 1st level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'otherworldly-patron-improvement-1', 'Otherworldly Patron feature', 'warlock', '',
  6, 'At 1st level, you have struck a bargain with an otherworldly being of your choice, such as the Fiend. Your choice grants you features at 1st level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'otherworldly-patron-improvement-2', 'Otherworldly Patron feature', 'warlock', '',
  10, 'At 1st level, you have struck a bargain with an otherworldly being of your choice, such as the Fiend. Your choice grants you features at 1st level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'otherworldly-patron-improvement-3', 'Otherworldly Patron feature', 'warlock', '',
  14, 'At 1st level, you have struck a bargain with an otherworldly being of your choice, such as the Fiend. Your choice grants you features at 1st level and again at 6th, 10th, and 14th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'overchannel', 'Overchannel', 'wizard', 'evocation',
  14, 'Starting at 14th level, you can increase the power of your simpler spells. When you cast a wizard spell of 1st through 5th level that deals damage, you can deal maximum damage with that spell. The first time you do so, you suffer no adverse effect. If you use this feature again before you finish a long rest, you take 2d12 necrotic damage for each level of the spell, immediately after you cast it. Each time you use this feature again before finishing a long rest, the necrotic damage per spell level increases by 1d12. This damage ignores resistance and immunity.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'pact-boon', 'Pact Boon', 'warlock', '',
  3, 'At 3rd level, your otherworldly patron bestows a gift upon you for your loyal service. You gain one of the following features of your choice.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'pact-magic', 'Pact Magic', 'warlock', '',
  1, 'Your arcane research and the magic bestowed on you by your patron have given you facility with spells.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'pact-of-the-blade', 'Pact of the Blade', 'warlock', '',
  3, 'You can use your action to create a pact weapon in your empty hand. You can choose the form that this melee weapon takes each time you create it. You are proficient with it while you wield it. This weapon counts as magical for the purpose of overcoming resistance and immunity to nonmagical attacks and damage. Your pact weapon disappears if it is more than 5 feet away from you for 1 minute or more. It also disappears if you use this feature again, if you dismiss the weapon (no action required), or if you die. You can transform one magic weapon into your pact weapon by performing a special ritual while you hold the weapon. You perform the ritual over the course of 1 hour, which can be done during a short rest. You can then dismiss the weapon, shunting it into an extradimensional space, and it appears whenever you create your pact weapon thereafter. You can''t affect an artifact or a sentient weapon in this way. The weapon ceases being your pact weapon if you die, if you perform the 1-hour ritual on a different weapon, or if you use a 1-hour ritual to break your bond to it. The weapon appears at your feet if it is in the extradimensional space when the bond breaks. If you serve the Fiend, your weapon could be an axe made of black metal and adorned with decorative flames.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'pact-of-the-chain', 'Pact of the Chain', 'warlock', '',
  3, 'You learn the find familiar spell and can cast it as a ritual. The spell doesn''t count against your number of spells known. When you cast the spell, you can choose one of the normal forms for your familiar or one of the following special forms: imp, pseudodragon, quasit, or sprite. Additionally, when you take the Attack action, you can forgo one of your own attacks to allow your familiar to make one attack of its own with its reaction. Your familiar is more cunning than a typical familiar. Its default form can be a reflection of your patron, with imps and quasits tied to the Fiend.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'pact-of-the-tome', 'Pact of the Tome', 'warlock', '',
  3, 'Your patron gives you a grimoire called a Book of Shadows. When you gain this feature, choose three cantrips from any class''s spell list (the three needn''t be from the same list). While the book is on your person, you can cast those cantrips at will. They don''t count against your number of cantrips known. If they don''t appear on the warlock spell list, they are nonetheless warlock spells for you. If you lose your Book of Shadows, you can perform a 1-hour ceremony to receive a replacement from your patron. This ceremony can be performed during a short or long rest, and it destroys the previous book. The book turns to ash when you die. Your Book of Shadows could be a weighty tome bound in demon hide studded with iron, holding spells of conjuration and a wealth of forbidden lore about the sinister regions of the cosmos, a gift of the Fiend.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'paladin-ability-score-improvement-1', 'Ability Score Improvement', 'paladin', '',
  4, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'paladin-ability-score-improvement-2', 'Ability Score Improvement', 'paladin', '',
  8, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'paladin-ability-score-improvement-3', 'Ability Score Improvement', 'paladin', '',
  12, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'paladin-ability-score-improvement-4', 'Ability Score Improvement', 'paladin', '',
  16, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'paladin-ability-score-improvement-5', 'Ability Score Improvement', 'paladin', '',
  19, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'paladin-extra-attack', 'Extra Attack', 'paladin', '',
  5, 'Beginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'paladin-fighting-style', 'Fighting Style', 'paladin', '',
  2, 'At 2nd level, you adopt a style of fighting as your specialty. Choose one of the following options. You can''t take a Fighting Style option more than once, even if you later get to choose again.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'patient-defense', 'Patient Defense', 'monk', '',
  2, 'You can spend 1 ki point to take the Dodge action as a bonus action on your turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'peerless-skill', 'Peerless Skill', 'bard', 'lore',
  14, 'Starting at 14th level, when you make an ability check, you can expend one use of Bardic Inspiration. Roll a Bardic Inspiration die and add the number rolled to your ability check. You can choose to do so after you roll the die for the ability check, but before the GM tells you whether you succeed or fail.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'perfect-self', 'Perfect Self', 'monk', '',
  20, 'At 20th level, when you roll for initiative and have no ki points remaining, you regain 4 ki points.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'persistent-rage', 'Persistent Rage', 'barbarian', '',
  15, 'Beginning at 15th level, your rage is so fierce that it ends early only if you fall unconscious or if you choose to end it.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'potent-cantrip', 'Potent Cantrip', 'wizard', 'evocation',
  6, 'Starting at 6th level, your damaging cantrips affect even creatures that avoid the brunt of the effect. When a creature succeeds on a saving throw against your cantrip, the creature takes half the cantrip''s damage (if any) but suffers no additional effect from the cantrip.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'primal-champion', 'Primal Champion', 'barbarian', '',
  20, 'At 20th level, you embody the power of the wilds. Your Strength and Constitution scores increase by 4. Your maximum for those scores is now 24.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'primal-path', 'Primal Path', 'barbarian', '',
  3, 'At 3rd level, you choose a path that shapes the nature of your rage. Choose the Path of the Berserker or the Path of the Totem Warrior, both detailed at the end of the class description. Your choice grants you features at 3rd level and again at 6th, 10th, and 14th levels.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'primal-path-improvement-1', 'Path feature', 'barbarian', '',
  6, 'At 3rd level, you choose a path that shapes the nature of your rage. Choose the Path of the Berserker or the Path of the Totem Warrior, both detailed at the end of the class description. Your choice grants you features at 3rd level and again at 6th, 10th, and 14th levels.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'primal-path-improvement-2', 'Path feature', 'barbarian', '',
  10, 'At 3rd level, you choose a path that shapes the nature of your rage. Choose the Path of the Berserker or the Path of the Totem Warrior, both detailed at the end of the class description. Your choice grants you features at 3rd level and again at 6th, 10th, and 14th levels.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'primal-path-improvement-3', 'Path feature', 'barbarian', '',
  14, 'At 3rd level, you choose a path that shapes the nature of your rage. Choose the Path of the Berserker or the Path of the Totem Warrior, both detailed at the end of the class description. Your choice grants you features at 3rd level and again at 6th, 10th, and 14th levels.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'primeval-awareness', 'Primeval Awareness', 'ranger', '',
  3, 'Beginning at 3rd level, you can use your action and expend one ranger spell slot to focus your awareness on the region around you. For 1 minute per level of the spell slot you expend, you can sense whether the following types of creatures are present within 1 mile of you (or within up to 6 miles if you are in your favored terrain): aberrations, celestials, dragons, elementals, fey, fiends, and undead. This feature doesn''t reveal the creatures'' location or number.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'purity-of-body', 'Purity of Body', 'monk', '',
  10, 'At 10th level, your mastery of the ki flowing through you makes you immune to disease and poison.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'purity-of-spirit', 'Purity of Spirit', 'paladin', 'devotion',
  15, 'Beginning at 15th level, you are always under the effects of a protection from evil and good spell.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'quivering-palm', 'Quivering Palm', 'monk', 'open-hand',
  17, 'At 17th level, you gain the ability to set up lethal vibrations in someone''s body. When you hit a creature with an unarmed strike, you can spend 3 ki points to start these imperceptible vibrations, which last for a number of days equal to your monk level. The vibrations are harmless unless you use your action to end them. To do so, you and the target must be on the same plane of existence. When you use this action, the creature must make a Constitution saving throw. If it fails, it is reduced to 0 hit points. If it succeeds, it takes 10d10 necrotic damage. You can have only one creature under the effect of this feature at a time. You can choose to end the vibrations harmlessly without using an action.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'rage', 'Rage', 'barbarian', '',
  1, 'In battle, you fight with primal ferocity. On your turn, you can enter a rage as a bonus action. While raging, you gain the following benefits if you aren''t wearing heavy armor: - You have advantage on Strength checks and Strength saving throws. - When you make a melee weapon Attack using Strength, you gain a +2 bonus to the damage roll. This bonus increases as you level. - You have Resistance to bludgeoning, piercing, and slashing damage. If you are able to cast Spells, you can''t cast them or concentrate on them while raging. Your rage lasts for 1 minute. It ends early if you are knocked Unconscious or if Your Turn ends and you haven''t attacked a hostile creature since your last turn or taken damage since then. You can also end your rage on Your Turn as a Bonus Action. Once you have raged the maximum number of times for your barbarian level, you must finish a Long Rest before you can rage again. You may rage 2 times at 1st level, 3 at 3rd, 4 at 6th, 5 at 12th, and 6 at 17th.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-ability-score-improvement-1', 'Ability Score Improvement', 'ranger', '',
  4, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-ability-score-improvement-2', 'Ability Score Improvement', 'ranger', '',
  8, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-ability-score-improvement-3', 'Ability Score Improvement', 'ranger', '',
  12, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-ability-score-improvement-4', 'Ability Score Improvement', 'ranger', '',
  16, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-ability-score-improvement-5', 'Ability Score Improvement', 'ranger', '',
  19, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-archetype', 'Ranger Archetype', 'ranger', '',
  3, 'At 3rd level, you choose an archetype that you strive to emulate, such as the Hunter. Your choice grants you features at 3rd level and again at 7th, 11th, and 15th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-archetype-improvement-1', 'Ranger Archetype feature', 'ranger', '',
  7, 'At 3rd level, you choose an archetype that you strive to emulate, such as the Hunter. Your choice grants you features at 3rd level and again at 7th, 11th, and 15th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-archetype-improvement-2', 'Ranger Archetype feature', 'ranger', '',
  11, 'At 3rd level, you choose an archetype that you strive to emulate, such as the Hunter. Your choice grants you features at 3rd level and again at 7th, 11th, and 15th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-archetype-improvement-3', 'Ranger Archetype feature', 'ranger', '',
  15, 'At 3rd level, you choose an archetype that you strive to emulate, such as the Hunter. Your choice grants you features at 3rd level and again at 7th, 11th, and 15th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-extra-attack', 'Extra Attack', 'ranger', '',
  5, 'Beginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-fighting-style', 'Fighting Style', 'ranger', '',
  2, 'At 2nd level, you adopt a particular style of fighting as your specialty. Choose one of the following options. You can''t take a Fighting Style option more than once, even if you later get to choose again.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-fighting-style-archery', 'Fighting Style: Archery', 'ranger', '',
  2, 'You gain a +2 bonus to attack rolls you make with ranged weapons.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-fighting-style-defense', 'Fighting Style: Defense', 'ranger', '',
  2, 'While you are wearing armor, you gain a +1 bonus to AC.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-fighting-style-dueling', 'Fighting Style: Dueling', 'ranger', '',
  2, 'When you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-fighting-style-two-weapon-fighting', 'Fighting Style: Two-Weapon Fighting', 'ranger', '',
  2, 'When you engage in two-weapon fighting, you can add your ability modifier to the damage of the second attack.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'ranger-lands-stride', 'Land''s Stride', 'ranger', '',
  8, 'Starting at 8th level, moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard. In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such those created by the entangle spell.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'reckless-attack', 'Reckless Attack', 'barbarian', '',
  2, 'Starting at 2nd level, you can throw aside all concern for defense to attack with fierce desperation. When you make your first attack on your turn, you can decide to attack recklessly. Doing so gives you advantage on melee weapon attack rolls using Strength during this turn, but attack rolls against you have advantage until your next turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'relentless-rage', 'Relentless Rage', 'barbarian', '',
  11, 'Starting at 11th level, your rage can keep you fighting despite grievous wounds. If you drop to 0 hit points while you''re raging and don''t die outright, you can make a DC 10 Constitution saving throw. If you succeed, you drop to 1 hit point instead. Each time you use this feature after the first, the DC increases by 5. When you finish a short or long rest, the DC resets to 10.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'reliable-talent', 'Reliable Talent', 'rogue', '',
  11, 'By 11th level, you have refined your chosen skills until they approach perfection. Whenever you make an ability check that lets you add your proficiency bonus, you can treat a d20 roll of 9 or lower as a 10.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'remarkable-athlete', 'Remarkable Athlete', 'fighter', 'champion',
  7, 'Starting at 7th level, you can add half your proficiency bonus (round up) to any Strength, Dexterity, or Constitution check you make that doesn''t already use your proficiency bonus. In addition, when you make a running long jump, the distance you can cover increases by a number of feet equal to your Strength modifier.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'retaliation', 'Retaliation', 'barbarian', 'berserker',
  14, 'Starting at 14th level, when you take damage from a creature that is within 5 feet of you, you can use your reaction to make a melee weapon Attack against that creature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'rogue-ability-score-improvement-1', 'Ability Score Improvement', 'rogue', '',
  4, 'When you reach 4th level, and again at 8th, 10th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'rogue-ability-score-improvement-2', 'Ability Score Improvement', 'rogue', '',
  8, 'When you reach 4th level, and again at 8th, 10th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'rogue-ability-score-improvement-3', 'Ability Score Improvement', 'rogue', '',
  10, 'When you reach 4th level, and again at 8th, 10th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'rogue-ability-score-improvement-4', 'Ability Score Improvement', 'rogue', '',
  12, 'When you reach 4th level, and again at 8th, 10th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'rogue-ability-score-improvement-5', 'Ability Score Improvement', 'rogue', '',
  16, 'When you reach 4th level, and again at 8th, 10th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'rogue-ability-score-improvement-6', 'Ability Score Improvement', 'rogue', '',
  19, 'When you reach 4th level, and again at 8th, 10th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'rogue-evasion', 'Evasion', 'rogue', '',
  7, 'Beginning at 7th level, you can nimbly dodge out of the way of certain area effects, such as a red dragon''s fiery breath or an ice storm spell. When you are subjected to an effect that allows you to make a Dexterity saving throw to take only half damage, you instead take no damage if you succeed on the saving throw, and only half damage if you fail.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'rogue-expertise-1', 'Expertise', 'rogue', '',
  1, 'At 1st level, choose two of your skill proficiencies, or one of your skill proficiencies and your proficiency with thieves'' tools. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies. At 6th level, you can choose two more of your proficiencies (in skills or with thieves'' tools) to gain this benefit', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'rogue-expertise-2', 'Expertise', 'rogue', '',
  6, 'At 1st level, choose two of your skill proficiencies, or one of your skill proficiencies and your proficiency with thieves'' tools. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies. At 6th level, you can choose two more of your proficiencies (in skills or with thieves'' tools) to gain this benefit', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'roguish-archetype', 'Roguish Archetype', 'rogue', '',
  3, 'At 3rd level, you choose an archetype that you emulate in the exercise of your rogue abilities, such as Thief. Additional archetypes are available in the original source material. Your archetype choice grants you features at 3rd level and then again at 9th, 13th, and 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'roguish-archetype-improvement-1', 'Roguish Archetype feature', 'rogue', '',
  9, 'At 3rd level, you choose an archetype that you emulate in the exercise of your rogue abilities, such as Thief. Additional archetypes are available in the original source material. Your archetype choice grants you features at 3rd level and then again at 9th, 13th, and 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'roguish-archetype-improvement-2', 'Roguish Archetype feature', 'rogue', '',
  13, 'At 3rd level, you choose an archetype that you emulate in the exercise of your rogue abilities, such as Thief. Additional archetypes are available in the original source material. Your archetype choice grants you features at 3rd level and then again at 9th, 13th, and 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'roguish-archetype-improvement-3', 'Roguish Archetype feature', 'rogue', '',
  17, 'At 3rd level, you choose an archetype that you emulate in the exercise of your rogue abilities, such as Thief. Additional archetypes are available in the original source material. Your archetype choice grants you features at 3rd level and then again at 9th, 13th, and 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sacred-oath', 'Sacred Oath', 'paladin', '',
  3, 'When you reach 3rd level, you swear the oath that binds you as a paladin forever. Up to this time you have been in a preparatory stage, committed to the path but not yet sworn to it. Now you choose an oath, such as the Oath of Devotion. Your choice grants you features at 3rd level and again at 7th, 15th, and 20th level. Those features include oath spells and the Channel Divinity feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sacred-oath-improvement-1', 'Sacred Oath feature', 'paladin', '',
  7, 'When you reach 3rd level, you swear the oath that binds you as a paladin forever. Up to this time you have been in a preparatory stage, committed to the path but not yet sworn to it. Now you choose an oath, such as the Oath of Devotion. Your choice grants you features at 3rd level and again at 7th, 15th, and 20th level. Those features include oath spells and the Channel Divinity feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sacred-oath-improvement-2', 'Sacred Oath feature', 'paladin', '',
  15, 'When you reach 3rd level, you swear the oath that binds you as a paladin forever. Up to this time you have been in a preparatory stage, committed to the path but not yet sworn to it. Now you choose an oath, such as the Oath of Devotion. Your choice grants you features at 3rd level and again at 7th, 15th, and 20th level. Those features include oath spells and the Channel Divinity feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sacred-oath-improvement-3', 'Sacred Oath feature', 'paladin', '',
  20, 'When you reach 3rd level, you swear the oath that binds you as a paladin forever. Up to this time you have been in a preparatory stage, committed to the path but not yet sworn to it. Now you choose an oath, such as the Oath of Devotion. Your choice grants you features at 3rd level and again at 7th, 15th, and 20th level. Those features include oath spells and the Channel Divinity feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sculpt-spells', 'Sculpt Spells', 'wizard', 'evocation',
  2, 'Beginning at 2nd level, you can create pockets of relative safety within the effects of your evocation spells. When you cast an evocation spell that affects other creatures that you can see, you can choose a number of them equal to 1 + the spell''s level. The chosen creatures automatically succeed on their saving throws against the spell, and they take no damage if they would normally take half damage on a successful save.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'second-story-work', 'Second-Story Work', 'rogue', 'thief',
  3, 'When you choose this archetype at 3rd level, you gain the ability to climb faster than normal; climbing no longer costs you extra movement. In addition, when you make a running jump, the distance you cover increases by a number of feet equal to your Dexterity modifier.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'second-wind', 'Second Wind', 'fighter', '',
  1, 'You have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain hit points equal to 1d10 + your fighter level. Once you use this feature, you must finish a short or long rest before you can use it again.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'signature-spell', 'Signature Spell', 'wizard', '',
  20, 'When you reach 20th level, you gain mastery over two powerful spells and can cast them with little effort. Choose two 3rd-level wizard spells in your spellbook as your signature spells. You always have these spells prepared, they don''t count against the number of spells you have prepared, and you can cast each of them once at 3rd level without expending a spell slot. When you do so, you can''t do so again until you finish a short or long rest. If you want to cast either spell at a higher level, you must expend a spell slot as normal.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'slippery-mind', 'Slippery Mind', 'rogue', '',
  15, 'By 15th level, you have acquired greater mental strength. You gain proficiency in Wisdom saving throws.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'slow-fall', 'Slow Fall', 'monk', '',
  4, 'Beginning at 4th level, you can use your reaction when you fall to reduce any falling damage you take by an amount equal to five times your monk level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sneak-attack', 'Sneak Attack', 'rogue', '',
  1, 'Beginning at 1st level, you know how to strike subtly and exploit a foe''s distraction. Once per turn, you can deal an extra 1d6 damage to one creature you hit with an attack if you have advantage on the attack roll. The attack must use a finesse or a ranged weapon. You don''t need advantage on the attack roll if another enemy of the target is within 5 feet of it, that enemy isn''t incapacitated, and you don''t have disadvantage on the attack roll. The amount of the extra damage increases as you gain levels in this class, as shown in the Sneak Attack column of the Rogue table.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'song-of-rest-d10', 'Song of Rest (d10)', 'bard', '',
  13, 'Beginning at 2nd level, you can use soothing music or oration to help revitalize your wounded allies during a short rest. If you or any friendly creatures who can hear your performance regain hit points at the end of the short rest by spending one or more Hit Dice, each of those creatures regains an extra 1d6 hit points.  The extra hit points increase when you reach certain levels in this class: to 1d8 at 9th level, to 1d10 at 13th level, and to 1d12 at 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'song-of-rest-d12', 'Song of Rest (d12)', 'bard', '',
  17, 'Beginning at 2nd level, you can use soothing music or oration to help revitalize your wounded allies during a short rest. If you or any friendly creatures who can hear your performance regain hit points at the end of the short rest by spending one or more Hit Dice, each of those creatures regains an extra 1d6 hit points.  The extra hit points increase when you reach certain levels in this class: to 1d8 at 9th level, to 1d10 at 13th level, and to 1d12 at 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'song-of-rest-d6', 'Song of Rest (d6)', 'bard', '',
  2, 'Beginning at 2nd level, you can use soothing music or oration to help revitalize your wounded allies during a short rest. If you or any friendly creatures who can hear your performance regain hit points at the end of the short rest by spending one or more Hit Dice, each of those creatures regains an extra 1d6 hit points.  The extra hit points increase when you reach certain levels in this class: to 1d8 at 9th level, to 1d10 at 13th level, and to 1d12 at 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'song-of-rest-d8', 'Song of Rest (d8)', 'bard', '',
  9, 'Beginning at 2nd level, you can use soothing music or oration to help revitalize your wounded allies during a short rest. If you or any friendly creatures who can hear your performance regain hit points at the end of the short rest by spending one or more Hit Dice, each of those creatures regains an extra 1d6 hit points.  The extra hit points increase when you reach certain levels in this class: to 1d8 at 9th level, to 1d10 at 13th level, and to 1d12 at 17th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sorcerer-ability-score-improvement-1', 'Ability Score Improvement', 'sorcerer', '',
  4, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sorcerer-ability-score-improvement-2', 'Ability Score Improvement', 'sorcerer', '',
  8, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sorcerer-ability-score-improvement-3', 'Ability Score Improvement', 'sorcerer', '',
  12, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sorcerer-ability-score-improvement-4', 'Ability Score Improvement', 'sorcerer', '',
  16, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sorcerer-ability-score-improvement-5', 'Ability Score Improvement', 'sorcerer', '',
  19, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sorcerous-origin', 'Sorcerous Origin', 'sorcerer', '',
  1, 'Choose a sorcerous origin, which describes the source of your innate magical power, such as Draconic Bloodline. Your choice grants you features when you choose it at 1st level and again at 6th, 14th, and 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sorcerous-origin-improvement-1', 'Sorcerous Origin feature', 'sorcerer', '',
  6, 'Choose a sorcerous origin, which describes the source of your innate magical power, such as Draconic Bloodline. Your choice grants you features when you choose it at 1st level and again at 6th, 14th, and 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sorcerous-origin-improvement-2', 'Sorcerous Origin feature', 'sorcerer', '',
  14, 'Choose a sorcerous origin, which describes the source of your innate magical power, such as Draconic Bloodline. Your choice grants you features when you choose it at 1st level and again at 6th, 14th, and 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sorcerous-origin-improvement-3', 'Sorcerous Origin feature', 'sorcerer', '',
  18, 'Choose a sorcerous origin, which describes the source of your innate magical power, such as Draconic Bloodline. Your choice grants you features when you choose it at 1st level and again at 6th, 14th, and 18th level.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'sorcerous-restoration', 'Sorcerous Restoration', 'sorcerer', '',
  20, 'At 20th level, you regain 4 expended sorcery points whenever you finish a short rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'spell-mastery', 'Spell Mastery', 'wizard', '',
  18, 'At 18th level, you have achieved such mastery over certain spells that you can cast them at will. Choose a 1st-level wizard spell and a 2nd-level wizard spell that are in your spellbook. You can cast those spells at their lowest level without expending a spell slot when you have them prepared. If you want to cast either spell at a higher level, you must expend a spell slot as normal. By spending 8 hours in study, you can exchange one or both of the spells you chose for different spells of the same levels.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'spellcasting-bard', 'Spellcasting: Bard', 'bard', '',
  1, 'You have learned to untangle and reshape the fabric of reality in harmony with your wishes and music. Your spells are part of your vast repertoire, magic that you can tune to different situations.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'spellcasting-cleric', 'Spellcasting: Cleric', 'cleric', '',
  1, 'As a conduit for divine power, you can cast cleric spells.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'spellcasting-druid', 'Spellcasting: Druid', 'druid', '',
  1, 'Drawing on the divine essence of nature itself, you can cast spells to shape that essence to your will.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'spellcasting-paladin', 'Spellcasting: Paladin', 'paladin', '',
  2, 'By 2nd level, you have learned to draw on divine magic through meditation and prayer to cast spells as a cleric does.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'spellcasting-ranger', 'Spellcasting: Ranger', 'ranger', '',
  2, 'By the time you reach 2nd level, you have learned to use the magical essence of nature to cast spells, much as a druid does.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'spellcasting-sorcerer', 'Spellcasting: Sorcerer', 'sorcerer', '',
  1, 'An event in your past, or in the life of a parent or ancestor, left an indelible mark on you, infusing you with arcane magic. This font of magic, whatever its origin, fuels your spells.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'spellcasting-wizard', 'Spellcasting: Wizard', 'wizard', '',
  1, 'As a student of arcane magic, you have a spellbook containing spells that show the first glimmerings of your true power.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'step-of-the-wind', 'Step of the Wind', 'monk', '',
  2, 'You can spend 1 ki point to take the Disengage or Dash action as a bonus action on your turn, and your jump distance is doubled for the turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'stillness-of-mind', 'Stillness of Mind', 'monk', '',
  7, 'Starting at 7th level, you can use your action to end one effect on yourself that is causing you to be charmed or frightened.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'stroke-of-luck', 'Stroke of Luck', 'rogue', '',
  20, 'At 20th level, you have an uncanny knack for succeeding when you need to. If your attack misses a target within range, you can turn the miss into a hit. Alternatively, if you fail an ability check, you can treat the d20 roll as a 20. Once you use this feature, you can''t use it again until you finish a short or long rest.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'stunning-strike', 'Stunning Strike', 'monk', '',
  5, 'Starting at 5th level, you can interfere with the flow of ki in an opponent''s body. When you hit another creature with a melee weapon attack, you can spend 1 ki point to attempt a stunning strike. The target must succeed on a Constitution saving throw or be stunned until the end of your next turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'superior-critical', 'Superior Critical', 'fighter', 'champion',
  15, 'Starting at 15th level, your weapon attacks score a critical hit on a roll of 18-20.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'superior-hunters-defense', 'Superior Hunter''s Defense', 'ranger', 'hunter',
  15, 'At 15th level, you gain one of the following features of your choice. Evasion Stand Against the Tide Uncanny Dodge', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'superior-hunters-defense-evasion', 'Superior Hunter''s Defense: Evasion', 'ranger', 'hunter',
  15, 'When you are subjected to an effect, such as a red dragon''s fiery breath or a lightning bolt spell, that allows you to make a Dexterity saving throw to take only half damage, you instead take no damage if you succeed on the saving throw, and only half damage if you fail.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'superior-hunters-defense-stand-against-the-tide', 'Superior Hunter''s Defense: Stand Against the Tide', 'ranger', 'hunter',
  15, 'When a hostile creature misses you with a melee attack, you can use your reaction to force that creature to repeat the same attack against another creature (other than itself) of your choice.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'superior-hunters-defense-uncanny-dodge', 'Superior Hunter''s Defense: Uncanny Dodge', 'ranger', 'hunter',
  15, 'When an attacker that you can see hits you with an attack, you can use your reaction to halve the attack''s damage against you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'superior-inspiration', 'Superior Inspiration', 'bard', '',
  20, 'At 20th level, when you roll initiative and have no uses of Bardic Inspiration left, you regain one use.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'supreme-healing', 'Supreme Healing', 'cleric', '',
  17, 'Starting at 17th level, when you would normally roll one or more dice to restore hit points with a spell, you instead use the highest number possible for each die. For example, instead of restoring 2d6 hit points to a creature, you restore 12.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'supreme-sneak', 'Supreme Sneak', 'rogue', 'thief',
  9, 'Starting at 9th level, you have advantage on a Dexterity (Stealth) check if you move no more than half your speed on the same turn.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'survivor', 'Survivor', 'fighter', 'champion',
  18, 'At 18th level, you attain the pinnacle of resilience in battle. At the start of each of your turns, you regain hit points equal to 5 + your Constitution modifier if you have no more than half of your hit points left. You don''t gain this benefit if you have 0 hit points.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'thiefs-reflexes', 'Thief''s Reflexes', 'rogue', 'thief',
  17, 'When you reach 17th level, you have become adept at laying ambushes and quickly escaping danger. You can take two turns during the first round of any combat. You take your first turn at your normal initiative and your second turn at your initiative minus 10. You can''t use this feature when you are surprised.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'thieves-cant', 'Thieves'' Cant', 'rogue', '',
  1, 'During your rogue training you learned thieves'' cant, a secret mix of dialect, jargon, and code that allows you to hide messages in seemingly normal conversation. Only another creature that knows thieves'' cant understands such messages. It takes four times longer to convey such a message than it does to speak the same idea plainly. In addition, you understand a set of secret signs and symbols used to convey short, simple messages, such as whether an area is dangerous or the territory of a thieves'' guild, whether loot is nearby, or whether the people in an area are easy marks or will provide a safe house for thieves on the run.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'tongue-of-the-sun-and-moon', 'Tongue of the Sun and Moon', 'monk', '',
  13, 'Starting at 13th level, you learn to touch the ki of other minds so that you understand all spoken languages. Moreover, any creature that can understand a language can understand what you say.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'tranquility', 'Tranquility', 'monk', 'open-hand',
  11, 'Beginning at 11th level, you can enter a special meditation that surrounds you with an aura of peace. At the end of a long rest, you gain the effect of a sanctuary spell that lasts until the start of your next long rest (the spell can end early as normal). The saving throw DC for the spell equals 8 + your Wisdom modifier + your proficiency bonus.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'unarmored-movement-1', 'Unarmored Movement', 'monk', '',
  2, 'Starting at 2nd level, your speed increases by 10 feet while you are not wearing armor or wielding a shield. This bonus increases when you reach certain monk levels, as shown in Table: The Monk. At 9th level, you gain the ability to move along vertical surfaces and across liquids on your turn without falling during the move.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'unarmored-movement-2', 'Unarmored Movement', 'monk', '',
  9, 'Starting at 2nd level, your speed increases by 10 feet while you are not wearing armor or wielding a shield. This bonus increases when you reach certain monk levels, as shown in Table: The Monk. At 9th level, you gain the ability to move along vertical surfaces and across liquids on your turn without falling during the move.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'uncanny-dodge', 'Uncanny Dodge', 'rogue', '',
  5, 'Starting at 5th level, when an attacker that you can see hits you with an attack, you can use your reaction to halve the attack''s damage against you.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'use-magic-device', 'Use Magic Device', 'rogue', 'thief',
  13, 'By 13th level, you have learned enough about the workings of magic that you can improvise the use of items even when they are not intended for you. You ignore all class, race, and level requirements on the use of magic items.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'vanish', 'Vanish', 'ranger', '',
  14, 'Starting at 14th level, you can use the Hide action as a bonus action on your turn. Also, you can''t be tracked by nonmagical means, unless you choose to leave a trail.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'warlock-ability-score-improvement-1', 'Ability Score Improvement', 'warlock', '',
  4, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'warlock-ability-score-improvement-2', 'Ability Score Improvement', 'warlock', '',
  8, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'warlock-ability-score-improvement-3', 'Ability Score Improvement', 'warlock', '',
  12, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'warlock-ability-score-improvement-4', 'Ability Score Improvement', 'warlock', '',
  16, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'warlock-ability-score-improvement-5', 'Ability Score Improvement', 'warlock', '',
  19, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'wholeness-of-body', 'Wholeness of Body', 'monk', 'open-hand',
  6, 'At 6th level, you gain the ability to heal yourself. As an action, you can regain hit points equal to three times your monk level. You must finish a long rest before you can use this feature again.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'wild-shape-cr-1-2-or-below-no-flying-speed', 'Wild Shape (CR 1/2 or below, no flying speed)', 'druid', '',
  4, 'Starting at 2nd level, you can use your action to magically assume the shape of a beast that you have seen before. You can use this feature twice. You regain expended uses when you finish a short or long rest. Your druid level determines the beasts you can transform into, as shown in the Beast Shapes table. At 2nd level, for example, you can transform into any beast that has a challenge rating of 1/4 or lower that doesn''t have a flying or swimming speed. You can stay in a beast shape for a number of hours equal to half your druid level (rounded down). You then revert to your normal form unless you expend another use of this feature. You can revert to your normal form earlier by using a bonus action on your turn. You automatically revert if you fall unconscious, drop to 0 hit points, or die. While you are transformed, the following rules apply: - Your game statistics are replaced by the statistics of the beast, but you retain your alignment, personality, and Intelligence, Wisdom, and Charisma scores. You also retain all of your skill and saving throw proficiencies, in addition to gaining those of the creature. If the creature has the same proficiency as you and the bonus in its stat block is higher than yours, use the creature''s bonus instead of yours. If the creature has any legendary or lair actions, you can''t use them. - When you transform, you assume the beast''s hit points and Hit Dice. When you revert to your normal form, you return to the number of hit points you had before you transformed. However, if you revert as a result of dropping to 0 hit points, any excess damage carries over to your normal form. For example, if you take 10 damage in animal form and have only 1 hit point left, you revert and take 9 damage. As long as the excess damage doesn''t reduce your normal form to 0 hit points, you aren''t knocked unconscious. - You can''t cast spells, and your ability to speak or take any action that requires hands is limited to the capabilities of your beast form. Transforming doesn''t break your concentration on a spell you''ve already cast, however, or prevent you from taking actions that are part of a spell, such as call lightning, that you''ve already cast. - You retain the benefit of any features from your class, race, or other source and can use them if the new form is physically capable of doing so. However, you can''t use any of your special senses, such as darkvision, unless your new form also has that sense. - You choose whether your equipment falls to the ground in your space, merges into your new form, or is worn by it. Worn equipment functions as normal, but the GM decides whether it is practical for the new form to wear a piece of equipment, based on the creature''s shape and size. Your equipment doesn''t change size or shape to match the new form, and any equipment that the new form can''t wear must either fall to the ground or merge with it. Equipment that merges with the form has no effect until you leave the form.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'wild-shape-cr-1-4-or-below-no-flying-or-swim-speed', 'Wild Shape (CR 1/4 or below, no flying or swim speed)', 'druid', '',
  2, 'Starting at 2nd level, you can use your action to magically assume the shape of a beast that you have seen before. You can use this feature twice. You regain expended uses when you finish a short or long rest. Your druid level determines the beasts you can transform into, as shown in the Beast Shapes table. At 2nd level, for example, you can transform into any beast that has a challenge rating of 1/4 or lower that doesn''t have a flying or swimming speed. You can stay in a beast shape for a number of hours equal to half your druid level (rounded down). You then revert to your normal form unless you expend another use of this feature. You can revert to your normal form earlier by using a bonus action on your turn. You automatically revert if you fall unconscious, drop to 0 hit points, or die. While you are transformed, the following rules apply: - Your game statistics are replaced by the statistics of the beast, but you retain your alignment, personality, and Intelligence, Wisdom, and Charisma scores. You also retain all of your skill and saving throw proficiencies, in addition to gaining those of the creature. If the creature has the same proficiency as you and the bonus in its stat block is higher than yours, use the creature''s bonus instead of yours. If the creature has any legendary or lair actions, you can''t use them. - When you transform, you assume the beast''s hit points and Hit Dice. When you revert to your normal form, you return to the number of hit points you had before you transformed. However, if you revert as a result of dropping to 0 hit points, any excess damage carries over to your normal form. For example, if you take 10 damage in animal form and have only 1 hit point left, you revert and take 9 damage. As long as the excess damage doesn''t reduce your normal form to 0 hit points, you aren''t knocked unconscious. - You can''t cast spells, and your ability to speak or take any action that requires hands is limited to the capabilities of your beast form. Transforming doesn''t break your concentration on a spell you''ve already cast, however, or prevent you from taking actions that are part of a spell, such as call lightning, that you''ve already cast. - You retain the benefit of any features from your class, race, or other source and can use them if the new form is physically capable of doing so. However, you can''t use any of your special senses, such as darkvision, unless your new form also has that sense. - You choose whether your equipment falls to the ground in your space, merges into your new form, or is worn by it. Worn equipment functions as normal, but the GM decides whether it is practical for the new form to wear a piece of equipment, based on the creature''s shape and size. Your equipment doesn''t change size or shape to match the new form, and any equipment that the new form can''t wear must either fall to the ground or merge with it. Equipment that merges with the form has no effect until you leave the form.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'wild-shape-cr-1-or-below', 'Wild Shape (CR 1 or below)', 'druid', '',
  8, 'Starting at 2nd level, you can use your action to magically assume the shape of a beast that you have seen before. You can use this feature twice. You regain expended uses when you finish a short or long rest. Your druid level determines the beasts you can transform into, as shown in the Beast Shapes table. At 2nd level, for example, you can transform into any beast that has a challenge rating of 1/4 or lower that doesn''t have a flying or swimming speed. You can stay in a beast shape for a number of hours equal to half your druid level (rounded down). You then revert to your normal form unless you expend another use of this feature. You can revert to your normal form earlier by using a bonus action on your turn. You automatically revert if you fall unconscious, drop to 0 hit points, or die. While you are transformed, the following rules apply: - Your game statistics are replaced by the statistics of the beast, but you retain your alignment, personality, and Intelligence, Wisdom, and Charisma scores. You also retain all of your skill and saving throw proficiencies, in addition to gaining those of the creature. If the creature has the same proficiency as you and the bonus in its stat block is higher than yours, use the creature''s bonus instead of yours. If the creature has any legendary or lair actions, you can''t use them. - When you transform, you assume the beast''s hit points and Hit Dice. When you revert to your normal form, you return to the number of hit points you had before you transformed. However, if you revert as a result of dropping to 0 hit points, any excess damage carries over to your normal form. For example, if you take 10 damage in animal form and have only 1 hit point left, you revert and take 9 damage. As long as the excess damage doesn''t reduce your normal form to 0 hit points, you aren''t knocked unconscious. - You can''t cast spells, and your ability to speak or take any action that requires hands is limited to the capabilities of your beast form. Transforming doesn''t break your concentration on a spell you''ve already cast, however, or prevent you from taking actions that are part of a spell, such as call lightning, that you''ve already cast. - You retain the benefit of any features from your class, race, or other source and can use them if the new form is physically capable of doing so. However, you can''t use any of your special senses, such as darkvision, unless your new form also has that sense. - You choose whether your equipment falls to the ground in your space, merges into your new form, or is worn by it. Worn equipment functions as normal, but the GM decides whether it is practical for the new form to wear a piece of equipment, based on the creature''s shape and size. Your equipment doesn''t change size or shape to match the new form, and any equipment that the new form can''t wear must either fall to the ground or merge with it. Equipment that merges with the form has no effect until you leave the form.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'wizard-ability-score-improvement-1', 'Ability Score Improvement', 'wizard', '',
  4, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'wizard-ability-score-improvement-2', 'Ability Score Improvement', 'wizard', '',
  8, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'wizard-ability-score-improvement-3', 'Ability Score Improvement', 'wizard', '',
  12, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'wizard-ability-score-improvement-4', 'Ability Score Improvement', 'wizard', '',
  16, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  'wizard-ability-score-improvement-5', 'Ability Score Improvement', 'wizard', '',
  19, 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can''t increase an ability score above 20 using this feature.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
