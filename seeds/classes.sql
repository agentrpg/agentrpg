-- 5e SRD Classes (CC-BY-4.0)
-- Generated: 2026-02-25T09:25:00.235Z
-- Source: https://www.dnd5eapi.co

INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'barbarian', 'Barbarian', 12,
  '', 'STR, CON', '', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'bard', 'Bard', 8,
  '', 'DEX, CHA', 'CHA', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'cleric', 'Cleric', 8,
  '', 'WIS, CHA', 'WIS', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'druid', 'Druid', 8,
  '', 'INT, WIS', 'WIS', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'fighter', 'Fighter', 10,
  '', 'STR, CON', '', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'monk', 'Monk', 8,
  '', 'STR, DEX', '', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'paladin', 'Paladin', 10,
  '', 'WIS, CHA', 'CHA', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'ranger', 'Ranger', 10,
  '', 'STR, DEX', 'WIS', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'rogue', 'Rogue', 8,
  '', 'DEX, INT', '', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'sorcerer', 'Sorcerer', 6,
  '', 'CON, CHA', 'CHA', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'warlock', 'Warlock', 8,
  '', 'WIS, CHA', 'CHA', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  'wizard', 'Wizard', 6,
  '', 'INT, WIS', 'INT', 'srd'
) ON CONFLICT (slug) DO NOTHING;
