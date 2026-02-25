-- 5e SRD Races (CC-BY-4.0)
-- Generated: 2026-02-25T09:25:00.693Z
-- Source: https://www.dnd5eapi.co

INSERT INTO races (slug, name, size, speed, ability_mods, traits, source) VALUES (
  'dragonborn', 'Dragonborn', 'Medium', 30,
  '{"STR":2,"CHA":1}', 'Draconic Ancestry, Breath Weapon, Damage Resistance', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO races (slug, name, size, speed, ability_mods, traits, source) VALUES (
  'dwarf', 'Dwarf', 'Medium', 25,
  '{"CON":2}', 'Darkvision, Dwarven Resilience, Stonecunning, Dwarven Combat Training, Tool Proficiency', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO races (slug, name, size, speed, ability_mods, traits, source) VALUES (
  'elf', 'Elf', 'Medium', 30,
  '{"DEX":2}', 'Darkvision, Fey Ancestry, Trance, Keen Senses', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO races (slug, name, size, speed, ability_mods, traits, source) VALUES (
  'gnome', 'Gnome', 'Small', 25,
  '{"INT":2}', 'Darkvision, Gnome Cunning', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO races (slug, name, size, speed, ability_mods, traits, source) VALUES (
  'half-elf', 'Half-Elf', 'Medium', 30,
  '{"CHA":2}', 'Darkvision, Fey Ancestry, Skill Versatility', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO races (slug, name, size, speed, ability_mods, traits, source) VALUES (
  'half-orc', 'Half-Orc', 'Medium', 30,
  '{"STR":2,"CON":1}', 'Darkvision, Savage Attacks, Relentless Endurance, Menacing', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO races (slug, name, size, speed, ability_mods, traits, source) VALUES (
  'halfling', 'Halfling', 'Small', 25,
  '{"DEX":2}', 'Brave, Halfling Nimbleness, Lucky', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO races (slug, name, size, speed, ability_mods, traits, source) VALUES (
  'human', 'Human', 'Medium', 30,
  '{"STR":1,"DEX":1,"CON":1,"INT":1,"WIS":1,"CHA":1}', '', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO races (slug, name, size, speed, ability_mods, traits, source) VALUES (
  'tiefling', 'Tiefling', 'Medium', 30,
  '{"INT":1,"CHA":2}', 'Darkvision, Hellish Resistance, Infernal Legacy', 'srd'
) ON CONFLICT (slug) DO NOTHING;
