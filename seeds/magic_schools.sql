-- 5e SRD Magic Schools (CC-BY-4.0)
-- Generated: 2026-02-25T09:31:52.971Z
-- Source: https://www.dnd5eapi.co

INSERT INTO magic_schools (slug, name, description, source) VALUES (
  'abjuration', 'Abjuration', 'Abjuration spells are protective in nature, though some of them have aggressive uses. They create magical barriers, negate harmful effects, harm trespassers, or banish creatures to other planes of existence.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO magic_schools (slug, name, description, source) VALUES (
  'conjuration', 'Conjuration', 'Conjuration spells involve the transportation of objects and creatures from one location to another. Some spells summon creatures or objects to the caster''s side, whereas others allow the caster to teleport to another location. Some conjurations create objects or effects out of nothing.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO magic_schools (slug, name, description, source) VALUES (
  'divination', 'Divination', 'Divination spells reveal information, whether in the form of secrets long forgotten, glimpses of the future, the locations of hidden things, the truth behind illusions, or visions of distant people or places.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO magic_schools (slug, name, description, source) VALUES (
  'enchantment', 'Enchantment', 'Enchantment spells affect the minds of others, influencing or controlling their behavior. Such spells can make enemies see the caster as a friend, force creatures to take a course of action, or even control another creature like a puppet.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO magic_schools (slug, name, description, source) VALUES (
  'evocation', 'Evocation', 'Evocation spells manipulate magical energy to produce a desired effect. Some call up blasts of fire or lightning. Others channel positive energy to heal wounds.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO magic_schools (slug, name, description, source) VALUES (
  'illusion', 'Illusion', 'Illusion spells deceive the senses or minds of others. They cause people to see things that are not there, to miss things that are there, to hear phantom noises, or to remember things that never happened. Some illusions create phantom images that any creature can see, but the most insidious illusions plant an image directly in the mind of a creature.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO magic_schools (slug, name, description, source) VALUES (
  'necromancy', 'Necromancy', 'Necromancy spells manipulate the energies of life and death. Such spells can grant an extra reserve of life force, drain the life energy from another creature, create the undead, or even bring the dead back to life.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO magic_schools (slug, name, description, source) VALUES (
  'transmutation', 'Transmutation', 'Transmutation spells change the properties of a creature, object, or environment. They might turn an enemy into a harmless creature, bolster the strength of an ally, make an object move at the caster''s command, or enhance a creature''s innate healing abilities to rapidly recover from injury.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
