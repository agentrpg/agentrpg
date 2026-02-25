-- 5e SRD Weapons (CC-BY-4.0)
-- Generated: 2026-02-25T09:25:01.054Z
-- Source: https://www.dnd5eapi.co

INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'battleaxe', 'Battleaxe', 'martial', 'melee',
  '1d8', 'slashing', 4, 'Versatile', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'blowgun', 'Blowgun', 'martial', 'ranged',
  '1', 'piercing', 1, 'Ammunition, Loading', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'club', 'Club', 'simple', 'melee',
  '1d4', 'bludgeoning', 2, 'Light, Monk', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'crossbow-hand', 'Crossbow, hand', 'martial', 'ranged',
  '1d6', 'piercing', 3, 'Ammunition, Light, Loading', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'crossbow-heavy', 'Crossbow, heavy', 'martial', 'ranged',
  '1d10', 'piercing', 18, 'Ammunition, Heavy, Loading, Two-Handed', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'crossbow-light', 'Crossbow, light', 'simple', 'ranged',
  '1d8', 'piercing', 5, 'Ammunition, Loading, Two-Handed', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'dagger', 'Dagger', 'simple', 'melee',
  '1d4', 'piercing', 1, 'Finesse, Light, Thrown, Monk', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'dart', 'Dart', 'simple', 'ranged',
  '1d4', 'piercing', 0.25, 'Finesse, Thrown', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'flail', 'Flail', 'martial', 'melee',
  '1d8', 'bludgeoning', 2, '', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'glaive', 'Glaive', 'martial', 'melee',
  '1d10', 'slashing', 6, 'Heavy, Reach, Two-Handed', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'greataxe', 'Greataxe', 'martial', 'melee',
  '1d12', 'slashing', 7, 'Heavy, Two-Handed', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'greatclub', 'Greatclub', 'simple', 'melee',
  '1d8', 'bludgeoning', 10, 'Two-Handed', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'greatsword', 'Greatsword', 'martial', 'melee',
  '2d6', 'slashing', 6, 'Heavy, Two-Handed', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'halberd', 'Halberd', 'martial', 'melee',
  '1d10', 'slashing', 6, 'Heavy, Reach, Two-Handed', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'handaxe', 'Handaxe', 'simple', 'melee',
  '1d6', 'slashing', 2, 'Light, Thrown, Monk', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'javelin', 'Javelin', 'simple', 'melee',
  '1d6', 'piercing', 2, 'Thrown, Monk', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'lance', 'Lance', 'martial', 'melee',
  '1d12', 'piercing', 6, 'Reach, Special', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'light-hammer', 'Light hammer', 'simple', 'melee',
  '1d4', 'bludgeoning', 2, 'Light, Thrown, Monk', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'longbow', 'Longbow', 'martial', 'ranged',
  '1d8', 'piercing', 2, 'Ammunition, Heavy, Two-Handed', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'longsword', 'Longsword', 'martial', 'melee',
  '1d8', 'slashing', 3, 'Versatile', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'mace', 'Mace', 'simple', 'melee',
  '1d6', 'bludgeoning', 4, 'Monk', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'maul', 'Maul', 'martial', 'melee',
  '2d6', 'bludgeoning', 10, 'Heavy, Two-Handed', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'morningstar', 'Morningstar', 'martial', 'melee',
  '1d8', 'piercing', 4, '', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'net', 'Net', 'martial', 'ranged',
  '1d6', 'bludgeoning', 3, 'Thrown, Special', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'pike', 'Pike', 'martial', 'melee',
  '1d10', 'piercing', 18, 'Heavy, Reach, Two-Handed', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'quarterstaff', 'Quarterstaff', 'simple', 'melee',
  '1d6', 'bludgeoning', 4, 'Versatile, Monk', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'rapier', 'Rapier', 'martial', 'melee',
  '1d8', 'piercing', 2, 'Finesse', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'scimitar', 'Scimitar', 'martial', 'melee',
  '1d6', 'slashing', 3, 'Finesse, Light', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'shortbow', 'Shortbow', 'simple', 'ranged',
  '1d6', 'piercing', 2, 'Ammunition, Two-Handed', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'shortsword', 'Shortsword', 'martial', 'melee',
  '1d6', 'piercing', 2, 'Finesse, Light, Monk', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'sickle', 'Sickle', 'simple', 'melee',
  '1d4', 'slashing', 2, 'Light, Monk', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'sling', 'Sling', 'simple', 'ranged',
  '1d4', 'bludgeoning', 0, 'Ammunition', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'spear', 'Spear', 'simple', 'melee',
  '1d6', 'piercing', 3, 'Thrown, Versatile, Monk', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'trident', 'Trident', 'martial', 'melee',
  '1d6', 'piercing', 4, 'Thrown, Versatile', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'war-pick', 'War pick', 'martial', 'melee',
  '1d8', 'piercing', 2, '', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'warhammer', 'Warhammer', 'martial', 'melee',
  '1d8', 'bludgeoning', 2, 'Versatile', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  'whip', 'Whip', 'martial', 'melee',
  '1d4', 'slashing', 3, 'Finesse, Reach', 'srd'
) ON CONFLICT (slug) DO NOTHING;
