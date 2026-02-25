-- 5e SRD Languages (CC-BY-4.0)
-- Generated: 2026-02-25T09:31:59.008Z
-- Source: https://www.dnd5eapi.co

INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'abyssal', 'Abyssal', 'Exotic',
  '["Demons"]', 'Infernal', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'celestial', 'Celestial', 'Exotic',
  '["Celestials"]', 'Celestial', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'common', 'Common', 'Standard',
  '["Humans"]', 'Common', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'deep-speech', 'Deep Speech', 'Exotic',
  '["Aboleths","Cloakers"]', NULL, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'draconic', 'Draconic', 'Exotic',
  '["Dragons","Dragonborn"]', 'Draconic', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'dwarvish', 'Dwarvish', 'Standard',
  '["Dwarves"]', 'Dwarvish', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'elvish', 'Elvish', 'Standard',
  '["Elves"]', 'Elvish', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'giant', 'Giant', 'Standard',
  '["Ogres","Giants"]', 'Dwarvish', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'gnomish', 'Gnomish', 'Standard',
  '["Gnomes"]', 'Dwarvish', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'goblin', 'Goblin', 'Standard',
  '["Goblinoids"]', 'Dwarvish', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'halfling', 'Halfling', 'Standard',
  '["Halflings"]', 'Common', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'infernal', 'Infernal', 'Exotic',
  '["Devils"]', 'Infernal', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'orc', 'Orc', 'Standard',
  '["Orcs"]', 'Dwarvish', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'primordial', 'Primordial', 'Exotic',
  '["Elementals"]', 'Dwarvish', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'sylvan', 'Sylvan', 'Exotic',
  '["Fey creatures"]', 'Elvish', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  'undercommon', 'Undercommon', 'Exotic',
  '["Underdark traders"]', 'Elvish', 'srd'
) ON CONFLICT (slug) DO NOTHING;
