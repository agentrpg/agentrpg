-- 5e SRD Spells (CC-BY-4.0)
-- Generated: 2026-02-25T09:24:49.415Z
-- Source: https://www.dnd5eapi.co

INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'acid-arrow', 'Acid Arrow', 2, 'evocation',
  '1 action', '90 feet', 'V, S, M', 'Instantaneous',
  'A shimmering green arrow streaks toward a target within range and bursts in a spray of acid. Make a ranged spell attack against the target. On a hit, the target takes 4d4 acid damage immediately and 2d4 acid damage at the end of its next turn. On a miss, the arrow splashes the target with acid for half as much of the initial damage and no damage at the end of its next turn.', '4d4', 'acid', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'acid-splash', 'Acid Splash', 0, 'conjuration',
  '1 action', '60 feet', 'V, S', 'Instantaneous',
  'You hurl a bubble of acid. Choose one creature within range, or choose two creatures within range that are within 5 feet of each other. A target must succeed on a dexterity saving throw or take 1d6 acid damage. This spell''s damage increases by 1d6 when you reach 5th level (2d6), 11th level (3d6), and 17th level (4d6).', '1d6', 'acid', 'DEX', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'aid', 'Aid', 2, 'abjuration',
  '1 action', '30 feet', 'V, S, M', '8 hours',
  'Your spell bolsters your allies with toughness and resolve. Choose up to three creatures within range. Each target''s hit point maximum and current hit points increase by 5 for the duration.', '', '', '', '5',
  '["cleric","paladin"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'alarm', 'Alarm', 1, 'abjuration',
  '1 minute', '30 feet', 'V, S, M', '8 hours',
  'You set an alarm against unwanted intrusion. Choose a door, a window, or an area within range that is no larger than a 20-foot cube. Until the spell ends, an alarm alerts you whenever a Tiny or larger creature touches or enters the warded area. When you cast the spell, you can designate creatures that won''t set off the alarm. You also choose whether the alarm is mental or audible. A mental alarm alerts you with a ping in your mind if you are within 1 mile of the warded area. This ping awakens you if you are sleeping. An audible alarm produces the sound of a hand bell for 10 seconds within 60 feet.', '', '', '', '',
  '["ranger","wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'alter-self', 'Alter Self', 2, 'transmutation',
  '1 action', 'Self', 'V, S', 'Up to 1 hour',
  'You assume a different form. When you cast the spell, choose one of the following options, the effects of which last for the duration of the spell. While the spell lasts, you can end one option as an action to gain the benefits of a different one. ***Aquatic Adaptation.*** You adapt your body to an aquatic environment, sprouting gills and growing webbing between your fingers. You can breathe underwater and gain a swimming speed equal to your walking speed. ***Change Appearance.*** You transform your appearance. You decide what you look like, including your height, weight, facial features, sound of your voice, hair length, coloration, and distinguishing characteristics, if any. You can make yourself appear as a member of another race, though none of your statistics change. You also can''t appear as a creature of a different size than you, and your basic shape stays the same; if you''re bipedal, you can''t use this spell to become quadrupedal, for instance. At any time for the duration of t', '', '', '', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'animal-friendship', 'Animal Friendship', 1, 'enchantment',
  '1 action', '30 feet', 'V, S, M', '24 hours',
  'This spell lets you convince a beast that you mean it no harm. Choose a beast that you can see within range. It must see and hear you. If the beast''s Intelligence is 4 or higher, the spell fails. Otherwise, the beast must succeed on a wisdom saving throw or be charmed by you for the spell''s duration. If you or one of your companions harms the target, the spells ends.', '', '', 'WIS', '',
  '["bard","druid","ranger"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'animal-messenger', 'Animal Messenger', 2, 'enchantment',
  '1 action', '30 feet', 'V, S, M', '24 hours',
  'By means of this spell, you use an animal to deliver a message. Choose a Tiny beast you can see within range, such as a squirrel, a blue jay, or a bat. You specify a location, which you must have visited, and a recipient who matches a general description, such as "a man or woman dressed in the uniform of the town guard" or "a red-haired dwarf wearing a pointed hat." You also speak a message of up to twenty-five words. The target beast travels for the duration of the spell toward the specified location, covering about 50 miles per 24 hours for a flying messenger, or 25 miles for other animals. When the messenger arrives, it delivers your message to the creature that you described, replicating the sound of your voice. The messenger speaks only to a creature matching the description you gave. If the messenger doesn''t reach its destination before the spell ends, the message is lost, and the beast makes its way back to where you cast this spell.', '', '', '', '',
  '["bard","druid","ranger"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'animal-shapes', 'Animal Shapes', 8, 'transmutation',
  '1 action', '30 feet', 'V, S', 'Up to 24 hours',
  'Your magic turns others into beasts. Choose any number of willing creatures that you can see within range. You transform each target into the form of a Large or smaller beast with a challenge rating of 4 or lower. On subsequent turns, you can use your action to transform affected creatures into new forms. The transformation lasts for the duration for each target, or until the target drops to 0 hit points or dies. You can choose a different form for each target. A target''s game statistics are replaced by the statistics of the chosen beast, though the target retains its alignment and Intelligence, Wisdom, and Charisma scores. The target assumes the hit points of its new form, and when it reverts to its normal form, it returns to the number of hit points it had before it transformed. If it reverts as a result of dropping to 0 hit points, any excess damage carries over to its normal form. As long as the excess damage doesn''t reduce the creature''s normal form to 0 hit points, it isn''t knock', '', '', '', '',
  '["druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'animate-dead', 'Animate Dead', 3, 'necromancy',
  '1 minute', '10 feet', 'V, S, M', 'Instantaneous',
  'This spell creates an undead servant. Choose a pile of bones or a corpse of a Medium or Small humanoid within range. Your spell imbues the target with a foul mimicry of life, raising it as an undead creature. The target becomes a skeleton if you chose bones or a zombie if you chose a corpse (the GM has the creature''s game statistics). On each of your turns, you can use a bonus action to mentally command any creature you made with this spell if the creature is within 60 feet of you (if you control multiple creatures, you can command any or all of them at the same time, issuing the same command to each one). You decide what action the creature will take and where it will move during its next turn, or you can issue a general command, such as to guard a particular chamber or corridor. If you issue no commands, the creature only defends itself against hostile creatures. Once given an order, the creature continues to follow it until its task is complete. The creature is under your control fo', '', '', '', '',
  '["cleric","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'animate-objects', 'Animate Objects', 5, 'transmutation',
  '1 action', '120 feet', 'V, S', 'Up to 1 minute',
  'Objects come to life at your command. Choose up to ten nonmagical objects within range that are not being worn or carried. Medium targets count as two objects, Large targets count as four objects, Huge targets count as eight objects. You can''t animate any object larger than Huge. Each target animates and becomes a creature under your control until the spell ends or until reduced to 0 hit points. As a bonus action, you can mentally command any creature you made with this spell if the creature is within 500 feet of you (if you control multiple creatures, you can command any or all of them at the same time, issuing the same command to each one). You decide what action the creature will take and where it will move during its next turn, or you can issue a general command, such as to guard a particular chamber or corridor. If you issue no commands, the creature only defends itself against hostile creatures. Once given an order, the creature continues to follow it until its task is complete. ', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'antilife-shell', 'Antilife Shell', 5, 'abjuration',
  '1 action', 'Self', 'V, S', 'Up to 1 hour',
  'A shimmering barrier extends out from you in a 10-foot radius and moves with you, remaining centered on you and hedging out creatures other than undead and constructs. The barrier lasts for the duration. The barrier prevents an affected creature from passing or reaching through. An affected creature can cast spells or make attacks with ranged or reach weapons through the barrier. If you move so that an affected creature is forced to pass through the barrier, the spell ends.', '', '', '', '',
  '["druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'antimagic-field', 'Antimagic Field', 8, 'abjuration',
  '1 action', 'Self', 'V, S, M', 'Up to 1 hour',
  'A 10-foot-radius invisible sphere of antimagic surrounds you. This area is divorced from the magical energy that suffuses the multiverse. Within the sphere, spells can''t be cast, summoned creatures disappear, and even magic items become mundane. Until the spell ends, the sphere moves with you, centered on you. Spells and other magical effects, except those created by an artifact or a deity, are suppressed in the sphere and can''t protrude into it. A slot expended to cast a suppressed spell is consumed. While an effect is suppressed, it doesn''t function, but the time it spends suppressed counts against its duration. ***Targeted Effects.*** Spells and other magical effects, such as magic missile and charm person, that target a creature or an object in the sphere have no effect on that target. ***Areas of Magic.*** The area of another spell or magical effect, such as fireball, can''t extend into the sphere. If the sphere overlaps an area of magic, the part of the area that is covered by the', '', '', '', '',
  '["cleric","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'antipathy-sympathy', 'Antipathy/Sympathy', 8, 'enchantment',
  '1 hour', '60 feet', 'V, S, M', '10 days',
  'This spell attracts or repels creatures of your choice. You target something within range, either a Huge or smaller object or creature or an area that is no larger than a 200-foot cube. Then specify a kind of intelligent creature, such as red dragons, goblins, or vampires. You invest the target with an aura that either attracts or repels the specified creatures for the duration. Choose antipathy or sympathy as the aura''s effect. ***Antipathy.*** The enchantment causes creatures of the kind you designated to feel an intense urge to leave the area and avoid the target. When such a creature can see the target or comes within 60 feet of it, the creature must succeed on a wisdom saving throw or become frightened. The creature remains frightened while it can see the target or is within 60 feet of it. While frightened by the target, the creature must use its movement to move to the nearest safe spot from which it can''t see the target. If the creature moves more than 60 feet from the target an', '', '', '', '',
  '["druid","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'arcane-eye', 'Arcane Eye', 4, 'divination',
  '1 action', '30 feet', 'V, S, M', 'Up to 1 hour',
  'You create an invisible, magical eye within range that hovers in the air for the duration. You mentally receive visual information from the eye, which has normal vision and darkvision out to 30 feet. The eye can look in every direction. As an action, you can move the eye up to 30 feet in any direction. There is no limit to how far away from you the eye can move, but it can''t enter another plane of existence. A solid barrier blocks the eye''s movement, but the eye can pass through an opening as small as 1 inch in diameter.', '', '', '', '',
  '["cleric","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'arcane-hand', 'Arcane Hand', 5, 'evocation',
  '1 action', '120 feet', 'V, S, M', 'Up to 1 minute',
  'You create a Large hand of shimmering, translucent force in an unoccupied space that you can see within range. The hand lasts for the spell''s duration, and it moves at your command, mimicking the movements of your own hand. The hand is an object that has AC 20 and hit points equal to your hit point maximum. If it drops to 0 hit points, the spell ends. It has a Strength of 26 (+8) and a Dexterity of 10 (+0). The hand doesn''t fill its space. When you cast the spell and as a bonus action on your subsequent turns, you can move the hand up to 60 feet and then cause one of the following effects with it. ***Clenched Fist.*** The hand strikes one creature or object within 5 feet of it. Make a melee spell attack for the hand using your game statistics. On a hit, the target takes 4d8 force damage. ***Forceful Hand.*** The hand attempts to push a creature within 5 feet of it in a direction you choose. Make a check with the hand''s Strength contested by the Strength (Athletics) check of the target.', '', '', '', '',
  '["wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'arcane-lock', 'Arcane Lock', 2, 'abjuration',
  '1 action', 'Touch', 'V, S, M', 'Until dispelled',
  'You touch a closed door, window, gate, chest, or other entryway, and it becomes locked for the duration. You and the creatures you designate when you cast this spell can open the object normally. You can also set a password that, when spoken within 5 feet of the object, suppresses this spell for 1 minute. Otherwise, it is impassable until it is broken or the spell is dispelled or suppressed. Casting knock on the object suppresses arcane lock for 10 minutes. While affected by this spell, the object is more difficult to break or force open; the DC to break it or pick any locks on it increases by 10.', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'arcane-sword', 'Arcane Sword', 7, 'evocation',
  '1 action', '60 feet', 'V, S, M', 'Up to 1 minute',
  'You create a sword-shaped plane of force that hovers within range. It lasts for the duration. When the sword appears, you make a melee spell attack against a target of your choice within 5 feet of the sword. On a hit, the target takes 3d10 force damage. Until the spell ends, you can use a bonus action on each of your turns to move the sword up to 20 feet to a spot you can see and repeat this attack against the same target or a different one.', '3d10', 'force', '', '',
  '["bard","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'arcanists-magic-aura', 'Arcanist''s Magic Aura', 2, 'illusion',
  '1 action', 'Touch', 'V, S, M', '24 hours',
  'You place an illusion on a creature or an object you touch so that divination spells reveal false information about it. The target can be a willing creature or an object that isn''t being carried or worn by another creature. When you cast the spell, choose one or both of the following effects. The effect lasts for the duration. If you cast this spell on the same creature or object every day for 30 days, placing the same effect on it each time, the illusion lasts until it is dispelled. ***False Aura.*** You change the way the target appears to spells and magical effects, such as detect magic, that detect magical auras. You can make a nonmagical object appear magical, a magical object appear nonmagical, or change the object''s magical aura so that it appears to belong to a specific school of magic that you choose. When you use this effect on an object, you can make the false magic apparent to any creature that handles the item. ***Mask.*** You change the way the target appears to spells an', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'astral-projection', 'Astral Projection', 9, 'necromancy',
  '1 hour', '10 feet', 'V, S, M', 'Special',
  'You and up to eight willing creatures within range project your astral bodies into the Astral Plane (the spell fails and the casting is wasted if you are already on that plane). The material body you leave behind is unconscious and in a state of suspended animation; it doesn''t need food or air and doesn''t age. Your astral body resembles your mortal form in almost every way, replicating your game statistics and possessions. The principal difference is the addition of a silvery cord that extends from between your shoulder blades and trails behind you, fading to invisibility after 1 foot. This cord is your tether to your material body. As long as the tether remains intact, you can find your way home. If the cord is cut--something that can happen only when an effect specifically states that it does--your soul and body are separated, killing you instantly. Your astral form can freely travel through the Astral Plane and can pass through portals there leading to any other plane. If you enter ', '', '', '', '',
  '["cleric","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'augury', 'Augury', 2, 'divination',
  '1 minute', 'Self', 'V, S, M', 'Instantaneous',
  'By casting gem-inlaid sticks, rolling dragon bones, laying out ornate cards, or employing some other divining tool, you receive an omen from an otherworldly entity about the results of a specific course of action that you plan to take within the next 30 minutes. The GM chooses from the following possible omens: - Weal, for good results - Woe, for bad results - Weal and woe, for both good and bad results - Nothing, for results that aren''t especially good or bad The spell doesn''t take into account any possible circumstances that might change the outcome, such as the casting of additional spells or the loss or gain of a companion. If you cast the spell two or more times before completing your next long rest, there is a cumulative 25 percent chance for each casting after the first that you get a random reading. The GM makes this roll in secret.', '', '', '', '',
  '["cleric"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'awaken', 'Awaken', 5, 'transmutation',
  '8 hours', 'Touch', 'V, S, M', 'Instantaneous',
  'After spending the casting time tracing magical pathways within a precious gemstone, you touch a Huge or smaller beast or plant. The target must have either no Intelligence score or an Intelligence of 3 or less. The target gains an Intelligence of 10. The target also gains the ability to speak one language you know. If the target is a plant, it gains the ability to move its limbs, roots, vines, creepers, and so forth, and it gains senses similar to a human''s. Your GM chooses statistics appropriate for the awakened plant, such as the statistics for the awakened shrub or the awakened tree. The awakened beast or plant is charmed by you for 30 days or until you or your companions do anything harmful to it. When the charmed condition ends, the awakened creature chooses whether to remain friendly to you, based on how you treated it while it was charmed.', '', '', '', '',
  '["bard","druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'bane', 'Bane', 1, 'enchantment',
  '1 action', '30 feet', 'V, S, M', 'Up to 1 minute',
  'Up to three creatures of your choice that you can see within range must make charisma saving throws. Whenever a target that fails this saving throw makes an attack roll or a saving throw before the spell ends, the target must roll a d4 and subtract the number rolled from the attack roll or saving throw.', '', '', 'CHA', '',
  '["bard","cleric"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'banishment', 'Banishment', 4, 'abjuration',
  '1 action', '60 feet', 'V, S, M', 'Up to 1 minute',
  'You attempt to send one creature that you can see within range to another plane of existence. The target must succeed on a charisma saving throw or be banished. If the target is native to the plane of existence you''re on, you banish the target to a harmless demiplane. While there, the target is incapacitated. The target remains there until the spell ends, at which point the target reappears in the space it left or in the nearest unoccupied space if that space is occupied. If the target is native to a different plane of existence than the one you''re on, the target is banished with a faint popping noise, returning to its home plane. If the spell ends before 1 minute has passed, the target reappears in the space it left or in the nearest unoccupied space if that space is occupied. Otherwise, the target doesn''t return.', '', '', 'CHA', '',
  '["cleric","paladin","sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'barkskin', 'Barkskin', 2, 'transmutation',
  '1 action', 'Touch', 'V, S, M', 'Up to 1 hour',
  'You touch a willing creature. Until the spell ends, the target''s skin has a rough, bark-like appearance, and the target''s AC can''t be less than 16, regardless of what kind of armor it is wearing.', '', '', '', '',
  '["druid","ranger"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'beacon-of-hope', 'Beacon of Hope', 3, 'abjuration',
  '1 action', '30 feet', 'V, S', 'Up to 1 minute',
  'This spell bestows hope and vitality. Choose any number of creatures within range. For the duration, each target has advantage on wisdom saving throws and death saving throws, and regains the maximum number of hit points possible from any healing.', '', '', '', '',
  '["cleric"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'bestow-curse', 'Bestow Curse', 3, 'necromancy',
  '1 action', 'Touch', 'V, S', 'Up to 1 minute',
  'You touch a creature, and that creature must succeed on a wisdom saving throw or become cursed for the duration of the spell. When you cast this spell, choose the nature of the curse from the following options: - Choose one ability score. While cursed, the target has disadvantage on ability checks and saving throws made with that ability score. - While cursed, the target has disadvantage on attack rolls against you. - While cursed, the target must make a wisdom saving throw at the start of each of its turns. If it fails, it wastes its action that turn doing nothing. - While the target is cursed, your attacks and spells deal an extra 1d8 necrotic damage to the target. A remove curse spell ends this effect. At the GM''s option, you may choose an alternative curse effect, but it should be no more powerful than those described above. The GM has final say on such a curse''s effect.', '', '', 'WIS', '',
  '["bard","cleric","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'black-tentacles', 'Black Tentacles', 4, 'conjuration',
  '1 action', '90 feet', 'V, S, M', 'Up to 1 minute',
  'Squirming, ebony tentacles fill a 20-foot square on ground that you can see within range. For the duration, these tentacles turn the ground in the area into difficult terrain. When a creature enters the affected area for the first time on a turn or starts its turn there, the creature must succeed on a Dexterity saving throw or take 3d6 bludgeoning damage and be restrained by the tentacles until the spell ends. A creature that starts its turn in the area and is already restrained by the tentacles takes 3d6 bludgeoning damage. A creature restrained by the tentacles can use its action to make a Strength or Dexterity check (its choice) against your spell save DC. On a success, it frees itself.', '3d6', 'bludgeoning', 'DEX', '',
  '["wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'blade-barrier', 'Blade Barrier', 6, 'evocation',
  '1 action', '90 feet', 'V, S', 'Up to 10 minutes',
  'You create a vertical wall of whirling, razor-sharp blades made of magical energy. The wall appears within range and lasts for the duration. You can make a straight wall up to 100 feet long, 20 feet high, and 5 feet thick, or a ringed wall up to 60 feet in diameter, 20 feet high, and 5 feet thick. The wall provides three-quarters cover to creatures behind it, and its space is difficult terrain. When a creature enters the wall''s area for the first time on a turn or starts its turn there, the creature must make a dexterity saving throw. On a failed save, the creature takes 6d10 slashing damage. On a successful save, the creature takes half as much damage.', '6d10', 'slashing', 'DEX', '',
  '["cleric"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'bless', 'Bless', 1, 'enchantment',
  '1 action', '30 feet', 'V, S, M', 'Up to 1 minute',
  'You bless up to three creatures of your choice within range. Whenever a target makes an attack roll or a saving throw before the spell ends, the target can roll a d4 and add the number rolled to the attack roll or saving throw.', '', '', '', '',
  '["cleric","paladin"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'blight', 'Blight', 4, 'necromancy',
  '1 action', '30 feet', 'V, S', 'Instantaneous',
  'Necromantic energy washes over a creature of your choice that you can see within range, draining moisture and vitality from it. The target must make a constitution saving throw. The target takes 8d8 necrotic damage on a failed save, or half as much damage on a successful one. The spell has no effect on undead or constructs. If you target a plant creature or a magical plant, it makes the saving throw with disadvantage, and the spell deals maximum damage to it. If you target a nonmagical plant that isn''t a creature, such as a tree or shrub, it doesn''t make a saving throw; it simply withers and dies.', '8d8', 'necrotic', 'CON', '',
  '["druid","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'blindness-deafness', 'Blindness/Deafness', 2, 'necromancy',
  '1 action', '30 feet', 'V', '1 minute',
  'You can blind or deafen a foe. Choose one creature that you can see within range to make a constitution saving throw. If it fails, the target is either blinded or deafened (your choice) for the duration. At the end of each of its turns, the target can make a constitution saving throw. On a success, the spell ends.', '', '', 'CON', '',
  '["bard","cleric","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'blink', 'Blink', 3, 'transmutation',
  '1 action', 'Self', 'V, S', '1 minute',
  'Roll a d20 at the end of each of your turns for the duration of the spell. On a roll of 11 or higher, you vanish from your current plane of existence and appear in the Ethereal Plane (the spell fails and the casting is wasted if you were already on that plane). At the start of your next turn, and when the spell ends if you are on the Ethereal Plane, you return to an unoccupied space of your choice that you can see within 10 feet of the space you vanished from. If no unoccupied space is available within that range, you appear in the nearest unoccupied space (chosen at random if more than one space is equally near). You can dismiss this spell as an action. While on the Ethereal Plane, you can see and hear the plane you originated from, which is cast in shades of gray, and you can''t see anything there more than 60 feet away. You can only affect and be affected by other creatures on the Ethereal Plane. Creatures that aren''t there can''t perceive you or interact with you, unless they have th', '', '', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'blur', 'Blur', 2, 'illusion',
  '1 action', 'Self', 'V', 'Up to 1 minute',
  'Your body becomes blurred, shifting and wavering to all who can see you. For the duration, any creature has disadvantage on attack rolls against you. An attacker is immune to this effect if it doesn''t rely on sight, as with blindsight, or can see through illusions, as with truesight.', '', '', '', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'branding-smite', 'Branding Smite', 2, 'evocation',
  '1 bonus action', 'Self', 'V', 'Up to 1 minute',
  'The next time you hit a creature with a weapon attack before this spell ends, the weapon gleams with astral radiance as you strike. The attack deals an extra 2d6 radiant damage to the target, which becomes visible if it''s invisible, and the target sheds dim light in a 5-foot radius and can''t become invisible until the spell ends.', '2d6', 'radiant', '', '',
  '["paladin"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'burning-hands', 'Burning Hands', 1, 'evocation',
  '1 action', 'Self', 'V, S', 'Instantaneous',
  'As you hold your hands with thumbs touching and fingers spread, a thin sheet of flames shoots forth from your outstretched fingertips. Each creature in a 15-foot cone must make a dexterity saving throw. A creature takes 3d6 fire damage on a failed save, or half as much damage on a successful one. The fire ignites any flammable objects in the area that aren''t being worn or carried.', '3d6', 'fire', 'DEX', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'call-lightning', 'Call Lightning', 3, 'conjuration',
  '1 action', '120 feet', 'V, S', 'Up to 10 minutes',
  'A storm cloud appears in the shape of a cylinder that is 10 feet tall with a 60-foot radius, centered on a point you can see 100 feet directly above you. The spell fails if you can''t see a point in the air where the storm cloud could appear (for example, if you are in a room that can''t accommodate the cloud). When you cast the spell, choose a point you can see within range. A bolt of lightning flashes down from the cloud to that point. Each creature within 5 feet of that point must make a dexterity saving throw. A creature takes 3d10 lightning damage on a failed save, or half as much damage on a successful one. On each of your turns until the spell ends, you can use your action to call down lightning in this way again, targeting the same point or a different one. If you are outdoors in stormy conditions when you cast this spell, the spell gives you control over the existing storm instead of creating a new one. Under such conditions, the spell''s damage increases by 1d10.', '3d10', 'lightning', '', '',
  '["druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'calm-emotions', 'Calm Emotions', 2, 'enchantment',
  '1 action', '60 feet', 'V, S', 'Up to 1 minute',
  'You attempt to suppress strong emotions in a group of people. Each humanoid in a 20-foot-radius sphere centered on a point you choose within range must make a charisma saving throw; a creature can choose to fail this saving throw if it wishes. If a creature fails its saving throw, choose one of the following two effects. You can suppress any effect causing a target to be charmed or frightened. When this spell ends, any suppressed effect resumes, provided that its duration has not expired in the meantime. Alternatively, you can make a target indifferent about creatures of your choice that it is hostile toward. This indifference ends if the target is attacked or harmed by a spell or if it witnesses any of its friends being harmed. When the spell ends, the creature becomes hostile again, unless the GM rules otherwise.', '', '', 'CHA', '',
  '["bard","cleric"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'chain-lightning', 'Chain Lightning', 6, 'evocation',
  '1 action', '150 feet', 'V, S, M', 'Instantaneous',
  'You create a bolt of lightning that arcs toward a target of your choice that you can see within range. Three bolts then leap from that target to as many as three other targets, each of which must be within 30 feet of the first target. A target can be a creature or an object and can be targeted by only one of the bolts. A target must make a dexterity saving throw. The target takes 10d8 lightning damage on a failed save, or half as much damage on a successful one.', '10d8', 'lightning', 'DEX', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'charm-person', 'Charm Person', 1, 'enchantment',
  '1 action', '30 feet', 'V, S', '1 hour',
  'You attempt to charm a humanoid you can see within range. It must make a wisdom saving throw, and does so with advantage if you or your companions are fighting it. If it fails the saving throw, it is charmed by you until the spell ends or until you or your companions do anything harmful to it. The charmed creature regards you as a friendly acquaintance. When the spell ends, the creature knows it was charmed by you.', '', '', 'WIS', '',
  '["bard","druid","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'chill-touch', 'Chill Touch', 0, 'necromancy',
  '1 action', '120 feet', 'V, S', '1 round',
  'You create a ghostly, skeletal hand in the space of a creature within range. Make a ranged spell attack against the creature to assail it with the chill of the grave. On a hit, the target takes 1d8 necrotic damage, and it can''t regain hit points until the start of your next turn. Until then, the hand clings to the target. If you hit an undead target, it also has disadvantage on attack rolls against you until the end of your next turn. This spell''s damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).', '1d8', 'necrotic', '', '',
  '["sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'circle-of-death', 'Circle of Death', 6, 'necromancy',
  '1 action', '150 feet', 'V, S, M', 'Instantaneous',
  'A sphere of negative energy ripples out in a 60-foot radius sphere from a point within range. Each creature in that area must make a constitution saving throw. A target takes 8d6 necrotic damage on a failed save, or half as much damage on a successful one.', '8d6', 'necrotic', 'CON', '',
  '["sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'clairvoyance', 'Clairvoyance', 3, 'divination',
  '10 minutes', '1 mile', 'V, S, M', 'Up to 10 minutes',
  'You create an invisible sensor within range in a location familiar to you (a place you have visited or seen before) or in an obvious location that is unfamiliar to you (such as behind a door, around a corner, or in a grove of trees). The sensor remains in place for the duration, and it can''t be attacked or otherwise interacted with. When you cast the spell, you choose seeing or hearing. You can use the chosen sense through the sensor as if you were in its space. As your action, you can switch between seeing and hearing. A creature that can see the sensor (such as a creature benefiting from see invisibility or truesight) sees a luminous, intangible orb about the size of your fist.', '', '', '', '',
  '["bard","cleric","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'clone', 'Clone', 8, 'necromancy',
  '1 hour', 'Touch', 'V, S, M', 'Instantaneous',
  'This spell grows an inert duplicate of a living creature as a safeguard against death. This clone forms inside a sealed vessel and grows to full size and maturity after 120 days; you can also choose to have the clone be a younger version of the same creature. It remains inert and endures indefinitely, as long as its vessel remains undisturbed. At any time after the clone matures, if the original creature dies, its soul transfers to the clone, provided that the soul is free and willing to return. The clone is physically identical to the original and has the same personality, memories, and abilities, but none of the original''s equipment. The original creature''s physical remains, if they still exist, become inert and can''t thereafter be restored to life, since the creature''s soul is elsewhere.', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'cloudkill', 'Cloudkill', 5, 'conjuration',
  '1 action', '120 feet', 'V, S', 'Up to 10 minutes',
  'You create a 20-foot-radius sphere of poisonous, yellow-green fog centered on a point you choose within range. The fog spreads around corners. It lasts for the duration or until strong wind disperses the fog, ending the spell. Its area is heavily obscured. When a creature enters the spell''s area for the first time on a turn or starts its turn there, that creature must make a constitution saving throw. The creature takes 5d8 poison damage on a failed save, or half as much damage on a successful one. Creatures are affected even if they hold their breath or don''t need to breathe. The fog moves 10 feet away from you at the start of each of your turns, rolling along the surface of the ground. The vapors, being heavier than air, sink to the lowest level of the land, even pouring down openings.', '5d8', 'poison', 'CON', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'color-spray', 'Color Spray', 1, 'illusion',
  '1 action', 'Self', 'V, S, M', '1 round',
  'A dazzling array of flashing, colored light springs from your hand. Roll 6d10; the total is how many hit points of creatures this spell can effect. Creatures in a 15-foot cone originating from you are affected in ascending order of their current hit points (ignoring unconscious creatures and creatures that can''t see). Starting with the creature that has the lowest current hit points, each creature affected by this spell is blinded until the spell ends. Subtract each creature''s hit points from the total before moving on to the creature with the next lowest hit points. A creature''s hit points must be equal to or less than the remaining total for that creature to be affected.', '', '', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'command', 'Command', 1, 'enchantment',
  '1 action', '60 feet', 'V', '1 round',
  'You speak a one-word command to a creature you can see within range. The target must succeed on a wisdom saving throw or follow the command on its next turn. The spell has no effect if the target is undead, if it doesn''t understand your language, or if your command is directly harmful to it. Some typical commands and their effects follow. You might issue a command other than one described here. If you do so, the GM determines how the target behaves. If the target can''t follow your command, the spell ends. ***Approach.*** The target moves toward you by the shortest and most direct route, ending its turn if it moves within 5 feet of you. ***Drop.*** The target drops whatever it is holding and then ends its turn. ***Flee.*** The target spends its turn moving away from you by the fastest available means. ***Grovel.*** The target falls prone and then ends its turn. ***Halt.*** The target doesn''t move and takes no actions. A flying creature stays aloft, provided that it is able to do so. If ', '', '', 'WIS', '',
  '["cleric","paladin"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'commune', 'Commune', 5, 'divination',
  '1 minute', 'Self', 'V, S, M', '1 minute',
  'You contact your deity or a divine proxy and ask up to three questions that can be answered with a yes or no. You must ask your questions before the spell ends. You receive a correct answer for each question. Divine beings aren''t necessarily omniscient, so you might receive "unclear" as an answer if a question pertains to information that lies beyond the deity''s knowledge. In a case where a one-word answer could be misleading or contrary to the deity''s interests, the GM might offer a short phrase as an answer instead. If you cast the spell two or more times before finishing your next long rest, there is a cumulative 25 percent chance for each casting after the first that you get no answer. The GM makes this roll in secret.', '', '', '', '',
  '["cleric"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'commune-with-nature', 'Commune With Nature', 5, 'divination',
  '1 minute', 'Self', 'V, S', 'Instantaneous',
  'You briefly become one with nature and gain knowledge of the surrounding territory. In the outdoors, the spell gives you knowledge of the land within 3 miles of you. In caves and other natural underground settings, the radius is limited to 300 feet. The spell doesn''t function where nature has been replaced by construction, such as in dungeons and towns. You instantly gain knowledge of up to three facts of your choice about any of the following subjects as they relate to the area: - terrain and bodies of water - prevalent plants, minerals, animals, or peoples - powerful celestials, fey, fiends, elementals, or undead - influence from other planes of existence - buildings For example, you could determine the location of powerful undead in the area, the location of major sources of safe drinking water, and the location of any nearby towns.', '', '', '', '',
  '["druid","ranger"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'comprehend-languages', 'Comprehend Languages', 1, 'divination',
  '1 action', 'Self', 'V, S, M', '1 hour',
  'For the duration, you understand the literal meaning of any spoken language that you hear. You also understand any written language that you see, but you must be touching the surface on which the words are written. It takes about 1 minute to read one page of text. This spell doesn''t decode secret messages in a text or a glyph, such as an arcane sigil, that isn''t part of a written language.', '', '', '', '',
  '["bard","sorcerer","warlock","wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'compulsion', 'Compulsion', 4, 'enchantment',
  '1 action', '30 feet', 'V, S', 'Up to 1 minute',
  'Creatures of your choice that you can see within range and that can hear you must make a wisdom saving throw. A target automatically succeeds on this saving throw if it can''t be charmed. On a failed save, a target is affected by this spell. Until the spell ends, you can use a bonus action on each of your turns to designate a direction that is horizontal to you. Each affected target must use as much of its movement as possible to move in that direction on its next turn. It can take any action before it moves. After moving in this way, it can make another Wisdom save to try to end the effect. A target isn''t compelled to move into an obviously deadly hazard, such as a fire or a pit, but it will provoke opportunity attacks to move in the designated direction.', '', '', 'WIS', '',
  '["bard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'cone-of-cold', 'Cone of Cold', 5, 'evocation',
  '1 action', 'Self', 'V, S, M', 'Instantaneous',
  'A blast of cold air erupts from your hands. Each creature in a 60-foot cone must make a constitution saving throw. A creature takes 8d8 cold damage on a failed save, or half as much damage on a successful one. A creature killed by this spell becomes a frozen statue until it thaws.', '8d8', 'cold', 'CON', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'confusion', 'Confusion', 4, 'enchantment',
  '1 action', '90 feet', 'V, S, M', 'Up to 1 minute',
  'This spell assaults and twists creatures'' minds, spawning delusions and provoking uncontrolled action. Each creature in a 10-foot-radius sphere centered on a point you choose within range must succeed on a Wisdom saving throw when you cast this spell or be affected by it. An affected target can''t take reactions and must roll a d10 at the start of each of its turns to determine its behavior for that turn. | d10 | Behavior | |---|---| | 1 | The creature uses all its movement to move in a random direction. To determine the direction, roll a d8 and assign a direction to each die face. The creature doesn''t take an action this turn. | | 2-6 | The creature doesn''t move or take actions this turn. | | 7-8 | The creature uses its action to make a melee attack against a randomly determined creature within its reach. If there is no creature within its reach, the creature does nothing this turn. | | 9-10 | The creature can act and move normally. | At the end of each of its turns, an affected target', '', '', 'WIS', '',
  '["bard","druid","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'conjure-animals', 'Conjure Animals', 3, 'conjuration',
  '1 action', '60 feet', 'V, S', 'Up to 1 hour',
  'You summon fey spirits that take the form of beasts and appear in unoccupied spaces that you can see within range. Choose one of the following options for what appears: - One beast of challenge rating 2 or lower - Two beasts of challenge rating 1 or lower - Four beasts of challenge rating 1/2 or lower - Eight beasts of challenge rating 1/4 or lower - Each beast is also considered fey, and it disappears when it drops to 0 hit points or when the spell ends. The summoned creatures are friendly to you and your companions. Roll initiative for the summoned creatures as a group, which has its own turns. They obey any verbal commands that you issue to them (no action required by you). If you don''t issue any commands to them, they defend themselves from hostile creatures, but otherwise take no actions. The GM has the creatures'' statistics.', '', '', '', '',
  '["druid","ranger"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'conjure-celestial', 'Conjure Celestial', 7, 'conjuration',
  '1 minute', '90 feet', 'V, S', 'Up to 1 hour',
  'You summon a celestial of challenge rating 4 or lower, which appears in an unoccupied space that you can see within range. The celestial disappears when it drops to 0 hit points or when the spell ends. The celestial is friendly to you and your companions for the duration. Roll initiative for the celestial, which has its own turns. It obeys any verbal commands that you issue to it (no action required by you), as long as they don''t violate its alignment. If you don''t issue any commands to the celestial, it defends itself from hostile creatures but otherwise takes no actions. The GM has the celestial''s statistics.', '', '', '', '',
  '["cleric"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'conjure-elemental', 'Conjure Elemental', 5, 'conjuration',
  '1 minute', '90 feet', 'V, S, M', 'Up to 1 hour',
  'You call forth an elemental servant. Choose an area of air, earth, fire, or water that fills a 10-foot cube within range. An elemental of challenge rating 5 or lower appropriate to the area you chose appears in an unoccupied space within 10 feet of it. For example, a fire elemental emerges from a bonfire, and an earth elemental rises up from the ground. The elemental disappears when it drops to 0 hit points or when the spell ends. The elemental is friendly to you and your companions for the duration. Roll initiative for the elemental, which has its own turns. It obeys any verbal commands that you issue to it (no action required by you). If you don''t issue any commands to the elemental, it defends itself from hostile creatures but otherwise takes no actions. If your concentration is broken, the elemental doesn''t disappear. Instead, you lose control of the elemental, it becomes hostile toward you and your companions, and it might attack. An uncontrolled elemental can''t be dismissed by yo', '', '', '', '',
  '["druid","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'conjure-fey', 'Conjure Fey', 6, 'conjuration',
  '1 minute', '90 feet', 'V, S', 'Up to 1 hour',
  'You summon a fey creature of challenge rating 6 or lower, or a fey spirit that takes the form of a beast of challenge rating 6 or lower. It appears in an unoccupied space that you can see within range. The fey creature disappears when it drops to 0 hit points or when the spell ends. The fey creature is friendly to you and your companions for the duration. Roll initiative for the creature, which has its own turns. It obeys any verbal commands that you issue to it (no action required by you), as long as they don''t violate its alignment. If you don''t issue any commands to the fey creature, it defends itself from hostile creatures but otherwise takes no actions. If your concentration is broken, the fey creature doesn''t disappear. Instead, you lose control of the fey creature, it becomes hostile toward you and your companions, and it might attack. An uncontrolled fey creature can''t be dismissed by you, and it disappears 1 hour after you summoned it. The GM has the fey creature''s statistics.', '', '', '', '',
  '["druid","warlock"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'conjure-minor-elementals', 'Conjure Minor Elementals', 4, 'conjuration',
  '1 minute', '90 feet', 'V, S', 'Up to 1 hour',
  'You summon elementals that appear in unoccupied spaces that you can see within range. You choose one the following options for what appears: - One elemental of challenge rating 2 or lower - Two elementals of challenge rating 1 or lower - Four elementals of challenge rating 1/2 or lower - Eight elementals of challenge rating 1/4 or lower. An elemental summoned by this spell disappears when it drops to 0 hit points or when the spell ends. The summoned creatures are friendly to you and your companions. Roll initiative for the summoned creatures as a group, which has its own turns. They obey any verbal commands that you issue to them (no action required by you). If you don''t issue any commands to them, they defend themselves from hostile creatures, but otherwise take no actions. The GM has the creatures'' statistics.', '', '', '', '',
  '["druid","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'conjure-woodland-beings', 'Conjure Woodland Beings', 4, 'conjuration',
  '1 action', '60 feet', 'V, S, M', 'Up to 1 hour',
  'You summon fey creatures that appear in unoccupied spaces that you can see within range. Choose one of the following options for what appears: - One fey creature of challenge rating 2 or lower - Two fey creatures of challenge rating 1 or lower - Four fey creatures of challenge rating 1/2 or lower - Eight fey creatures of challenge rating 1/4 or lower A summoned creature disappears when it drops to 0 hit points or when the spell ends. The summoned creatures are friendly to you and your companions. Roll initiative for the summoned creatures as a group, which have their own turns. They obey any verbal commands that you issue to them (no action required by you). If you don''t issue any commands to them, they defend themselves from hostile creatures, but otherwise take no actions. The GM has the creatures'' statistics.', '', '', '', '',
  '["druid","ranger"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'contact-other-plane', 'Contact Other Plane', 5, 'divination',
  '1 minute', 'Self', 'V', '1 minute',
  'You mentally contact a demigod, the spirit of a long-dead sage, or some other mysterious entity from another plane. Contacting this extraplanar intelligence can strain or even break your mind. When you cast this spell, make a DC 15 intelligence saving throw. On a failure, you take 6d6 psychic damage and are insane until you finish a long rest. While insane, you can''t take actions, can''t understand what other creatures say, can''t read, and speak only in gibberish. A greater restoration spell cast on you ends this effect. On a successful save, you can ask the entity up to five questions. You must ask your questions before the spell ends. The GM answers each question with one word, such as "yes," "no," "maybe," "never," "irrelevant," or "unclear" (if the entity doesn''t know the answer to the question). If a one-word answer would be misleading, the GM might instead offer a short phrase as an answer.', '', '', 'INT', '',
  '["warlock","wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'contagion', 'Contagion', 5, 'necromancy',
  '1 action', 'Touch', 'V, S', '7 days',
  'Your touch inflicts disease. Make a melee spell attack against a creature within your reach. On a hit, you afflict the creature with a disease of your choice from any of the ones described below. At the end of each of the target''s turns, it must make a constitution saving throw. After failing three of these saving throws, the disease''s effects last for the duration, and the creature stops making these saves. After succeeding on three of these saving throws, the creature recovers from the disease, and the spell ends. Since this spell induces a natural disease in its target, any effect that removes a disease or otherwise ameliorates a disease''s effects apply to it. ***Blinding Sickness.*** Pain grips the creature''s mind, and its eyes turn milky white. The creature has disadvantage on wisdom checks and wisdom saving throws and is blinded. ***Filth Fever.*** A raging fever sweeps through the creature''s body. The creature has disadvantage on strength checks, strength saving throws, and atta', '', '', 'CON', '',
  '["cleric","druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'contingency', 'Contingency', 6, 'evocation',
  '10 minutes', 'Self', 'V, S, M', '10 days',
  'Choose a spell of 5th level or lower that you can cast, that has a casting time of 1 action, and that can target you. You cast that spell--called the contingent spell--as part of casting contingency, expending spell slots for both, but the contingent spell doesn''t come into effect. Instead, it takes effect when a certain circumstance occurs. You describe that circumstance when you cast the two spells. For example, a contingency cast with water breathing might stipulate that water breathing comes into effect when you are engulfed in water or a similar liquid. The contingent spell takes effect immediately after the circumstance is met for the first time, whether or not you want it to. and then contingency ends. The contingent spell takes effect only on you, even if it can normally target others. You can use only one contingency spell at a time. If you cast this spell again, the effect of another contingency spell on you ends. Also, contingency ends on you if its material component is eve', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'continual-flame', 'Continual Flame', 2, 'evocation',
  '1 action', 'Touch', 'V, S, M', 'Until dispelled',
  'A flame, equivalent in brightness to a torch, springs forth from an object that you touch. The effect looks like a regular flame, but it creates no heat and doesn''t use oxygen. A continual flame can be covered or hidden but not smothered or quenched.', '', '', '', '',
  '["cleric","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'control-water', 'Control Water', 4, 'transmutation',
  '1 action', '300 feet', 'V, S, M', 'Up to 10 minutes',
  'Until the spell ends, you control any freestanding water inside an area you choose that is a cube up to 100 feet on a side. You can choose from any of the following effects when you cast this spell. As an action on your turn, you can repeat the same effect or choose a different one. ***Flood.*** You cause the water level of all standing water in the area to rise by as much as 20 feet. If the area includes a shore, the flooding water spills over onto dry land. If you choose an area in a large body of water, you instead create a 20-foot tall wave that travels from one side of the area to the other and then crashes down. Any Huge or smaller vehicles in the wave''s path are carried with it to the other side. Any Huge or smaller vehicles struck by the wave have a 25 percent chance of capsizing. The water level remains elevated until the spell ends or you choose a different effect. If this effect produced a wave, the wave repeats on the start of your next turn while the flood effect lasts. **', '2d8', 'bludgeoning', 'STR', '',
  '["cleric","druid","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'control-weather', 'Control Weather', 8, 'transmutation',
  '10 minutes', 'Self', 'V, S, M', 'Up to 8 hours',
  'You take control of the weather within 5 miles of you for the duration. You must be outdoors to cast this spell. Moving to a place where you don''t have a clear path to the sky ends the spell early. When you cast the spell, you change the current weather conditions, which are determined by the GM based on the climate and season. You can change precipitation, temperature, and wind. It takes 1d4 x 10 minutes for the new conditions to take effect. Once they do so, you can change the conditions again. When the spell ends, the weather gradually returns to normal. When you change the weather conditions, find a current condition on the following tables and change its stage by one, up or down. When changing the wind, you can change its direction. ##### Precipitation | Stage | Condition | |---|---| | 1 | Clear | | 2 | Light clouds | | 3 | Overcast or ground fog | | 4 | Rain, hail, or snow | | 5 | Torrential rain, driving hail, or blizzard | ##### Temperature | Stage | Condition | |---|---| | 1 |', '', '', '', '',
  '["cleric","druid","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'counterspell', 'Counterspell', 3, 'abjuration',
  '1 reaction', '60 feet', 'S', 'Instantaneous',
  'You attempt to interrupt a creature in the process of casting a spell. If the creature is casting a spell of 3rd level or lower, its spell fails and has no effect. If it is casting a spell of 4th level or higher, make an ability check using your spellcasting ability. The DC equals 10 + the spell''s level. On a success, the creature''s spell fails and has no effect.', '', '', '', '',
  '["sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'create-food-and-water', 'Create Food and Water', 3, 'conjuration',
  '1 action', '30 feet', 'V, S', 'Instantaneous',
  'You create 45 pounds of food and 30 gallons of water on the ground or in containers within range, enough to sustain up to fifteen humanoids or five steeds for 24 hours. The food is bland but nourishing, and spoils if uneaten after 24 hours. The water is clean and doesn''t go bad.', '', '', '', '',
  '["cleric","druid","paladin"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'create-or-destroy-water', 'Create or Destroy Water', 1, 'transmutation',
  '1 action', '30 feet', 'V, S, M', 'Instantaneous',
  'You either create or destroy water. ***Create Water.*** You create up to 10 gallons of clean water within range in an open container. Alternatively, the water falls as rain in a 30-foot cube within range. ***Destroy Water.*** You destroy up to 10 gallons of water in an open container within range. Alternatively, you destroy fog in a 30-foot cube within range.', '', '', '', '',
  '["cleric","druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'create-undead', 'Create Undead', 6, 'necromancy',
  '1 minute', '10 feet', 'V, S, M', 'Instantaneous',
  'You can cast this spell only at night. Choose up to three corpses of Medium or Small humanoids within range. Each corpse becomes a ghoul under your control. (The GM has game statistics for these creatures.) As a bonus action on each of your turns, you can mentally command any creature you animated with this spell if the creature is within 120 feet of you (if you control multiple creatures, you can command any or all of them at the same time, issuing the same command to each one). You decide what action the creature will take and where it will move during its next turn, or you can issue a general command, such as to guard a particular chamber or corridor. If you issue no commands, the creature only defends itself against hostile creatures. Once given an order, the creature continues to follow it until its task is complete. The creature is under your control for 24 hours, after which it stops obeying any command you have given it. To maintain control of the creature for another 24 hours,', '', '', '', '',
  '["cleric","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'creation', 'Creation', 5, 'illusion',
  '1 minute', '30 feet', 'V, S, M', 'Special',
  'You pull wisps of shadow material from the Shadowfell to create a nonliving object of vegetable matter within range: soft goods, rope, wood, or something similar. You can also use this spell to create mineral objects such as stone, crystal, or metal. The object created must be no larger than a 5-foot cube, and the object must be of a form and material that you have seen before. The duration depends on the object''s material. If the object is composed of multiple materials, use the shortest duration. | Material | Duration | |---|---| | Vegetable matter | 1 day | | Stone or crystal | 12 hours | | Precious metals | 1 hour | | Gems | 10 minutes | | Adamantine or mithral | 1 minute | Using any material created by this spell as another spell''s material component causes that spell to fail.', '', '', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'cure-wounds', 'Cure Wounds', 1, 'evocation',
  '1 action', 'Touch', 'V, S', 'Instantaneous',
  'A creature you touch regains a number of hit points equal to 1d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.', '', '', '', '1d8 + MOD',
  '["bard","cleric","druid","paladin","ranger"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'dancing-lights', 'Dancing Lights', 0, 'evocation',
  '1 action', '120 feet', 'V, S, M', 'Up to 1 minute',
  'You create up to four torch-sized lights within range, making them appear as torches, lanterns, or glowing orbs that hover in the air for the duration. You can also combine the four lights into one glowing vaguely humanoid form of Medium size. Whichever form you choose, each light sheds dim light in a 10-foot radius. As a bonus action on your turn, you can move the lights up to 60 feet to a new spot within range. A light must be within 20 feet of another light created by this spell, and a light winks out if it exceeds the spell''s range.', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'darkness', 'Darkness', 2, 'evocation',
  '1 action', '60 feet', 'V, M', 'Up to 10 minutes',
  'Magical darkness spreads from a point you choose within range to fill a 15-foot-radius sphere for the duration. The darkness spreads around corners. A creature with darkvision can''t see through this darkness, and nonmagical light can''t illuminate it. If the point you choose is on an object you are holding or one that isn''t being worn or carried, the darkness emanates from the object and moves with it. Completely covering the source of the darkness with an opaque object, such as a bowl or a helm, blocks the darkness. If any of this spell''s area overlaps with an area of light created by a spell of 2nd level or lower, the spell that created the light is dispelled.', '', '', '', '',
  '["sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'darkvision', 'Darkvision', 2, 'transmutation',
  '1 action', 'Touch', 'V, S, M', '8 hours',
  'You touch a willing creature to grant it the ability to see in the dark. For the duration, that creature has darkvision out to a range of 60 feet.', '', '', '', '',
  '["druid","ranger","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'daylight', 'Daylight', 3, 'evocation',
  '1 action', '60 feet', 'V, S', '1 hour',
  'A 60-foot-radius sphere of light spreads out from a point you choose within range. The sphere is bright light and sheds dim light for an additional 60 feet. If you chose a point on an object you are holding or one that isn''t being worn or carried, the light shines from the object and moves with it. Completely covering the affected object with an opaque object, such as a bowl or a helm, blocks the light. If any of this spell''s area overlaps with an area of darkness created by a spell of 3rd level or lower, the spell that created the darkness is dispelled.', '', '', '', '',
  '["cleric","druid","paladin","ranger","sorcerer"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'death-ward', 'Death Ward', 4, 'abjuration',
  '1 action', 'Touch', 'V, S', '8 hours',
  'You touch a creature and grant it a measure of protection from death. The first time the target would drop to 0 hit points as a result of taking damage, the target instead drops to 1 hit point, and the spell ends. If the spell is still in effect when the target is subjected to an effect that would kill it instantaneously without dealing damage, that effect is instead negated against the target, and the spell ends.', '', '', '', '',
  '["cleric","paladin"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'delayed-blast-fireball', 'Delayed Blast Fireball', 7, 'evocation',
  '1 action', '150 feet', 'V, S, M', 'Up to 1 minute',
  'A beam of yellow light flashes from your pointing finger, then condenses to linger at a chosen point within range as a glowing bead for the duration. When the spell ends, either because your concentration is broken or because you decide to end it, the bead blossoms with a low roar into an explosion of flame that spreads around corners. Each creature in a 20-foot-radius sphere centered on that point must make a dexterity saving throw. A creature takes fire damage equal to the total accumulated damage on a failed save, or half as much damage on a successful one. The spell''s base damage is 12d6. If at the end of your turn the bead has not yet detonated, the damage increases by 1d6. If the glowing bead is touched before the interval has expired, the creature touching it must make a dexterity saving throw. On a failed save, the spell ends immediately, causing the bead to erupt in flame. On a successful save, the creature can throw the bead up to 40 feet. When it strikes a creature or a soli', '12d6', 'fire', 'DEX', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'demiplane', 'Demiplane', 8, 'conjuration',
  '1 action', '60 feet', 'S', '1 hour',
  'You create a shadowy door on a flat solid surface that you can see within range. The door is large enough to allow Medium creatures to pass through unhindered. When opened, the door leads to a demiplane that appears to be an empty room 30 feet in each dimension, made of wood or stone. When the spell ends, the door disappears, and any creatures or objects inside the demiplane remain trapped there, as the door also disappears from the other side. Each time you cast this spell, you can create a new demiplane, or have the shadowy door connect to a demiplane you created with a previous casting of this spell. Additionally, if you know the nature and contents of a demiplane created by a casting of this spell by another creature, you can have the shadowy door connect to its demiplane instead.', '', '', '', '',
  '["warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'detect-evil-and-good', 'Detect Evil and Good', 1, 'divination',
  '1 action', 'Self', 'V, S', 'Up to 10 minutes',
  'For the duration, you know if there is an aberration, celestial, elemental, fey, fiend, or undead within 30 feet of you, as well as where the creature is located. Similarly, you know if there is a place or object within 30 feet of you that has been magically consecrated or desecrated. The spell can penetrate most barriers, but it is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.', '', '', '', '',
  '["cleric","paladin"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'detect-magic', 'Detect Magic', 1, 'divination',
  '1 action', 'Self', 'V, S', 'Up to 10 minutes',
  'For the duration, you sense the presence of magic within 30 feet of you. If you sense magic in this way, you can use your action to see a faint aura around any visible creature or object in the area that bears magic, and you learn its school of magic, if any. The spell can penetrate most barriers, but it is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.', '', '', '', '',
  '["bard","cleric","druid","paladin","ranger","sorcerer","wizard"]',
  true, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'detect-poison-and-disease', 'Detect Poison and Disease', 1, 'divination',
  '1 action', 'Self', 'V, S, M', 'Up to 10 minutes',
  'For the duration, you can sense the presence and location of poisons, poisonous creatures, and diseases within 30 feet of you. You also identify the kind of poison, poisonous creature, or disease in each case. The spell can penetrate most barriers, but it is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.', '', '', '', '',
  '["cleric","druid","paladin","ranger"]',
  true, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'detect-thoughts', 'Detect Thoughts', 2, 'divination',
  '1 action', 'Self', 'V, S, M', 'Up to 1 minute',
  'For the duration, you can read the thoughts of certain creatures. When you cast the spell and as your action on each turn until the spell ends, you can focus your mind on any one creature that you can see within 30 feet of you. If the creature you choose has an Intelligence of 3 or lower or doesn''t speak any language, the creature is unaffected. You initially learn the surface thoughts of the creature - what is most on its mind in that moment. As an action, you can either shift your attention to another creature''s thoughts or attempt to probe deeper into the same creature''s mind. If you probe deeper, the target must make a Wisdom saving throw. If it fails, you gain insight into its reasoning (if any), its emotional state, and something that looms large in its mind (such as something it worries over, loves, or hates). If it succeeds, the spell ends. Either way, the target knows that you are probing into its mind, and unless you shift your attention to another creature''s thoughts, the cr', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'dimension-door', 'Dimension Door', 4, 'conjuration',
  '1 action', '500 feet', 'V', 'Instantaneous',
  'You teleport yourself from your current location to any other spot within range. You arrive at exactly the spot desired. It can be a place you can see, one you can visualize, or one you can describe by stating distance and direction, such as "200 feet straight downward" or "upward to the northwest at a 45-degree angle, 300 feet." You can bring along objects as long as their weight doesn''t exceed what you can carry. You can also bring one willing creature of your size or smaller who is carrying gear up to its carrying capacity. The creature must be within 5 feet of you when you cast this spell. If you would arrive in a place already occupied by an object or a creature, you and any creature traveling with you each take 4d6 force damage, and the spell fails to teleport you.', '4d6', 'force', '', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'disguise-self', 'Disguise Self', 1, 'illusion',
  '1 action', 'Self', 'V, S', '1 hour',
  'You make yourself--including your clothing, armor, weapons, and other belongings on your person--look different until the spell ends or until you use your action to dismiss it. You can seem 1 foot shorter or taller and can appear thin, fat, or in between. You can''t change your body type, so you must adopt a form that has the same basic arrangement of limbs. Otherwise, the extent of the illusion is up to you. The changes wrought by this spell fail to hold up to physical inspection. For example, if you use this spell to add a hat to your outfit, objects pass through the hat, and anyone who touches it would feel nothing or would feel your head and hair. If you use this spell to appear thinner than you are, the hand of someone who reaches out to touch you would bump into you while it was seemingly still in midair. To discern that you are disguised, a creature can use its action to inspect your appearance and must succeed on an Intelligence (Investigation) check against your spell save DC.', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'disintegrate', 'Disintegrate', 6, 'transmutation',
  '1 action', '60 feet', 'V, S, M', 'Instantaneous',
  'A thin green ray springs from your pointing finger to a target that you can see within range. The target can be a creature, an object, or a creation of magical force, such as the wall created by wall of force. A creature targeted by this spell must make a dexterity saving throw. On a failed save, the target takes 10d6 + 40 force damage. If this damage reduces the target to 0 hit points, it is disintegrated. A disintegrated creature and everything it is wearing and carrying, except magic items, are reduced to a pile of fine gray dust. The creature can be restored to life only by means of a true resurrection or a wish spell. This spell automatically disintegrates a Large or smaller nonmagical object or a creation of magical force. If the target is a Huge or larger object or creation of force, this spell disintegrates a 10-foot-cube portion of it. A magic item is unaffected by this spell.', '10d6 + 40', 'force', 'DEX', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'dispel-evil-and-good', 'Dispel Evil and Good', 5, 'abjuration',
  '1 action', 'Self', 'V, S, M', 'Up to 1 minute',
  'Shimmering energy surrounds and protects you from fey, undead, and creatures originating from beyond the Material Plane. For the duration, celestials, elementals, fey, fiends, and undead have disadvantage on attack rolls against you. You can end the spell early by using either of the following special functions. ***Break Enchantment.*** As your action, you touch a creature you can reach that is charmed, frightened, or possessed by a celestial, an elemental, a fey, a fiend, or an undead. The creature you touch is no longer charmed, frightened, or possessed by such creatures. ***Dismissal.*** As your action, make a melee spell attack against a celestial, an elemental, a fey, a fiend, or an undead you can reach. On a hit, you attempt to drive the creature back to its home plane. The creature must succeed on a charisma saving throw or be sent back to its home plane (if it isn''t there already). If they aren''t on their home plane, undead are sent to the Shadowfell, and fey are sent to the Fe', '', '', 'CHA', '',
  '["cleric","paladin"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'dispel-magic', 'Dispel Magic', 3, 'abjuration',
  '1 action', '120 feet', 'V, S', 'Instantaneous',
  'Choose one creature, object, or magical effect within range. Any spell of 3rd level or lower on the target ends. For each spell of 4th level or higher on the target, make an ability check using your spellcasting ability. The DC equals 10 + the spell''s level. On a successful check, the spell ends.', '', '', '', '',
  '["bard","cleric","druid","paladin","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'divination', 'Divination', 4, 'divination',
  '1 action', 'Self', 'V, S, M', 'Instantaneous',
  'Your magic and an offering put you in contact with a god or a god''s servants. You ask a single question concerning a specific goal, event, or activity to occur within 7 days. The GM offers a truthful reply. The reply might be a short phrase, a cryptic rhyme, or an omen. The spell doesn''t take into account any possible circumstances that might change the outcome, such as the casting of additional spells or the loss or gain of a companion. If you cast the spell two or more times before finishing your next long rest, there is a cumulative 25 percent chance for each casting after the first that you get a random reading. The GM makes this roll in secret.', '', '', '', '',
  '["druid"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'divine-favor', 'Divine Favor', 1, 'evocation',
  '1 bonus action', 'Self', 'V, S', 'Up to 1 minute',
  'Your prayer empowers you with divine radiance. Until the spell ends, your weapon attacks deal an extra 1d4 radiant damage on a hit.', '1d4', 'radiant', '', '',
  '["paladin"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'divine-word', 'Divine Word', 7, 'evocation',
  '1 bonus action', '30 feet', 'V', 'Instantaneous',
  'You utter a divine word, imbued with the power that shaped the world at the dawn of creation. Choose any number of creatures you can see within range. Each creature that can hear you must make a Charisma saving throw. On a failed save, a creature suffers an effect based on its current hit points: - 50 hit points or fewer: deafened for 1 minute - 40 hit points or fewer: deafened and blinded for 10 minutes - 30 hit points or fewer: blinded, deafened, and stunned for 1 hour - 20 hit points or fewer: killed instantly Regardless of its current hit points, a celestial, an elemental, a fey, or a fiend that fails its save is forced back to its plane of origin (if it isn''t there already) and can''t return to your current plane for 24 hours by any means short of a wish spell.', '', '', 'CHA', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'dominate-beast', 'Dominate Beast', 4, 'enchantment',
  '1 action', '60 feet', 'V, S', 'Up to 1 minute',
  'You attempt to beguile a creature that you can see within range. It must succeed on a wisdom saving throw or be charmed by you for the duration. If you or creatures that are friendly to you are fighting it, it has advantage on the saving throw. While the creature is charmed, you have a telepathic link with it as long as the two of you are on the same plane of existence. You can use this telepathic link to issue commands to the creature while you are conscious (no action required), which it does its best to obey. You can specify a simple and general course of action, such as "Attack that creature," "Run over there," or "Fetch that object." If the creature completes the order and doesn''t receive further direction from you, it defends and preserves itself to the best of its ability. You can use your action to take total and precise control of the target. Until the end of your next turn, the creature takes only the actions you choose, and doesn''t do anything that you don''t allow it to do. ', '', '', 'WIS', '',
  '["druid","sorcerer"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'dominate-monster', 'Dominate Monster', 8, 'enchantment',
  '1 action', '60 feet', 'V, S', 'Up to 1 hour',
  'You attempt to beguile a creature that you can see within range. It must succeed on a wisdom saving throw or be charmed by you for the duration. If you or creatures that are friendly to you are fighting it, it has advantage on the saving throw. While the creature is charmed, you have a telepathic link with it as long as the two of you are on the same plane of existence. You can use this telepathic link to issue commands to the creature while you are conscious (no action required), which it does its best to obey. You can specify a simple and general course of action, such as "Attack that creature," "Run over there," or "Fetch that object." If the creature completes the order and doesn''t receive further direction from you, it defends and preserves itself to the best of its ability. You can use your action to take total and precise control of the target. Until the end of your next turn, the creature takes only the actions you choose, and doesn''t do anything that you don''t allow it to do. ', '', '', 'WIS', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'dominate-person', 'Dominate Person', 5, 'enchantment',
  '1 action', '60 feet', 'V, S', 'Up to 1 minute',
  'You attempt to beguile a humanoid that you can see within range. It must succeed on a wisdom saving throw or be charmed by you for the duration. If you or creatures that are friendly to you are fighting it, it has advantage on the saving throw. While the target is charmed, you have a telepathic link with it as long as the two of you are on the same plane of existence. You can use this telepathic link to issue commands to the creature while you are conscious (no action required), which it does its best to obey. You can specify a simple and general course of action, such as "Attack that creature," "Run over there," or "Fetch that object." If the creature completes the order and doesn''t receive further direction from you, it defends and preserves itself to the best of its ability. You can use your action to take total and precise control of the target. Until the end of your next turn, the creature takes only the actions you choose, and doesn''t do anything that you don''t allow it to do. Du', '', '', 'WIS', '',
  '["bard","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'dream', 'Dream', 5, 'illusion',
  '1 minute', 'Special', 'V, S, M', '8 hours',
  'This spell shapes a creature''s dreams. Choose a creature known to you as the target of this spell. The target must be on the same plane of existence as you. Creatures that don''t sleep, such as elves, can''t be contacted by this spell. You, or a willing creature you touch, enters a trance state, acting as a messenger. While in the trance, the messenger is aware of his or her surroundings, but can''t take actions or move. If the target is asleep, the messenger appears in the target''s dreams and can converse with the target as long as it remains asleep, through the duration of the spell. The messenger can also shape the environment of the dream, creating landscapes, objects, and other images. The messenger can emerge from the trance at any time, ending the effect of the spell early. The target recalls the dream perfectly upon waking. If the target is awake when you cast the spell, the messenger knows it, and can either end the trance (and the spell) or wait for the target to fall asleep, at', '3d6', 'psychic', 'WIS', '',
  '["bard","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'druidcraft', 'Druidcraft', 0, 'transmutation',
  '1 action', '30 feet', 'V, S', 'Instantaneous',
  'Whispering to the spirits of nature, you create one of the following effects within ''range'': - You create a tiny, harmless sensory effect that predicts what the weather will be at your location for the next 24 hours. The effect might manifest as a golden orb for clear skies, a cloud for rain, falling snowflakes for snow, and so on. This effect persists for 1 round. - You instantly make a flower bloom, a seed pod open, or a leaf bud bloom. - You create an instantaneous, harmless sensory effect, such as falling leaves, a puff of wind, the sound of a small animal, or the faint order of skunk. The effect must fit in a 5-foot cube. - You instantly light or snuff out a candle, a torch, or a small campfire.', '', '', '', '',
  '["druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'earthquake', 'Earthquake', 8, 'evocation',
  '1 action', '500 feet', 'V, S, M', 'Up to 1 minute',
  'You create a seismic disturbance at a point on the ground that you can see within range. For the duration, an intense tremor rips through the ground in a 100-foot-radius circle centered on that point and shakes creatures and structures in contact with the ground in that area. The ground in the area becomes difficult terrain. Each creature on the ground that is concentrating must make a constitution saving throw. On a failed save, the creature''s concentration is broken. When you cast this spell and at the end of each turn you spend concentrating on it, each creature on the ground in the area must make a dexterity saving throw. On a failed save, the creature is knocked prone. This spell can have additional effects depending on the terrain in the area, as determined by the GM. Fissures. Fissures open throughout the spell''s area at the start of your next turn after you cast the spell. A total of 1d6 such fissures open in locations chosen by the GM. Each is 1d10 x 10 feet deep, 10 feet wide', '', '', '', '',
  '["cleric","druid","sorcerer"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'eldritch-blast', 'Eldritch Blast', 0, 'evocation',
  '1 action', '120 feet', 'V, S', 'Instantaneous',
  'A beam of crackling energy streaks toward a creature within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 force damage. The spell creates more than one beam when you reach higher levels: two beams at 5th level, three beams at 11th level, and four beams at 17th level. You can direct the beams at the same target or at different ones. Make a separate attack roll for each beam.', '1d10', 'force', '', '',
  '["warlock"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'enhance-ability', 'Enhance Ability', 2, 'transmutation',
  '1 action', 'Touch', 'V, S, M', 'Up to 1 hour',
  'You touch a creature and bestow upon it a magical enhancement. Choose one of the following effects; the target gains that effect until the spell ends. ***Bear''s Endurance.*** The target has advantage on constitution checks. It also gains 2d6 temporary hit points, which are lost when the spell ends. ***Bull''s Strength.*** The target has advantage on strength checks, and his or her carrying capacity doubles. ***Cat''s Grace.*** The target has advantage on dexterity checks. It also doesn''t take damage from falling 20 feet or less if it isn''t incapacitated. ***Eagle''s Splendor.*** The target has advantage on Charisma checks. ***Fox''s Cunning.*** The target has advantage on intelligence checks. ***Owl''s Wisdom.*** The target has advantage on wisdom checks.', '', '', '', '',
  '["bard","cleric","druid","sorcerer"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'enlarge-reduce', 'Enlarge/Reduce', 2, 'transmutation',
  '1 action', '30 feet', 'V, S, M', 'Up to 1 minute',
  'You cause a creature or an object you can see within range to grow larger or smaller for the duration. Choose either a creature or an object that is neither worn nor carried. If the target is unwilling, it can make a Constitution saving throw. On a success, the spell has no effect. If the target is a creature, everything it is wearing and carrying changes size with it. Any item dropped by an affected creature returns to normal size at once. ***Enlarge.*** The target''s size doubles in all dimensions, and its weight is multiplied by eight. This growth increases its size by one category-from Medium to Large, for example. If there isn''t enough room for the target to double its size, the creature or object attains the maximum possible size in the space available. Until the spell ends, the target also has advantage on Strength checks and Strength saving throws. The target''s weapons also grow to match its new size. While these weapons are enlarged, the target''s attacks with them deal 1d4 extr', '', '', 'CON', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'entangle', 'Entangle', 1, 'conjuration',
  '1 action', '90 feet', 'V, S', 'Up to 1 minute',
  'Grasping weeds and vines sprout from the ground in a 20-foot square starting form a point within range. For the duration, these plants turn the ground in the area into difficult terrain. A creature in the area when you cast the spell must succeed on a strength saving throw or be restrained by the entangling plants until the spell ends. A creature restrained by the plants can use its action to make a Strength check against your spell save DC. On a success, it frees itself. When the spell ends, the conjured plants wilt away.', '', '', 'STR', '',
  '["druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'enthrall', 'Enthrall', 2, 'enchantment',
  '1 action', '60 feet', 'V, S', '1 minute',
  'You weave a distracting string of words, causing creatures of your choice that you can see within range and that can hear you to make a wisdom saving throw. Any creature that can''t be charmed succeeds on this saving throw automatically, and if you or your companions are fighting a creature, it has advantage on the save. On a failed save, the target has disadvantage on Wisdom (Perception) checks made to perceive any creature other than you until the spell ends or until the target can no longer hear you. The spell ends if you are incapacitated or can no longer speak.', '', '', 'WIS', '',
  '["bard","warlock"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'etherealness', 'Etherealness', 7, 'transmutation',
  '1 action', 'Self', 'V, S', '8 hours',
  'You step into the border regions of the Ethereal Plane, in the area where it overlaps with your current plane. You remain in the Border Ethereal for the duration or until you use your action to dismiss the spell. During this time, you can move in any direction. If you move up or down, every foot of movement costs an extra foot. You can see and hear the plane you originated from, but everything there looks gray, and you can''t see anything more than 60 feet away. While on the Ethereal Plane, you can only affect and be affected by other creatures on that plane. Creatures that aren''t on the Ethereal Plane can''t perceive you and can''t interact with you, unless a special ability or magic has given them the ability to do so. You ignore all objects and effects that aren''t on the Ethereal Plane, allowing you to move through objects you perceive on the plane you originated from. When the spell ends, you immediately return to the plane you originated from in the spot you currently occupy. If you ', '', '', '', '',
  '["bard","cleric","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'expeditious-retreat', 'Expeditious Retreat', 1, 'transmutation',
  '1 bonus action', 'Self', 'V, S', 'Up to 10 minutes',
  'This spell allows you to move at an incredible pace. When you cast this spell, and then as a bonus action on each of your turns until the spell ends, you can take the Dash action.', '', '', '', '',
  '["sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'eyebite', 'Eyebite', 6, 'necromancy',
  '1 action', 'Self', 'V, S', 'Up to 1 minute',
  'For the spell''s duration, your eyes become an inky void imbued with dread power. One creature of your choice within 60 feet of you that you can see must succeed on a wisdom saving throw or be affected by one of the following effects of your choice for the duration. On each of your turns until the spell ends, you can use your action to target another creature but can''t target a creature again if it has succeeded on a saving throw against this casting of eyebite. ***Asleep.*** The target falls unconscious. It wakes up if it takes any damage or if another creature uses its action to shake the sleeper awake. ***Panicked.*** The target is frightened of you. On each of its turns, the frightened creature must take the Dash action and move away from you by the safest and shortest available route, unless there is nowhere to move. If the target moves to a place at least 60 feet away from you where it can no longer see you, this effect ends. ***Sickened.*** The target has disadvantage on attack r', '', '', 'WIS', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'fabricate', 'Fabricate', 4, 'transmutation',
  '10 minutes', '120 feet', 'V, S', 'Instantaneous',
  'You convert raw materials into products of the same material. For example, you can fabricate a wooden bridge from a clump of trees, a rope from a patch of hemp, and clothes from flax or wool. Choose raw materials that you can see within range. You can fabricate a Large or smaller object (contained within a 10-foot cube, or eight connected 5-foot cubes), given a sufficient quantity of raw material. If you are working with metal, stone, or another mineral substance, however, the fabricated object can be no larger than Medium (contained within a single 5-foot cube). The quality of objects made by the spell is commensurate with the quality of the raw materials. Creatures or magic items can''t be created or transmuted by this spell. You also can''t use it to create items that ordinarily require a high degree of craftsmanship, such as jewelry, weapons, glass, or armor, unless you have proficiency with the type of artisan''s tools used to craft such objects.', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'faerie-fire', 'Faerie Fire', 1, 'evocation',
  '1 action', '60 feet', 'V', 'Up to 1 minute',
  'Each object in a 20-foot cube within range is outlined in blue, green, or violet light (your choice). Any creature in the area when the spell is cast is also outlined in light if it fails a dexterity saving throw. For the duration, objects and affected creatures shed dim light in a 10-foot radius. Any attack roll against an affected creature or object has advantage if the attacker can see it, and the affected creature or object can''t benefit from being invisible.', '', '', 'DEX', '',
  '["druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'faithful-hound', 'Faithful Hound', 4, 'conjuration',
  '1 action', '30 feet', 'V, S, M', '8 hours',
  'You conjure a phantom watchdog in an unoccupied space that you can see within range, where it remains for the duration, until you dismiss it as an action, or until you move more than 100 feet away from it. The hound is invisible to all creatures except you and can''t be harmed. When a Small or larger creature comes within 30 feet of it without first speaking the password that you specify when you cast this spell, the hound starts barking loudly. The hound sees invisible creatures and can see into the Ethereal Plane. It ignores illusions. At the start of each of your turns, the hound attempts to bite one creature within 5 feet of it that is hostile to you. The hound''s attack bonus is equal to your spellcasting ability modifier + your proficiency bonus. On a hit, it deals 4d8 piercing damage.', '4d8', 'piercing', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'false-life', 'False Life', 1, 'necromancy',
  '1 action', 'Self', 'V, S, M', '1 hour',
  'Bolstering yourself with a necromantic facsimile of life, you gain 1d4 + 4 temporary hit points for the duration.', '', '', '', '1d4 + 4',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'fear', 'Fear', 3, 'illusion',
  '1 action', 'Self', 'V, S, M', 'Up to 1 minute',
  'You project a phantasmal image of a creature''s worst fears. Each creature in a 30-foot cone must succeed on a wisdom saving throw or drop whatever it is holding and become frightened for the duration. While frightened by this spell, a creature must take the Dash action and move away from you by the safest available route on each of its turns, unless there is nowhere to move. If the creature ends its turn in a location where it doesn''t have line of sight to you, the creature can make a wisdom saving throw. On a successful save, the spell ends for that creature.', '', '', 'WIS', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'feather-fall', 'Feather Fall', 1, 'transmutation',
  '1 reaction', '60 feet', 'V, M', '1 minute',
  'Choose up to five falling creatures within range. A falling creature''s rate of descent slows to 60 feet per round until the spell ends. If the creature lands before the spell ends, it takes no falling damage and can land on its feet, and the spell ends for that creature.', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'feeblemind', 'Feeblemind', 8, 'enchantment',
  '1 action', '150 feet', 'V, S, M', 'Instantaneous',
  'You blast the mind of a creature that you can see within range, attempting to shatter its intellect and personality. The target takes 4d6 psychic damage and must make an intelligence saving throw. On a failed save, the creature''s Intelligence and Charisma scores become 1. The creature can''t cast spells, activate magic items, understand language, or communicate in any intelligible way. The creature can, however, identify its friends, follow them, and even protect them. At the end of every 30 days, the creature can repeat its saving throw against this spell. If it succeeds on its saving throw, the spell ends. The spell can also be ended by greater restoration, heal, or wish.', '4d6', 'psychic', 'INT', '',
  '["bard","druid","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'find-familiar', 'Find Familiar', 1, 'conjuration',
  '1 hour', '10 feet', 'V, S, M', 'Instantaneous',
  'You gain the service of a familiar, a spirit that takes an animal form you choose: bat, cat, crab, frog (toad), hawk, lizard, octopus, owl, poisonous snake, fish (quipper), rat, raven, sea horse, spider, or weasel. Appearing in an unoccupied space within range, the familiar has the statistics of the chosen form, though it is a celestial, fey, or fiend (your choice) instead of a beast. Your familiar acts independently of you, but it always obeys your commands. In combat, it rolls its own initiative and acts on its own turn. A familiar can''t attack, but it can take other actions as normal. When the familiar drops to 0 hit points, it disappears, leaving behind no physical form. It reappears after you cast this spell again. While your familiar is within 100 feet of you, you can communicate with it telepathically. Additionally, as an action, you can see through your familiar''s eyes and hear what it hears until the start of your next turn, gaining the benefits of any special senses that the ', '', '', '', '',
  '["wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'find-steed', 'Find Steed', 2, 'conjuration',
  '10 minutes', '30 feet', 'V, S', 'Instantaneous',
  'You summon a spirit that assumes the form of an unusually intelligent, strong, and loyal steed, creating a long-lasting bond with it. Appearing in an unoccupied space within range, the steed takes on a form that you choose, such as a warhorse, a pony, a camel, an elk, or a mastiff. (Your GM might allow other animals to be summoned as steeds.) The steed has the statistics of the chosen form, though it is a celestial, fey, or fiend (your choice) instead of its normal type. Additionally, if your steed has an Intelligence of 5 or less, its Intelligence becomes 6, and it gains the ability to understand one language of your choice that you speak. Your steed serves you as a mount, both in combat and out, and you have an instinctive bond with it that allows you to fight as a seamless unit. While mounted on your steed, you can make any spell you cast that targets only you also target your steed. When the steed drops to 0 hit points, it disappears, leaving behind no physical form. You can also d', '', '', '', '',
  '["paladin"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'find-the-path', 'Find the Path', 6, 'divination',
  '1 minute', 'Self', 'V, S, M', 'Up to 24 hours',
  'This spell allows you to find the shortest, most direct physical route to a specific fixed location that you are familiar with on the same plane of existence. If you name a destination on another plane of existence, a destination that moves (such as a mobile fortress), or a destination that isn''t specific (such as "a green dragon''s lair"), the spell fails. For the duration, as long as you are on the same plane of existence as the destination, you know how far it is and in what direction it lies. While you are traveling there, whenever you are presented with a choice of paths along the way, you automatically determine which path is the shortest and most direct route (but not necessarily the safest route) to the destination.', '', '', '', '',
  '["bard","cleric","druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'find-traps', 'Find Traps', 2, 'divination',
  '1 action', '120 feet', 'V, S', 'Instantaneous',
  'You sense the presence of any trap within range that is within line of sight. A trap, for the purpose of this spell, includes anything that would inflict a sudden or unexpected effect you consider harmful or undesirable, which was specifically intended as such by its creator. Thus, the spell would sense an area affected by the alarm spell, a glyph of warding, or a mechanical pit trap, but it would not reveal a natural weakness in the floor, an unstable ceiling, or a hidden sinkhole. This spell merely reveals that a trap is present. You don''t learn the location of each trap, but you do learn the general nature of the danger posed by a trap you sense.', '', '', '', '',
  '["cleric","druid","ranger"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'finger-of-death', 'Finger of Death', 7, 'necromancy',
  '1 action', '60 feet', 'V, S', 'Instantaneous',
  'You send negative energy coursing through a creature that you can see within range, causing it searing pain. The target must make a constitution saving throw. It takes 7d8 + 30 necrotic damage on a failed save, or half as much damage on a successful one. A humanoid killed by this spell rises at the start of your next turn as a zombie that is permanently under your command, following your verbal orders to the best of its ability.', '7d8 + 30', 'necrotic', 'CON', '',
  '["sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'fire-bolt', 'Fire Bolt', 0, 'evocation',
  '1 action', '120 feet', 'V, S', 'Instantaneous',
  'You hurl a mote of fire at a creature or object within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage. A flammable object hit by this spell ignites if it isn''t being worn or carried. This spell''s damage increases by 1d10 when you reach 5th level (2d10), 11th level (3d10), and 17th level (4d10).', '1d10', 'fire', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'fire-shield', 'Fire Shield', 4, 'evocation',
  '1 action', 'Self', 'V, S, M', '10 minutes',
  'Thin and vaporous flame surround your body for the duration of the spell, radiating a bright light bright light in a 10-foot radius and dim light for an additional 10 feet. You can end the spell using an action to make it disappear. The flames are around you a heat shield or cold, your choice. The heat shield gives you cold damage resistance and the cold resistance to fire damage. In addition, whenever a creature within 5 feet of you hits you with a melee attack, flames spring from the shield. The attacker then suffers 2d8 points of fire damage or cold, depending on the model.', '2d8', 'fire', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'fire-storm', 'Fire Storm', 7, 'evocation',
  '1 action', '150 feet', 'V, S', 'Instantaneous',
  'A storm made up of sheets of roaring flame appears in a location you choose within range. The area of the storm consists of up to ten 10-foot cubes, which you can arrange as you wish. Each cube must have at least one face adjacent to the face of another cube. Each creature in the area must make a dexterity saving throw. It takes 7d10 fire damage on a failed save, or half as much damage on a successful one. The fire damages objects in the area and ignites flammable objects that aren''t being worn or carried. If you choose, plant life in the area is unaffected by this spell.', '7d10', 'fire', 'DEX', '',
  '["cleric","druid","sorcerer"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'fireball', 'Fireball', 3, 'evocation',
  '1 action', '150 feet', 'V, S, M', 'Instantaneous',
  'A bright streak flashes from your pointing finger to a point you choose within range and then blossoms with a low roar into an explosion of flame. Each creature in a 20-foot-radius sphere centered on that point must make a dexterity saving throw. A target takes 8d6 fire damage on a failed save, or half as much damage on a successful one. The fire spreads around corners. It ignites flammable objects in the area that aren''t being worn or carried.', '8d6', 'fire', 'DEX', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'flame-blade', 'Flame Blade', 2, 'evocation',
  '1 bonus action', 'Self', 'V, S, M', 'Up to 10 minutes',
  'You evoke a fiery blade in your free hand. The blade is similar in size and shape to a scimitar, and it lasts for the duration. If you let go of the blade, it disappears, but you can evoke the blade again as a bonus action. You can use your action to make a melee spell attack with the fiery blade. On a hit, the target takes 3d6 fire damage. The flaming blade sheds bright light in a 10-foot radius and dim light for an additional 10 feet.', '3d6', 'fire', '', '',
  '["druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'flame-strike', 'Flame Strike', 5, 'evocation',
  '1 action', '60 feet', 'V, S, M', 'Instantaneous',
  'A vertical column of divine fire roars down from the heavens in a location you specify. Each creature in a 10-foot-radius, 40-foot-high cylinder centered on a point within range must make a dexterity saving throw. A creature takes 4d6 fire damage and 4d6 radiant damage on a failed save, or half as much damage on a successful one.', '4d6 + 4d6', 'fire', 'DEX', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'flaming-sphere', 'Flaming Sphere', 2, 'conjuration',
  '1 action', '60 feet', 'V, S, M', 'Up to 1 minute',
  'A 5-foot-diameter sphere of fire appears in an unoccupied space of your choice within range and lasts for the duration. Any creature that ends its turn within 5 feet of the sphere must make a dexterity saving throw. The creature takes 2d6 fire damage on a failed save, or half as much damage on a successful one. As a bonus action, you can move the sphere up to 30 feet. If you ram the sphere into a creature, that creature must make the saving throw against the sphere''s damage, and the sphere stops moving this turn. When you move the sphere, you can direct it over barriers up to 5 feet tall and jump it across pits up to 10 feet wide. The sphere ignites flammable objects not being worn or carried, and it sheds bright light in a 20-foot radius and dim light for an additional 20 feet.', '2d6', 'fire', '', '',
  '["druid","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'flesh-to-stone', 'Flesh to Stone', 6, 'transmutation',
  '1 action', '60 feet', 'V, S, M', 'Up to 1 minute',
  'You attempt to turn one creature that you can see within range into stone. If the target''s body is made of flesh, the creature must make a constitution saving throw. On a failed save, it is restrained as its flesh begins to harden. On a successful save, the creature isn''t affected. A creature restrained by this spell must make another constitution saving throw at the end of each of its turns. If it successfully saves against this spell three times, the spell ends. If it fails its saves three times, it is turned to stone and subjected to the petrified condition for the duration. The successes and failures don''t need to be consecutive; keep track of both until the target collects three of a kind. If the creature is physically broken while petrified, it suffers from similar deformities if it reverts to its original state. If you maintain your concentration on this spell for the entire possible duration, the creature is turned to stone until the effect is removed.', '', '', 'CON', '',
  '["warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'floating-disk', 'Floating Disk', 1, 'conjuration',
  '1 action', '30 feet', 'V, S, M', '1 hour',
  'This spell creates a circular, horizontal plane of force, 3 feet in diameter and 1 inch thick, that floats 3 feet above the ground in an unoccupied space of your choice that you can see within range. The disk remains for the duration, and can hold up to 500 pounds. If more weight is placed on it, the spell ends, and everything on the disk falls to the ground. The disk is immobile while you are within 20 feet of it. If you move more than 20 feet away from it, the disk follows you so that it remains within 20 feet of you. If can move across uneven terrain, up or down stairs, slopes and the like, but it can''t cross an elevation change of 10 feet or more. For example, the disk can''t move across a 10-foot-deep pit, nor could it leave such a pit if it was created at the bottom. If you move more than 100 feet away from the disk (typically because it can''t move around an obstacle to follow you), the spell ends.', '', '', '', '',
  '["wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'fly', 'Fly', 3, 'transmutation',
  '1 action', 'Touch', 'V, S, M', 'Up to 10 minutes',
  'You touch a willing creature. The target gains a flying speed of 60 feet for the duration. When the spell ends, the target falls if it is still aloft, unless it can stop the fall.', '', '', '', '',
  '["sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'fog-cloud', 'Fog Cloud', 1, 'conjuration',
  '1 action', '120 feet', 'V, S', 'Up to 1 hour',
  'You create a 20-foot-radius sphere of fog centered on a point within range. The sphere spreads around corners, and its area is heavily obscured. It lasts for the duration or until a wind of moderate or greater speed (at least 10 miles per hour) disperses it.', '', '', '', '',
  '["druid","ranger","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'forbiddance', 'Forbiddance', 6, 'abjuration',
  '10 minutes', 'Touch', 'V, S, M', '24 hours',
  'You create a ward against magical travel that protects up to 40,000 square feet of floor space to a height of 30 feet above the floor. For the duration, creatures can''t teleport into the area or use portals, such as those created by the gate spell, to enter the area. The spell proofs the area against planar travel, and therefore prevents creatures from accessing the area by way of the Astral Plane, Ethereal Plane, Feywild, Shadowfell, or the plane shift spell. In addition, the spell damages types of creatures that you choose when you cast it. Choose one or more of the following: celestials, elementals, fey, fiends, and undead. When a chosen creature enters the spell''s area for the first time on a turn or starts its turn there, the creature takes 5d10 radiant or necrotic damage (your choice when you cast this spell). When you cast this spell, you can designate a password. A creature that speaks the password as it enters the area takes no damage from the spell. The spell''s area can''t ove', '', '', '', '',
  '["cleric"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'forcecage', 'Forcecage', 7, 'evocation',
  '1 action', '100 feet', 'V, S, M', '1 hour',
  'An immobile, invisible, cube-shaped prison composed of magical force springs into existence around an area you choose within range. The prison can be a cage or a solid box, as you choose. A prison in the shape of a cage can be up to 20 feet on a side and is made from 1/2-inch diameter bars spaced 1/2 inch apart. A prison in the shape of a box can be up to 10 feet on a side, creating a solid barrier that prevents any matter from passing through it and blocking any spells cast into or out from the area. When you cast the spell, any creature that is completely inside the cage''s area is trapped. Creatures only partially within the area, or those too large to fit inside the area, are pushed away from the center of the area until they are completely outside the area. A creature inside the cage can''t leave it by nonmagical means. If the creature tries to use teleportation or interplanar travel to leave the cage, it must first make a charisma saving throw. On a success, the creature can use th', '', '', '', '',
  '["bard","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'foresight', 'Foresight', 9, 'divination',
  '1 minute', 'Touch', 'V, S, M', '8 hours',
  'You touch a willing creature and bestow a limited ability to see into the immediate future. For the duration, the target can''t be surprised and has advantage on attack rolls, ability checks, and saving throws. Additionally, other creatures have disadvantage on attack rolls against the target for the duration. This spell immediately ends if you cast it again before its duration ends.', '', '', '', '',
  '["bard","druid","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'freedom-of-movement', 'Freedom of Movement', 4, 'abjuration',
  '1 action', 'Touch', 'V, S, M', '1 hour',
  'You touch a willing creature. For the duration, the target''s movement is unaffected by difficult terrain, and spells and other magical effects can neither reduce the target''s speed nor cause the target to be paralyzed or restrained. The target can also spend 5 feet of movement to automatically escape from nonmagical restraints, such as manacles or a creature that has it grappled. Finally, being underwater imposes no penalties on the target''s movement or attacks.', '', '', '', '',
  '["bard","cleric","druid","ranger"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'freezing-sphere', 'Freezing Sphere', 6, 'evocation',
  '1 action', '300 feet', 'V, S, M', 'Instantaneous',
  'A frigid globe of cold energy streaks from your fingertips to a point of your choice within range, where it explodes in a 60-foot-radius sphere. Each creature within the area must make a constitution saving throw. On a failed save, a creature takes 10d6 cold damage. On a successful save, it takes half as much damage. If the globe strikes a body of water or a liquid that is principally water (not including water-based creatures), it freezes the liquid to a depth of 6 inches over an area 30 feet square. This ice lasts for 1 minute. Creatures that were swimming on the surface of frozen water are trapped in the ice. A trapped creature can use an action to make a Strength check against your spell save DC to break free. You can refrain from firing the globe after completing the spell, if you wish. A small globe about the size of a sling stone, cool to the touch, appears in your hand. At any time, you or a creature you give the globe to can throw the globe (to a range of 40 feet) or hurl it w', '10d6', 'cold', 'CON', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'gaseous-form', 'Gaseous Form', 3, 'transmutation',
  '1 action', 'Touch', 'V, S, M', 'Up to 1 hour',
  'You transform a willing creature you touch, along with everything it''s wearing and carrying, into a misty cloud for the duration. The spell ends if the creature drops to 0 hit points. An incorporeal creature isn''t affected. While in this form, the target''s only method of movement is a flying speed of 10 feet. The target can enter and occupy the space of another creature. The target has resistance to nonmagical damage, and it has advantage on Strength, Dexterity, and constitution saving throws. The target can pass through small holes, narrow openings, and even mere cracks, though it treats liquids as though they were solid surfaces. The target can''t fall and remains hovering in the air even when stunned or otherwise incapacitated. While in the form of a misty cloud, the target can''t talk or manipulate objects, and any objects it was carrying or holding can''t be dropped, used, or otherwise interacted with. The target can''t attack or cast spells.', '', '', '', '',
  '["sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'gate', 'Gate', 9, 'conjuration',
  '1 action', '60 feet', 'V, S, M', 'Up to 1 minute',
  'You conjure a portal linking an unoccupied space you can see within range to a precise location on a different plane of existence. The portal is a circular opening, which you can make 5 to 20 feet in diameter. You can orient the portal in any direction you choose. The portal lasts for the duration. The portal has a front and a back on each plane where it appears. Travel through the portal is possible only by moving through its front. Anything that does so is instantly transported to the other plane, appearing in the unoccupied space nearest to the portal. Deities and other planar rulers can prevent portals created by this spell from opening in their presence or anywhere within their domains. When you cast this spell, you can speak the name of a specific creature (a pseudonym, title, or nickname doesn''t work). If that creature is on a plane other than the one you are on, the portal opens in the named creature''s immediate vicinity and draws the creature through it to the nearest unoccupi', '', '', '', '',
  '["cleric","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'geas', 'Geas', 5, 'enchantment',
  '1 minute', '60 feet', 'V', '30 days',
  'You place a magical command on a creature that you can see within range, forcing it to carry out some service or refrain from some action or course of activity as you decide. If the creature can understand you, it must succeed on a wisdom saving throw or become charmed by you for the duration. While the creature is charmed by you, it takes 5d10 psychic damage each time it acts in a manner directly counter to your instructions, but no more than once each day. A creature that can''t understand you is unaffected by the spell. You can issue any command you choose, short of an activity that would result in certain death. Should you issue a suicidal command, the spell ends. You can end the spell early by using an action to dismiss it. A remove curse, greater restoration, or wish spell also ends it.', '', '', 'WIS', '',
  '["bard","cleric","druid","paladin","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'gentle-repose', 'Gentle Repose', 2, 'necromancy',
  '1 action', 'Touch', 'V, S, M', '10 days',
  'You touch a corpse or other remains. For the duration, the target is protected from decay and can''t become undead. The spell also effectively extends the time limit on raising the target from the dead, since days spent under the influence of this spell don''t count against the time limit of spells such as raise dead.', '', '', '', '',
  '["cleric","wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'giant-insect', 'Giant Insect', 4, 'transmutation',
  '1 action', '30 feet', 'V, S', 'Up to 10 minutes',
  'You transform up to ten centipedes, three spiders, five wasps, or one scorpion within range into giant versions of their natural forms for the duration. A centipede becomes a giant centipede, a spider becomes a giant spider, a wasp becomes a giant wasp, and a scorpion becomes a giant scorpion. Each creature obeys your verbal commands, and in combat, they act on your turn each round. The GM has the statistics for these creatures and resolves their actions and movement. A creature remains in its giant size for the duration, until it drops to 0 hit points, or until you use an action to dismiss the effect on it. The GM might allow you to choose different targets. For example, if you transform a bee, its giant version might have the same statistics as a giant wasp.', '', '', '', '',
  '["druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'glibness', 'Glibness', 8, 'transmutation',
  '1 action', 'Self', 'V', '1 hour',
  'Until the spell ends, when you make a Charisma check, you can replace the number you roll with a 15. Additionally, no matter what you say, magic that would determine if you are telling the truth indicates that you are being truthful.', '', '', '', '',
  '["bard","warlock"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'globe-of-invulnerability', 'Globe of Invulnerability', 6, 'abjuration',
  '1 action', 'Self', 'V, S, M', 'Up to 1 minute',
  'An immobile, faintly shimmering barrier springs into existence in a 10-foot radius around you and remains for the duration. Any spell of 5th level or lower cast from outside the barrier can''t affect creatures or objects within it, even if the spell is cast using a higher level spell slot. Such a spell can target creatures and objects within the barrier, but the spell has no effect on them. Similarly, the area within the barrier is excluded from the areas affected by such spells.', '', '', '', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'glyph-of-warding', 'Glyph of Warding', 3, 'abjuration',
  '1 hour', 'Touch', 'V, S, M', 'Until dispelled',
  'When you cast this spell, you inscribe a glyph that harms other creatures, either upon a surface (such as a table or a section of floor or wall) or within an object that can be closed (such as a book, a scroll, or a treasure chest) to conceal the glyph. If you choose a surface, the glyph can cover an area of the surface no larger than 10 feet in diameter. If you choose an object, that object must remain in its place; if the object is moved more than 10 feet from where you cast this spell, the glyph is broken, and the spell ends without being triggered. The glyph is nearly invisible and requires a successful Intelligence (Investigation) check against your spell save DC to be found. You decide what triggers the glyph when you cast the spell. For glyphs inscribed on a surface, the most typical triggers include touching or standing on the glyph, removing another object covering the glyph, approaching within a certain distance of the glyph, or manipulating the object on which the glyph is i', '', '', '', '',
  '["bard","cleric","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'goodberry', 'Goodberry', 1, 'transmutation',
  '1 action', 'Touch', 'V, S, M', 'Instantaneous',
  'Up to ten berries appear in your hand and are infused with magic for the duration. A creature can use its action to eat one berry. Eating a berry restores 1 hit point, and the berry provides enough nourishment to sustain a creature for a day. The berries lose their potency if they have not been consumed within 24 hours of the casting of this spell.', '', '', '', '',
  '["druid","ranger"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'grease', 'Grease', 1, 'conjuration',
  '1 action', '60 feet', 'V, S, M', '1 minute',
  'Slick grease covers the ground in a 10-foot square centered on a point within range and turns it into difficult terrain for the duration. When the grease appears, each creature standing in its area must succeed on a dexterity saving throw or fall prone. A creature that enters the area or ends its turn there must also succeed on a dexterity saving throw or fall prone.', '', '', 'DEX', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'greater-invisibility', 'Greater Invisibility', 4, 'illusion',
  '1 action', 'Touch', 'V, S', 'Up to 1 minute',
  'You or a creature you touch becomes invisible until the spell ends. Anything the target is wearing or carrying is invisible as long as it is on the target''s person.', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'greater-restoration', 'Greater Restoration', 5, 'abjuration',
  '1 action', 'Touch', 'V, S, M', 'Instantaneous',
  'You imbue a creature you touch with positive energy to undo a debilitating effect. You can reduce the target''s exhaustion level by one, or end one of the following effects on the target: - One effect that charmed or petrified the target - One curse, including the target''s attunement to a cursed magic item - Any reduction to one of the target''s ability scores - One effect reducing the target''s hit point maximum', '', '', '', '',
  '["bard","cleric","druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'guardian-of-faith', 'Guardian of Faith', 4, 'conjuration',
  '1 action', '30 feet', 'V', '8 hours',
  'A Large spectral guardian appears and hovers for the duration in an unoccupied space of your choice that you can see within range. The guardian occupies that space and is indistinct except for a gleaming sword and shield emblazoned with the symbol of your deity. Any creature hostile to you that moves to a space within 10 feet of the guardian for the first time on a turn must succeed on a dexterity saving throw. The creature takes 20 radiant damage on a failed save, or half as much damage on a successful one. The guardian vanishes when it has dealt a total of 60 damage.', '20', 'radiant', 'DEX', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'guards-and-wards', 'Guards and Wards', 6, 'abjuration',
  '10 minutes', 'Touch', 'V, S, M', '24 hours',
  'You create a ward that protects up to 2,500 square feet of floor space (an area 50 feet square, or one hundred 5-foot squares or twenty-five 10-foot squares). The warded area can be up to 20 feet tall, and shaped as you desire. You can ward several stories of a stronghold by dividing the area among them, as long as you can walk into each contiguous area while you are casting the spell. When you cast this spell, you can specify individuals that are unaffected by any or all of the effects that you choose. You can also specify a password that, when spoken aloud, makes the speaker immune to these effects. Guards and wards creates the following effects within the warded area. ***Corridors.*** Fog fills all the warded corridors, making them heavily obscured. In addition, at each intersection or branching passage offering a choice of direction, there is a 50 percent chance that a creature other than you will believe it is going in the opposite direction from the one it chooses. ***Doors.*** A', '', '', '', '',
  '["bard","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'guidance', 'Guidance', 0, 'divination',
  '1 action', 'Touch', 'V, S', 'Up to 1 minute',
  'You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one ability check of its choice. It can roll the die before or after making the ability check. The spell then ends.', '', '', '', '',
  '["cleric","druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'guiding-bolt', 'Guiding Bolt', 1, 'evocation',
  '1 action', '120 feet', 'V, S', '1 round',
  'A flash of light streaks toward a creature of your choice within range. Make a ranged spell attack against the target. On a hit, the target takes 4d6 radiant damage, and the next attack roll made against this target before the end of your next turn has advantage, thanks to the mystical dim light glittering on the target until then.', '4d6', 'radiant', '', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'gust-of-wind', 'Gust of Wind', 2, 'evocation',
  '1 action', 'Self', 'V, S, M', 'Up to 1 minute',
  'A line of strong wind 60 feet long and 10 feet wide blasts from you in a direction you choose for the spell''s duration. Each creature that starts its turn in the line must succeed on a strength saving throw or be pushed 15 feet away from you in a direction following the line. Any creature in the line must spend 2 feet of movement for every 1 foot it moves when moving closer to you. The gust disperses gas or vapor, and it extinguishes candles, torches, and similar unprotected flames in the area. It causes protected flames, such as those of lanterns, to dance wildly and has a 50 percent chance to extinguish them. As a bonus action on each of your turns before the spell ends, you can change the direction in which the line blasts from you.', '', '', 'STR', '',
  '["druid","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'hallow', 'Hallow', 5, 'evocation',
  '24 hours', 'Touch', 'V, S, M', 'Until dispelled',
  'You touch a point and infuse an area around it with holy (or unholy) power. The area can have a radius up to 60 feet, and the spell fails if the radius includes an area already under the effect a hallow spell. The affected area is subject to the following effects. First, celestials, elementals, fey, fiends, and undead can''t enter the area, nor can such creatures charm, frighten, or possess creatures within it. Any creature charmed, frightened, or possessed by such a creature is no longer charmed, frightened, or possessed upon entering the area. You can exclude one or more of those types of creatures from this effect. Second, you can bind an extra effect to the area. Choose the effect from the following list, or choose an effect offered by the GM. Some of these effects apply to creatures in the area; you can designate whether the effect applies to all creatures, creatures that follow a specific deity or leader, or creatures of a specific sort, such as ores or trolls. When a creature tha', '', '', 'CHA', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'hallucinatory-terrain', 'Hallucinatory Terrain', 4, 'illusion',
  '10 minutes', '300 feet', 'V, S, M', '24 hours',
  'You make natural terrain in a 150-foot cube in range look, sound, and smell like some other sort of natural terrain. Thus, open fields or a road can be made to resemble a swamp, hill, crevasse, or some other difficult or impassable terrain. A pond can be made to seem like a grassy meadow, a precipice like a gentle slope, or a rock-strewn gully like a wide and smooth road. Manufactured structures, equipment, and creatures within the area aren''t changed in appearance. The tactile characteristics of the terrain are unchanged, so creatures entering the area are likely to see through the illusion. If the difference isn''t obvious by touch, a creature carefully examining the illusion can attempt an Intelligence (Investigation) check against your spell save DC to disbelieve it. A creature who discerns the illusion for what it is, sees it as a vague image superimposed on the terrain.', '', '', '', '',
  '["bard","druid","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'harm', 'Harm', 6, 'necromancy',
  '1 action', '60 feet', 'V, S', 'Instantaneous',
  'You unleash a virulent disease on a creature that you can see within range. The target must make a constitution saving throw. On a failed save, it takes 14d6 necrotic damage, or half as much damage on a successful save. The damage can''t reduce the target''s hit points below 1. If the target fails the saving throw, its hit point maximum is reduced for 1 hour by an amount equal to the necrotic damage it took. Any effect that removes a disease allows a creature''s hit point maximum to return to normal before that time passes.', '14d6', 'necrotic', 'CON', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'haste', 'Haste', 3, 'transmutation',
  '1 action', '30 feet', 'V, S, M', 'Up to 1 minute',
  'Choose a willing creature that you can see within range. Until the spell ends, the target''s speed is doubled, it gains a +2 bonus to AC, it has advantage on dexterity saving throws, and it gains an additional action on each of its turns. That action can be used only to take the Attack (one weapon attack only), Dash, Disengage, Hide, or Use an Object action. When the spell ends, the target can''t move or take actions until after its next turn, as a wave of lethargy sweeps over it.', '', '', '', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'heal', 'Heal', 6, 'evocation',
  '1 action', '60 feet', 'V, S', 'Instantaneous',
  'Choose a creature that you can see within range. A surge of positive energy washes through the creature, causing it to regain 70 hit points. This spell also ends blindness, deafness, and any diseases affecting the target. This spell has no effect on constructs or undead.', '', '', '', '70',
  '["cleric","druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'healing-word', 'Healing Word', 1, 'evocation',
  '1 bonus action', '60 feet', 'V', 'Instantaneous',
  'A creature of your choice that you can see within range regains hit points equal to 1d4 + your spellcasting ability modifier. This spell has no effect on undead or constructs.', '', '', '', '1d4 + MOD',
  '["bard","cleric","druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'heat-metal', 'Heat Metal', 2, 'transmutation',
  '1 action', '60 feet', 'V, S, M', 'Up to 1 minute',
  'Choose a manufactured metal object, such as a metal weapon or a suit of heavy or medium metal armor, that you can see within range. You cause the object to glow red-hot. Any creature in physical contact with the object takes 2d8 fire damage when you cast the spell. Until the spell ends, you can use a bonus action on each of your subsequent turns to cause this damage again. If a creature is holding or wearing the object and takes the damage from it, the creature must succeed on a constitution saving throw or drop the object if it can. If it doesn''t drop the object, it has disadvantage on attack rolls and ability checks until the start of your next turn.', '2d8', 'fire', 'CON', '',
  '["bard","druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'hellish-rebuke', 'Hellish Rebuke', 1, 'evocation',
  '1 reaction', '60 feet', 'V, S', 'Instantaneous',
  'You point your finger, and the creature that damaged you is momentarily surrounded by hellish flames. The creature must make a dexterity saving throw. It takes 2d10 fire damage on a failed save, or half as much damage on a successful one.', '2d10', 'fire', 'DEX', '',
  '["warlock"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'heroes-feast', 'Heroes'' Feast', 6, 'conjuration',
  '10 minutes', '30 feet', 'V, S, M', 'Instantaneous',
  'You bring forth a great feast, including magnificent food and drink. The feast takes 1 hour to consume and disappears at the end of that time, and the beneficial effects don''t set in until this hour is over. Up to twelve other creatures can partake of the feast. A creature that partakes of the feast gains several benefits. The creature is cured of all diseases and poison, becomes immune to poison and being frightened, and makes all wisdom saving throws with advantage. Its hit point maximum also increases by 2d10, and it gains the same number of hit points. These benefits last for 24 hours.', '', '', '', '',
  '["cleric","druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'heroism', 'Heroism', 1, 'enchantment',
  '1 action', 'Touch', 'V, S', 'Up to 1 minute',
  'A willing creature you touch is imbued with bravery. Until the spell ends, the creature is immune to being frightened and gains temporary hit points equal to your spellcasting ability modifier at the start of each of its turns. When the spell ends, the target loses any remaining temporary hit points from this spell.', '', '', '', '',
  '["bard","paladin"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'hideous-laughter', 'Hideous Laughter', 1, 'enchantment',
  '1 action', '30 feet', 'V, S, M', 'Up to 1 minute',
  'A creature of your choice that you can see within range perceives everything as hilariously funny and falls into fits of laughter if this spell affects it. The target must succeed on a wisdom saving throw or fall prone, becoming incapacitated and unable to stand up for the duration. A creature with an Intelligence score of 4 or less isn''t affected. At the end of each of its turns, and each time it takes damage, the target can make another wisdom saving throw. The target had advantage on the saving throw if it''s triggered by damage. On a success, the spell ends.', '', '', 'WIS', '',
  '["bard","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'hold-monster', 'Hold Monster', 5, 'enchantment',
  '1 action', '90 feet', 'V, S, M', 'Up to 1 minute',
  'Choose a creature you can see and reach. The target must make a saving throw of Wisdom or be paralyzed for the duration of the spell. This spell has no effect against the undead. At the end of each round, the target can make a new saving throw of Wisdom. If successful, the spell ends for the creature.', '', '', 'WIS', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'hold-person', 'Hold Person', 2, 'enchantment',
  '1 action', '60 feet', 'V, S, M', 'Up to 1 minute',
  'Choose a humanoid that you can see within range. The target must succeed on a wisdom saving throw or be paralyzed for the duration. At the end of each of its turns, the target can make another wisdom saving throw. On a success, the spell ends on the target.', '', '', 'WIS', '',
  '["bard","cleric","druid","sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'holy-aura', 'Holy Aura', 8, 'abjuration',
  '1 action', 'Self', 'V, S, M', 'Up to 1 minute',
  'Divine light washes out from you and coalesces in a soft radiance in a 30-foot radius around you. Creatures of your choice in that radius when you cast this spell shed dim light in a 5-foot radius and have advantage on all saving throws, and other creatures have disadvantage on attack rolls against them until the spell ends. In addition, when a fiend or an undead hits an affected creature with a melee attack, the aura flashes with brilliant light. The attacker must succeed on a constitution saving throw or be blinded until the spell ends.', '', '', '', '',
  '["cleric"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'hunters-mark', 'Hunter''s Mark', 1, 'divination',
  '1 bonus action', '90 feet', 'V', 'Up to 1 hour',
  'You choose a creature you can see within range and mystically mark it as your quarry. Until the spell ends, you deal an extra 1d6 damage to the target whenever you hit it with a weapon attack, and you have advantage on any Wisdom (Perception) or Wisdom (Survival) check you make to find it. If the target drops to 0 hit points before this spell ends, you can use a bonus action on a subsequent turn of yours to mark a new creature.', '', '', '', '',
  '["ranger"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'hypnotic-pattern', 'Hypnotic Pattern', 3, 'illusion',
  '1 action', '120 feet', 'S, M', 'Up to 1 minute',
  'You create a twisting pattern of colors that weaves through the air inside a 30-foot cube within range. The pattern appears for a moment and vanishes. Each creature in the area who sees the pattern must make a wisdom saving throw. On a failed save, the creature becomes charmed for the duration. While charmed by this spell, the creature is incapacitated and has a speed of 0. The spell ends for an affected creature if it takes any damage or if someone else uses an action to shake the creature out of its stupor.', '', '', 'WIS', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'ice-storm', 'Ice Storm', 4, 'evocation',
  '1 action', '300 feet', 'V, S, M', 'Instantaneous',
  'A hail of rock-hard ice pounds to the ground in a 20-foot-radius, 40-foot-high cylinder centered on a point within range. Each creature in the cylinder must make a dexterity saving throw. A creature takes 2d8 bludgeoning damage and 4d6 cold damage on a failed save, or half as much damage on a successful one. Hailstones turn the storm''s area of effect into difficult terrain until the end of your next turn.', '2d8 + 4d6', 'bludgeoning', 'DEX', '',
  '["druid","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'identify', 'Identify', 1, 'divination',
  '1 minute', 'Touch', 'V, S, M', 'Instantaneous',
  'You choose one object that you must touch throughout the casting of the spell. If it is a magic item or some other magic-imbued object, you learn its properties and how to use them, whether it requires attunement to use, and how many charges it has, if any. You learn whether any spells are affecting the item and what they are. If the item was created by a spell, you learn which spell created it. If you instead touch a creature throughout the casting, you learn what spells, if any, are currently affecting it.', '', '', '', '',
  '["bard","wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'illusory-script', 'Illusory Script', 1, 'illusion',
  '1 minute', 'Touch', 'S, M', '10 days',
  'You write on parchment, paper, or some other suitable writing material and imbue it with a potent illusion that lasts for the duration. To you and any creatures you designate when you cast the spell, the writing appears normal, written in your hand, and conveys whatever meaning you intended when you wrote the text. To all others, the writing appears as if it were written in an unknown or magical script that is unintelligible. Alternatively, you can cause the writing to appear to be an entirely different message, written in a different hand and language, though the language must be one you know. Should the spell be dispelled, the original script and the illusion both disappear. A creature with truesight can read the hidden message.', '', '', '', '',
  '["bard","warlock","wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'imprisonment', 'Imprisonment', 9, 'abjuration',
  '1 minute', '30 feet', 'V, S, M', 'Until dispelled',
  'You create a magical restraint to hold a creature that you can see within range. The target must succeed on a wisdom saving throw or be bound by the spell; if it succeeds, it is immune to this spell if you cast it again. While affected by this spell, the creature doesn''t need to breathe, eat, or drink, and it doesn''t age. Divination spells can''t locate or perceive the target. When you cast the spell, you choose one of the following forms of imprisonment. ***Burial.*** The target is entombed far beneath the earth in a sphere of magical force that is just large enough to contain the target. Nothing can pass through the sphere, nor can any creature teleport or use planar travel to get into or out of it. The special component for this version of the spell is a small mithral orb. ***Chaining.*** Heavy chains, firmly rooted in the ground, hold the target in place. The target is restrained until the spell ends, and it can''t move or be moved by any means until then. The special component for t', '', '', 'WIS', '',
  '["warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'incendiary-cloud', 'Incendiary Cloud', 8, 'conjuration',
  '1 action', '150 feet', 'V, S', 'Up to 1 minute',
  'A swirling cloud of smoke shot through with white-hot embers appears in a 20-foot-radius sphere centered on a point within range. The cloud spreads around corners and is heavily obscured. It lasts for the duration or until a wind of moderate or greater speed (at least 10 miles per hour) disperses it. When the cloud appears, each creature in it must make a dexterity saving throw. A creature takes 10d8 fire damage on a failed save, or half as much damage on a successful one. A creature must also make this saving throw when it enters the spell''s area for the first time on a turn or ends its turn there. The cloud moves 10 feet directly away from you in a direction that you choose at the start of each of your turns.', '10d8', 'fire', 'DEX', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'inflict-wounds', 'Inflict Wounds', 1, 'necromancy',
  '1 action', 'Touch', 'V, S', 'Instantaneous',
  'Make a melee spell attack against a creature you can reach. On a hit, the target takes 3d10 necrotic damage.', '3d10', 'necrotic', '', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'insect-plague', 'Insect Plague', 5, 'conjuration',
  '1 action', '300 feet', 'V, S, M', 'Up to 10 minutes',
  'Swarming, biting locusts fill a 20-foot-radius sphere centered on a point you choose within range. The sphere spreads around corners. The sphere remains for the duration, and its area is lightly obscured. The sphere''s area is difficult terrain. When the area appears, each creature in it must make a constitution saving throw. A creature takes 4d10 piercing damage on a failed save, or half as much damage on a successful one. A creature must also make this saving throw when it enters the spell''s area for the first time on a turn or ends its turn there.', '4d10', 'piercing', 'CON', '',
  '["cleric","druid","sorcerer"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'instant-summons', 'Instant Summons', 6, 'conjuration',
  '1 minute', 'Touch', 'V, S, M', 'Until dispelled',
  'You touch an object weighing 10 pounds or less whose longest dimension is 6 feet or less. The spell leaves an invisible mark on its surface and invisibly inscribes the name of the item on the sapphire you use as the material component. Each time you cast this spell, you must use a different sapphire. At any time thereafter, you can use your action to speak the item''s name and crush the sapphire. The item instantly appears in your hand regardless of physical or planar distances, and the spell ends. If another creature is holding or carrying the item, crushing the sapphire doesn''t transport the item to you, but instead you learn who the creature possessing the object is and roughly where that creature is located at that moment. Dispel magic or a similar effect successfully applied to the sapphire ends this spell''s effect.', '', '', '', '',
  '["wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'invisibility', 'Invisibility', 2, 'illusion',
  '1 action', 'Touch', 'V, S, M', 'Up to 1 hour',
  'A creature you touch becomes invisible until the spell ends. Anything the target is wearing or carrying is invisible as long as it is on the target''s person. The spell ends for a target that attacks or casts a spell.', '', '', '', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'irresistible-dance', 'Irresistible Dance', 6, 'enchantment',
  '1 action', '30 feet', 'V', 'Up to 1 minute',
  'Choose one creature that you can see within range. The target begins a comic dance in place: shuffling, tapping its feet, and capering for the duration. Creatures that can''t be charmed are immune to this spell. A dancing creature must use all its movement to dance without leaving its space and has disadvantage on dexterity saving throws and attack rolls. While the target is affected by this spell, other creatures have advantage on attack rolls against it. As an action, a dancing creature makes a wisdom saving throw to regain control of itself. On a successful save, the spell ends.', '', '', '', '',
  '["bard","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'jump', 'Jump', 1, 'transmutation',
  '1 action', 'Touch', 'V, S, M', '1 minute',
  'You touch a creature. The creature''s jump distance is tripled until the spell ends.', '', '', '', '',
  '["druid","ranger","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'knock', 'Knock', 2, 'transmutation',
  '1 action', '60 feet', 'V', 'Instantaneous',
  'Choose an object that you can see within range. The object can be a door, a box, a chest, a set of manacles, a padlock, or another object that contains a mundane or magical means that prevents access. A target that is held shut by a mundane lock or that is stuck or barred becomes unlocked, unstuck, or unbarred. If the object has multiple locks, only one of them is unlocked. If you choose a target that is held shut with arcane lock, that spell is suppressed for 10 minutes, during which time the target can be opened and shut normally. When you cast the spell, a loud knock, audible from as far away as 300 feet, emanates from the target object.', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'legend-lore', 'Legend Lore', 5, 'divination',
  '10 minutes', 'Self', 'V, S, M', 'Instantaneous',
  'Name or describe a person, place, or object. The spell brings to your mind a brief summary of the significant lore about the thing you named. The lore might consist of current tales, forgotten stories, or even secret lore that has never been widely known. If the thing you named isn''t of legendary importance, you gain no information. The more information you already have about the thing, the more precise and detailed the information you receive is. The information you learn is accurate but might be couched in figurative language. For example, if you have a mysterious magic axe on hand the spell might yield this information: "Woe to the evildoer whose hand touches the axe, for even the haft slices the hand of the evil ones. Only a true Child of Stone, lover and beloved of Moradin, may awaken the true powers of the axe, and only with the sacred word *Rudnogg* on the lips."', '', '', '', '',
  '["bard","cleric","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'lesser-restoration', 'Lesser Restoration', 2, 'abjuration',
  '1 action', 'Touch', 'V, S', 'Instantaneous',
  'You touch a creature and can end either one disease or one condition afflicting it. The condition can be blinded, deafened, paralyzed, or poisoned.', '', '', '', '',
  '["bard","cleric","druid","paladin","ranger"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'levitate', 'Levitate', 2, 'transmutation',
  '1 action', '60 feet', 'V, S, M', 'Up to 10 minutes',
  'One creature or object of your choice that you can see within range rises vertically, up to 20 feet, and remains suspended there for the duration. The spell can levitate a target that weighs up to 500 pounds. An unwilling creature that succeeds on a constitution saving throw is unaffected. The target can move only by pushing or pulling against a fixed object or surface within reach (such as a wall or a ceiling), which allows it to move as if it were climbing. You can change the target''s altitude by up to 20 feet in either direction on your turn. If you are the target, you can move up or down as part of your move. Otherwise, you can use your action to move the target, which must remain within the spell''s range. When the spell ends, the target floats gently to the ground if it is still aloft.', '', '', '', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'light', 'Light', 0, 'evocation',
  '1 action', 'Touch', 'V, M', '1 hour',
  'You touch one object that is no larger than 10 feet in any dimension. Until the spell ends, the object sheds bright light in a 20-foot radius and dim light for an additional 20 feet. The light can be colored as you like. Completely covering the object with something opaque blocks the light. The spell ends if you cast it again or dismiss it as an action. If you target an object held or worn by a hostile creature, that creature must succeed on a dexterity saving throw to avoid the spell.', '', '', 'DEX', '',
  '["bard","cleric","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'lightning-bolt', 'Lightning Bolt', 3, 'evocation',
  '1 action', 'Self', 'V, S, M', 'Instantaneous',
  'A stroke of lightning forming a line 100 feet long and 5 feet wide blasts out from you in a direction you choose. Each creature in the line must make a dexterity saving throw. A creature takes 8d6 lightning damage on a failed save, or half as much damage on a successful one. The lightning ignites flammable objects in the area that aren''t being worn or carried.', '8d6', 'lightning', 'DEX', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'locate-animals-or-plants', 'Locate Animals or Plants', 2, 'divination',
  '1 action', 'Self', 'V, S, M', 'Instantaneous',
  'Describe or name a specific kind of beast or plant. Concentrating on the voice of nature in your surroundings, you learn the direction and distance to the closest creature or plant of that kind within 5 miles, if any are present.', '', '', '', '',
  '["bard","druid","ranger"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'locate-creature', 'Locate Creature', 4, 'divination',
  '1 action', 'Self', 'V, S, M', 'Up to 1 hour',
  'Describe or name a creature that is familiar to you. You sense the direction to the creature''s location, as long as that creature is within 1,000 feet of you. If the creature is moving, you know the direction of its movement. The spell can locate a specific creature known to you, or the nearest creature of a specific kind (such as a human or a unicorn), so long as you have seen such a creature up close--within 30 feet--at least once. If the creature you described or named is in a different form, such as being under the effects of a polymorph spell, this spell doesn''t locate the creature. This spell can''t locate a creature if running water at least 10 feet wide blocks a direct path between you and the creature.', '', '', '', '',
  '["bard","cleric","druid","paladin","ranger","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'locate-object', 'Locate Object', 2, 'divination',
  '1 action', 'Self', 'V, S, M', 'Up to 10 minutes',
  'Describe or name an object that is familiar to you. You sense the direction to the object''s location, as long as that object is within 1,000 feet of you. If the object is in motion, you know the direction of its movement. The spell can locate a specific object known to you, as long as you have seen it up close--within 30 feet--at least once. Alternatively, the spell can locate the nearest object of a particular kind, such as a certain kind of apparel, jewelry, furniture, tool, or weapon. This spell can''t locate an object if any thickness of lead, even a thin sheet, blocks a direct path between you and the object.', '', '', '', '',
  '["bard","cleric","druid","paladin","ranger","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'longstrider', 'Longstrider', 1, 'transmutation',
  '1 action', 'Touch', 'V, S, M', '1 hour',
  'You touch a creature. The target''s speed increases by 10 feet until the spell ends.', '', '', '', '',
  '["bard","druid","ranger","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'mage-armor', 'Mage Armor', 1, 'abjuration',
  '1 action', 'Touch', 'V, S, M', '8 hours',
  'You touch a willing creature who isn''t wearing armor, and a protective magical force surrounds it until the spell ends. The target''s base AC becomes 13 + its Dexterity modifier. The spell ends if the target dons armor or if you dismiss the spell as an action.', '', '', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'mage-hand', 'Mage Hand', 0, 'conjuration',
  '1 action', '30 feet', 'V, S', '1 minute',
  'A spectral, floating hand appears at a point you choose within range. The hand lasts for the duration or until you dismiss it as an action. The hand vanishes if it is ever more than 30 feet away from you or if you cast this spell again. You can use your action to control the hand. You can use the hand to manipulate an object, open an unlocked door or container, stow or retrieve an item from an open container, or pour the contents out of a vial. You can move the hand up to 30 feet each time you use it. The hand can''t attack, activate magic items, or carry more than 10 pounds.', '', '', '', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'magic-circle', 'Magic Circle', 3, 'abjuration',
  '1 minute', '10 feet', 'V, S, M', '1 hour',
  'You create a 10-foot radius, 20-foot-tall cylinder of magical energy centered on a point on the ground that you can see within range. Glowing runes appear whenever the cylinder intersects with the floor or other surface. Choose one or more of the following types of creatures: celestials, elementals, fey, fiends, or undead. The circle affects a creature of the chosen type in the following ways: - The creature can''t willingly enter the cylinder by nonmagical means. If the creature tries to use teleportation or interplanar travel to do so, it must first succeed on a charisma saving throw. - The creature has disadvantage on attack rolls against targets within the cylinder. - Targets within the cylinder can''t be charmed, frightened, or possessed by the creature. When you cast this spell, you can elect to cause its magic to operate in the reverse direction, preventing a creature of the specified type from leaving the cylinder and protecting targets outside it.', '', '', 'CHA', '',
  '["cleric","paladin","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'magic-jar', 'Magic Jar', 6, 'necromancy',
  '1 minute', 'Self', 'V, S, M', 'Until dispelled',
  'Your body falls into a catatonic state as your soul leaves it and enters the container you used for the spell''s material component. While your soul inhabits the container, you are aware of your surroundings as if you were in the container''s space. You can''t move or use reactions. The only action you can take is to project your soul up to 100 feet out of the container, either returning to your living body (and ending the spell) or attempting to possess a humanoids body. You can attempt to possess any humanoid within 100 feet of you that you can see (creatures warded by a protection from evil and good or magic circle spell can''t be possessed). The target must make a charisma saving throw. On a failure, your soul moves into the target''s body, and the target''s soul becomes trapped in the container. On a success, the target resists your efforts to possess it, and you can''t attempt to possess it again for 24 hours. Once you possess a creature''s body, you control it. Your game statistics are ', '', '', 'CHA', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'magic-missile', 'Magic Missile', 1, 'evocation',
  '1 action', '120 feet', 'V, S', 'Instantaneous',
  'You create three glowing darts of magical force. Each dart hits a creature of your choice that you can see within range. A dart deals 1d4 + 1 force damage to its target. The darts all strike simultaneously, and you can direct them to hit one creature or several.', '1d4 + 1', 'force', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'magic-mouth', 'Magic Mouth', 2, 'illusion',
  '1 minute', '30 feet', 'V, S, M', 'Until dispelled',
  'You plant a message to an object in the range of the spell. The message is verbalized when the trigger conditions are met. Choose an object that you see, and that is not worn or carried by another creature. Then say the message, which should not exceed 25 words but listening can take up to 10 minutes. Finally, establish the circumstances that trigger the spell to deliver your message. When these conditions are satisfied, a magical mouth appears on the object and it articulates the message imitating your voice, the same tone used during implantation of the message. If the selected object has a mouth or something that approaches such as the mouth of a statue, the magic mouth come alive at this point, giving the illusion that the words come from the mouth of the object. When you cast this spell, you may decide that the spell ends when the message is delivered or it can persist and repeat the message whenever circumstances occur. The triggering circumstance can be as general or as detailed', '', '', '', '',
  '["bard","wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'magic-weapon', 'Magic Weapon', 2, 'transmutation',
  '1 bonus action', 'Touch', 'V, S', 'Up to 1 hour',
  'You touch a nonmagical weapon. Until the spell ends, that weapon becomes a magic weapon with a +1 bonus to attack rolls and damage rolls.', '', '', '', '',
  '["paladin","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'magnificent-mansion', 'Magnificent Mansion', 7, 'conjuration',
  '1 minute', '300 feet', 'V, S, M', '24 hours',
  'You conjure an extradimensional dwelling in range that lasts for the duration. You choose where its one entrance is located. The entrance shimmers faintly and is 5 feet wide and 10 feet tall. You and any creature you designate when you cast the spell can enter the extradimensional dwelling as long as the portal remains open. You can open or close the portal if you are within 30 feet of it. While closed, the portal is invisible. Beyond the portal is a magnificent foyer with numerous chambers beyond. The atmosphere is clean, fresh, and warm. You can create any floor plan you like, but the space can''t exceed 50 cubes, each cube being 10 feet on each side. The place is furnished and decorated as you choose. It contains sufficient food to serve a nine course banquet for up to 100 people. A staff of 100 near-transparent servants attends all who enter. You decide the visual appearance of these servants and their attire. They are completely obedient to your orders. Each servant can perform any', '', '', '', '',
  '["bard","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'major-image', 'Major Image', 3, 'illusion',
  '1 action', '120 feet', 'V, S, M', 'Up to 10 minutes',
  'You create the image of an object, a creature, or some other visible phenomenon that is no larger than a 20-foot cube. The image appears at a spot that you can see within range and lasts for the duration. It seems completely real, including sounds, smells, and temperature appropriate to the thing depicted. You can''t create sufficient heat or cold to cause damage, a sound loud enough to deal thunder damage or deafen a creature, or a smell that might sicken a creature (like a troglodyte''s stench). As long as you are within range of the illusion, you can use your action to cause the image to move to any other spot within range. As the image changes location, you can alter its appearance so that its movements appear natural for the image. For example, if you create an image of a creature and move it, you can alter the image so that it appears to be walking. Similarly, you can cause the illusion to make different sounds at different times, even making it carry on a conversation, for example', '', '', '', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'mass-cure-wounds', 'Mass Cure Wounds', 5, 'conjuration',
  '1 action', '60 feet', 'V, S', 'Instantaneous',
  'A wave of healing energy washes out from a point of your choice within range. Choose up to six creatures in a 30-foot-radius sphere centered on that point. Each target regains hit points equal to 3d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.', '', '', '', '3d8 + MOD',
  '["bard","cleric","druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'mass-heal', 'Mass Heal', 9, 'conjuration',
  '1 action', '60 feet', 'V, S', 'Instantaneous',
  'A flood of healing energy flows from you into injured creatures around you. You restore up to 700 hit points, divided as you choose among any number of creatures that you can see within range. Creatures healed by this spell are also cured of all diseases and any effect making them blinded or deafened. This spell has no effect on undead or constructs.', '', '', '', '700',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'mass-healing-word', 'Mass Healing Word', 3, 'evocation',
  '1 bonus action', '60 feet', 'V', 'Instantaneous',
  'As you call out words of restoration, up to six creatures of your choice that you can see within range regain hit points equal to 1d4 + your spellcasting ability modifier. This spell has no effect on undead or constructs.', '', '', '', '1d4 + MOD',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'mass-suggestion', 'Mass Suggestion', 6, 'enchantment',
  '1 action', '60 feet', 'V, M', '24 hours',
  'You suggest a course of activity (limited to a sentence or two) and magically influence up to twelve creatures of your choice that you can see within range and that can hear and understand you. Creatures that can''t be charmed are immune to this effect. The suggestion must be worded in such a manner as to make the course of action sound reasonable. Asking the creature to stab itself, throw itself onto a spear, immolate itself, or do some other obviously harmful act automatically negates the effect of the spell. Each target must make a wisdom saving throw. On a failed save, it pursues the course of action you described to the best of its ability. The suggested course of action can continue for the entire duration. If the suggested activity can be completed in a shorter time, the spell ends when the subject finishes what it was asked to do. You can also specify conditions that will trigger a special activity during the duration. For example, you might suggest that a group of soldiers give', '', '', 'WIS', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'maze', 'Maze', 8, 'conjuration',
  '1 action', '60 feet', 'V, S', 'Up to 10 minutes',
  'You banish a creature that you can see within range into a labyrinthine demiplane. The target remains there for the duration or until it escapes the maze. The target can use its action to attempt to escape. When it does so, it makes a DC 20 Intelligence check. If it succeeds, it escapes, and the spell ends (a minotaur or goristro demon automatically succeeds). When the spell ends, the target reappears in the space it left or, if that space is occupied, in the nearest unoccupied space.', '', '', '', '',
  '["wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'meld-into-stone', 'Meld Into Stone', 3, 'transmutation',
  '1 action', 'Touch', 'V, S', '8 hours',
  'You step into a stone object or surface large enough to fully contain your body, melding yourself and all the equipment you carry with the stone for the duration. Using your movement, you step into the stone at a point you can touch. Nothing of your presence remains visible or otherwise detectable by nonmagical senses. While merged with the stone, you can''t see what occurs outside it, and any Wisdom (Perception) checks you make to hear sounds outside it are made with disadvantage. You remain aware of the passage of time and can cast spells on yourself while merged in the stone. You can use your movement to leave the stone where you entered it, which ends the spell. You otherwise can''t move. Minor physical damage to the stone doesn''t harm you, but its partial destruction or a change in its shape (to the extent that you no longer fit within it) expels you and deals 6d6 bludgeoning damage to you. The stone''s complete destruction (or transmutation into a different substance) expels you and', '', '', '', '',
  '["cleric"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'mending', 'Mending', 0, 'transmutation',
  '1 minute', 'Touch', 'V, S, M', 'Instantaneous',
  'This spell repairs a single break or tear in an object you touch, such as a broken key, a torn cloak, or a leaking wineskin. As long as the break or tear is no longer than 1 foot in any dimension, you mend it, leaving no trace of the former damage. This spell can physically repair a magic item or construct, but the spell can''t restore magic to such an object.', '', '', '', '',
  '["cleric","bard","druid","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'message', 'Message', 0, 'transmutation',
  '1 action', '120 feet', 'V, S, M', '1 round',
  'You point your finger toward a creature within range and whisper a message. The target (and only the target) hears the message and can reply in a whisper that only you can hear. You can cast this spell through solid objects if you are familiar with the target and know it is beyond the barrier. Magical silence, 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood blocks the spell. The spell doesn''t have to follow a straight line and can travel freely around corners or through openings.', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'meteor-swarm', 'Meteor Swarm', 9, 'evocation',
  '1 action', '1 mile', 'V, S', 'Instantaneous',
  'Blazing orbs of fire plummet to the ground at four different points you can see within range. Each creature in a 40-foot-radius sphere centered on each point you choose must make a dexterity saving throw. The sphere spreads around corners. A creature takes 20d6 fire damage and 20d6 bludgeoning damage on a failed save, or half as much damage on a successful one. A creature in the area of more than one fiery burst is affected only once. The spell damages objects in the area and ignites flammable objects that aren''t being worn or carried.', '20d6 + 20d6', 'fire', 'DEX', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'mind-blank', 'Mind Blank', 8, 'abjuration',
  '1 action', 'Touch', 'V, S', '24 hours',
  'Until the spell ends, one willing creature you touch is immune to psychic damage, any effect that would sense its emotions or read its thoughts, divination spells, and the charmed condition. The spell even foils wish spells and spells or effects of similar power used to affect the target''s mind or to gain information about the target.', '', '', '', '',
  '["bard","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'minor-illusion', 'Minor Illusion', 0, 'illusion',
  '1 action', '30 feet', 'S, M', '1 minute',
  'You create a sound or an image of an object within range that lasts for the duration. The illusion also ends if you dismiss it as an action or cast this spell again. If you create a sound, its volume can range from a whisper to a scream. It can be your voice, someone else''s voice, a lion''s roar, a beating of drums, or any other sound you choose. The sound continues unabated throughout the duration, or you can make discrete sounds at different times before the spell ends. If you create an image of an object--such as a chair, muddy footprints, or a small chest--it must be no larger than a 5-foot cube. The image can''t create sound, light, smell, or any other sensory effect. Physical interaction with the image reveals it to be an illusion, because things can pass through it. If a creature uses its action to examine the sound or image, the creature can determine that it is an illusion with a successful Intelligence (Investigation) check against your spell save DC. If a creature discerns the', '', '', '', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'mirage-arcane', 'Mirage Arcane', 7, 'illusion',
  '10 minutes', 'Sight', 'V, S', '10 days',
  'You make terrain in an area up to 1 mile square look, sound, smell, and even feel like some other sort of terrain. The terrain''s general shape remains the same, however. Open fields or a road could be made to resemble a swamp, hill, crevasse, or some other difficult or impassable terrain. A pond can be made to seem like a grassy meadow, a precipice like a gentle slope, or a rock-strewn gully like a wide and smooth road. Similarly, you can alter the appearance of structures, or add them where none are present. The spell doesn''t disguise, conceal, or add creatures. The illusion includes audible, visual, tactile, and olfactory elements, so it can turn clear ground into difficult terrain (or vice versa) or otherwise impede movement through the area. Any piece of the illusory terrain (such as a rock or stick) that is removed from the spell''s area disappears immediately. Creatures with truesight can see through the illusion to the terrain''s true form; however, all other elements of the illus', '', '', '', '',
  '["bard","druid","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'mirror-image', 'Mirror Image', 2, 'illusion',
  '1 action', 'Self', 'V, S', '1 minute',
  'Three illusory duplicates of yourself appear in your space. Until the spell ends, the duplicates move with you and mimic your actions, shifting position so it''s impossible to track which image is real. You can use your action to dismiss the illusory duplicates. Each time a creature targets you with an attack during the spell''s duration, roll a d20 to determine whether the attack instead targets one of your duplicates. If you have three duplicates, you must roll a 6 or higher to change the attack''s target to a duplicate. With two duplicates, you must roll an 8 or higher. With one duplicate, you must roll an 11 or higher. A duplicate''s AC equals 10 + your Dexterity modifier. If an attack hits a duplicate, the duplicate is destroyed. A duplicate can be destroyed only by an attack that hits it. It ignores all other damage and effects. The spell ends when all three duplicates are destroyed. A creature is unaffected by this spell if it can''t see, if it relies on senses other than sight, such', '', '', '', '',
  '["sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'mislead', 'Mislead', 5, 'illusion',
  '1 action', 'Self', 'S', 'Up to 1 hour',
  'You become invisible at the same time that an illusory double of you appears where you are standing. The double lasts for the duration, but the invisibility ends if you attack or cast a spell. You can use your action to move your illusory double up to twice your speed and make it gesture, speak, and behave in whatever way you choose. You can see through its eyes and hear through its ears as if you were located where it is. On each of your turns as a bonus action, you can switch from using its senses to using your own, or back again. While you are using its senses, you are blinded and deafened in regard to your own surroundings.', '', '', '', '',
  '["bard","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'misty-step', 'Misty Step', 2, 'conjuration',
  '1 bonus action', 'Self', 'V', 'Instantaneous',
  'Briefly surrounded by silvery mist, you teleport up to 30 feet to an unoccupied space that you can see.', '', '', '', '',
  '["sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'modify-memory', 'Modify Memory', 5, 'enchantment',
  '1 action', '30 feet', 'V, S', 'Up to 1 minute',
  'You attempt to reshape another creature''s memories. One creature that you can see must make a wisdom saving throw. If you are fighting the creature, it has advantage on the saving throw. On a failed save, the target becomes charmed by you for the duration. The charmed target is incapacitated and unaware of its surroundings, though it can still hear you. If it takes any damage or is targeted by another spell, this spell ends, and none of the target''s memories are modified. While this charm lasts, you can affect the target''s memory of an event that it experienced within the last 24 hours and that lasted no more than 10 minutes. You can permanently eliminate all memory of the event, allow the target to recall the event with perfect clarity and exacting detail, change its memory of the details of the event, or create a memory of some other event. You must speak to the target to describe how its memories are affected, and it must be able to understand your language for the modified memories', '', '', 'WIS', '',
  '["bard","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'moonbeam', 'Moonbeam', 2, 'evocation',
  '1 action', '120 feet', 'V, S, M', 'Up to 1 minute',
  'A silvery beam of pale light shines down in a 5-foot radius, 40-foot-high cylinder centered on a point within range. Until the spell ends, dim light fills the cylinder. When a creature enters the spell''s area for the first time on a turn or starts its turn there, it is engulfed in ghostly flames that cause searing pain, and it must make a constitution saving throw. It takes 2d10 radiant damage on a failed save, or half as much damage on a successful one. A shapechanger makes its saving throw with disadvantage. If it fails, it also instantly reverts to its original form and can''t assume a different form until it leaves the spell''s light. On each of your turns after you cast this spell, you can use an action to move the beam 60 feet in any direction.', '2d10', 'radiant', 'CON', '',
  '["druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'move-earth', 'Move Earth', 6, 'transmutation',
  '1 action', '120 feet', 'V, S, M', 'Up to 2 hours',
  'Choose an area of terrain no larger than 40 feet on a side within range. You can reshape dirt, sand, or clay in the area in any manner you choose for the duration. You can raise or lower the area''s elevation, create or fill in a trench, erect or flatten a wall, or form a pillar. The extent of any such changes can''t exceed half the area''s largest dimension. So, if you affect a 40-foot square, you can create a pillar up to 20 feet high, raise or lower the square''s elevation by up to 20 feet, dig a trench up to 20 feet deep, and so on. It takes 10 minutes for these changes to complete. At the end of every 10 minutes you spend concentrating on the spell, you can choose a new area of terrain to affect. Because the terrain''s transformation occurs slowly, creatures in the area can''t usually be trapped or injured by the ground''s movement. This spell can''t manipulate natural stone or stone construction. Rocks and structures shift to accommodate the new terrain. If the way you shape the terrain ', '', '', '', '',
  '["druid","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'nondetection', 'Nondetection', 3, 'abjuration',
  '1 action', 'Touch', 'V, S, M', '8 hours',
  'For the duration, you hide a target that you touch from divination magic. The target can be a willing creature or a place or an object no larger than 10 feet in any dimension. The target can''t be targeted by any divination magic or perceived through magical scrying sensors.', '', '', '', '',
  '["bard","ranger","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'pass-without-trace', 'Pass Without Trace', 2, 'abjuration',
  '1 action', 'Self', 'V, S, M', 'Up to 1 hour',
  'A veil of shadows and silence radiates from you, masking you and your companions from detection. For the duration, each creature you choose within 30 feet of you (including you) has a +10 bonus to Dexterity (Stealth) checks and can''t be tracked except by magical means. A creature that receives this bonus leaves behind no tracks or other traces of its passage.', '', '', '', '',
  '["druid","ranger"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'passwall', 'Passwall', 5, 'transmutation',
  '1 action', '30 feet', 'V, S, M', '1 hour',
  'A passage appears at a point of your choice that you can see on a wooden, plaster, or stone surface (such as a wall, a ceiling, or a floor) within range, and lasts for the duration. You choose the opening''s dimensions: up to 5 feet wide, 8 feet tall, and 20 feet deep. The passage creates no instability in a structure surrounding it. When the opening disappears, any creatures or objects still in the passage created by the spell are safely ejected to an unoccupied space nearest to the surface on which you cast the spell.', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'phantasmal-killer', 'Phantasmal Killer', 4, 'illusion',
  '1 action', '120 feet', 'V, S', 'Up to 1 minute',
  'You tap into the nightmares of a creature you can see within range and create an illusory manifestation of its deepest fears, visible only to that creature. The target must make a wisdom saving throw. On a failed save, the target becomes frightened for the duration. At the start of each of the target''s turns before the spell ends, the target must succeed on a wisdom saving throw or take 4d10 psychic damage. On a successful save, the spell ends.', '4d10', 'psychic', 'WIS', '',
  '["wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'phantom-steed', 'Phantom Steed', 3, 'illusion',
  '1 minute', '30 feet', 'V, S', '1 hour',
  'A Large quasi-real, horselike creature appears on the ground in an unoccupied space of your choice within range. You decide the creature''s appearance, but it is equipped with a saddle, bit, and bridle. Any of the equipment created by the spell vanishes in a puff of smoke if it is carried more than 10 feet away from the steed. For the duration, you or a creature you choose can ride the steed. The creature uses the statistics for a riding horse, except it has a speed of 100 feet and can travel 10 miles in an hour, or 13 miles at a fast pace. When the spell ends, the steed gradually fades, giving the rider 1 minute to dismount. The spell ends if you use an action to dismiss it or if the steed takes any damage.', '', '', '', '',
  '["wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'planar-ally', 'Planar Ally', 6, 'conjuration',
  '10 minutes', '60 feet', 'V, S', 'Instantaneous',
  'You beseech an otherworldly entity for aid. The being must be known to you: a god, a primordial, a demon prince, or some other being of cosmic power. That entity sends a celestial, an elemental, or a fiend loyal to it to aid you, making the creature appear in an unoccupied space within range. If you know a specific creature''s name, you can speak that name when you cast this spell to request that creature, though you might get a different creature anyway (GM''s choice). When the creature appears, it is under no compulsion to behave in any particular way. You can ask the creature to perform a service in exchange for payment, but it isn''t obliged to do so. The requested task could range from simple (fly us across the chasm, or help us fight a battle) to complex (spy on our enemies, or protect us during our foray into the dungeon). You must be able to communicate with the creature to bargain for its services. Payment can take a variety of forms. A celestial might require a sizable donation ', '', '', '', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'planar-binding', 'Planar Binding', 5, 'abjuration',
  '1 hour', '60 feet', 'V, S, M', '24 hours',
  'With this spell, you attempt to bind a celestial, an elemental, a fey, or a fiend to your service. The creature must be within range for the entire casting of the spell. (Typically, the creature is first summoned into the center of an inverted magic circle in order to keep it trapped while this spell is cast.) At the completion of the casting, the target must make a charisma saving throw. On a failed save, it is bound to serve you for the duration. If the creature was summoned or created by another spell, that spell''s duration is extended to match the duration of this spell. A bound creature must follow your instructions to the best of its ability. You might command the creature to accompany you on an adventure, to guard a location, or to deliver a message. The creature obeys the letter of your instructions, but if the creature is hostile to you, it strives to twist your words to achieve its own objectives. If the creature carries out your instructions completely before the spell ends,', '', '', 'CHA', '',
  '["bard","cleric","druid","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'plane-shift', 'Plane Shift', 7, 'conjuration',
  '1 action', 'Touch', 'V, S, M', 'Instantaneous',
  'You and up to eight willing creatures who link hands in a circle are transported to a different plane of existence. You can specify a target destination in general terms, such as the City of Brass on the Elemental Plane of Fire or the palace of Dispater on the second level of the Nine Hells, and you appear in or near that destination. If you are trying to reach the City of Brass, for example, you might arrive in its Street of Steel, before its Gate of Ashes, or looking at the city from across the Sea of Fire, at the GM''s discretion. Alternatively, if you know the sigil sequence of a teleportation circle on another plane of existence, this spell can take you to that circle. If the teleportation circle is too small to hold all the creatures you transported, they appear in the closest unoccupied spaces next to the circle. You can use this spell to banish an unwilling creature to another plane. Choose a creature within your reach and make a melee spell attack against it. On a hit, the crea', '', '', 'CHA', '',
  '["cleric","druid","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'plant-growth', 'Plant Growth', 3, 'transmutation',
  '1 action', '150 feet', 'V, S', 'Instantaneous',
  'This spell channels vitality into plants within a specific area. There are two possible uses for the spell, granting either immediate or long-term benefits. If you cast this spell using 1 action, choose a point within range. All normal plants in a 100-foot radius centered on that point become thick and overgrown. A creature moving through the area must spend 4 feet of movement for every 1 foot it moves. You can exclude one or more areas of any size within the spell''s area from being affected. If you cast this spell over 8 hours, you enrich the land. All plants in a half-mile radius centered on a point within range become enriched for 1 year. The plants yield twice the normal amount of food when harvested.', '', '', '', '',
  '["bard","druid","ranger"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'poison-spray', 'Poison Spray', 0, 'conjuration',
  '1 action', '10 feet', 'V, S', 'Instantaneous',
  'You extend your hand toward a creature you can see within range and project a puff of noxious gas from your palm. The creature must succeed on a constitution saving throw or take 1d12 poison damage. This spell''s damage increases by 1d12 when you reach 5th level (2d12), 11th level (3d12), and 17th level (4d12).', '1d12', 'poison', 'CON', '',
  '["sorcerer","warlock","wizard","druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'polymorph', 'Polymorph', 4, 'transmutation',
  '1 action', '60 feet', 'V, S, M', 'Up to 1 hour',
  'This spell transforms a creature that you can see within range into a new form. An unwilling creature must make a wisdom saving throw to avoid the effect. A shapechanger automatically succeeds on this saving throw. The transformation lasts for the duration, or until the target drops to 0 hit points or dies. The new form can be any beast whose challenge rating is equal to or less than the target''s (or the target''s level, if it doesn''t have a challenge rating). The target''s game statistics, including mental ability scores, are replaced by the statistics of the chosen beast. It retains its alignment and personality. The target assumes the hit points of its new form. When it reverts to its normal form, the creature returns to the number of hit points it had before it transformed. If it reverts as a result of dropping to 0 hit points, any excess damage carries over to its normal form. As long as the excess damage doesn''t reduce the creature''s normal form to 0 hit points, it isn''t knocked un', '', '', 'WIS', '',
  '["bard","druid","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'power-word-kill', 'Power Word Kill', 9, 'enchantment',
  '1 action', '60 feet', 'V', 'Instantaneous',
  'You utter a word of power that can compel one creature you can see within range to die instantly. If the creature you choose has 100 hit points or fewer, it dies. Otherwise, the spell has no effect.', '', '', '', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'power-word-stun', 'Power Word Stun', 8, 'enchantment',
  '1 action', '60 feet', 'V', 'Instantaneous',
  'You speak a word of power that can overwhelm the mind of one creature you can see within range, leaving it dumbfounded. If the target has 150 hit points or fewer, it is stunned. Otherwise, the spell has no effect. The stunned target must make a constitution saving throw at the end of each of its turns. On a successful save, this stunning effect ends.', '', '', '', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'prayer-of-healing', 'Prayer of Healing', 2, 'evocation',
  '10 minutes', '30 feet', 'V', 'Instantaneous',
  'Up to six creatures of your choice that you can see within range each regain hit points equal to 2d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.', '', '', '', '2d8 + MOD',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'prestidigitation', 'Prestidigitation', 0, 'transmutation',
  '1 action', '10 feet', 'V, S', '1 hour',
  'This spell is a minor magical trick that novice spellcasters use for practice. You create one of the following magical effects within ''range'': You create an instantaneous, harmless sensory effect, such as a shower of sparks, a puff of wind, faint musical notes, or an odd odor. You instantaneously light or snuff out a candle, a torch, or a small campfire. You instantaneously clean or soil an object no larger than 1 cubic foot. You chill, warm, or flavor up to 1 cubic foot of nonliving material for 1 hour. You make a color, a small mark, or a symbol appear on an object or a surface for 1 hour. You create a nonmagical trinket or an illusory image that can fit in your hand and that lasts until the end of your next turn. If you cast this spell multiple times, you can have up to three of its non-instantaneous effects active at a time, and you can dismiss such an effect as an action.', '', '', '', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'prismatic-spray', 'Prismatic Spray', 7, 'evocation',
  '1 action', 'Self', 'V, S', 'Instantaneous',
  'Eight multicolored rays of light flash from your hand. Each ray is a different color and has a different power and purpose. Each creature in a 60-foot cone must make a dexterity saving throw. For each target, roll a d8 to determine which color ray affects it. ***1. Red.*** The target takes 10d6 fire damage on a failed save, or half as much damage on a successful one. ***2. Orange.*** The target takes 10d6 acid damage on a failed save, or half as much damage on a successful one. ***3. Yellow.*** The target takes 10d6 lightning damage on a failed save, or half as much damage on a successful one. ***4. Green.*** The target takes 10d6 poison damage on a failed save, or half as much damage on a successful one. ***5. Blue.*** The target takes 10d6 cold damage on a failed save, or half as much damage on a successful one. ***6. Indigo.*** On a failed save, the target is restrained. It must then make a constitution saving throw at the end of each of its turns. If it successfully saves three tim', '10d6', '', 'DEX', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'prismatic-wall', 'Prismatic Wall', 9, 'abjuration',
  '1 action', '60 feet', 'V, S', '10 minutes',
  'A shimmering, multicolored plane of light forms a vertical opaque wall--up to 90 feet long, 30 feet high, and 1 inch thick--centered on a point you can see within range. Alternatively, you can shape the wall into a sphere up to 30 feet in diameter centered on a point you choose within range. The wall remains in place for the duration. If you position the wall so that it passes through a space occupied by a creature, the spell fails, and your action and the spell slot are wasted. The wall sheds bright light out to a range of 100 feet and dim light for an additional 100 feet. You and creatures you designate at the time you cast the spell can pass through and remain near the wall without harm. If another creature that can see the wall moves to within 20 feet of it or starts its turn there, the creature must succeed on a constitution saving throw or become blinded for 1 minute. The wall consists of seven layers, each with a different color. When a creature attempts to reach into or pass th', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'private-sanctum', 'Private Sanctum', 4, 'abjuration',
  '10 minutes', '120 feet', 'V, S, M', '24 hours',
  'You make an area within range magically secure. The area is a cube that can be as small as 5 feet to as large as 100 feet on each side. The spell lasts for the duration or until you use an action to dismiss it. When you cast the spell, you decide what sort of security the spell provides, choosing any or all of the following properties: - Sound can''t pass through the barrier at the edge of the warded area. - The barrier of the warded area appears dark and foggy, preventing vision (including darkvision) through it. - Sensors created by divination spells can''t appear inside the protected area or pass through the barrier at its perimeter. - Creatures in the area can''t be targeted by divination spells. - Nothing can teleport into or out of the warded area. - Planar travel is blocked within the warded area. Casting this spell on the same spot every day for a year makes this effect permanent.', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'produce-flame', 'Produce Flame', 0, 'conjuration',
  '1 action', 'Self', 'V, S', '10 minutes',
  'A flickering flame appears in your hand. The flame remains there for the duration and harms neither you nor your equipment. The flame sheds bright light in a 10-foot radius and dim light for an additional 10 feet. The spell ends if you dismiss it as an action or if you cast it again. You can also attack with the flame, although doing so ends the spell. When you cast this spell, or as an action on a later turn, you can hurl the flame at a creature within 30 feet of you. Make a ranged spell attack. On a hit, the target takes 1d8 fire damage. This spell''s damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).', '1d8', 'fire', '', '',
  '["druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'programmed-illusion', 'Programmed Illusion', 6, 'illusion',
  '1 action', '120 feet', 'V, S, M', 'Until dispelled',
  'You create an illusion of an object, a creature, or some other visible phenomenon within range that activates when a specific condition occurs. The illusion is imperceptible until then. It must be no larger than a 30-foot cube, and you decide when you cast the spell how the illusion behaves and what sounds it makes. This scripted performance can last up to 5 minutes. When the condition you specify occurs, the illusion springs into existence and performs in the manner you described. Once the illusion finishes performing, it disappears and remains dormant for 10 minutes. After this time, the illusion can be activated again. The triggering condition can be as general or as detailed as you like, though it must be based on visual or audible conditions that occur within 30 feet of the area. For example, you could create an illusion of yourself to appear and warn off others who attempt to open a trapped door, or you could set the illusion to trigger only when a creature says the correct word ', '', '', '', '',
  '["bard","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'project-image', 'Project Image', 7, 'illusion',
  '1 action', '500 miles', 'V, S, M', 'Up to 24 hours',
  'You create an illusory copy of yourself that lasts for the duration. The copy can appear at any location within range that you have seen before, regardless of intervening obstacles. The illusion looks and sounds like you but is intangible. If the illusion takes any damage, it disappears, and the spell ends. You can use your action to move this illusion up to twice your speed, and make it gesture, speak, and behave in whatever way you choose. It mimics your mannerisms perfectly. You can see through its eyes and hear through its ears as if you were in its space. On your turn as a bonus action, you can switch from using its senses to using your own, or back again. While you are using its senses, you are blinded and deafened in regard to your own surroundings. Physical interaction with the image reveals it to be an illusion, because things can pass through it. A creature that uses its action to examine the image can determine that it is an illusion with a successful Intelligence (Investiga', '', '', '', '',
  '["bard","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'protection-from-energy', 'Protection From Energy', 3, 'abjuration',
  '1 action', 'Touch', 'V, S', 'Up to 1 hour',
  'For the duration, the willing creature you touch has resistance to one damage type of your choice: acid, cold, fire, lightning, or thunder.', '', '', '', '',
  '["cleric","druid","ranger","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'protection-from-evil-and-good', 'Protection from Evil and Good', 1, 'abjuration',
  '1 action', 'Touch', 'V, S, M', 'Up to 10 minutes',
  'Until the spell ends, one willing creature you touch is protected against certain types of creatures: aberrations, celestials, elementals, fey, fiends, and undead. The protection grants several benefits. Creatures of those types have disadvantage on attack rolls against the target. The target also can''t be charmed, frightened, or possessed by them. If the target is already charmed, frightened, or possessed by such a creature, the target has advantage on any new saving throw against the relevant effect.', '', '', '', '',
  '["cleric","paladin","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'protection-from-poison', 'Protection from Poison', 2, 'abjuration',
  '1 action', 'Touch', 'V, S', '1 hour',
  'You touch a creature. If it is poisoned, you neutralize the poison. If more than one poison afflicts the target, you neutralize one poison that you know is present, or you neutralize one at random. For the duration, the target has advantage on saving throws against being poisoned, and it has resistance to poison damage.', '', '', '', '',
  '["cleric","druid","paladin","ranger"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'purify-food-and-drink', 'Purify Food and Drink', 1, 'transmutation',
  '1 action', '10 feet', 'V, S', 'Instantaneous',
  'All nonmagical food and drink within a 5-foot radius sphere centered on a point of your choice within range is purified and rendered free of poison and disease.', '', '', '', '',
  '["cleric","druid","paladin"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'raise-dead', 'Raise Dead', 5, 'necromancy',
  '1 hour', 'Touch', 'V, S, M', 'Instantaneous',
  'You return a dead creature you touch to life, provided that it has been dead no longer than 10 days. If the creature''s soul is both willing and at liberty to rejoin the body, the creature returns to life with 1 hit point. This spell also neutralizes any poisons and cures nonmagical diseases that affected the creature at the time it died. This spell doesn''t, however, remove magical diseases, curses, or similar effects; if these aren''t first removed prior to casting the spell, they take effect when the creature returns to life. The spell can''t return an undead creature to life. This spell closes all mortal wounds, but it doesn''t restore missing body parts. If the creature is lacking body parts or organs integral for its survival--its head, for instance--the spell automatically fails. Coming back from the dead is an ordeal. The target takes a -4 penalty to all attack rolls, saving throws, and ability checks. Every time the target finishes a long rest, the penalty is reduced by 1 until it ', '', '', '', '',
  '["bard","cleric","paladin"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'ray-of-enfeeblement', 'Ray of Enfeeblement', 2, 'necromancy',
  '1 action', '60 feet', 'V, S', 'Up to 1 minute',
  'A black beam of enervating energy springs from your finger toward a creature within range. Make a ranged spell attack against the target. On a hit, the target deals only half damage with weapon attacks that use Strength until the spell ends. At the end of each of the target''s turns, it can make a constitution saving throw against the spell. On a success, the spell ends.', '', '', 'CON', '',
  '["warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'ray-of-frost', 'Ray of Frost', 0, 'evocation',
  '1 action', '60 feet', 'V, S', 'Instantaneous',
  'A frigid beam of blue-white light streaks toward a creature within range. Make a ranged spell attack against the target. On a hit, it takes 1d8 cold damage, and its speed is reduced by 10 feet until the start of your next turn. The spell''s damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).', '1d8', 'cold', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'regenerate', 'Regenerate', 7, 'transmutation',
  '1 minute', 'Touch', 'V, S, M', '1 hour',
  'You touch a creature and stimulate its natural healing ability. The target regains 4d8 + 15 hit points. For the duration of the spell, the target regains 1 hit point at the start of each of its turns (10 hit points each minute). The target''s severed body members (fingers, legs, tails, and so on), if any, are restored after 2 minutes. If you have the severed part and hold it to the stump, the spell instantaneously causes the limb to knit to the stump.', '', '', '', '4d8 + 15',
  '["bard","cleric","druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'reincarnate', 'Reincarnate', 5, 'transmutation',
  '1 hour', 'Touch', 'V, S, M', 'Instantaneous',
  'You touch a dead humanoid or a piece of a dead humanoid. Provided that the creature has been dead no longer than 10 days, the spell forms a new adult body for it and then calls the soul to enter that body. If the target''s soul isn''t free or willing to do so, the spell fails. The magic fashions a new body for the creature to inhabit, which likely causes the creature''s race to change. The GM rolls a d 100 and consults the following table to determine what form the creature takes when restored to life, or the GM chooses a form. | d100 | Race | |---|---| | 01-04 | Dragonborn | | 05-13 | Dwarf, hill | | 14-21 | Dwarf, mountain | | 22-25 | Elf, dark | | 26-34 | Elf, high | | 35-42 | Elf, wood | | 43-46 | Gnome, forest | | 47-52 | Gnome, rock | | 53-56 | Half-elf | | 57-60 | Half-orc | | 61-68 | Halfling, lightfoot | | 69-76 | Halfling, stout | | 77-96 | Human | | 97-00 | Tiefling | The reincarnated creature recalls its former life and experiences. It retains the capabilities it had in its or', '', '', '', '',
  '["druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'remove-curse', 'Remove Curse', 3, 'abjuration',
  '1 action', 'Touch', 'V, S', 'Instantaneous',
  'At your touch, all curses affecting one creature or object end. If the object is a cursed magic item, its curse remains, but the spell breaks its owner''s attunement to the object so it can be removed or discarded.', '', '', '', '',
  '["cleric","paladin","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'resilient-sphere', 'Resilient Sphere', 4, 'evocation',
  '1 action', '30 feet', 'V, S, M', 'Up to 1 minute',
  'A sphere of shimmering force encloses a creature or object of Large size or smaller within range. An unwilling creature must make a dexterity saving throw. On a failed save, the creature is enclosed for the duration. Nothing--not physical objects, energy, or other spell effects--can pass through the barrier, in or out, though a creature in the sphere can breathe there. The sphere is immune to all damage, and a creature or object inside can''t be damaged by attacks or effects originating from outside, nor can a creature inside the sphere damage anything outside it. The sphere is weightless and just large enough to contain the creature or object inside. An enclosed creature can use its action to push against the sphere''s walls and thus roll the sphere at up to half the creature''s speed. Similarly, the globe can be picked up and moved by other creatures. A disintegrate spell targeting the globe destroys it without harming anything inside it.', '', '', 'DEX', '',
  '["wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'resistance', 'Resistance', 0, 'abjuration',
  '1 action', 'Touch', 'V, S, M', 'Up to 1 minute',
  'You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one saving throw of its choice. It can roll the die before or after making the saving throw. The spell then ends.', '', '', '', '',
  '["cleric","druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'resurrection', 'Resurrection', 7, 'necromancy',
  '1 hour', 'Touch', 'V, S, M', 'Instantaneous',
  'You touch a dead creature that has been dead for no more than a century, that didn''t die of old age, and that isn''t undead. If its soul is free and willing, the target returns to life with all its hit points. This spell neutralizes any poisons and cures normal diseases afflicting the creature when it died. It doesn''t, however, remove magical diseases, curses, and the like; if such effects aren''t removed prior to casting the spell, they afflict the target on its return to life. This spell closes all mortal wounds and restores any missing body parts. Coming back from the dead is an ordeal. The target takes a -4 penalty to all attack rolls, saving throws, and ability checks. Every time the target finishes a long rest, the penalty is reduced by 1 until it disappears. Casting this spell to restore life to a creature that has been dead for one year or longer taxes you greatly. Until you finish a long rest, you can''t cast spells again, and you have disadvantage on all attack rolls, ability ch', '', '', '', '',
  '["bard","cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'reverse-gravity', 'Reverse Gravity', 7, 'transmutation',
  '1 action', '100 feet', 'V, S, M', 'Up to 1 minute',
  'This spell reverses gravity in a 50-foot-radius, 100-foot high cylinder centered on a point within range. All creatures and objects that aren''t somehow anchored to the ground in the area fall upward and reach the top of the area when you cast this spell. A creature can make a dexterity saving throw to grab onto a fixed object it can reach, thus avoiding the fall. If some solid object (such as a ceiling) is encountered in this fall, falling objects and creatures strike it just as they would during a normal downward fall. If an object or creature reaches the top of the area without striking anything, it remains there, oscillating slightly, for the duration. At the end of the duration, affected objects and creatures fall back down.', '', '', 'DEX', '',
  '["druid","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'revivify', 'Revivify', 3, 'conjuration',
  '1 action', 'Touch', 'V, S, M', 'Instantaneous',
  'You touch a creature that has died within the last minute. That creature returns to life with 1 hit point. This spell can''t return to life a creature that has died of old age, nor can it restore any missing body parts.', '', '', '', '',
  '["cleric","paladin"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'rope-trick', 'Rope Trick', 2, 'transmutation',
  '1 action', 'Touch', 'V, S, M', '1 hour',
  'You touch a length of rope that is up to 60 feet long. One end of the rope then rises into the air until the whole rope hangs perpendicular to the ground. At the upper end of the rope, an invisible entrance opens to an extradimensional space that lasts until the spell ends. The extradimensional space can be reached by climbing to the top of the rope. The space can hold as many as eight Medium or smaller creatures. The rope can be pulled into the space, making the rope disappear from view outside the space. Attacks and spells can''t cross through the entrance into or out of the extradimensional space, but those inside can see out of it as if through a 3-foot-by-5-foot window centered on the rope. Anything inside the extradimensional space drops out when the spell ends.', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'sacred-flame', 'Sacred Flame', 0, 'evocation',
  '1 action', '60 feet', 'V, S', 'Instantaneous',
  'Flame-like radiance descends on a creature that you can see within range. The target must succeed on a dexterity saving throw or take 1d8 radiant damage. The target gains no benefit from cover for this saving throw. The spell''s damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).', '1d8', 'radiant', 'DEX', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'sanctuary', 'Sanctuary', 1, 'abjuration',
  '1 bonus action', '30 feet', 'V, S, M', '1 minute',
  'You ward a creature within range against attack. Until the spell ends, any creature who targets the warded creature with an attack or a harmful spell must first make a wisdom saving throw. On a failed save, the creature must choose a new target or lose the attack or spell. This spell doesn''t protect the warded creature from area effects, such as the explosion of a fireball. If the warded creature makes an attack or casts a spell that affects an enemy creature, this spell ends.', '', '', '', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'scorching-ray', 'Scorching Ray', 2, 'evocation',
  '1 action', '120 feet', 'V, S', 'Instantaneous',
  'You create three rays of fire and hurl them at targets within range. You can hurl them at one target or several. Make a ranged spell attack for each ray. On a hit, the target takes 2d6 fire damage.', '2d6', 'fire', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'scrying', 'Scrying', 5, 'divination',
  '10 minutes', 'Self', 'V, S, M', 'Up to 10 minutes',
  'You can see and hear a particular creature you choose that is on the same plane of existence as you. The target must make a wisdom saving throw, which is modified by how well you know the target and the sort of physical connection you have to it. If a target knows you''re casting this spell, it can fail the saving throw voluntarily if it wants to be observed. | Knowledge | Save Modifier | |---|---| | Secondhand (you have heard of the target) | +5 | | Firsthand (you have met the target) | +0 | | Familiar (you know the target well) | -5 |  | Connection | Save Modifier | |---|---| | Likeness or picture | -2 | | Possession or garment | -4 | | Body part, lock of hair, bit of nail, or the like | -10 | On a successful save, the target isn''t affected, and you can''t use this spell against it again for 24 hours. On a failed save, the spell creates an invisible sensor within 10 feet of the target. You can see and hear through the sensor as if you were there. The sensor moves with the target, remai', '', '', 'WIS', '',
  '["bard","cleric","druid","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'secret-chest', 'Secret Chest', 4, 'conjuration',
  '1 action', 'Touch', 'V, S, M', 'Instantaneous',
  'You hide a chest, and all its contents, on the Ethereal Plane. You must touch the chest and the miniature replica that serves as a material component for the spell. The chest can contain up to 12 cubic feet of nonliving material (3 feet by 2 feet by 2 feet). While the chest remains on the Ethereal Plane, you can use an action and touch the replica to recall the chest. It appears in an unoccupied space on the ground within 5 feet of you. You can send the chest back to the Ethereal Plane by using an action and touching both the chest and the replica. After 60 days, there is a cumulative 5 percent chance per day that the spell''s effect ends. This effect ends if you cast this spell again, if the smaller replica chest is destroyed, or if you choose to end the spell as an action. If the spell ends and the larger chest is on the Ethereal Plane, it is irretrievably lost.', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'see-invisibility', 'See Invisibility', 2, 'divination',
  '1 action', 'Self', 'V, S, M', '1 hour',
  'For the duration of the spell, you see invisible creatures and objects as if they were visible, and you can see through Ethereal. The ethereal objects and creatures appear ghostly translucent.', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'seeming', 'Seeming', 5, 'illusion',
  '1 action', '30 feet', 'V, S', '8 hours',
  'This spell allows you to change the appearance of any number of creatures that you can see within range. You give each target you choose a new, illusory appearance. An unwilling target can make a charisma saving throw, and if it succeeds, it is unaffected by this spell. The spell disguises physical appearance as well as clothing, armor, weapons, and equipment. You can make each creature seem 1 foot shorter or taller and appear thin, fat, or in between. You can''t change a target''s body type, so you must choose a form that has the same basic arrangement of limbs. Otherwise, the extent of the illusion is up to you. The spell lasts for the duration, unless you use your action to dismiss it sooner. The changes wrought by this spell fail to hold up to physical inspection. For example, if you use this spell to add a hat to a creature''s outfit, objects pass through the hat, and anyone who touches it would feel nothing or would feel the creature''s head and hair. If you use this spell to appear ', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'sending', 'Sending', 3, 'evocation',
  '1 action', 'Unlimited', 'V, S, M', '1 round',
  'You send a short message of twenty-five words or less to a creature with which you are familiar. The creature hears the message in its mind, recognizes you as the sender if it knows you, and can answer in a like manner immediately. The spell enables creatures with Intelligence scores of at least 1 to understand the meaning of your message. You can send the message across any distance and even to other planes of existence, but if the target is on a different plane than you, there is a 5 percent chance that the message doesn''t arrive.', '', '', '', '',
  '["bard","cleric","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'sequester', 'Sequester', 7, 'transmutation',
  '1 action', 'Touch', 'V, S, M', 'Until dispelled',
  'By means of this spell, a willing creature or an object can be hidden away, safe from detection for the duration. When you cast the spell and touch the target, it becomes invisible and can''t be targeted by divination spells or perceived through scrying sensors created by divination spells. If the target is a creature, it falls into a state of suspended animation. Time ceases to flow for it, and it doesn''t grow older. You can set a condition for the spell to end early. The condition can be anything you choose, but it must occur or be visible within 1 mile of the target. Examples include "after 1,000 years" or "when the tarrasque awakens." This spell also ends if the target takes any damage.', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'shapechange', 'Shapechange', 9, 'transmutation',
  '1 action', 'Self', 'V, S, M', 'Up to 1 hour',
  'You assume the form of a different creature for the duration. The new form can be of any creature with a challenge rating equal to your level or lower. The creature can''t be a construct or an undead, and you must have seen the sort of creature at least once. You transform into an average example of that creature, one without any class levels or the Spellcasting trait. Your game statistics are replaced by the statistics of the chosen creature, though you retain your alignment and Intelligence, Wisdom, and Charisma scores. You also retain all of your skill and saving throw proficiencies, in addition to gaining those of the creature. If the creature has the same proficiency as you and the bonus listed in its statistics is higher than yours, use the creature''s bonus in place of yours. You can''t use any legendary actions or lair actions of the new form. You assume the hit points and Hit Dice of the new form. When you revert to your normal form, you return to the number of hit points you had', '', '', '', '',
  '["druid","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'shatter', 'Shatter', 2, 'evocation',
  '1 action', '60 feet', 'V, S, M', 'Instantaneous',
  'A sudden loud ringing noise, painfully intense, erupts from a point of your choice within range. Each creature in a 10-foot-radius sphere centered on that point must make a Constitution saving throw. A creature takes 3d8 thunder damage on a failed save, or half as much damage on a successful one. A creature made of inorganic material such as stone, crystal, or metal has disadvantage on this saving throw. A non-magical item that is not worn or carried also suffers damage if it is in the area of the spell.', '3d8', 'thunder', 'CON', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'shield', 'Shield', 1, 'abjuration',
  '1 reaction', 'Self', 'V, S', '1 round',
  'An invisible barrier of magical force appears and protects you. Until the start of your next turn, you have a +5 bonus to AC, including against the triggering attack, and you take no damage from magic missile.', '', '', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'shield-of-faith', 'Shield of Faith', 1, 'abjuration',
  '1 bonus action', '60 feet', 'V, S, M', 'Up to 10 minutes',
  'A shimmering field appears and surrounds a creature of your choice within range, granting it a +2 bonus to AC for the duration.', '', '', '', '',
  '["cleric","paladin"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'shillelagh', 'Shillelagh', 0, 'transmutation',
  '1 bonus action', 'Touch', 'V, S, M', '1 minute',
  'The wood of a club or a quarterstaff you are holding is imbued with nature''s power. For the duration, you can use your spellcasting ability instead of Strength for the attack and damage rolls of melee attacks using that weapon, and the weapon''s damage die becomes a d8. The weapon also becomes magical, if it isn''t already. The spell ends if you cast it again or if you let go of the weapon.', '', '', '', '',
  '["druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'shocking-grasp', 'Shocking Grasp', 0, 'evocation',
  '1 action', 'Touch', 'V, S', 'Instantaneous',
  'Lightning springs from your hand to deliver a shock to a creature you try to touch. Make a melee spell attack against the target. You have advantage on the attack roll if the target is wearing armor made of metal. On a hit, the target takes 1d8 lightning damage, and it can''t take reactions until the start of its next turn. The spell''s damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).', '1d8', 'lightning', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'silence', 'Silence', 2, 'illusion',
  '1 action', '120 feet', 'V, S', 'Up to 10 minutes',
  'For the duration, no sound can be created within or pass through a 20-foot-radius sphere centered on a point you choose within range. Any creature or object entirely inside the sphere is immune to thunder damage, and creatures are deafened while entirely inside it. Casting a spell that includes a verbal component is impossible there.', '', '', '', '',
  '["bard","cleric","ranger"]',
  true, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'silent-image', 'Silent Image', 1, 'illusion',
  '1 action', '60 feet', 'V, S, M', 'Up to 10 minutes',
  'You create the image of an object, a creature, or some other visible phenomenon that is no larger than a 15-foot cube. The image appears at a spot within range and lasts for the duration. The image is purely visual; it isn''t accompanied by sound, smell, or other sensory effects. You can use your action to cause the image to move to any spot within range. As the image changes location, you can alter its appearance so that its movements appear natural for the image. For example, if you create an image of a creature and move it, you can alter the image so that it appears to be walking. Physical interaction with the image reveals it to be an illusion, because things can pass through it. A creature that uses its action to examine the image can determine that it is an illusion with a successful Intelligence (Investigation) check against your spell save DC. If a creature discerns the illusion for what it is, the creature can see through the image.', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'simulacrum', 'Simulacrum', 7, 'illusion',
  '12 hours', 'Touch', 'V, S, M', 'Until dispelled',
  'You shape an illusory duplicate of one beast or humanoid that is within range for the entire casting time of the spell. The duplicate is a creature, partially real and formed from ice or snow, and it can take actions and otherwise be affected as a normal creature. It appears to be the same as the original, but it has half the creature''s hit point maximum and is formed without any equipment. Otherwise, the illusion uses all the statistics of the creature it duplicates. The simulacrum is friendly to you and creatures you designate. It obeys your spoken commands, moving and acting in accordance with your wishes and acting on your turn in combat. The simulacrum lacks the ability to learn or become more powerful, so it never increases its level or other abilities, nor can it regain expended spell slots. If the simulacrum is damaged, you can repair it in an alchemical laboratory, using rare herbs and minerals worth 100 gp per hit point it regains. The simulacrum lasts until it drops to 0 hit', '', '', '', '',
  '["wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'sleep', 'Sleep', 1, 'enchantment',
  '1 action', '90 feet', 'V, S, M', '1 minute',
  'This spell sends creatures into a magical slumber. Roll 5d8; the total is how many hit points of creatures this spell can affect. Creatures within 20 feet of a point you choose within range are affected in ascending order of their current hit points (ignoring unconscious creatures). Starting with the creature that has the lowest current hit points, each creature affected by this spell falls unconscious until the spell ends, the sleeper takes damage, or someone uses an action to shake or slap the sleeper awake. Subtract each creature''s hit points from the total before moving on to the creature with the next lowest hit points. A creature''s hit points must be equal to or less than the remaining total for that creature to be affected. Undead and creatures immune to being charmed aren''t affected by this spell.', '5d8', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'sleet-storm', 'Sleet Storm', 3, 'conjuration',
  '1 action', '150 feet', 'V, S, M', 'Up to 1 minute',
  'Until the spell ends, freezing rain and sleet fall in a 20-foot-tall cylinder with a 40-foot radius centered on a point you choose within range. The area is heavily obscured, and exposed flames in the area are doused. The ground in the area is covered with slick ice, making it difficult terrain. When a creature enters the spell''s area for the first time on a turn or starts its turn there, it must make a dexterity saving throw. On a failed save, it falls prone. If a creature is concentrating in the spell''s area, the creature must make a successful constitution saving throw against your spell save DC or lose concentration.', '', '', '', '',
  '["druid","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'slow', 'Slow', 3, 'transmutation',
  '1 action', '120 feet', 'V, S, M', 'Up to 1 minute',
  'You alter time around up to six creatures of your choice in a 40-foot cube within range. Each target must succeed on a wisdom saving throw or be affected by this spell for the duration. An affected target''s speed is halved, it takes a -2 penalty to AC and dexterity saving throws, and it can''t use reactions. On its turn, it can use either an action or a bonus action, not both. Regardless of the creature''s abilities or magic items, it can''t make more than one melee or ranged attack during its turn. If the creature attempts to cast a spell with a casting time of 1 action, roll a d20. On an 11 or higher, the spell doesn''t take effect until the creature''s next turn, and the creature must use its action on that turn to complete the spell. If it can''t, the spell is wasted. A creature affected by this spell makes another wisdom saving throw at the end of its turn. On a successful save, the effect ends for it.', '', '', 'WIS', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'spare-the-dying', 'Spare the Dying', 0, 'necromancy',
  '1 action', 'Touch', 'V, S', 'Instantaneous',
  'You touch a living creature that has 0 hit points. The creature becomes stable. This spell has no effect on undead or constructs.', '', '', '', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'speak-with-animals', 'Speak with Animals', 1, 'divination',
  '1 action', 'Self', 'V, S', '10 minutes',
  'You gain the ability to comprehend and verbally communicate with beasts for the duration. The knowledge and awareness of many beasts is limited by their intelligence, but at a minimum, beasts can give you information about nearby locations and monsters, including whatever they can perceive or have perceived within the past day. You might be able to persuade a beast to perform a small favor for you, at the GM''s discretion.', '', '', '', '',
  '["bard","druid","ranger"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'speak-with-dead', 'Speak with Dead', 3, 'necromancy',
  '1 action', '10 feet', 'V, S, M', '10 minutes',
  'You grant the semblance of life and intelligence to a corpse of your choice within range, allowing it to answer the questions you pose. The corpse must still have a mouth and can''t be undead. The spell fails if the corpse was the target of this spell within the last 10 days. Until the spell ends, you can ask the corpse up to five questions. The corpse knows only what it knew in life, including the languages it knew. Answers are usually brief, cryptic, or repetitive, and the corpse is under no compulsion to offer a truthful answer if you are hostile to it or it recognizes you as an enemy. This spell doesn''t return the creature''s soul to its body, only its animating spirit. Thus, the corpse can''t learn new information, doesn''t comprehend anything that has happened since it died, and can''t speculate about future events.', '', '', '', '',
  '["bard","cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'speak-with-plants', 'Speak with Plants', 3, 'transmutation',
  '1 action', 'Self', 'V, S', '10 minutes',
  'You imbue plants within 30 feet of you with limited sentience and animation, giving them the ability to communicate with you and follow your simple commands. You can question plants about events in the spell''s area within the past day, gaining information about creatures that have passed, weather, and other circumstances. You can also turn difficult terrain caused by plant growth (such as thickets and undergrowth) into ordinary terrain that lasts for the duration. Or you can turn ordinary terrain where plants are present into difficult terrain that lasts for the duration, causing vines and branches to hinder pursuers, for example. Plants might be able to perform other tasks on your behalf, at the GM''s discretion. The spell doesn''t enable plants to uproot themselves and move about, but they can freely move branches, tendrils, and stalks. If a plant creature is in the area, you can communicate with it as if you shared a common language, but you gain no magical ability to influence it. Th', '', '', '', '',
  '["bard","druid","ranger"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'spider-climb', 'Spider Climb', 2, 'transmutation',
  '1 action', 'Touch', 'V, S, M', 'Up to 1 hour',
  'Until the spell ends, one willing creature you touch gains the ability to move up, down, and across vertical surfaces and upside down along ceilings, while leaving its hands free. The target also gains a climbing speed equal to its walking speed.', '', '', '', '',
  '["sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'spike-growth', 'Spike Growth', 2, 'transmutation',
  '1 action', '150 feet', 'V, S, M', 'Up to 10 minutes',
  'The ground in a 20-foot radius centered on a point within range twists and sprouts hard spikes and thorns. The area becomes difficult terrain for the duration. When a creature moves into or within the area, it takes 2d4 piercing damage for every 5 feet it travels. The transformation of the ground is camouflaged to look natural. Any creature that can''t see the area at the time the spell is cast can make a Wisdom (Perception) check against your spell save DC to recognize the terrain as hazardous before entering it.', '', '', '', '',
  '["druid","ranger"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'spirit-guardians', 'Spirit Guardians', 3, 'conjuration',
  '1 action', 'Self', 'V, S, M', 'Up to 10 minutes',
  'You call forth spirits to protect you. They flit around you to a distance of 15 feet for the duration. If you are good or neutral, their spectral form appears angelic or fey (your choice). If you are evil, they appear fiendish. When you cast this spell, you can designate any number of creatures you can see to be unaffected by it. An affected creature''s speed is halved in the area, and when the creature enters the area for the first time on a turn or starts its turn there, it must make a wisdom saving throw. On a failed save, the creature takes 3d8 radiant damage (if you are good or neutral) or 3d8 necrotic damage (if you are evil). On a successful save, the creature takes half as much damage.', '', '', '', '',
  '["cleric"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'spiritual-weapon', 'Spiritual Weapon', 2, 'evocation',
  '1 bonus action', '60 feet', 'V, S', '1 minute',
  'You create a floating, spectral weapon within range that lasts for the duration or until you cast this spell again. When you cast the spell, you can make a melee spell attack against a creature within 5 feet of the weapon. On a hit, the target takes force damage equal to 1d8 + your spellcasting ability modifier. As a bonus action on your turn, you can move the weapon up to 20 feet and repeat the attack against a creature within 5 feet of it. The weapon can take whatever form you choose. Clerics of deities who are associated with a particular weapon (as St. Cuthbert is known for his mace and Thor for his hammer) make this spell''s effect resemble that weapon.', '1d8 + MOD', 'force', '', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'stinking-cloud', 'Stinking Cloud', 3, 'conjuration',
  '1 action', '90 feet', 'V, S, M', 'Up to 1 minute',
  'You create a 20-foot-radius sphere of yellow, nauseating gas centered on a point within range. The cloud spreads around corners, and its area is heavily obscured. The cloud lingers in the air for the duration. Each creature that is completely within the cloud at the start of its turn must make a constitution saving throw against poison. On a failed save, the creature spends its action that turn retching and reeling. Creatures that don''t need to breathe or are immune to poison automatically succeed on this saving throw. A moderate wind (at least 10 miles per hour) disperses the cloud after 4 rounds. A strong wind (at least 20 miles per hour) disperses it after 1 round.', '', '', 'CON', '',
  '["bard","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'stone-shape', 'Stone Shape', 4, 'transmutation',
  '1 action', 'Touch', 'V, S, M', 'Instantaneous',
  'You touch a stone object of Medium size or smaller or a section of stone no more than 5 feet in any dimension and form it into any shape that suits your purpose. So, for example, you could shape a large rock into a weapon, idol, or coffer, or make a small passage through a wall, as long as the wall is less than 5 feet thick. You could also shape a stone door or its frame to seal the door shut. The object you create can have up to two hinges and a latch, but finer mechanical detail isn''t possible.', '', '', '', '',
  '["cleric","druid","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'stoneskin', 'Stoneskin', 4, 'abjuration',
  '1 action', 'Touch', 'V, S, M', 'Up to 1 hour',
  'This spell turns the flesh of a willing creature you touch as hard as stone. Until the spell ends, the target has resistance to nonmagical bludgeoning, piercing, and slashing damage.', '', '', '', '',
  '["druid","ranger","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'storm-of-vengeance', 'Storm of Vengeance', 9, 'conjuration',
  '1 action', 'Sight', 'V, S', 'Up to 1 minute',
  'A churning storm cloud forms, centered on a point you can see and spreading to a radius of 360 feet. Lightning flashes in the area, thunder booms, and strong winds roar. Each creature under the cloud (no more than 5,000 feet beneath the cloud) when it appears must make a constitution saving throw. On a failed save, a creature takes 2d6 thunder damage and becomes deafened for 5 minutes. Each round you maintain concentration on this spell, the storm produces additional effects on your turn. ***Round 2.*** Acidic rain falls from the cloud. Each creature and object under the cloud takes 1d6 acid damage. ***Round 3.*** You call six bolts of lightning from the cloud to strike six creatures or objects of your choice beneath the cloud. A given creature or object can''t be struck by more than one bolt. A struck creature must make a dexterity saving throw. The creature takes 10d6 lightning damage on a failed save, or half as much damage on a successful one. ***Round 4.*** Hailstones rain down fro', '2d6', 'thunder', 'CON', '',
  '["druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'suggestion', 'Suggestion', 2, 'enchantment',
  '1 action', '30 feet', 'V, M', 'Up to 8 hours',
  'You suggest a course of activity (limited to a sentence or two) and magically influence a creature you can see within range that can hear and understand you. Creatures that can''t be charmed are immune to this effect. The suggestion must be worded in such a manner as to make the course of action sound reasonable. Asking the creature to stab itself, throw itself onto a spear, immolate itself, or do some other obviously harmful act ends the spell. The target must make a wisdom saving throw. On a failed save, it pursues the course of action you described to the best of its ability. The suggested course of action can continue for the entire duration. If the suggested activity can be completed in a shorter time, the spell ends when the subject finishes what it was asked to do. You can also specify conditions that will trigger a special activity during the duration. For example, you might suggest that a knight give her warhorse to the first beggar she meets. If the condition isn''t met before ', '', '', 'WIS', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'sunbeam', 'Sunbeam', 6, 'evocation',
  '1 action', 'Self', 'V, S, M', 'Up to 1 minute',
  'A beam of brilliant light flashes out from your hand in a 5-foot-wide, 60-foot-long line. Each creature in the line must make a constitution saving throw. On a failed save, a creature takes 6d8 radiant damage and is blinded until your next turn. On a successful save, it takes half as much damage and isn''t blinded by this spell. Undead and oozes have disadvantage on this saving throw. You can create a new line of radiance as your action on any turn until the spell ends. For the duration, a mote of brilliant radiance shines in your hand. It sheds bright light in a 30-foot radius and dim light for an additional 30 feet. This light is sunlight.', '6d8', 'radiant', 'CON', '',
  '["druid","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'sunburst', 'Sunburst', 8, 'evocation',
  '1 action', '150 feet', 'V, S, M', 'Instantaneous',
  'Brilliant sunlight flashes in a 60-foot radius centered on a point you choose within range. Each creature in that light must make a constitution saving throw. On a failed save, a creature takes 12d6 radiant damage and is blinded for 1 minute. On a successful save, it takes half as much damage and isn''t blinded by this spell. Undead and oozes have disadvantage on this saving throw. A creature blinded by this spell makes another constitution saving throw at the end of each of its turns. On a successful save, it is no longer blinded. This spell dispels any darkness in its area that was created by a spell.', '12d6', 'radiant', 'CON', '',
  '["druid","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'symbol', 'Symbol', 7, 'abjuration',
  '1 minute', 'Touch', 'V, S, M', 'Until dispelled',
  'When you cast this spell, you inscribe a harmful glyph either on a surface (such as a section of floor, a wall, or a table) or within an object that can be closed to conceal the glyph (such as a book, a scroll, or a treasure chest). If you choose a surface, the glyph can cover an area of the surface no larger than 10 feet in diameter. If you choose an object, that object must remain in its place; if the object is moved more than 10 feet from where you cast this spell, the glyph is broken, and the spell ends without being triggered. The glyph is nearly invisible, requiring an Intelligence (Investigation) check against your spell save DC to find it. You decide what triggers the glyph when you cast the spell. For glyphs inscribed on a surface, the most typical triggers include touching or stepping on the glyph, removing another object covering it, approaching within a certain distance of it, or manipulating the object that holds it. For glyphs inscribed within an object, the most common t', '', '', '', '',
  '["bard","cleric","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'telekinesis', 'Telekinesis', 5, 'transmutation',
  '1 action', '60 feet', 'V, S', 'Up to 10 minutes',
  'You gain the ability to move or manipulate creatures or objects by thought. When you cast the spell, and as your action each round for the duration, you can exert your will on one creature or object that you can see within range, causing the appropriate effect below. You can affect the same target round after round, or choose a new one at any time. If you switch targets, the prior target is no longer affected by the spell. ***Creature.*** You can try to move a Huge or smaller creature. Make an ability check with your spellcasting ability contested by the creature''s Strength check. If you win the contest, you move the creature up to 30 feet in any direction, including upward but not beyond the range of this spell. Until the end of your next turn, the creature is restrained in your telekinetic grip. A creature lifted upward is suspended in mid-air. On subsequent rounds, you can use your action to attempt to maintain your telekinetic grip on the creature by repeating the contest. ***Objec', '', '', '', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'telepathic-bond', 'Telepathic Bond', 5, 'divination',
  '1 action', '30 feet', 'V, S, M', '1 hour',
  'You forge a telepathic link among up to eight willing creatures of your choice within range, psychically linking each creature to all the others for the duration. Creatures with Intelligence scores of 2 or less aren''t affected by this spell. Until the spell ends, the targets can communicate telepathically through the bond whether or not they have a common language. The communication is possible over any distance, though it can''t extend to other planes of existence.', '', '', '', '',
  '["wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'teleport', 'Teleport', 7, 'conjuration',
  '1 action', '10 feet', 'V', 'Instantaneous',
  'This spell instantly transports you and up to eight willing creatures of your choice that you can see within range, or a single object that you can see within range, to a destination you select. If you target an object, it must be able to fit entirely inside a 10-foot cube, and it can''t be held or carried by an unwilling creature. The destination you choose must be known to you, and it must be on the same plane of existence as you. Your familiarity with the destination determines whether you arrive there successfully. The GM rolls d100 and consults the table. | Familiarity | Mishap | Similar Area | Off Target | On Target | |---|---|---|---|---| | Permanent circle | -- | -- | -- | 01-100 | | Associated object | -- | -- | -- | 01-100 | | Very familiar | 01-05 | 06-13 | 14-24 | 25-100 | | Seen casually | 01-33 | 34-43 | 44-53 | 54-100 | | Viewed once | 01-43 | 44-53 | 54-73 | 74-100 | | Description | 01-43 | 44-53 | 54-73 | 74-100 | | False destination | 01-50 | 51-100 | -- | -- | ***Fami', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'teleportation-circle', 'Teleportation Circle', 5, 'conjuration',
  '1 minute', '10 feet', 'V, M', '1 round',
  'As you cast the spell, you draw a 10-foot-diameter circle on the ground inscribed with sigils that link your location to a permanent teleportation circle of your choice whose sigil sequence you know and that is on the same plane of existence as you. A shimmering portal opens within the circle you drew and remains open until the end of your next turn. Any creature that enters the portal instantly appears within 5 feet of the destination circle or in the nearest unoccupied space if that space is occupied. Many major temples, guilds, and other important places have permanent teleportation circles inscribed somewhere within their confines. Each such circle includes a unique sigil sequence--a string of magical runes arranged in a particular pattern. When you first gain the ability to cast this spell, you learn the sigil sequences for two destinations on the Material Plane, determined by the GM. You can learn additional sigil sequences during your adventures. You can commit a new sigil seque', '', '', '', '',
  '["bard","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'thaumaturgy', 'Thaumaturgy', 0, 'transmutation',
  '1 action', '30 feet', 'V', '1 minute',
  'You manifest a minor wonder, a sign of supernatural power, within range. You create one of the following magical effects within range. - Your voice booms up to three times as loud as normal for 1 minute. - You cause flames to flicker, brighten, dim, or change color for 1 minute. - You cause harmless tremors in the ground for 1 minute. - You create an instantaneous sound that originates from a point of your choice within range, such as a rumble of thunder, the cry of a raven, or ominous whispers. - You instantaneously cause an unlocked door or window to fly open or slam shut. - You alter the appearance of your eyes for 1 minute. If you cast this spell multiple times, you can have up to three of its 1-minute effects active at a time, and you can dismiss such an effect as an action.', '', '', '', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'thunderwave', 'Thunderwave', 1, 'evocation',
  '1 action', 'Self', 'V, S', 'Instantaneous',
  'A wave of thunderous force sweeps out from you. Each creature in a 15-foot cube originating from you must make a constitution saving throw. On a failed save, a creature takes 2d8 thunder damage and is pushed 10 feet away from you. On a successful save, the creature takes half as much damage and isn''t pushed. In addition, unsecured objects that are completely within the area of effect are automatically pushed 10 feet away from you by the spell''s effect, and the spell emits a thunderous boom audible out to 300 feet.', '2d8', 'thunder', 'CON', '',
  '["bard","druid","sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'time-stop', 'Time Stop', 9, 'transmutation',
  '1 action', 'Self', 'V', 'Instantaneous',
  'You briefly stop the flow of time for everyone but yourself. No time passes for other creatures, while you take 1d4 + 1 turns in a row, during which you can use actions and move as normal. This spell ends if one of the actions you use during this period, or any effects that you create during this period, affects a creature other than you or an object being worn or carried by someone other than you. In addition, the spell ends if you move to a place more than 1,000 feet from the location where you cast it.', '', '', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'tiny-hut', 'Tiny Hut', 3, 'evocation',
  '1 minute', 'Self', 'V, S, M', '8 hours',
  'A 10-foot-radius immobile dome of force springs into existence around and above you and remains stationary for the duration. The spell ends if you leave its area. Nine creatures of Medium size or smaller can fit inside the dome with you. The spell fails if its area includes a larger creature or more than nine creatures. Creatures and objects within the dome when you cast this spell can move through it freely. All other creatures and objects are barred from passing through it. Spells and other magical effects can''t extend through the dome or be cast through it. The atmosphere inside the space is comfortable and dry, regardless of the weather outside. Until the spell ends, you can command the interior to become dimly lit or dark. The dome is opaque from the outside, of any color you choose, but it is transparent from the inside.', '', '', '', '',
  '["bard","wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'tongues', 'Tongues', 3, 'divination',
  '1 action', 'Touch', 'V, M', '1 hour',
  'This spell grants the creature you touch the ability to understand any spoken language it hears. Moreover, when the target speaks, any creature that knows at least one language and can hear the target understands what it says.', '', '', '', '',
  '["bard","cleric","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'transport-via-plants', 'Transport via Plants', 6, 'conjuration',
  '1 action', '10 feet', 'V, S', '1 round',
  'This spell creates a magical link between a Large or larger inanimate plant within range and another plant, at any distance, on the same plane of existence. You must have seen or touched the destination plant at least once before. For the duration, any creature can step into the target plant and exit from the destination plant by using 5 feet of movement.', '', '', '', '',
  '["druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'tree-stride', 'Tree Stride', 5, 'conjuration',
  '1 action', 'Self', 'V, S', 'Up to 1 minute',
  'You gain the ability to enter a tree and move from inside it to inside another tree of the same kind within 500 feet. Both trees must be living and at least the same size as you. You must use 5 feet of movement to enter a tree. You instantly know the location of all other trees of the same kind within 500 feet and, as part of the move used to enter the tree, can either pass into one of those trees or step out of the tree you''re in. You appear in a spot of your choice within 5 feet of the destination tree, using another 5 feet of movement. If you have no movement left, you appear within 5 feet of the tree you entered. You can use this transportation ability once per round for the duration. You must end each turn outside a tree.', '', '', '', '',
  '["druid","ranger"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'true-polymorph', 'True Polymorph', 9, 'transmutation',
  '1 action', '30 feet', 'V, S, M', 'Up to 1 hour',
  'Choose one creature or nonmagical object that you can see within range. You transform the creature into a different creature, the creature into an object, or the object into a creature (the object must be neither worn nor carried by another creature). The transformation lasts for the duration, or until the target drops to 0 hit points or dies. If you concentrate on this spell for the full duration, the transformation becomes permanent. Shapechangers aren''t affected by this spell. An unwilling creature can make a wisdom saving throw, and if it succeeds, it isn''t affected by this spell. ***Creature into Creature.*** If you turn a creature into another kind of creature, the new form can be any kind you choose whose challenge rating is equal to or less than the target''s (or its level, if the target doesn''t have a challenge rating). The target''s game statistics, including mental ability scores, are replaced by the statistics of the new form. It retains its alignment and personality. The tar', '', '', '', '',
  '["bard","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'true-resurrection', 'True Resurrection', 9, 'necromancy',
  '1 hour', 'Touch', 'V, S, M', 'Instantaneous',
  'You touch a creature that has been dead for no longer than 200 years and that died for any reason except old age. If the creature''s soul is free and willing, the creature is restored to life with all its hit points. This spell closes all wounds, neutralizes any poison, cures all diseases, and lifts any curses affecting the creature when it died. The spell replaces damaged or missing organs and limbs. The spell can even provide a new body if the original no longer exists, in which case you must speak the creature''s name. The creature then appears in an unoccupied space you choose within 10 feet of you.', '', '', '', '',
  '["cleric","druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'true-seeing', 'True Seeing', 6, 'divination',
  '1 action', 'Touch', 'V, S, M', '1 hour',
  'This spell gives the willing creature you touch the ability to see things as they actually are. For the duration, the creature has truesight, notices secret doors hidden by magic, and can see into the Ethereal Plane, all out to a range of 120 feet.', '', '', '', '',
  '["bard","cleric","sorcerer","warlock","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'true-strike', 'True Strike', 0, 'divination',
  '1 action', '30 feet', 'S', 'Up to 1 round',
  'You extend your hand and point a finger at a target in range. Your magic grants you a brief insight into the target''s defenses. On your next turn, you gain advantage on your first attack roll against the target, provided that this spell hasn''t ended.', '', '', '', '',
  '["bard","sorcerer","warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'unseen-servant', 'Unseen Servant', 1, 'conjuration',
  '1 action', '60 feet', 'V, S, M', '1 hour',
  'This spell creates an invisible, mindless, shapeless force that performs simple tasks at your command until the spell ends. The servant springs into existence in an unoccupied space on the ground within range. It has AC 10, 1 hit point, and a Strength of 2, and it can''t attack. If it drops to 0 hit points, the spell ends. Once on each of your turns as a bonus action, you can mentally command the servant to move up to 15 feet and interact with an object. The servant can perform simple tasks that a human servant could do, such as fetching things, cleaning, mending, folding clothes, lighting fires, serving food, and pouring wine. Once you give the command, the servant performs the task to the best of its ability until it completes the task, then waits for your next command. If you command the servant to perform a task that would move it more than 60 feet away from you, the spell ends.', '', '', '', '',
  '["bard","warlock","wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'vampiric-touch', 'Vampiric Touch', 3, 'necromancy',
  '1 action', 'Self', 'V, S', 'Up to 1 minute',
  'The touch of your shadow-wreathed hand can siphon life force from others to heal your wounds. Make a melee spell attack against a creature within your reach. On a hit, the target takes 3d6 necrotic damage, and you regain hit points equal to half the amount of necrotic damage dealt. Until the spell ends, you can make the attack again on each of your turns as an action.', '3d6', 'necrotic', '', '',
  '["warlock","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'vicious-mockery', 'Vicious Mockery', 0, 'enchantment',
  '1 action', '60 feet', 'V', 'Instantaneous',
  'You unleash a string of insults laced with subtle enchantments at a creature you can see within range. If the target can hear you (though it need not understand you), it must succeed on a wisdom saving throw or take 1d4 psychic damage and have disadvantage on the next attack roll it makes before the end of its next turn. This spell''s damage increases by 1d4 when you reach 5th level (2d4), 11th level (3d4), and 17th level (4d4).', '1d4', 'psychic', 'WIS', '',
  '["bard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'wall-of-fire', 'Wall of Fire', 4, 'evocation',
  '1 action', '120 feet', 'V, S, M', 'Up to 1 minute',
  'You create a wall of fire on a solid surface within range. You can make the wall up to 60 feet long, 20 feet high, and 1 foot thick, or a ringed wall up to 20 feet in diameter, 20 feet high, and 1 foot thick. The wall is opaque and lasts for the duration. When the wall appears, each creature within its area must make a Dexterity saving throw. On a failed save, a creature takes 5d8 fire damage, or half as much damage on a successful save. One side of the wall, selected by you when you cast this spell, deals 5d8 fire damage to each creature that ends its turn within 10 feet o f that side or inside the wall. A creature takes the same damage when it enters the wall for the first time on a turn or ends its turn there. The other side of the wall deals no damage. The other side of the wall deals no damage.', '5d8', 'fire', 'DEX', '',
  '["druid","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'wall-of-force', 'Wall of Force', 5, 'evocation',
  '1 action', '120 feet', 'V, S, M', 'Up to 10 minutes',
  'An invisible wall of force springs into existence at a point you choose within range. The wall appears in any orientation you choose, as a horizontal or vertical barrier or at an angle. It can be free floating or resting on a solid surface. You can form it into a hemispherical dome or a sphere with a radius of up to 10 feet, or you can shape a flat surface made up of ten 10-foot-by-10-foot panels. Each panel must be contiguous with another panel. In any form, the wall is 1/4 inch thick. It lasts for the duration. If the wall cuts through a creature''s space when it appears, the creature is pushed to one side of the wall (your choice which side). Nothing can physically pass through the wall. It is immune to all damage and can''t be dispelled by dispel magic. A disintegrate spell destroys the wall instantly, however. The wall also extends into the Ethereal Plane, blocking ethereal travel through the wall.', '', '', '', '',
  '["wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'wall-of-ice', 'Wall of Ice', 6, 'evocation',
  '1 action', '120 feet', 'V, S, M', 'Up to 10 minutes',
  'You create a wall of ice on a solid surface within range. You can form it into a hemispherical dome or a sphere with a radius of up to 10 feet, or you can shape a flat surface made up of ten 10-foot-square panels. Each panel must be contiguous with another panel. In any form, the wall is 1 foot thick and lasts for the duration. If the wall cuts through a creature''s space when it appears, the creature within its area is pushed to one side of the wall and must make a dexterity saving throw. On a failed save, the creature takes 10d6 cold damage, or half as much damage on a successful save. The wall is an object that can be damaged and thus breached. It has AC 12 and 30 hit points per 10-foot section, and it is vulnerable to fire damage. Reducing a 10-foot section of wall to 0 hit points destroys it and leaves behind a sheet of frigid air in the space the wall occupied. A creature moving through the sheet of frigid air for the first time on a turn must make a constitution saving throw. Tha', '10d6', 'cold', 'DEX', '',
  '["wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'wall-of-stone', 'Wall of Stone', 5, 'evocation',
  '1 action', '120 feet', 'V, S, M', 'Up to 10 minutes',
  'A nonmagical wall of solid stone springs into existence at a point you choose within range. The wall is 6 inches thick and is composed of ten 10-foot-by-10-foot panels. Each panel must be contiguous with at least one other panel. Alternatively, you can create 10-foot-by-20-foot panels that are only 3 inches thick. If the wall cuts through a creature''s space when it appears, the creature is pushed to one side of the wall (your choice). If a creature would be surrounded on all sides by the wall (or the wall and another solid surface), that creature can make a dexterity saving throw. On a success, it can use its reaction to move up to its speed so that it is no longer enclosed by the wall. The wall can have any shape you desire, though it can''t occupy the same space as a creature or object. The wall doesn''t need to be vertical or rest on any firm foundation. It must, however, merge with and be solidly supported by existing stone. Thus, you can use this spell to bridge a chasm or create a ', '', '', '', '',
  '["druid","sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'wall-of-thorns', 'Wall of Thorns', 6, 'conjuration',
  '1 action', '120 feet', 'V, S, M', 'Up to 10 minutes',
  'You create a wall of tough, pliable, tangled brush bristling with needle-sharp thorns. The wall appears within range on a solid surface and lasts for the duration. You choose to make the wall up to 60 feet long, 10 feet high, and 5 feet thick or a circle that has a 20-foot diameter and is up to 20 feet high and 5 feet thick. The wall blocks line of sight. When the wall appears, each creature within its area must make a dexterity saving throw. On a failed save, a creature takes 7d8 piercing damage, or half as much damage on a successful save. A creature can move through the wall, albeit slowly and painfully. For every 1 foot a creature moves through the wall, it must spend 4 feet of movement. Furthermore, the first time a creature enters the wall on a turn or ends its turn there, the creature must make a dexterity saving throw. It takes 7d8 slashing damage on a failed save, or half as much damage on a successful one.', '7d8', 'piercing', 'DEX', '',
  '["druid"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'warding-bond', 'Warding Bond', 2, 'abjuration',
  '1 action', 'Touch', 'V, S, M', '1 hour',
  'This spell wards a willing creature you touch and creates a mystic connection between you and the target until the spell ends. While the target is within 60 feet of you, it gains a +1 bonus to AC and saving throws, and it has resistance to all damage. Also, each time it takes damage, you take the same amount of damage. The spell ends if you drop to 0 hit points or if you and the target become separated by more than 60 feet. It also ends if the spell is cast again on either of the connected creatures. You can also dismiss the spell as an action.', '', '', '', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'water-breathing', 'Water Breathing', 3, 'transmutation',
  '1 action', '30 feet', 'V, S, M', '24 hours',
  'This spell gives a maximum of ten willing creatures within range and you can see, the ability to breathe underwater until the end of its term. Affected creatures also retain their normal breathing pattern.', '', '', '', '',
  '["druid","ranger","sorcerer","wizard"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'water-walk', 'Water Walk', 3, 'transmutation',
  '1 action', '30 feet', 'V, S, M', '1 hour',
  'This spell grants the ability to move across any liquid surface--such as water, acid, mud, snow, quicksand, or lava--as if it were harmless solid ground (creatures crossing molten lava can still take damage from the heat). Up to ten willing creatures you can see within range gain this ability for the duration. If you target a creature submerged in a liquid, the spell carries the target to the surface of the liquid at a rate of 60 feet per round.', '', '', '', '',
  '["cleric","druid","ranger","sorcerer"]',
  true, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'web', 'Web', 2, 'conjuration',
  '1 action', '60 feet', 'V, S, M', 'Up to 1 hour',
  'You conjure a mass of thick, sticky webbing at a point of your choice within range. The webs fill a 20-foot cube from that point for the duration. The webs are difficult terrain and lightly obscure their area. If the webs aren''t anchored between two solid masses (such as walls or trees) or layered across a floor, wall, or ceiling, the conjured web collapses on itself, and the spell ends at the start of your next turn. Webs layered over a flat surface have a depth of 5 feet. Each creature that starts its turn in the webs or that enters them during its turn must make a dexterity saving throw. On a failed save, the creature is restrained as long as it remains in the webs or until it breaks free. A creature restrained by the webs can use its action to make a Strength check against your spell save DC. If it succeeds, it is no longer restrained. The webs are flammable. Any 5-foot cube of webs exposed to fire burns away in 1 round, dealing 2d4 fire damage to any creature that starts its turn ', '', '', '', '',
  '["sorcerer","wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'weird', 'Weird', 9, 'illusion',
  '1 action', '120 feet', 'V, S', 'Up to 1 minute',
  'Drawing on the deepest fears of a group of creatures, you create illusory creatures in their minds, visible only to them. Each creature in a 30-foot-radius sphere centered on a point of your choice within range must make a wisdom saving throw. On a failed save, a creature becomes frightened for the duration. The illusion calls on the creature''s deepest fears, manifesting its worst nightmares as an implacable threat. At the start of each of the frightened creature''s turns, it must succeed on a wisdom saving throw or take 4d10 psychic damage. On a successful save, the spell ends for that creature.', '', '', 'WIS', '',
  '["wizard"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'wind-walk', 'Wind Walk', 6, 'transmutation',
  '1 minute', '30 feet', 'V, S, M', '8 hours',
  'You and up to ten willing creatures you can see within range assume a gaseous form for the duration, appearing as wisps of cloud. While in this cloud form, a creature has a flying speed of 300 feet and has resistance to damage from nonmagical weapons. The only actions a creature can take in this form are the Dash action or to revert to its normal form. Reverting takes 1 minute, during which time a creature is incapacitated and can''t move. Until the spell ends, a creature can revert to cloud form, which also requires the 1-minute transformation. If a creature is in cloud form and flying when the effect ends, the creature descends 60 feet per round for 1 minute until it lands, which it does safely. If it can''t land after 1 minute, the creature falls the remaining distance.', '', '', '', '',
  '["druid"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'wind-wall', 'Wind Wall', 3, 'evocation',
  '1 action', '120 feet', 'V, S, M', 'Up to 1 minute',
  'A wall of strong wind rises from the ground at a point you choose within range. You can make the wall up to 50 feet long, 15 feet high, and 1 foot thick. You can shape the wall in any way you choose so long as it makes one continuous path along the ground. The wall lasts for the duration. When the wall appears, each creature within its area must make a strength saving throw. A creature takes 3d8 bludgeoning damage on a failed save, or half as much damage on a successful one. The strong wind keeps fog, smoke, and other gases at bay. Small or smaller flying creatures or objects can''t pass through the wall. Loose, lightweight materials brought into the wall fly upward. Arrows, bolts, and other ordinary projectiles launched at targets behind the wall are deflected upward and automatically miss. (Boulders hurled by giants or siege engines, and similar projectiles, are unaffected.) Creatures in gaseous form can''t pass through it.', '3d8', 'bludgeoning', 'STR', '',
  '["druid","ranger"]',
  false, true,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'wish', 'Wish', 9, 'conjuration',
  '1 action', 'Self', 'V', 'Instantaneous',
  'Wish is the mightiest spell a mortal creature can cast. By simply speaking aloud, you can alter the very foundations of reality in accord with your desires. The basic use of this spell is to duplicate any other spell of 8th level or lower. You don''t need to meet any requirements in that spell, including costly components. The spell simply takes effect. Alternatively, you can create one of the following effects of your choice: - You create one object of up to 25,000 gp in value that isn''t a magic item. The object can be no more than 300 feet in any dimension, and it appears in an unoccupied space you can see on the ground. - You allow up to twenty creatures that you can see to regain all hit points, and you end all effects on them described in the greater restoration spell. - You grant up to ten creatures that you can see resistance to a damage type you choose. - You grant up to ten creatures you can see immunity to a single spell or other magical effect for 8 hours. For instance, you c', '', '', '', '',
  '["sorcerer","wizard"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'word-of-recall', 'Word of Recall', 6, 'conjuration',
  '1 action', '5 feet', 'V', 'Instantaneous',
  'You and up to five willing creatures within 5 feet of you instantly teleport to a previously designated sanctuary. You and any creatures that teleport with you appear in the nearest unoccupied space to the spot you designated when you prepared your sanctuary (see below). If you cast this spell without first preparing a sanctuary, the spell has no effect. You must designate a sanctuary by casting this spell within a location, such as a temple, dedicated to or strongly linked to your deity. If you attempt to cast the spell in this manner in an area that isn''t dedicated to your deity, the spell has no effect.', '', '', '', '',
  '["cleric"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  'zone-of-truth', 'Zone of Truth', 2, 'enchantment',
  '1 action', '60 feet', 'V, S', '10 minutes',
  'You create a magical zone that guards against deception in a 15-foot-radius sphere centered on a point of your choice within range. Until the spell ends, a creature that enters the spell''s area for the first time on a turn or starts its turn there must make a Charisma saving throw. On a failed save, a creature can''t speak a deliberate lie while in the radius. You know whether each creature succeeds or fails on its saving throw. An affected creature is aware of the spell and can thus avoid answering questions to which it would normally respond with a lie. Such a creature can remain evasive in its answers as long as it remains within the boundaries of the truth.', '', '', '', '',
  '["bard","cleric","paladin"]',
  false, false,
  'srd'
) ON CONFLICT (slug) DO NOTHING;
