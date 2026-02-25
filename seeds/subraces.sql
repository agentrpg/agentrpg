-- 5e SRD Subraces (CC-BY-4.0)
-- Generated: 2026-02-25T09:32:18.033Z
-- Source: https://www.dnd5eapi.co

INSERT INTO subraces (slug, name, race_slug, description, ability_bonuses, racial_traits, source) VALUES (
  'high-elf', 'High Elf', 'elf',
  'As a high elf, you have a keen mind and a mastery of at least the basics of magic. In many fantasy gaming worlds, there are two kinds of high elves. One type is haughty and reclusive, believing themselves to be superior to non-elves and even other elves. The other type is more common and more friendly, and often encountered among humans and other races.', '{"INT":1}',
  '["elf-weapon-training","high-elf-cantrip","extra-language"]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO subraces (slug, name, race_slug, description, ability_bonuses, racial_traits, source) VALUES (
  'hill-dwarf', 'Hill Dwarf', 'dwarf',
  'As a hill dwarf, you have keen senses, deep intuition, and remarkable resilience.', '{"WIS":1}',
  '["dwarven-toughness"]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO subraces (slug, name, race_slug, description, ability_bonuses, racial_traits, source) VALUES (
  'lightfoot-halfling', 'Lightfoot Halfling', 'halfling',
  'As a lightfoot halfling, you can easily hide from notice, even using other people as cover. You''re inclined to be affable and get along well with others. Lightfoots are more prone to wanderlust than other halflings, and often dwell alongside other races or take up a nomadic life.', '{"CHA":1}',
  '["naturally-stealthy"]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO subraces (slug, name, race_slug, description, ability_bonuses, racial_traits, source) VALUES (
  'rock-gnome', 'Rock Gnome', 'gnome',
  'As a rock gnome, you have a natural inventiveness and hardiness beyond that of other gnomes.', '{"CON":1}',
  '["artificers-lore","tinker"]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
