-- 5e SRD Ability Scores (CC-BY-4.0)
-- Generated: 2026-02-25T09:31:50.961Z
-- Source: https://www.dnd5eapi.co

INSERT INTO ability_scores (slug, name, full_name, description, skills, source) VALUES (
  'cha', 'CHA', 'Charisma',
  'Charisma measures your ability to interact effectively with others. It includes such factors as confidence and eloquence, and it can represent a charming or commanding personality. A Charisma check might arise when you try to influence or entertain others, when you try to make an impression or tell a convincing lie, or when you are navigating a tricky social situation. The Deception, Intimidation, Performance, and Persuasion skills reflect aptitude in certain kinds of Charisma checks.', '["deception","intimidation","performance","persuasion"]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO ability_scores (slug, name, full_name, description, skills, source) VALUES (
  'con', 'CON', 'Constitution',
  'Constitution measures health, stamina, and vital force. Constitution checks are uncommon, and no skills apply to Constitution checks, because the endurance this ability represents is largely passive rather than involving a specific effort on the part of a character or monster.', '[]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO ability_scores (slug, name, full_name, description, skills, source) VALUES (
  'dex', 'DEX', 'Dexterity',
  'Dexterity measures agility, reflexes, and balance. A Dexterity check can model any attempt to move nimbly, quickly, or quietly, or to keep from falling on tricky footing. The Acrobatics, Sleight of Hand, and Stealth skills reflect aptitude in certain kinds of Dexterity checks.', '["acrobatics","sleight-of-hand","stealth"]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO ability_scores (slug, name, full_name, description, skills, source) VALUES (
  'int', 'INT', 'Intelligence',
  'Intelligence measures mental acuity, accuracy of recall, and the ability to reason. An Intelligence check comes into play when you need to draw on logic, education, memory, or deductive reasoning. The Arcana, History, Investigation, Nature, and Religion skills reflect aptitude in certain kinds of Intelligence checks.', '["arcana","history","investigation","nature","religion"]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO ability_scores (slug, name, full_name, description, skills, source) VALUES (
  'str', 'STR', 'Strength',
  'Strength measures bodily power, athletic training, and the extent to which you can exert raw physical force. A Strength check can model any attempt to lift, push, pull, or break something, to force your body through a space, or to otherwise apply brute force to a situation. The Athletics skill reflects aptitude in certain kinds of Strength checks.', '["athletics"]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO ability_scores (slug, name, full_name, description, skills, source) VALUES (
  'wis', 'WIS', 'Wisdom',
  'Wisdom reflects how attuned you are to the world around you and represents perceptiveness and intuition. A Wisdom check might reflect an effort to read body language, understand someone''s feelings, notice things about the environment, or care for an injured person. The Animal Handling, Insight, Medicine, Perception, and Survival skills reflect aptitude in certain kinds of Wisdom checks.', '["animal-handling","insight","medicine","perception","survival"]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
