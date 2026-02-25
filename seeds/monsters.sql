-- 5e SRD Monsters (CC-BY-4.0)
-- Generated: 2026-02-25T09:24:37.675Z
-- Source: https://www.dnd5eapi.co

INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'aboleth', 'Aboleth', 'Large', 'aberration',
  17, 135, '18d10', 10,
  21, 9, 15, 18, 15, 18,
  '10', 5900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Tentacle","attack_bonus":9,"damage_dice":"2d6+5","damage_type":"bludgeoning"},{"name":"Tail","attack_bonus":9,"damage_dice":"3d6+5","damage_type":"bludgeoning"},{"name":"Enslave","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'acolyte', 'Acolyte', 'Medium', 'humanoid',
  10, 9, '2d8', 30,
  10, 10, 10, 10, 14, 11,
  '0.25', 50,
  '[{"name":"Club","attack_bonus":2,"damage_dice":"1d4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'adult-black-dragon', 'Adult Black Dragon', 'Huge', 'dragon',
  19, 195, '17d12', 40,
  23, 14, 21, 14, 13, 17,
  '14', 11500,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":11,"damage_dice":"2d10+6","damage_type":"piercing"},{"name":"Claw","attack_bonus":11,"damage_dice":"2d6+6","damage_type":"slashing"},{"name":"Tail","attack_bonus":11,"damage_dice":"2d8+6","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Acid Breath","attack_bonus":0,"damage_dice":"12d8","damage_type":"acid"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'adult-blue-dragon', 'Adult Blue Dragon', 'Huge', 'dragon',
  19, 225, '18d12', 40,
  25, 10, 23, 16, 15, 19,
  '16', 15000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":12,"damage_dice":"2d10+7","damage_type":"piercing"},{"name":"Claw","attack_bonus":12,"damage_dice":"2d6+7","damage_type":"slashing"},{"name":"Tail","attack_bonus":12,"damage_dice":"2d8+7","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Lightning Breath","attack_bonus":0,"damage_dice":"12d10","damage_type":"lightning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'adult-brass-dragon', 'Adult Brass Dragon', 'Huge', 'dragon',
  18, 172, '15d12', 40,
  23, 10, 21, 14, 13, 17,
  '13', 10000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":11,"damage_dice":"2d10+6","damage_type":"piercing"},{"name":"Claw","attack_bonus":11,"damage_dice":"2d6+6","damage_type":"slashing"},{"name":"Tail","attack_bonus":11,"damage_dice":"2d8+6","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'adult-bronze-dragon', 'Adult Bronze Dragon', 'Huge', 'dragon',
  19, 212, '17d12', 40,
  25, 10, 23, 16, 15, 19,
  '15', 13000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":12,"damage_dice":"2d10+7","damage_type":"piercing"},{"name":"Claw","attack_bonus":12,"damage_dice":"2d6+7","damage_type":"slashing"},{"name":"Tail","attack_bonus":12,"damage_dice":"2d8+7","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'adult-copper-dragon', 'Adult Copper Dragon', 'Huge', 'dragon',
  18, 184, '16d12', 40,
  23, 12, 21, 18, 15, 17,
  '14', 11500,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":11,"damage_dice":"2d10+6","damage_type":"piercing"},{"name":"Claw","attack_bonus":11,"damage_dice":"2d6+6","damage_type":"slashing"},{"name":"Tail","attack_bonus":11,"damage_dice":"2d8+6","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'adult-gold-dragon', 'Adult Gold Dragon', 'Huge', 'dragon',
  19, 256, '19d12', 40,
  27, 14, 25, 16, 15, 24,
  '17', 18000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":14,"damage_dice":"2d10+8","damage_type":"piercing"},{"name":"Claw","attack_bonus":14,"damage_dice":"2d6+8","damage_type":"slashing"},{"name":"Tail","attack_bonus":14,"damage_dice":"2d8+8","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'adult-green-dragon', 'Adult Green Dragon', 'Huge', 'dragon',
  19, 207, '18d12', 40,
  23, 12, 21, 18, 15, 17,
  '15', 13000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":11,"damage_dice":"2d10+6","damage_type":"piercing"},{"name":"Claw","attack_bonus":11,"damage_dice":"2d6+6","damage_type":"slashing"},{"name":"Tail","attack_bonus":11,"damage_dice":"2d8+6","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Poison Breath","attack_bonus":0,"damage_dice":"16d6","damage_type":"poison"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'adult-red-dragon', 'Adult Red Dragon', 'Huge', 'dragon',
  19, 256, '19d12', 40,
  27, 10, 25, 16, 13, 21,
  '17', 18000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":14,"damage_dice":"2d10+8","damage_type":"piercing"},{"name":"Claw","attack_bonus":14,"damage_dice":"2d6+8","damage_type":"slashing"},{"name":"Tail","attack_bonus":14,"damage_dice":"2d8+8","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Fire Breath","attack_bonus":0,"damage_dice":"18d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'adult-silver-dragon', 'Adult Silver Dragon', 'Huge', 'dragon',
  19, 243, '18d12', 40,
  27, 10, 25, 16, 13, 21,
  '16', 15000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":13,"damage_dice":"2d10+8","damage_type":"piercing"},{"name":"Claw","attack_bonus":13,"damage_dice":"2d6+8","damage_type":"slashing"},{"name":"Tail","attack_bonus":13,"damage_dice":"2d8+8","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'adult-white-dragon', 'Adult White Dragon', 'Huge', 'dragon',
  18, 200, '16d12', 40,
  22, 10, 22, 8, 12, 12,
  '13', 10000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":11,"damage_dice":"2d10+6","damage_type":"piercing"},{"name":"Claw","attack_bonus":11,"damage_dice":"2d6+6","damage_type":"slashing"},{"name":"Tail","attack_bonus":11,"damage_dice":"2d8+6","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Cold Breath","attack_bonus":0,"damage_dice":"12d8","damage_type":"cold"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'air-elemental', 'Air Elemental', 'Large', 'elemental',
  15, 90, '12d10', 30,
  14, 20, 14, 6, 10, 6,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":8,"damage_dice":"2d8+5","damage_type":"bludgeoning"},{"name":"Whirlwind","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ancient-black-dragon', 'Ancient Black Dragon', 'Gargantuan', 'dragon',
  22, 367, '21d20', 40,
  27, 14, 25, 16, 15, 19,
  '21', 33000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":15,"damage_dice":"2d10+8","damage_type":"piercing"},{"name":"Claw","attack_bonus":15,"damage_dice":"2d6+8","damage_type":"slashing"},{"name":"Tail","attack_bonus":15,"damage_dice":"2d8+8","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Acid Breath","attack_bonus":0,"damage_dice":"15d8","damage_type":"acid"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ancient-blue-dragon', 'Ancient Blue Dragon', 'Gargantuan', 'dragon',
  22, 481, '26d20', 40,
  29, 10, 27, 18, 17, 21,
  '23', 50000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":16,"damage_dice":"2d10+9","damage_type":"piercing"},{"name":"Claw","attack_bonus":16,"damage_dice":"2d6+9","damage_type":"slashing"},{"name":"Tail","attack_bonus":16,"damage_dice":"2d8+9","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Lightning Breath","attack_bonus":0,"damage_dice":"16d10","damage_type":"lightning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ancient-brass-dragon', 'Ancient Brass Dragon', 'Gargantuan', 'dragon',
  20, 297, '17d20', 40,
  27, 10, 25, 16, 15, 19,
  '20', 25000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":14,"damage_dice":"2d10+8","damage_type":"piercing"},{"name":"Claw","attack_bonus":14,"damage_dice":"2d6+8","damage_type":"slashing"},{"name":"Tail","attack_bonus":14,"damage_dice":"2d8+8","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Change Shape","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ancient-bronze-dragon', 'Ancient Bronze Dragon', 'Gargantuan', 'dragon',
  22, 444, '24d20', 40,
  29, 10, 27, 18, 17, 21,
  '22', 41000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":16,"damage_dice":"2d10+9","damage_type":"piercing"},{"name":"Claw","attack_bonus":16,"damage_dice":"2d6+9","damage_type":"slashing"},{"name":"Tail","attack_bonus":16,"damage_dice":"2d8+9","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Change Shape","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ancient-copper-dragon', 'Ancient Copper Dragon', 'Gargantuan', 'dragon',
  21, 350, '20d20', 40,
  27, 12, 25, 20, 17, 19,
  '21', 33000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":15,"damage_dice":"2d10+8","damage_type":"piercing"},{"name":"Claw","attack_bonus":15,"damage_dice":"2d6+8","damage_type":"slashing"},{"name":"Tail","attack_bonus":15,"damage_dice":"2d8+8","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Change Shape","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ancient-gold-dragon', 'Ancient Gold Dragon', 'Gargantuan', 'dragon',
  22, 546, '28d20', 40,
  30, 14, 29, 18, 17, 28,
  '24', 62000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":17,"damage_dice":"2d10+10","damage_type":"piercing"},{"name":"Claw","attack_bonus":17,"damage_dice":"2d6+10","damage_type":"slashing"},{"name":"Tail","attack_bonus":17,"damage_dice":"2d8+10","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Change Shape","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ancient-green-dragon', 'Ancient Green Dragon', 'Gargantuan', 'dragon',
  21, 385, '22d20', 40,
  27, 12, 25, 20, 17, 19,
  '22', 41000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":15,"damage_dice":"2d10+8","damage_type":"piercing"},{"name":"Claw","attack_bonus":15,"damage_dice":"4d6+8","damage_type":"slashing"},{"name":"Tail","attack_bonus":15,"damage_dice":"2d8+8","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Poison Breath","attack_bonus":0,"damage_dice":"22d6","damage_type":"poison"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ancient-red-dragon', 'Ancient Red Dragon', 'Gargantuan', 'dragon',
  22, 546, '28d20', 40,
  30, 10, 29, 18, 15, 23,
  '24', 62000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":17,"damage_dice":"2d10+10","damage_type":"bludgeoning"},{"name":"Claw","attack_bonus":17,"damage_dice":"2d6+10","damage_type":"slashing"},{"name":"Tail","attack_bonus":17,"damage_dice":"2d8+10","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Fire Breath","attack_bonus":0,"damage_dice":"26d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ancient-silver-dragon', 'Ancient Silver Dragon', 'Gargantuan', 'dragon',
  22, 487, '25d20', 40,
  30, 10, 29, 18, 15, 23,
  '23', 50000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":17,"damage_dice":"2d10+10","damage_type":"piercing"},{"name":"Claw","attack_bonus":17,"damage_dice":"2d6+10","damage_type":"slashing"},{"name":"Tail","attack_bonus":17,"damage_dice":"2d8+10","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Change Shape","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ancient-white-dragon', 'Ancient White Dragon', 'Gargantuan', 'dragon',
  20, 333, '18d20', 40,
  26, 10, 26, 10, 13, 14,
  '20', 25000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":14,"damage_dice":"2d10+8","damage_type":"piercing"},{"name":"Claw","attack_bonus":14,"damage_dice":"2d6+8","damage_type":"slashing"},{"name":"Tail","attack_bonus":14,"damage_dice":"2d8+8","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Cold Breath","attack_bonus":0,"damage_dice":"16d8","damage_type":"cold"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'androsphinx', 'Androsphinx', 'Large', 'monstrosity',
  17, 199, '19d10', 40,
  22, 10, 20, 16, 18, 23,
  '17', 18000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Claw","attack_bonus":12,"damage_dice":"2d10+6","damage_type":"slashing"},{"name":"Roar","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'animated-armor', 'Animated Armor', 'Medium', 'construct',
  18, 33, '6d8', 25,
  14, 11, 13, 1, 3, 1,
  '1', 200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ankheg', 'Ankheg', 'Large', 'monstrosity',
  14, 39, '6d10', 30,
  17, 11, 13, 1, 13, 6,
  '2', 250,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"slashing"},{"name":"Acid Spray","attack_bonus":0,"damage_dice":"3d6","damage_type":"acid"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ape', 'Ape', 'Medium', 'beast',
  12, 19, '3d8', 30,
  16, 14, 14, 6, 12, 7,
  '0.5', 100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Fist","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"bludgeoning"},{"name":"Rock","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'archmage', 'Archmage', 'Medium', 'humanoid',
  12, 99, '18d8', 30,
  10, 14, 12, 20, 15, 16,
  '12', 8400,
  '[{"name":"Dagger","attack_bonus":6,"damage_dice":"1d4+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'assassin', 'Assassin', 'Medium', 'humanoid',
  15, 78, '12d8', 30,
  11, 16, 14, 13, 11, 10,
  '8', 3900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Shortsword","attack_bonus":6,"damage_dice":"1d6+3","damage_type":"piercing"},{"name":"Light Crossbow","attack_bonus":6,"damage_dice":"1d8+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'awakened-shrub', 'Awakened Shrub', 'Small', 'plant',
  9, 10, '3d6', 20,
  3, 8, 11, 10, 10, 6,
  '0', 10,
  '[{"name":"Rake","attack_bonus":1,"damage_dice":"1d4-1","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'awakened-tree', 'Awakened Tree', 'Huge', 'plant',
  13, 59, '7d12', 20,
  19, 6, 15, 10, 10, 7,
  '2', 450,
  '[{"name":"Slam","attack_bonus":6,"damage_dice":"3d6+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'axe-beak', 'Axe Beak', 'Large', 'beast',
  11, 19, '3d10', 50,
  14, 12, 12, 2, 10, 5,
  '0.25', 50,
  '[{"name":"Beak","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'azer', 'Azer', 'Medium', 'elemental',
  15, 39, '6d8', 30,
  17, 12, 15, 12, 13, 10,
  '2', 450,
  '[{"name":"Warhammer","attack_bonus":5,"damage_dice":"1d8+3","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'baboon', 'Baboon', 'Small', 'beast',
  12, 3, '1d6', 30,
  8, 14, 11, 4, 12, 6,
  '0', 10,
  '[{"name":"Bite","attack_bonus":1,"damage_dice":"1d4-1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'badger', 'Badger', 'Tiny', 'beast',
  10, 3, '1d4', 20,
  4, 11, 12, 2, 12, 5,
  '0', 10,
  '[{"name":"Bite","attack_bonus":2,"damage_dice":"1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'balor', 'Balor', 'Huge', 'fiend',
  19, 262, '21d12', 40,
  26, 15, 22, 20, 16, 22,
  '19', 22000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Longsword","attack_bonus":14,"damage_dice":"3d8+8","damage_type":"slashing"},{"name":"Whip","attack_bonus":14,"damage_dice":"2d6+8","damage_type":"slashing"},{"name":"Teleport","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'bandit', 'Bandit', 'Medium', 'humanoid',
  12, 11, '2d8', 30,
  11, 12, 12, 10, 10, 10,
  '0.125', 25,
  '[{"name":"Scimitar","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"slashing"},{"name":"Light Crossbow","attack_bonus":3,"damage_dice":"1d8+1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'bandit-captain', 'Bandit Captain', 'Medium', 'humanoid',
  15, 65, '10d8', 30,
  15, 16, 14, 14, 11, 14,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Scimitar","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"slashing"},{"name":"Dagger","attack_bonus":5,"damage_dice":"1d4+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'barbed-devil', 'Barbed Devil', 'Medium', 'fiend',
  15, 110, '13d8', 30,
  16, 17, 18, 12, 14, 14,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Claw","attack_bonus":6,"damage_dice":"1d6+3","damage_type":"piercing"},{"name":"Tail","attack_bonus":6,"damage_dice":"2d6+3","damage_type":"piercing"},{"name":"Hurl Flame","attack_bonus":5,"damage_dice":"3d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'basilisk', 'Basilisk', 'Medium', 'monstrosity',
  12, 52, '8d8', 20,
  16, 8, 15, 2, 8, 7,
  '3', 700,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'bat', 'Bat', 'Tiny', 'beast',
  12, 1, '1d4', 5,
  2, 15, 8, 2, 12, 4,
  '0', 10,
  '[{"name":"Bite","attack_bonus":0,"damage_dice":"1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'bearded-devil', 'Bearded Devil', 'Medium', 'fiend',
  13, 52, '8d8', 30,
  16, 15, 15, 9, 11, 11,
  '3', 700,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Beard","attack_bonus":5,"damage_dice":"1d8+2","damage_type":"piercing"},{"name":"Glaive","attack_bonus":5,"damage_dice":"1d10+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'behir', 'Behir', 'Huge', 'monstrosity',
  17, 168, '16d12', 50,
  23, 16, 18, 7, 14, 12,
  '11', 7200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":10,"damage_dice":"3d10+6","damage_type":"piercing"},{"name":"Constrict","attack_bonus":10,"damage_dice":"2d10+6","damage_type":"bludgeoning"},{"name":"Lightning Breath","attack_bonus":0,"damage_dice":"12d10","damage_type":"lightning"},{"name":"Swallow","attack_bonus":0,"damage_dice":"6d6","damage_type":"acid"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'berserker', 'Berserker', 'Medium', 'humanoid',
  13, 67, '9d8', 30,
  16, 12, 17, 9, 11, 9,
  '2', 450,
  '[{"name":"Greataxe","attack_bonus":5,"damage_dice":"1d12+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'black-bear', 'Black Bear', 'Medium', 'beast',
  11, 19, '3d8', 40,
  15, 10, 14, 2, 12, 7,
  '0.5', 100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":3,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Claws","attack_bonus":3,"damage_dice":"2d4+2","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'black-dragon-wyrmling', 'Black Dragon Wyrmling', 'Medium', 'dragon',
  17, 33, '6d8', 30,
  15, 14, 13, 10, 11, 13,
  '2', 450,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d10+2","damage_type":"piercing"},{"name":"Acid Breath","attack_bonus":0,"damage_dice":"5d8","damage_type":"acid"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'black-pudding', 'Black Pudding', 'Large', 'ooze',
  7, 85, '10d10', 20,
  16, 5, 16, 1, 6, 1,
  '4', 1100,
  '[{"name":"Pseudopod","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'blink-dog', 'Blink Dog', 'Medium', 'fey',
  13, 22, '4d8', 40,
  12, 17, 12, 10, 13, 11,
  '0.25', 50,
  '[{"name":"Bite","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"piercing"},{"name":"Teleport","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'blood-hawk', 'Blood Hawk', 'Small', 'beast',
  12, 7, '2d6', 10,
  6, 14, 10, 3, 14, 5,
  '0.125', 25,
  '[{"name":"Beak","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'blue-dragon-wyrmling', 'Blue Dragon Wyrmling', 'Medium', 'dragon',
  17, 52, '8d8', 30,
  17, 10, 15, 12, 11, 15,
  '3', 700,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1d10+3","damage_type":"piercing"},{"name":"Lightning Breath","attack_bonus":0,"damage_dice":"4d10","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'boar', 'Boar', 'Medium', 'beast',
  11, 11, '2d8', 40,
  13, 11, 12, 2, 9, 5,
  '0.25', 50,
  '[{"name":"Tusk","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'bone-devil', 'Bone Devil', 'Large', 'fiend',
  19, 142, '15d10', 40,
  18, 16, 18, 13, 14, 16,
  '9', 5000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Claw","attack_bonus":8,"damage_dice":"1d8+4","damage_type":"slashing"},{"name":"Sting","attack_bonus":8,"damage_dice":"2d8+4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'brass-dragon-wyrmling', 'Brass Dragon Wyrmling', 'Medium', 'dragon',
  16, 16, '3d8', 30,
  15, 10, 13, 10, 11, 13,
  '1', 100,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d10+2","damage_type":"piercing"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'bronze-dragon-wyrmling', 'Bronze Dragon Wyrmling', 'Medium', 'dragon',
  17, 32, '5d8', 30,
  17, 10, 15, 12, 11, 15,
  '2', 450,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1d10+3","damage_type":"piercing"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'brown-bear', 'Brown Bear', 'Large', 'beast',
  11, 34, '4d10', 40,
  19, 10, 16, 2, 13, 7,
  '1', 200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":5,"damage_dice":"1d8+4","damage_type":"piercing"},{"name":"Claws","attack_bonus":5,"damage_dice":"2d6+4","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'bugbear', 'Bugbear', 'Medium', 'humanoid',
  16, 27, '5d8', 30,
  15, 14, 13, 8, 11, 9,
  '1', 200,
  '[{"name":"Morningstar","attack_bonus":4,"damage_dice":"2d8+2","damage_type":"piercing"},{"name":"Javelin","attack_bonus":4,"damage_dice":"2d6+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'bulette', 'Bulette', 'Large', 'monstrosity',
  17, 94, '9d10', 40,
  19, 11, 21, 2, 10, 5,
  '5', 1800,
  '[{"name":"Bite","attack_bonus":7,"damage_dice":"4d12+4","damage_type":"piercing"},{"name":"Deadly Leap","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'camel', 'Camel', 'Large', 'beast',
  9, 15, '2d10', 50,
  16, 8, 14, 2, 8, 5,
  '0.125', 25,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1d4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'cat', 'Cat', 'Tiny', 'beast',
  12, 2, '1d4', 40,
  3, 15, 10, 3, 12, 7,
  '0', 10,
  '[{"name":"Claws","attack_bonus":0,"damage_dice":"1","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'centaur', 'Centaur', 'Large', 'monstrosity',
  12, 45, '6d10', 50,
  18, 14, 14, 9, 13, 11,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Pike","attack_bonus":6,"damage_dice":"1d10+4","damage_type":"piercing"},{"name":"Hooves","attack_bonus":6,"damage_dice":"2d6+4","damage_type":"bludgeoning"},{"name":"Longbow","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'chain-devil', 'Chain Devil', 'Medium', 'fiend',
  16, 85, '10d8', 30,
  18, 15, 18, 11, 12, 14,
  '8', 3900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Chain","attack_bonus":8,"damage_dice":"2d6+4","damage_type":"slashing"},{"name":"Animate Chains","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'chimera', 'Chimera', 'Large', 'monstrosity',
  14, 114, '12d10', 30,
  19, 11, 19, 3, 14, 10,
  '6', 2300,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"piercing"},{"name":"Horns","attack_bonus":7,"damage_dice":"1d12+4","damage_type":"bludgeoning"},{"name":"Claws","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"slashing"},{"name":"Fire Breath","attack_bonus":0,"damage_dice":"7d8","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'chuul', 'Chuul', 'Large', 'aberration',
  16, 93, '11d10', 30,
  19, 10, 16, 5, 11, 5,
  '4', 1100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Pincer","attack_bonus":6,"damage_dice":"2d6+4","damage_type":"bludgeoning"},{"name":"Tentacles","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'clay-golem', 'Clay Golem', 'Large', 'construct',
  14, 133, '14d10', 20,
  20, 9, 18, 3, 8, 1,
  '9', 5000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":8,"damage_dice":"2d10+5","damage_type":"bludgeoning"},{"name":"Haste","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'cloaker', 'Cloaker', 'Large', 'aberration',
  14, 78, '12d10', 10,
  17, 15, 12, 13, 12, 14,
  '8', 3900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":6,"damage_dice":"2d6+3","damage_type":"piercing"},{"name":"Tail","attack_bonus":6,"damage_dice":"1d8+3","damage_type":"slashing"},{"name":"Moan","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Phantasms","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'cloud-giant', 'Cloud Giant', 'Huge', 'giant',
  14, 200, '16d12', 40,
  27, 10, 22, 12, 16, 16,
  '9', 5000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Morningstar","attack_bonus":12,"damage_dice":"3d8+8","damage_type":"piercing"},{"name":"Rock","attack_bonus":12,"damage_dice":"4d10+8","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'cockatrice', 'Cockatrice', 'Small', 'monstrosity',
  11, 27, '6d6', 20,
  6, 12, 12, 2, 13, 5,
  '0.5', 100,
  '[{"name":"Bite","attack_bonus":3,"damage_dice":"1d4+1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'commoner', 'Commoner', 'Medium', 'humanoid',
  10, 4, '1d8', 30,
  10, 10, 10, 10, 10, 10,
  '0', 10,
  '[{"name":"Club","attack_bonus":2,"damage_dice":"1d4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'constrictor-snake', 'Constrictor Snake', 'Large', 'beast',
  12, 13, '2d10', 30,
  15, 14, 12, 1, 10, 3,
  '0.25', 50,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Constrict","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'copper-dragon-wyrmling', 'Copper Dragon Wyrmling', 'Medium', 'dragon',
  16, 22, '4d8', 30,
  15, 12, 13, 14, 11, 13,
  '1', 200,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d10+2","damage_type":"piercing"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'couatl', 'Couatl', 'Medium', 'celestial',
  19, 97, '13d8', 30,
  16, 20, 17, 18, 20, 18,
  '4', 1100,
  '[{"name":"Bite","attack_bonus":8,"damage_dice":"1d6+5","damage_type":"piercing"},{"name":"Constrict","attack_bonus":6,"damage_dice":"2d6+3","damage_type":"bludgeoning"},{"name":"Change Shape","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'crab', 'Crab', 'Tiny', 'beast',
  11, 2, '1d4', 20,
  2, 11, 10, 1, 8, 2,
  '0', 10,
  '[{"name":"Claw","attack_bonus":0,"damage_dice":"1","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'crocodile', 'Crocodile', 'Large', 'beast',
  12, 19, '3d10', 20,
  15, 10, 13, 2, 10, 5,
  '0.5', 100,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d10+2","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'cult-fanatic', 'Cult Fanatic', 'Medium', 'humanoid',
  13, 22, '6d8', 30,
  11, 14, 12, 10, 13, 14,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Dagger","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'cultist', 'Cultist', 'Medium', 'humanoid',
  12, 9, '2d8', 30,
  11, 12, 10, 10, 11, 10,
  '0.125', 25,
  '[{"name":"Scimitar","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'darkmantle', 'Darkmantle', 'Small', 'monstrosity',
  11, 22, '5d6', 10,
  16, 12, 13, 2, 10, 5,
  '0.5', 100,
  '[{"name":"Crush","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"bludgeoning"},{"name":"Darkness Aura","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'death-dog', 'Death Dog', 'Medium', 'monstrosity',
  12, 39, '6d8', 40,
  15, 14, 14, 3, 13, 6,
  '1', 200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'deep-gnome-svirfneblin', 'Deep Gnome (Svirfneblin)', 'Small', 'humanoid',
  15, 16, '3d6', 20,
  15, 14, 14, 12, 10, 9,
  '0.5', 50,
  '[{"name":"War Pick","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"piercing"},{"name":"Poisoned Dart","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'deer', 'Deer', 'Medium', 'beast',
  13, 4, '1d8', 50,
  11, 16, 11, 2, 14, 5,
  '0', 10,
  '[{"name":"Bite","attack_bonus":2,"damage_dice":"1d4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'deva', 'Deva', 'Medium', 'celestial',
  17, 136, '16d8', 30,
  18, 18, 18, 17, 20, 20,
  '10', 5900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Mace","attack_bonus":8,"damage_dice":"1d6+4","damage_type":"bludgeoning"},{"name":"Healing Touch","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Change Shape","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'dire-wolf', 'Dire Wolf', 'Large', 'beast',
  14, 37, '5d10', 50,
  17, 15, 15, 3, 12, 7,
  '1', 200,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'djinni', 'Djinni', 'Large', 'elemental',
  17, 161, '14d10', 30,
  21, 15, 22, 15, 16, 20,
  '11', 7200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Scimitar","attack_bonus":9,"damage_dice":"2d6+5","damage_type":"slashing"},{"name":"Create Whirlwind","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'doppelganger', 'Doppelganger', 'Medium', 'monstrosity',
  14, 52, '8d8', 30,
  11, 18, 14, 11, 12, 14,
  '3', 700,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":6,"damage_dice":"1d6+4","damage_type":"bludgeoning"},{"name":"Read Thoughts","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'draft-horse', 'Draft Horse', 'Large', 'beast',
  10, 19, '3d10', 40,
  18, 10, 12, 2, 11, 7,
  '0.25', 50,
  '[{"name":"Hooves","attack_bonus":6,"damage_dice":"2d4+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'dragon-turtle', 'Dragon Turtle', 'Gargantuan', 'dragon',
  20, 341, '22d20', 20,
  25, 10, 20, 10, 12, 12,
  '17', 18000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":13,"damage_dice":"3d12+7","damage_type":"piercing"},{"name":"Claw","attack_bonus":13,"damage_dice":"2d8+7","damage_type":"piercing"},{"name":"Tail","attack_bonus":13,"damage_dice":"3d12+7","damage_type":"bludgeoning"},{"name":"Steam Breath","attack_bonus":0,"damage_dice":"15d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'dretch', 'Dretch', 'Small', 'fiend',
  11, 18, '4d6', 20,
  11, 11, 12, 5, 8, 3,
  '0.25', 25,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":2,"damage_dice":"1d6","damage_type":"piercing"},{"name":"Claws","attack_bonus":2,"damage_dice":"2d4","damage_type":"slashing"},{"name":"Fetid Cloud","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'drider', 'Drider', 'Large', 'monstrosity',
  19, 123, '13d10', 30,
  16, 16, 18, 13, 14, 12,
  '6', 2300,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":6,"damage_dice":"1d4","damage_type":"piercing"},{"name":"Longsword","attack_bonus":6,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Longbow","attack_bonus":6,"damage_dice":"1d8+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'drow', 'Drow', 'Medium', 'humanoid',
  15, 13, '3d8', 30,
  10, 14, 10, 11, 11, 12,
  '0.25', 50,
  '[{"name":"Shortsword","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"bludgeoning"},{"name":"Hand Crossbow","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'druid', 'Druid', 'Medium', 'humanoid',
  11, 27, '5d8', 30,
  10, 12, 13, 12, 15, 11,
  '2', 450,
  '[{"name":"Quarterstaff","attack_bonus":2,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'dryad', 'Dryad', 'Medium', 'fey',
  11, 22, '5d8', 30,
  10, 12, 11, 14, 15, 18,
  '1', 200,
  '[{"name":"Club","attack_bonus":2,"damage_dice":"1d4","damage_type":"bludgeoning"},{"name":"Fey Charm","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'duergar', 'Duergar', 'Medium', 'humanoid',
  16, 26, '4d8', 25,
  14, 11, 14, 11, 10, 9,
  '1', 200,
  '[{"name":"Enlarge","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"War Pick","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"piercing"},{"name":"Javelin","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"bludgeoning"},{"name":"Invisibility","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'dust-mephit', 'Dust Mephit', 'Small', 'elemental',
  12, 17, '5d6', 30,
  5, 14, 10, 9, 11, 10,
  '0.5', 100,
  '[{"name":"Claws","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"slashing"},{"name":"Blinding Breath","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'eagle', 'Eagle', 'Small', 'beast',
  12, 3, '1d6', 10,
  6, 15, 10, 2, 14, 7,
  '0', 10,
  '[{"name":"Talons","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'earth-elemental', 'Earth Elemental', 'Large', 'elemental',
  17, 126, '12d10', 30,
  20, 8, 20, 5, 10, 5,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":8,"damage_dice":"2d8+5","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'efreeti', 'Efreeti', 'Large', 'elemental',
  17, 200, '16d10', 40,
  22, 12, 24, 16, 15, 16,
  '11', 7200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Scimitar","attack_bonus":10,"damage_dice":"2d6+6","damage_type":"slashing"},{"name":"Hurl Flame","attack_bonus":7,"damage_dice":"5d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'elephant', 'Elephant', 'Huge', 'beast',
  12, 76, '8d12', 40,
  22, 9, 17, 3, 11, 6,
  '4', 1100,
  '[{"name":"Gore","attack_bonus":8,"damage_dice":"3d8+6","damage_type":"piercing"},{"name":"Stomp","attack_bonus":8,"damage_dice":"3d10+6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'elk', 'Elk', 'Large', 'beast',
  10, 13, '2d10', 50,
  16, 10, 12, 2, 10, 6,
  '0.25', 50,
  '[{"name":"Ram","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"bludgeoning"},{"name":"Hooves","attack_bonus":5,"damage_dice":"2d4+3","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'erinyes', 'Erinyes', 'Medium', 'fiend',
  18, 153, '18d8', 30,
  18, 16, 18, 14, 14, 18,
  '12', 8400,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Longsword","attack_bonus":8,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Longbow","attack_bonus":7,"damage_dice":"1d8+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ettercap', 'Ettercap', 'Medium', 'monstrosity',
  13, 44, '8d8', 30,
  14, 15, 13, 7, 12, 8,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":4,"damage_dice":"2d6+2","damage_type":"piercing"},{"name":"Claws","attack_bonus":4,"damage_dice":"2d4+2","damage_type":"bludgeoning"},{"name":"Web","attack_bonus":4,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ettin', 'Ettin', 'Large', 'giant',
  12, 85, '10d10', 40,
  21, 8, 17, 6, 10, 8,
  '4', 1100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Battleaxe","attack_bonus":7,"damage_dice":"2d8+5","damage_type":"slashing"},{"name":"Morningstar","attack_bonus":7,"damage_dice":"2d8+5","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'fire-elemental', 'Fire Elemental', 'Large', 'elemental',
  13, 102, '12d10', 50,
  10, 17, 16, 6, 10, 7,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Touch","attack_bonus":6,"damage_dice":"2d6+3","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'fire-giant', 'Fire Giant', 'Huge', 'giant',
  18, 162, '13d12', 30,
  25, 9, 23, 10, 14, 13,
  '9', 5000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Greatsword","attack_bonus":11,"damage_dice":"6d6+7","damage_type":"slashing"},{"name":"Rock","attack_bonus":11,"damage_dice":"4d10+7","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'flesh-golem', 'Flesh Golem', 'Medium', 'construct',
  9, 93, '11d8', 30,
  19, 9, 18, 6, 10, 5,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":7,"damage_dice":"2d8+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'flying-snake', 'Flying Snake', 'Tiny', 'beast',
  14, 5, '2d4', 30,
  4, 18, 11, 2, 12, 5,
  '0.125', 25,
  '[{"name":"Bite","attack_bonus":6,"damage_dice":"1","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'flying-sword', 'Flying Sword', 'Small', 'construct',
  17, 17, '5d6', 30,
  12, 15, 11, 1, 5, 1,
  '0.25', 50,
  '[{"name":"Longsword","attack_bonus":3,"damage_dice":"1d8+1","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'frog', 'Frog', 'Tiny', 'beast',
  11, 1, '1d4', 20,
  1, 13, 8, 1, 8, 3,
  '0', 0,
  '[]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'frost-giant', 'Frost Giant', 'Huge', 'giant',
  15, 138, '12d12', 40,
  23, 9, 21, 9, 10, 12,
  '8', 3900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Greataxe","attack_bonus":9,"damage_dice":"3d12+6","damage_type":"slashing"},{"name":"Rock","attack_bonus":9,"damage_dice":"4d10+6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'gargoyle', 'Gargoyle', 'Medium', 'elemental',
  15, 52, '7d8', 30,
  15, 11, 16, 6, 11, 7,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Claws","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'gelatinous-cube', 'Gelatinous Cube', 'Large', 'ooze',
  6, 84, '8d10', 15,
  14, 3, 20, 1, 6, 1,
  '2', 450,
  '[{"name":"Pseudopod","attack_bonus":4,"damage_dice":"3d6","damage_type":"acid"},{"name":"Engulf","attack_bonus":0,"damage_dice":"3d6","damage_type":"acid"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ghast', 'Ghast', 'Medium', 'undead',
  13, 36, '8d8', 30,
  16, 17, 10, 11, 10, 8,
  '2', 450,
  '[{"name":"Bite","attack_bonus":3,"damage_dice":"2d8+3","damage_type":"piercing"},{"name":"Claws","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ghost', 'Ghost', 'Medium', 'undead',
  11, 45, '10d8', 30,
  7, 13, 10, 10, 12, 17,
  '4', 1100,
  '[{"name":"Withering Touch","attack_bonus":5,"damage_dice":"4d6+3","damage_type":"necrotic"},{"name":"Etherealness","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Horrifying Visage","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Possession","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ghoul', 'Ghoul', 'Medium', 'undead',
  12, 22, '5d8', 30,
  13, 15, 10, 7, 10, 6,
  '1', 200,
  '[{"name":"Bite","attack_bonus":2,"damage_dice":"2d6+2","damage_type":"piercing"},{"name":"Claws","attack_bonus":4,"damage_dice":"2d4+2","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-ape', 'Giant Ape', 'Huge', 'beast',
  12, 157, '15d12', 40,
  23, 14, 18, 7, 12, 7,
  '7', 2900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Fist","attack_bonus":9,"damage_dice":"3d10+6","damage_type":"bludgeoning"},{"name":"Rock","attack_bonus":9,"damage_dice":"7d6+6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-badger', 'Giant Badger', 'Medium', 'beast',
  10, 13, '2d8', 30,
  13, 10, 15, 2, 12, 5,
  '0.25', 50,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"piercing"},{"name":"Claws","attack_bonus":3,"damage_dice":"2d4+1","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-bat', 'Giant Bat', 'Large', 'beast',
  13, 22, '4d10', 10,
  15, 16, 11, 2, 12, 6,
  '0.25', 50,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-boar', 'Giant Boar', 'Large', 'beast',
  12, 42, '5d10', 40,
  17, 10, 16, 2, 7, 5,
  '2', 450,
  '[{"name":"Tusk","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-centipede', 'Giant Centipede', 'Small', 'beast',
  13, 4, '1d6', 30,
  5, 14, 12, 1, 7, 3,
  '0.25', 50,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-constrictor-snake', 'Giant Constrictor Snake', 'Huge', 'beast',
  12, 60, '8d12', 30,
  19, 14, 12, 1, 10, 3,
  '2', 450,
  '[{"name":"Bite","attack_bonus":6,"damage_dice":"2d6+4","damage_type":"piercing"},{"name":"Constrict","attack_bonus":6,"damage_dice":"2d8+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-crab', 'Giant Crab', 'Medium', 'beast',
  15, 13, '3d8', 30,
  13, 15, 11, 1, 9, 3,
  '0.125', 25,
  '[{"name":"Claw","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-crocodile', 'Giant Crocodile', 'Huge', 'beast',
  14, 85, '9d12', 30,
  21, 9, 17, 2, 10, 7,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":8,"damage_dice":"3d10+5","damage_type":"piercing"},{"name":"Tail","attack_bonus":8,"damage_dice":"2d8+5","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-eagle', 'Giant Eagle', 'Large', 'beast',
  13, 26, '4d10', 10,
  16, 17, 13, 8, 14, 10,
  '1', 200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Beak","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"piercing"},{"name":"Talons","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-elk', 'Giant Elk', 'Huge', 'beast',
  14, 42, '5d12', 60,
  19, 16, 14, 7, 14, 10,
  '2', 450,
  '[{"name":"Ram","attack_bonus":6,"damage_dice":"2d6+4","damage_type":"bludgeoning"},{"name":"Hooves","attack_bonus":6,"damage_dice":"4d8+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-fire-beetle', 'Giant Fire Beetle', 'Small', 'beast',
  13, 4, '1d6', 30,
  8, 10, 12, 1, 7, 3,
  '0', 10,
  '[{"name":"Bite","attack_bonus":1,"damage_dice":"1d6-1","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-frog', 'Giant Frog', 'Medium', 'beast',
  11, 18, '4d8', 30,
  12, 13, 11, 2, 10, 3,
  '0.25', 50,
  '[{"name":"Bite","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"piercing"},{"name":"Swallow","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-goat', 'Giant Goat', 'Large', 'beast',
  11, 19, '3d10', 40,
  17, 11, 12, 3, 12, 6,
  '0.5', 100,
  '[{"name":"Ram","attack_bonus":5,"damage_dice":"2d4+3","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-hyena', 'Giant Hyena', 'Large', 'beast',
  12, 45, '6d10', 50,
  16, 14, 14, 2, 12, 7,
  '1', 200,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-lizard', 'Giant Lizard', 'Large', 'beast',
  12, 19, '3d10', 30,
  15, 12, 13, 2, 10, 5,
  '0.25', 50,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-octopus', 'Giant Octopus', 'Large', 'beast',
  11, 52, '8d10', 10,
  17, 13, 13, 4, 10, 4,
  '1', 200,
  '[{"name":"Tentacles","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"bludgeoning"},{"name":"Ink Cloud","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-owl', 'Giant Owl', 'Large', 'beast',
  12, 19, '3d10', 5,
  13, 15, 12, 8, 13, 10,
  '0.25', 50,
  '[{"name":"Talons","attack_bonus":3,"damage_dice":"2d6+1","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-poisonous-snake', 'Giant Poisonous Snake', 'Medium', 'beast',
  14, 11, '2d8', 30,
  10, 18, 13, 2, 10, 3,
  '0.25', 50,
  '[{"name":"Bite","attack_bonus":6,"damage_dice":"1d4+4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-rat', 'Giant Rat', 'Small', 'beast',
  12, 7, '2d6', 30,
  7, 15, 11, 2, 10, 4,
  '0.125', 25,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-rat-diseased', 'Giant Rat (Diseased)', 'Small', 'beast',
  12, 7, '2d6', 30,
  7, 15, 11, 2, 10, 4,
  '0.125', 25,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-scorpion', 'Giant Scorpion', 'Large', 'beast',
  15, 52, '7d10', 40,
  15, 13, 15, 1, 9, 3,
  '3', 700,
  '[{"name":"Claw","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"bludgeoning"},{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Sting","attack_bonus":4,"damage_dice":"1d10+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-sea-horse', 'Giant Sea Horse', 'Large', 'beast',
  13, 16, '3d10', 30,
  12, 15, 11, 2, 12, 5,
  '0.5', 100,
  '[{"name":"Ram","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-shark', 'Giant Shark', 'Huge', 'beast',
  13, 126, '11d12', 30,
  23, 11, 21, 1, 10, 5,
  '5', 1800,
  '[{"name":"Bite","attack_bonus":9,"damage_dice":"3d10+6","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-spider', 'Giant Spider', 'Large', 'beast',
  14, 26, '4d10', 30,
  14, 16, 12, 2, 11, 4,
  '1', 200,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1d8+3","damage_type":"piercing"},{"name":"Web","attack_bonus":5,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-toad', 'Giant Toad', 'Large', 'beast',
  11, 39, '6d10', 20,
  15, 13, 13, 2, 10, 3,
  '1', 200,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d10+2","damage_type":"piercing"},{"name":"Swallow","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-vulture', 'Giant Vulture', 'Large', 'beast',
  10, 22, '3d10', 10,
  15, 10, 15, 6, 12, 7,
  '1', 200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Beak","attack_bonus":4,"damage_dice":"2d4+2","damage_type":"piercing"},{"name":"Talons","attack_bonus":4,"damage_dice":"2d6+2","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-wasp', 'Giant Wasp', 'Medium', 'beast',
  12, 13, '3d8', 10,
  10, 14, 10, 1, 10, 3,
  '0.5', 100,
  '[{"name":"Sting","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-weasel', 'Giant Weasel', 'Medium', 'beast',
  13, 9, '2d8', 40,
  11, 16, 10, 4, 12, 5,
  '0.125', 25,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1d4+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'giant-wolf-spider', 'Giant Wolf Spider', 'Medium', 'beast',
  13, 11, '2d8', 40,
  12, 16, 13, 3, 12, 4,
  '0.25', 50,
  '[{"name":"Bite","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'gibbering-mouther', 'Gibbering Mouther', 'Medium', 'aberration',
  9, 67, '9d8', 10,
  10, 8, 16, 3, 10, 6,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bites","attack_bonus":2,"damage_dice":"5d6","damage_type":"bludgeoning"},{"name":"Blinding Spittle","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'glabrezu', 'Glabrezu', 'Large', 'fiend',
  17, 157, '15d10', 40,
  20, 15, 21, 19, 17, 16,
  '9', 5000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Pincer","attack_bonus":9,"damage_dice":"2d10+5","damage_type":"bludgeoning"},{"name":"Fist","attack_bonus":9,"damage_dice":"2d4+2","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'gladiator', 'Gladiator', 'Medium', 'humanoid',
  16, 112, '15d8', 30,
  18, 15, 16, 10, 12, 15,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Spear","attack_bonus":7,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Shield Bash","attack_bonus":7,"damage_dice":"2d4+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'gnoll', 'Gnoll', 'Medium', 'humanoid',
  15, 22, '5d8', 30,
  14, 12, 11, 6, 10, 7,
  '0.5', 100,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"},{"name":"Spear","attack_bonus":4,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Longbow","attack_bonus":3,"damage_dice":"1d8+1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'goat', 'Goat', 'Medium', 'beast',
  10, 4, '1d8', 40,
  12, 10, 11, 2, 10, 5,
  '0', 10,
  '[{"name":"Ram","attack_bonus":3,"damage_dice":"1d4+1","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'goblin', 'Goblin', 'Small', 'humanoid',
  15, 7, '2d6', 30,
  8, 14, 10, 10, 8, 8,
  '0.25', 50,
  '[{"name":"Scimitar","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"slashing"},{"name":"Shortbow","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'gold-dragon-wyrmling', 'Gold Dragon Wyrmling', 'Medium', 'dragon',
  17, 60, '8d8', 30,
  19, 14, 17, 14, 11, 16,
  '3', 700,
  '[{"name":"Bite","attack_bonus":6,"damage_dice":"1d10+4","damage_type":"piercing"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'gorgon', 'Gorgon', 'Large', 'monstrosity',
  19, 114, '12d10', 40,
  20, 11, 18, 2, 12, 7,
  '5', 1800,
  '[{"name":"Gore","attack_bonus":8,"damage_dice":"2d12+5","damage_type":"piercing"},{"name":"Hooves","attack_bonus":8,"damage_dice":"2d10+5","damage_type":"bludgeoning"},{"name":"Petrifying Breath","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'gray-ooze', 'Gray Ooze', 'Medium', 'ooze',
  8, 22, '3d8', 10,
  12, 6, 16, 1, 6, 2,
  '0.5', 100,
  '[{"name":"Pseudopod","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'green-dragon-wyrmling', 'Green Dragon Wyrmling', 'Medium', 'dragon',
  17, 38, '7d8', 30,
  15, 12, 13, 14, 11, 13,
  '2', 450,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d10+2","damage_type":"piercing"},{"name":"Poison Breath","attack_bonus":0,"damage_dice":"6d6","damage_type":"poison"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'green-hag', 'Green Hag', 'Medium', 'fey',
  17, 82, '11d8', 30,
  18, 12, 16, 13, 14, 14,
  '3', 700,
  '[{"name":"Claws","attack_bonus":6,"damage_dice":"2d8+4","damage_type":"slashing"},{"name":"Illusory Appearance","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Invisible Passage","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'grick', 'Grick', 'Medium', 'monstrosity',
  14, 27, '6d8', 30,
  14, 14, 11, 3, 14, 5,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Tentacles","attack_bonus":4,"damage_dice":"2d6+2","damage_type":"slashing"},{"name":"Beak","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'griffon', 'Griffon', 'Large', 'monstrosity',
  12, 59, '7d10', 30,
  18, 15, 16, 2, 13, 8,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Beak","attack_bonus":6,"damage_dice":"1d8+4","damage_type":"piercing"},{"name":"Claws","attack_bonus":6,"damage_dice":"2d6+4","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'grimlock', 'Grimlock', 'Medium', 'humanoid',
  11, 11, '2d8', 30,
  16, 12, 12, 9, 8, 6,
  '0.25', 50,
  '[{"name":"Spiked Bone Club","attack_bonus":5,"damage_dice":"1d4+3","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'guard', 'Guard', 'Medium', 'humanoid',
  16, 11, '2d8', 30,
  13, 12, 12, 10, 11, 10,
  '0.125', 25,
  '[{"name":"Spear","attack_bonus":3,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'guardian-naga', 'Guardian Naga', 'Large', 'monstrosity',
  18, 127, '15d10', 40,
  19, 18, 16, 16, 19, 18,
  '10', 5900,
  '[{"name":"Bite","attack_bonus":8,"damage_dice":"1d8+4","damage_type":"piercing"},{"name":"Spit Poison","attack_bonus":8,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'gynosphinx', 'Gynosphinx', 'Large', 'monstrosity',
  17, 136, '16d10', 40,
  18, 15, 16, 18, 18, 18,
  '11', 7200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Claw","attack_bonus":9,"damage_dice":"2d8+4","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'half-red-dragon-veteran', 'Half-Red Dragon Veteran', 'Medium', 'humanoid',
  18, 65, '10d8', 30,
  16, 13, 14, 10, 11, 10,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Longsword","attack_bonus":5,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Shortsword","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"piercing"},{"name":"Heavy Crossbow","attack_bonus":3,"damage_dice":"1d10+1","damage_type":"piercing"},{"name":"Fire Breath","attack_bonus":0,"damage_dice":"7d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'harpy', 'Harpy', 'Medium', 'monstrosity',
  11, 38, '7d8', 20,
  12, 13, 12, 7, 10, 13,
  '1', 200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Claws","attack_bonus":3,"damage_dice":"2d4+1","damage_type":"slashing"},{"name":"Club","attack_bonus":3,"damage_dice":"1d4+1","damage_type":"bludgeoning"},{"name":"Luring Song","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'hawk', 'Hawk', 'Tiny', 'beast',
  13, 1, '1d4', 10,
  5, 16, 8, 2, 14, 6,
  '0', 10,
  '[{"name":"Talons","attack_bonus":5,"damage_dice":"1","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'hell-hound', 'Hell Hound', 'Medium', 'fiend',
  15, 45, '7d8', 50,
  17, 12, 14, 6, 13, 6,
  '3', 700,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1d8+3","damage_type":"piercing"},{"name":"Fire Breath","attack_bonus":0,"damage_dice":"6d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'hezrou', 'Hezrou', 'Large', 'fiend',
  16, 136, '13d10', 30,
  19, 17, 20, 5, 12, 13,
  '8', 3900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"2d10+4","damage_type":"piercing"},{"name":"Claws","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'hill-giant', 'Hill Giant', 'Huge', 'giant',
  13, 105, '10d12', 40,
  21, 8, 19, 5, 9, 6,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Greatclub","attack_bonus":8,"damage_dice":"3d8+5","damage_type":"bludgeoning"},{"name":"Rock","attack_bonus":8,"damage_dice":"3d10+5","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'hippogriff', 'Hippogriff', 'Large', 'monstrosity',
  11, 19, '3d10', 40,
  17, 13, 13, 2, 12, 8,
  '1', 200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Beak","attack_bonus":5,"damage_dice":"1d10+3","damage_type":"piercing"},{"name":"Claws","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'hobgoblin', 'Hobgoblin', 'Medium', 'humanoid',
  18, 11, '2d8', 30,
  13, 12, 12, 10, 10, 9,
  '0.5', 100,
  '[{"name":"Longsword","attack_bonus":3,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Longbow","attack_bonus":3,"damage_dice":"1d8+1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'homunculus', 'Homunculus', 'Tiny', 'construct',
  13, 5, '2d4', 20,
  4, 15, 11, 10, 10, 7,
  '0', 10,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'horned-devil', 'Horned Devil', 'Large', 'fiend',
  18, 178, '17d10', 20,
  22, 17, 21, 12, 16, 17,
  '11', 7200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Fork","attack_bonus":10,"damage_dice":"2d8+6","damage_type":"piercing"},{"name":"Tail","attack_bonus":10,"damage_dice":"1d8+6","damage_type":"piercing"},{"name":"Hurl Flame","attack_bonus":7,"damage_dice":"4d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'hunter-shark', 'Hunter Shark', 'Large', 'beast',
  12, 45, '6d10', 30,
  18, 13, 15, 1, 10, 4,
  '2', 450,
  '[{"name":"Bite","attack_bonus":6,"damage_dice":"2d8+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'hydra', 'Hydra', 'Huge', 'monstrosity',
  15, 172, '15d12', 30,
  20, 12, 20, 2, 10, 7,
  '8', 3900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":8,"damage_dice":"1d10+5","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'hyena', 'Hyena', 'Medium', 'beast',
  11, 5, '1d8', 50,
  11, 13, 12, 2, 12, 5,
  '0', 10,
  '[{"name":"Bite","attack_bonus":2,"damage_dice":"1d6","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ice-devil', 'Ice Devil', 'Large', 'fiend',
  18, 180, '19d10', 40,
  21, 14, 18, 18, 15, 18,
  '14', 11500,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":10,"damage_dice":"2d6+5","damage_type":"piercing"},{"name":"Claws","attack_bonus":10,"damage_dice":"2d4+5","damage_type":"slashing"},{"name":"Tail","attack_bonus":10,"damage_dice":"2d6+5","damage_type":"bludgeoning"},{"name":"Wall of Ice","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ice-mephit', 'Ice Mephit', 'Small', 'elemental',
  11, 21, '6d6', 30,
  7, 13, 10, 9, 11, 12,
  '0.5', 100,
  '[{"name":"Claws","attack_bonus":3,"damage_dice":"1d4+1","damage_type":"slashing"},{"name":"Frost Breath","attack_bonus":0,"damage_dice":"2d4","damage_type":"cold"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'imp', 'Imp', 'Tiny', 'fiend',
  13, 10, '3d4', 20,
  6, 17, 13, 11, 12, 14,
  '1', 200,
  '[{"name":"Sting (Bite in Beast Form)","attack_bonus":5,"damage_dice":"1d4+3","damage_type":"piercing"},{"name":"Invisibility","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'invisible-stalker', 'Invisible Stalker', 'Medium', 'elemental',
  14, 104, '16d8', 50,
  16, 19, 14, 10, 15, 11,
  '6', 2300,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":6,"damage_dice":"2d6+3","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'iron-golem', 'Iron Golem', 'Large', 'construct',
  20, 210, '20d10', 30,
  24, 9, 20, 3, 11, 1,
  '16', 15000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":13,"damage_dice":"3d8+7","damage_type":"bludgeoning"},{"name":"Sword","attack_bonus":13,"damage_dice":"3d10+7","damage_type":"slashing"},{"name":"Poison Breath","attack_bonus":0,"damage_dice":"10d8","damage_type":"poison"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'jackal', 'Jackal', 'Small', 'beast',
  12, 3, '1d6', 40,
  8, 15, 11, 3, 12, 6,
  '0', 10,
  '[{"name":"Bite","attack_bonus":1,"damage_dice":"1d4-1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'killer-whale', 'Killer Whale', 'Huge', 'beast',
  12, 90, '12d12', 30,
  19, 10, 13, 3, 12, 7,
  '3', 700,
  '[{"name":"Bite","attack_bonus":6,"damage_dice":"5d6+4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'knight', 'Knight', 'Medium', 'humanoid',
  18, 52, '8d8', 30,
  16, 11, 14, 11, 11, 15,
  '3', 700,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Greatsword","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"slashing"},{"name":"Heavy Crossbow","attack_bonus":2,"damage_dice":"1d10","damage_type":"piercing"},{"name":"Leadership","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'kobold', 'Kobold', 'Small', 'humanoid',
  12, 5, '2d6', 30,
  7, 15, 9, 8, 7, 8,
  '0.125', 25,
  '[{"name":"Dagger","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"},{"name":"Sling","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'kraken', 'Kraken', 'Gargantuan', 'monstrosity',
  18, 472, '27d20', 20,
  30, 11, 25, 22, 18, 20,
  '23', 50000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"3d8+10","damage_type":"piercing"},{"name":"Tentacle","attack_bonus":7,"damage_dice":"3d6+10","damage_type":"bludgeoning"},{"name":"Fling","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Lightning Storm","attack_bonus":0,"damage_dice":"4d10","damage_type":"lightning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'lamia', 'Lamia', 'Large', 'monstrosity',
  13, 97, '13d10', 30,
  16, 13, 15, 14, 15, 16,
  '4', 1100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Claws","attack_bonus":5,"damage_dice":"2d10+3","damage_type":"slashing"},{"name":"Dagger","attack_bonus":5,"damage_dice":"1d4+3","damage_type":"piercing"},{"name":"Intoxicating Touch","attack_bonus":5,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'lemure', 'Lemure', 'Medium', 'fiend',
  7, 13, '3d8', 15,
  10, 5, 11, 1, 11, 3,
  '0', 10,
  '[{"name":"Fist","attack_bonus":3,"damage_dice":"1d4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'lich', 'Lich', 'Medium', 'undead',
  17, 135, '18d8', 30,
  11, 16, 16, 20, 14, 16,
  '21', 33000,
  '[{"name":"Paralyzing Touch","attack_bonus":12,"damage_dice":"3d6","damage_type":"cold"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'lion', 'Lion', 'Large', 'beast',
  12, 26, '4d10', 50,
  17, 15, 13, 3, 12, 8,
  '1', 200,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1d8+3","damage_type":"piercing"},{"name":"Claw","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'lizard', 'Lizard', 'Tiny', 'beast',
  10, 2, '1d4', 20,
  2, 11, 10, 1, 8, 3,
  '0', 10,
  '[{"name":"Bite","attack_bonus":0,"damage_dice":"1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'lizardfolk', 'Lizardfolk', 'Medium', 'humanoid',
  13, 22, '4d8', 30,
  15, 10, 13, 7, 12, 7,
  '0.5', 100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Heavy Club","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"bludgeoning"},{"name":"Javelin","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Spiked Shield","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'mage', 'Mage', 'Medium', 'humanoid',
  12, 40, '9d8', 30,
  9, 14, 11, 17, 12, 11,
  '6', 2300,
  '[{"name":"Dagger","attack_bonus":5,"damage_dice":"1d4+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'magma-mephit', 'Magma Mephit', 'Small', 'elemental',
  11, 22, '5d6', 30,
  8, 12, 12, 7, 10, 10,
  '0.5', 100,
  '[{"name":"Claws","attack_bonus":3,"damage_dice":"1d4+1","damage_type":"slashing"},{"name":"Fire Breath","attack_bonus":0,"damage_dice":"2d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'magmin', 'Magmin', 'Small', 'elemental',
  14, 9, '2d6', 30,
  7, 15, 12, 8, 11, 10,
  '0.5', 100,
  '[{"name":"Touch","attack_bonus":4,"damage_dice":"2d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'mammoth', 'Mammoth', 'Huge', 'beast',
  13, 126, '11d12', 40,
  24, 9, 21, 3, 11, 6,
  '6', 2300,
  '[{"name":"Gore","attack_bonus":10,"damage_dice":"4d8+7","damage_type":"piercing"},{"name":"Stomp","attack_bonus":10,"damage_dice":"4d10+7","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'manticore', 'Manticore', 'Large', 'monstrosity',
  14, 68, '8d10', 30,
  17, 16, 17, 7, 12, 8,
  '3', 700,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":5,"damage_dice":"1d8+3","damage_type":"piercing"},{"name":"Claw","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"slashing"},{"name":"Tail Spike","attack_bonus":5,"damage_dice":"1d8+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'marilith', 'Marilith', 'Large', 'fiend',
  18, 189, '18d10', 40,
  18, 20, 20, 18, 16, 20,
  '16', 15000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Longsword","attack_bonus":9,"damage_dice":"2d8+4","damage_type":"slashing"},{"name":"Tail","attack_bonus":9,"damage_dice":"2d10+4","damage_type":"bludgeoning"},{"name":"Teleport","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'mastiff', 'Mastiff', 'Medium', 'beast',
  12, 5, '1d8', 40,
  13, 14, 12, 3, 12, 7,
  '0.125', 25,
  '[{"name":"Bite","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'medusa', 'Medusa', 'Medium', 'monstrosity',
  15, 127, '17d8', 30,
  10, 15, 16, 12, 13, 15,
  '6', 2300,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Snake Hair","attack_bonus":5,"damage_dice":"1d4+2","damage_type":"piercing"},{"name":"Shortsword","attack_bonus":5,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Longbow","attack_bonus":5,"damage_dice":"1d8+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'merfolk', 'Merfolk', 'Medium', 'humanoid',
  11, 11, '2d8', 10,
  10, 13, 12, 11, 11, 12,
  '0.125', 25,
  '[{"name":"Spear","attack_bonus":2,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'merrow', 'Merrow', 'Large', 'monstrosity',
  13, 45, '6d10', 10,
  18, 10, 15, 8, 10, 9,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":6,"damage_dice":"1d8+4","damage_type":"piercing"},{"name":"Claws","attack_bonus":6,"damage_dice":"2d4+4","damage_type":"slashing"},{"name":"Harpoon","attack_bonus":6,"damage_dice":"2d6+4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'mimic', 'Mimic', 'Medium', 'monstrosity',
  12, 58, '9d8', 15,
  17, 12, 15, 5, 13, 8,
  '2', 450,
  '[{"name":"Pseudopod","attack_bonus":5,"damage_dice":"1d8+3","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":5,"damage_dice":"1d8+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'minotaur', 'Minotaur', 'Large', 'monstrosity',
  14, 76, '9d10', 40,
  18, 11, 16, 6, 16, 9,
  '3', 700,
  '[{"name":"Greataxe","attack_bonus":6,"damage_dice":"2d12+4","damage_type":"slashing"},{"name":"Gore","attack_bonus":6,"damage_dice":"2d8+4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'minotaur-skeleton', 'Minotaur Skeleton', 'Large', 'undead',
  12, 67, '9d10', 40,
  18, 11, 15, 6, 8, 5,
  '2', 450,
  '[{"name":"Greataxe","attack_bonus":6,"damage_dice":"2d12+4","damage_type":"slashing"},{"name":"Gore","attack_bonus":6,"damage_dice":"2d8+4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'mule', 'Mule', 'Medium', 'beast',
  10, 11, '2d8', 40,
  14, 10, 13, 2, 10, 5,
  '0.125', 25,
  '[{"name":"Hooves","attack_bonus":2,"damage_dice":"1d4+2","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'mummy', 'Mummy', 'Medium', 'undead',
  11, 58, '9d8', 20,
  16, 8, 15, 6, 10, 12,
  '3', 700,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Rotting Fist","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"bludgeoning"},{"name":"Dreadful Glare","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'mummy-lord', 'Mummy Lord', 'Medium', 'undead',
  17, 97, '13d8', 20,
  18, 10, 17, 11, 18, 16,
  '15', 13000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Rotting Fist","attack_bonus":9,"damage_dice":"3d6+4","damage_type":"bludgeoning"},{"name":"Dreadful Glare","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'nalfeshnee', 'Nalfeshnee', 'Large', 'fiend',
  18, 184, '16d10', 20,
  21, 10, 22, 19, 12, 15,
  '13', 10000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":10,"damage_dice":"5d10+5","damage_type":"piercing"},{"name":"Claw","attack_bonus":10,"damage_dice":"3d6+5","damage_type":"slashing"},{"name":"Horror Nimbus","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Teleport","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'night-hag', 'Night Hag', 'Medium', 'fiend',
  17, 112, '15d8', 30,
  18, 15, 16, 16, 14, 16,
  '5', 1800,
  '[{"name":"Claws (Hag Form Only)","attack_bonus":7,"damage_dice":"2d8+4","damage_type":"slashing"},{"name":"Change Shape","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Etherealness","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Nightmare Haunting","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'nightmare', 'Nightmare', 'Large', 'fiend',
  13, 68, '8d10', 60,
  18, 15, 16, 10, 13, 15,
  '3', 700,
  '[{"name":"Hooves","attack_bonus":6,"damage_dice":"2d8+4","damage_type":"bludgeoning"},{"name":"Ethereal Stride","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'noble', 'Noble', 'Medium', 'humanoid',
  15, 9, '2d8', 30,
  11, 12, 11, 12, 14, 16,
  '0.125', 25,
  '[{"name":"Rapier","attack_bonus":3,"damage_dice":"1d8+1","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ochre-jelly', 'Ochre Jelly', 'Large', 'ooze',
  8, 45, '6d10', 10,
  15, 6, 14, 2, 6, 1,
  '2', 450,
  '[{"name":"Pseudopod","attack_bonus":4,"damage_dice":"2d6+2","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'octopus', 'Octopus', 'Small', 'beast',
  12, 3, '1d6', 5,
  4, 15, 11, 3, 10, 4,
  '0', 10,
  '[{"name":"Tentacles","attack_bonus":4,"damage_dice":"1","damage_type":"bludgeoning"},{"name":"Ink Cloud","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ogre', 'Ogre', 'Large', 'giant',
  11, 59, '7d10', 40,
  19, 8, 16, 5, 7, 7,
  '2', 450,
  '[{"name":"Greatclub","attack_bonus":6,"damage_dice":"2d8+4","damage_type":"bludgeoning"},{"name":"Javelin","attack_bonus":6,"damage_dice":"2d6+4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'ogre-zombie', 'Ogre Zombie', 'Large', 'undead',
  8, 85, '9d10', 30,
  19, 6, 18, 3, 6, 5,
  '2', 450,
  '[{"name":"Morningstar","attack_bonus":6,"damage_dice":"2d8+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'oni', 'Oni', 'Large', 'giant',
  16, 110, '13d10', 30,
  19, 11, 16, 14, 12, 15,
  '7', 2900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Claw (Oni Form Only)","attack_bonus":7,"damage_dice":"1d8+4","damage_type":"slashing"},{"name":"Glaive","attack_bonus":7,"damage_dice":"2d10+4","damage_type":"slashing"},{"name":"Change Shape","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'orc', 'Orc', 'Medium', 'humanoid',
  13, 15, '2d8', 30,
  16, 12, 16, 7, 11, 10,
  '0.5', 100,
  '[{"name":"Greataxe","attack_bonus":5,"damage_dice":"1d12+3","damage_type":"slashing"},{"name":"Javelin","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'otyugh', 'Otyugh', 'Large', 'aberration',
  14, 114, '12d10', 30,
  16, 11, 19, 6, 13, 6,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":6,"damage_dice":"2d8+3","damage_type":"piercing"},{"name":"Tentacle","attack_bonus":6,"damage_dice":"1d8+3","damage_type":"bludgeoning"},{"name":"Tentacle Slam","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'owl', 'Owl', 'Tiny', 'beast',
  11, 1, '1d4', 5,
  3, 13, 8, 2, 12, 7,
  '0', 10,
  '[{"name":"Talons","attack_bonus":3,"damage_dice":"1","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'owlbear', 'Owlbear', 'Large', 'monstrosity',
  13, 59, '7d10', 40,
  20, 12, 17, 3, 12, 7,
  '3', 700,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Beak","attack_bonus":7,"damage_dice":"1d10+5","damage_type":"piercing"},{"name":"Claws","attack_bonus":7,"damage_dice":"2d8+5","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'panther', 'Panther', 'Medium', 'beast',
  12, 13, '3d8', 50,
  14, 15, 10, 3, 14, 7,
  '0.25', 50,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Claw","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'pegasus', 'Pegasus', 'Large', 'celestial',
  12, 59, '7d10', 60,
  18, 15, 16, 10, 15, 13,
  '2', 450,
  '[{"name":"Hooves","attack_bonus":6,"damage_dice":"2d6+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'phase-spider', 'Phase Spider', 'Large', 'monstrosity',
  13, 32, '5d10', 30,
  15, 15, 12, 6, 10, 6,
  '3', 700,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d10+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'pit-fiend', 'Pit Fiend', 'Large', 'fiend',
  19, 300, '24d10', 30,
  26, 14, 24, 22, 18, 24,
  '20', 25000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":14,"damage_dice":"4d6+8","damage_type":"piercing"},{"name":"Claw","attack_bonus":14,"damage_dice":"2d8+8","damage_type":"slashing"},{"name":"Mace","attack_bonus":14,"damage_dice":"2d6+8","damage_type":"bludgeoning"},{"name":"Tail","attack_bonus":14,"damage_dice":"3d10+8","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'planetar', 'Planetar', 'Large', 'celestial',
  19, 200, '16d10', 40,
  24, 20, 24, 19, 22, 25,
  '16', 15000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Greatsword","attack_bonus":12,"damage_dice":"4d6+7","damage_type":"slashing"},{"name":"Healing Touch","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'plesiosaurus', 'Plesiosaurus', 'Large', 'beast',
  13, 68, '8d10', 20,
  18, 15, 16, 2, 12, 5,
  '2', 450,
  '[{"name":"Bite","attack_bonus":6,"damage_dice":"3d6+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'poisonous-snake', 'Poisonous Snake', 'Tiny', 'beast',
  13, 2, '1d4', 30,
  2, 16, 11, 1, 10, 3,
  '0.125', 25,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'polar-bear', 'Polar Bear', 'Large', 'beast',
  12, 42, '5d10', 40,
  20, 10, 16, 2, 13, 7,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"1d8+5","damage_type":"piercing"},{"name":"Claws","attack_bonus":7,"damage_dice":"2d6+5","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'pony', 'Pony', 'Medium', 'beast',
  10, 11, '2d8', 40,
  15, 10, 13, 2, 11, 7,
  '0.125', 25,
  '[{"name":"Hooves","attack_bonus":4,"damage_dice":"2d4+2","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'priest', 'Priest', 'Medium', 'humanoid',
  13, 27, '5d8', 25,
  10, 10, 12, 13, 16, 13,
  '2', 450,
  '[{"name":"Mace","attack_bonus":2,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'pseudodragon', 'Pseudodragon', 'Tiny', 'dragon',
  13, 7, '2d4', 15,
  6, 15, 13, 10, 12, 10,
  '0.25', 50,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"},{"name":"Sting","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'purple-worm', 'Purple Worm', 'Gargantuan', 'monstrosity',
  18, 247, '15d20', 50,
  28, 7, 22, 1, 8, 4,
  '15', 13000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":9,"damage_dice":"3d8+9","damage_type":"piercing"},{"name":"Tail Stinger","attack_bonus":9,"damage_dice":"3d6+9","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'quasit', 'Quasit', 'Tiny', 'fiend',
  13, 7, '3d4', 40,
  5, 17, 10, 7, 10, 10,
  '1', 200,
  '[{"name":"Claw (Bite in Beast Form)","attack_bonus":4,"damage_dice":"1d4+3","damage_type":"piercing"},{"name":"Scare","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Invisibility","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'quipper', 'Quipper', 'Tiny', 'beast',
  13, 1, '1d4', 30,
  2, 16, 9, 1, 7, 2,
  '0', 10,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'rakshasa', 'Rakshasa', 'Medium', 'fiend',
  16, 110, '13d8', 40,
  14, 17, 18, 13, 16, 20,
  '13', 10000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Claw","attack_bonus":7,"damage_dice":"2d6+2","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'rat', 'Rat', 'Tiny', 'beast',
  10, 1, '1d4', 20,
  2, 11, 9, 2, 10, 4,
  '0', 10,
  '[{"name":"Bite","attack_bonus":0,"damage_dice":"1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'raven', 'Raven', 'Tiny', 'beast',
  12, 1, '1d4', 10,
  2, 14, 8, 2, 12, 6,
  '0', 10,
  '[{"name":"Beak","attack_bonus":4,"damage_dice":"1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'red-dragon-wyrmling', 'Red Dragon Wyrmling', 'Medium', 'dragon',
  17, 75, '10d8', 30,
  19, 10, 17, 12, 11, 15,
  '4', 1100,
  '[{"name":"Bite","attack_bonus":6,"damage_dice":"1d10+4","damage_type":"piercing"},{"name":"Fire Breath","attack_bonus":0,"damage_dice":"7d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'reef-shark', 'Reef Shark', 'Medium', 'beast',
  12, 22, '4d8', 30,
  14, 13, 13, 1, 10, 4,
  '0.5', 100,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'remorhaz', 'Remorhaz', 'Huge', 'monstrosity',
  17, 195, '17d12', 30,
  24, 13, 21, 4, 10, 5,
  '11', 7200,
  '[{"name":"Bite","attack_bonus":11,"damage_dice":"6d10+7","damage_type":"piercing"},{"name":"Swallow","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'rhinoceros', 'Rhinoceros', 'Large', 'beast',
  11, 45, '6d10', 40,
  21, 8, 15, 2, 12, 6,
  '2', 450,
  '[{"name":"Gore","attack_bonus":7,"damage_dice":"2d8+5","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'riding-horse', 'Riding Horse', 'Large', 'beast',
  10, 13, '2d10', 60,
  16, 10, 12, 2, 11, 7,
  '0.25', 25,
  '[{"name":"Hooves","attack_bonus":5,"damage_dice":"2d4+3","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'roc', 'Roc', 'Gargantuan', 'monstrosity',
  15, 248, '16d20', 20,
  28, 10, 20, 3, 10, 9,
  '11', 7200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Beak","attack_bonus":13,"damage_dice":"4d8+9","damage_type":"piercing"},{"name":"Talons","attack_bonus":13,"damage_dice":"4d6+9","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'roper', 'Roper', 'Large', 'monstrosity',
  20, 93, '11d10', 10,
  18, 8, 17, 7, 16, 6,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"4d8+4","damage_type":"piercing"},{"name":"Tendril","attack_bonus":7,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Reel","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'rug-of-smothering', 'Rug of Smothering', 'Large', 'construct',
  12, 33, '6d10', 10,
  17, 14, 10, 1, 3, 1,
  '2', 450,
  '[{"name":"Smother","attack_bonus":5,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'rust-monster', 'Rust Monster', 'Medium', 'monstrosity',
  14, 27, '5d8', 40,
  13, 12, 13, 2, 13, 6,
  '0.5', 100,
  '[{"name":"Bite","attack_bonus":3,"damage_dice":"1d8+1","damage_type":"piercing"},{"name":"Antennae","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'saber-toothed-tiger', 'Saber-Toothed Tiger', 'Large', 'beast',
  12, 52, '7d10', 40,
  18, 14, 15, 3, 12, 8,
  '2', 450,
  '[{"name":"Bite","attack_bonus":6,"damage_dice":"1d10+5","damage_type":"piercing"},{"name":"Claw","attack_bonus":6,"damage_dice":"2d6+5","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'sahuagin', 'Sahuagin', 'Medium', 'humanoid',
  12, 22, '4d8', 30,
  13, 11, 12, 12, 13, 9,
  '0.5', 100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":3,"damage_dice":"1d4+1","damage_type":"piercing"},{"name":"Claws","attack_bonus":3,"damage_dice":"1d4+1","damage_type":"slashing"},{"name":"Spear","attack_bonus":3,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'salamander', 'Salamander', 'Large', 'elemental',
  15, 90, '12d10', 30,
  18, 14, 15, 11, 10, 12,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Spear","attack_bonus":7,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Tail","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'satyr', 'Satyr', 'Medium', 'fey',
  14, 31, '7d8', 40,
  12, 16, 11, 12, 10, 14,
  '0.5', 100,
  '[{"name":"Ram","attack_bonus":3,"damage_dice":"2d4+1","damage_type":"bludgeoning"},{"name":"Shortsword","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"piercing"},{"name":"Shortbow","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'scorpion', 'Scorpion', 'Tiny', 'beast',
  11, 1, '1d4', 10,
  2, 11, 8, 1, 8, 2,
  '0', 10,
  '[{"name":"Sting","attack_bonus":2,"damage_dice":"1","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'scout', 'Scout', 'Medium', 'humanoid',
  13, 16, '3d8', 30,
  11, 14, 12, 11, 13, 11,
  '0.5', 100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Shortsword","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Longbow","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'sea-hag', 'Sea Hag', 'Medium', 'fey',
  14, 52, '7d8', 30,
  16, 13, 16, 12, 12, 13,
  '2', 450,
  '[{"name":"Claws","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"slashing"},{"name":"Death Glare","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Illusory Appearance","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'sea-horse', 'Sea Horse', 'Tiny', 'beast',
  11, 1, '1d4', 30,
  1, 12, 8, 1, 10, 2,
  '0', 0,
  '[]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'shadow', 'Shadow', 'Medium', 'undead',
  12, 16, '3d8', 40,
  6, 14, 13, 6, 10, 8,
  '0.5', 100,
  '[{"name":"Strength Drain","attack_bonus":4,"damage_dice":"2d6+2","damage_type":"necrotic"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'shambling-mound', 'Shambling Mound', 'Large', 'plant',
  15, 136, '16d10', 20,
  18, 8, 16, 5, 10, 5,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":7,"damage_dice":"2d8+4","damage_type":"bludgeoning"},{"name":"Engulf","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'shield-guardian', 'Shield Guardian', 'Large', 'construct',
  17, 142, '15d10', 30,
  18, 8, 18, 7, 10, 3,
  '7', 2900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Fist","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'shrieker', 'Shrieker', 'Medium', 'plant',
  5, 13, '3d8', 30,
  1, 1, 10, 1, 3, 1,
  '0', 10,
  '[]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'silver-dragon-wyrmling', 'Silver Dragon Wyrmling', 'Medium', 'dragon',
  17, 45, '6d8', 30,
  19, 10, 17, 12, 11, 15,
  '2', 450,
  '[{"name":"Bite","attack_bonus":6,"damage_dice":"1d10+4","damage_type":"piercing"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'skeleton', 'Skeleton', 'Medium', 'undead',
  13, 13, '2d8', 30,
  10, 14, 15, 6, 8, 5,
  '0.25', 50,
  '[{"name":"Shortsword","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Shortbow","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'solar', 'Solar', 'Large', 'celestial',
  21, 243, '18d10', 50,
  26, 22, 26, 25, 25, 30,
  '21', 33000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Greatsword","attack_bonus":15,"damage_dice":"4d6+8","damage_type":"radiant"},{"name":"Slaying Longbow","attack_bonus":13,"damage_dice":"2d8+6","damage_type":"piercing"},{"name":"Flying Sword","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Healing Touch","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'specter', 'Specter', 'Medium', 'undead',
  12, 22, '5d8', 30,
  1, 14, 11, 10, 10, 11,
  '1', 200,
  '[{"name":"Life Drain","attack_bonus":4,"damage_dice":"3d6","damage_type":"necrotic"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'spider', 'Spider', 'Tiny', 'beast',
  12, 1, '1d4', 20,
  2, 14, 8, 1, 10, 2,
  '0', 10,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'spirit-naga', 'Spirit Naga', 'Large', 'monstrosity',
  15, 75, '10d10', 40,
  18, 17, 14, 16, 15, 16,
  '8', 3900,
  '[{"name":"Bite","attack_bonus":7,"damage_dice":"1d6+4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'sprite', 'Sprite', 'Tiny', 'fey',
  15, 2, '1d4', 10,
  3, 18, 10, 14, 13, 11,
  '0.25', 50,
  '[{"name":"Longsword","attack_bonus":2,"damage_dice":"1","damage_type":"slashing"},{"name":"Shortbow","attack_bonus":6,"damage_dice":"1","damage_type":"piercing"},{"name":"Heart Sight","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Invisibility","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'spy', 'Spy', 'Medium', 'humanoid',
  12, 27, '6d8', 30,
  10, 15, 10, 12, 14, 16,
  '1', 200,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Shortsword","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Hand Crossbow","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'steam-mephit', 'Steam Mephit', 'Small', 'elemental',
  10, 21, '6d6', 30,
  5, 11, 10, 11, 10, 12,
  '0.25', 50,
  '[{"name":"Claws","attack_bonus":2,"damage_dice":"1d4","damage_type":"slashing"},{"name":"Steam Breath","attack_bonus":0,"damage_dice":"1d8","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'stirge', 'Stirge', 'Tiny', 'beast',
  14, 2, '1d4', 10,
  4, 16, 11, 2, 8, 6,
  '0.125', 25,
  '[{"name":"Blood Drain","attack_bonus":5,"damage_dice":"1d4+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'stone-giant', 'Stone Giant', 'Huge', 'giant',
  17, 126, '11d12', 40,
  23, 15, 20, 10, 12, 9,
  '7', 2900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Greatclub","attack_bonus":9,"damage_dice":"3d8+6","damage_type":"bludgeoning"},{"name":"Rock","attack_bonus":9,"damage_dice":"4d10+6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'stone-golem', 'Stone Golem', 'Large', 'construct',
  17, 178, '17d10', 30,
  22, 9, 20, 3, 11, 1,
  '10', 5900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":10,"damage_dice":"3d8+6","damage_type":"bludgeoning"},{"name":"Slow","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'storm-giant', 'Storm Giant', 'Huge', 'giant',
  16, 230, '20d12', 50,
  29, 14, 20, 16, 18, 18,
  '13', 10000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Greatsword","attack_bonus":14,"damage_dice":"6d6+9","damage_type":"slashing"},{"name":"Rock","attack_bonus":14,"damage_dice":"4d12+9","damage_type":"bludgeoning"},{"name":"Lightning Strike","attack_bonus":0,"damage_dice":"12d8","damage_type":"lightning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'succubus-incubus', 'Succubus/Incubus', 'Medium', 'fiend',
  15, 66, '12d8', 30,
  8, 17, 13, 15, 12, 20,
  '4', 1100,
  '[{"name":"Claw (Fiend Form Only)","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"slashing"},{"name":"Charm","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Draining Kiss","attack_bonus":0,"damage_dice":"5d10+5","damage_type":"psychic"},{"name":"Etherealness","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'swarm-of-bats', 'Swarm of Bats', 'Medium', 'swarm of Tiny beasts',
  12, 22, '5d8', 30,
  5, 15, 10, 2, 12, 4,
  '0.25', 50,
  '[{"name":"Bites","attack_bonus":4,"damage_dice":"2d4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'swarm-of-beetles', 'Swarm of Beetles', 'Medium', 'swarm of Tiny beasts',
  12, 22, '5d8', 20,
  3, 13, 10, 1, 7, 1,
  '0.5', 100,
  '[{"name":"Bites","attack_bonus":3,"damage_dice":"4d4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'swarm-of-centipedes', 'Swarm of Centipedes', 'Medium', 'swarm of Tiny beasts',
  12, 22, '5d8', 20,
  3, 13, 10, 1, 7, 1,
  '0.5', 100,
  '[{"name":"Bites","attack_bonus":3,"damage_dice":"4d4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'swarm-of-insects', 'Swarm of Insects', 'Medium', 'swarm of Tiny beasts',
  12, 22, '5d8', 20,
  3, 13, 10, 1, 7, 1,
  '0.5', 100,
  '[{"name":"Bites","attack_bonus":3,"damage_dice":"4d4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'swarm-of-poisonous-snakes', 'Swarm of Poisonous Snakes', 'Medium', 'swarm of Tiny beasts',
  14, 36, '8d8', 30,
  8, 18, 11, 1, 10, 3,
  '2', 450,
  '[{"name":"Bites","attack_bonus":6,"damage_dice":"2d6","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'swarm-of-quippers', 'Swarm of Quippers', 'Medium', 'swarm of Tiny beasts',
  13, 28, '8d8', 30,
  13, 16, 9, 1, 7, 2,
  '1', 200,
  '[{"name":"Bites","attack_bonus":5,"damage_dice":"4d6","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'swarm-of-rats', 'Swarm of Rats', 'Medium', 'swarm of Tiny beasts',
  10, 24, '7d8', 30,
  9, 11, 9, 2, 10, 3,
  '0.25', 50,
  '[{"name":"Bites","attack_bonus":2,"damage_dice":"2d6","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'swarm-of-ravens', 'Swarm of Ravens', 'Medium', 'swarm of Tiny beasts',
  12, 24, '7d8', 10,
  6, 14, 8, 3, 12, 6,
  '0.25', 50,
  '[{"name":"Beaks","attack_bonus":4,"damage_dice":"2d6","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'swarm-of-spiders', 'Swarm of Spiders', 'Medium', 'swarm of Tiny beasts',
  12, 22, '5d8', 20,
  3, 13, 10, 1, 7, 1,
  '0.5', 100,
  '[{"name":"Bites","attack_bonus":3,"damage_dice":"4d4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'swarm-of-wasps', 'Swarm of Wasps', 'Medium', 'swarm of Tiny beasts',
  12, 22, '5d8', 5,
  3, 13, 10, 1, 7, 1,
  '0.5', 100,
  '[{"name":"Bites","attack_bonus":3,"damage_dice":"4d4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'tarrasque', 'Tarrasque', 'Gargantuan', 'monstrosity',
  25, 676, '33d20', 40,
  30, 11, 30, 3, 11, 11,
  '30', 155000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":19,"damage_dice":"4d12+10","damage_type":"piercing"},{"name":"Claw","attack_bonus":19,"damage_dice":"4d8+10","damage_type":"slashing"},{"name":"Horns","attack_bonus":19,"damage_dice":"4d10+10","damage_type":"piercing"},{"name":"Tail","attack_bonus":19,"damage_dice":"4d6+10","damage_type":"bludgeoning"},{"name":"Frightful Presence","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Swallow","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'thug', 'Thug', 'Medium', 'humanoid',
  11, 32, '5d8', 30,
  15, 11, 14, 10, 10, 11,
  '0.5', 100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Mace","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"bludgeoning"},{"name":"Heavy Crossbow","attack_bonus":2,"damage_dice":"1d10","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'tiger', 'Tiger', 'Large', 'beast',
  12, 37, '5d10', 40,
  17, 15, 14, 3, 12, 8,
  '1', 200,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1d10+3","damage_type":"piercing"},{"name":"Claw","attack_bonus":5,"damage_dice":"1d8+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'treant', 'Treant', 'Huge', 'plant',
  16, 138, '12d12', 30,
  23, 8, 21, 12, 16, 12,
  '9', 5000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":10,"damage_dice":"3d6+6","damage_type":"bludgeoning"},{"name":"Rock","attack_bonus":10,"damage_dice":"4d10+6","damage_type":"bludgeoning"},{"name":"Animate Trees","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'tribal-warrior', 'Tribal Warrior', 'Medium', 'humanoid',
  12, 11, '2d8', 30,
  13, 11, 12, 8, 11, 8,
  '0.125', 25,
  '[{"name":"Spear","attack_bonus":3,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'triceratops', 'Triceratops', 'Huge', 'beast',
  13, 95, '10d12', 50,
  22, 9, 17, 2, 11, 5,
  '5', 1800,
  '[{"name":"Gore","attack_bonus":9,"damage_dice":"4d8+6","damage_type":"piercing"},{"name":"Stomp","attack_bonus":9,"damage_dice":"3d10+6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'troll', 'Troll', 'Large', 'giant',
  15, 84, '8d10', 30,
  18, 13, 20, 7, 9, 7,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"1d6+4","damage_type":"piercing"},{"name":"Claw","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'tyrannosaurus-rex', 'Tyrannosaurus Rex', 'Huge', 'beast',
  13, 136, '13d12', 50,
  25, 10, 19, 2, 12, 9,
  '8', 3900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":10,"damage_dice":"4d12+7","damage_type":"piercing"},{"name":"Tail","attack_bonus":10,"damage_dice":"3d8+7","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'unicorn', 'Unicorn', 'Large', 'celestial',
  12, 67, '9d10', 50,
  18, 14, 15, 11, 17, 16,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Hooves","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"bludgeoning"},{"name":"Horn","attack_bonus":7,"damage_dice":"1d8+4","damage_type":"piercing"},{"name":"Healing Touch","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Teleport","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'vampire-bat', 'Vampire, Bat Form', 'Medium', 'undead',
  16, 144, '17d8', 5,
  18, 18, 18, 17, 15, 18,
  '13', 10000,
  '[{"name":"Bite","attack_bonus":9,"damage_dice":"1d6+4","damage_type":"piercing"},{"name":"Charm","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Children of the Night","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'vampire-mist', 'Vampire, Mist Form', 'Medium', 'undead',
  16, 144, '17d8', 30,
  18, 18, 18, 17, 15, 18,
  '13', 10000,
  '[]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'vampire-spawn', 'Vampire Spawn', 'Medium', 'undead',
  15, 82, '11d8', 30,
  16, 16, 16, 11, 10, 12,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":6,"damage_dice":"1d6+3","damage_type":"piercing"},{"name":"Claws","attack_bonus":6,"damage_dice":"2d4+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'vampire-vampire', 'Vampire, Vampire Form', 'Medium', 'undead',
  16, 144, '17d8', 30,
  18, 18, 18, 17, 15, 18,
  '13', 10000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Unarmed Strike","attack_bonus":9,"damage_dice":"1d8+4","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":9,"damage_dice":"1d6+4","damage_type":"piercing"},{"name":"Charm","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Children of the Night","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'veteran', 'Veteran', 'Medium', 'humanoid',
  17, 58, '9d8', 30,
  16, 13, 14, 10, 11, 10,
  '3', 700,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Longsword","attack_bonus":5,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Shortsword","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"piercing"},{"name":"Heavy Crossbow","attack_bonus":3,"damage_dice":"1d10+1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'violet-fungus', 'Violet Fungus', 'Medium', 'plant',
  5, 18, '4d8', 5,
  3, 1, 10, 1, 3, 1,
  '0.25', 50,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Rotting Touch","attack_bonus":2,"damage_dice":"1d8","damage_type":"necrotic"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'vrock', 'Vrock', 'Large', 'fiend',
  15, 104, '11d10', 40,
  17, 15, 18, 8, 13, 8,
  '6', 2300,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Beak","attack_bonus":6,"damage_dice":"2d6+3","damage_type":"piercing"},{"name":"Talons","attack_bonus":6,"damage_dice":"2d10+3","damage_type":"slashing"},{"name":"Spores","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Stunning Screech","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'vulture', 'Vulture', 'Medium', 'beast',
  10, 5, '1d8', 10,
  7, 10, 13, 2, 12, 4,
  '0', 10,
  '[{"name":"Beak","attack_bonus":2,"damage_dice":"1d4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'warhorse', 'Warhorse', 'Large', 'beast',
  11, 19, '3d10', 60,
  18, 12, 13, 2, 12, 7,
  '0.5', 100,
  '[{"name":"Hooves","attack_bonus":6,"damage_dice":"2d6+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'warhorse-skeleton', 'Warhorse Skeleton', 'Large', 'undead',
  13, 22, '3d10', 60,
  18, 12, 15, 2, 8, 5,
  '0.5', 100,
  '[{"name":"Hooves","attack_bonus":6,"damage_dice":"2d6+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'water-elemental', 'Water Elemental', 'Large', 'elemental',
  14, 114, '12d10', 30,
  18, 14, 18, 5, 10, 8,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Slam","attack_bonus":7,"damage_dice":"2d8+4","damage_type":"bludgeoning"},{"name":"Whelm","attack_bonus":0,"damage_dice":"2d8+4","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'weasel', 'Weasel', 'Tiny', 'beast',
  13, 1, '1d4', 30,
  3, 16, 8, 2, 12, 3,
  '0', 10,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'werebear-bear', 'Werebear, Bear Form', 'Medium', 'humanoid',
  11, 135, '18d8', 40,
  19, 10, 17, 11, 12, 12,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"2d10+4","damage_type":"piercing"},{"name":"Claw","attack_bonus":7,"damage_dice":"2d8+4","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'werebear-human', 'Werebear, Human Form', 'Medium', 'humanoid',
  10, 135, '18d8', 30,
  19, 10, 17, 11, 12, 12,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Greataxe","attack_bonus":7,"damage_dice":"1d12+4","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'werebear-hybrid', 'Werebear, Hybrid Form', 'Medium', 'humanoid',
  11, 135, '18d8', 40,
  19, 10, 17, 11, 12, 12,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"2d10+4","damage_type":"piercing"},{"name":"Claw","attack_bonus":7,"damage_dice":"2d8+4","damage_type":"slashing"},{"name":"Greataxe","attack_bonus":7,"damage_dice":"1d12+4","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'wereboar-boar', 'Wereboar, Boar Form', 'Medium', 'humanoid',
  11, 78, '12d8', 40,
  17, 10, 15, 10, 11, 8,
  '4', 1100,
  '[{"name":"Tusks","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'wereboar-human', 'Wereboar, Human Form', 'Medium', 'humanoid',
  10, 78, '12d8', 30,
  17, 10, 15, 10, 11, 8,
  '4', 1100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Maul","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'wereboar-hybrid', 'Wereboar, Hybrid Form', 'Medium', 'humanoid',
  11, 78, '12d8', 30,
  17, 10, 15, 10, 11, 8,
  '4', 1100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Maul","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"bludgeoning"},{"name":"Tusks","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'wererat-human', 'Wererat, Human Form', 'Medium', 'humanoid',
  12, 33, '6d8', 30,
  10, 15, 12, 11, 10, 8,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Shortsword","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Hand Crossbow","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'wererat-hybrid', 'Wererat, Hybrid Form', 'Medium', 'humanoid',
  12, 33, '6d8', 30,
  10, 15, 12, 11, 10, 8,
  '2', 450,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"},{"name":"Shortsword","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"},{"name":"Hand Crossbow","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'wererat-rat', 'Wererat, Rat Form', 'Medium', 'humanoid',
  12, 33, '6d8', 30,
  10, 15, 12, 11, 10, 8,
  '2', 450,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d4+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'weretiger-human', 'Weretiger, Human Form', 'Medium', 'humanoid',
  12, 120, '16d8', 30,
  17, 15, 16, 10, 13, 11,
  '4', 1100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Scimitar","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"slashing"},{"name":"Longbow","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'weretiger-hybrid', 'Weretiger, Hybrid Form', 'Medium', 'humanoid',
  12, 120, '16d8', 30,
  17, 15, 16, 10, 13, 11,
  '4', 1100,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":5,"damage_dice":"1d10+3","damage_type":"piercing"},{"name":"Claw","attack_bonus":5,"damage_dice":"1d8+3","damage_type":"slashing"},{"name":"Scimitar","attack_bonus":5,"damage_dice":"1d6+3","damage_type":"slashing"},{"name":"Longbow","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'weretiger-tiger', 'Weretiger, Tiger Form', 'Medium', 'humanoid',
  12, 120, '16d8', 40,
  17, 15, 16, 10, 13, 11,
  '4', 1100,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"1d10+3","damage_type":"piercing"},{"name":"Claw","attack_bonus":5,"damage_dice":"1d8+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'werewolf-human', 'Werewolf, Human Form', 'Medium', 'humanoid',
  11, 58, '9d8', 30,
  15, 13, 14, 10, 11, 10,
  '3', 700,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Spear","attack_bonus":4,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'werewolf-hybrid', 'Werewolf, Hybrid Form', 'Medium', 'humanoid',
  12, 58, '9d8', 30,
  15, 13, 14, 10, 11, 10,
  '3', 700,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"piercing"},{"name":"Claws","attack_bonus":4,"damage_dice":"2d4+2","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'werewolf-wolf', 'Werewolf, Wolf Form', 'Medium', 'humanoid',
  12, 58, '9d8', 40,
  15, 13, 14, 10, 11, 10,
  '3', 700,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'white-dragon-wyrmling', 'White Dragon Wyrmling', 'Medium', 'dragon',
  16, 32, '5d8', 30,
  14, 10, 14, 5, 10, 11,
  '2', 450,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"1d10+2","damage_type":"piercing"},{"name":"Cold Breath","attack_bonus":0,"damage_dice":"5d8","damage_type":"cold"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'wight', 'Wight', 'Medium', 'undead',
  14, 45, '6d8', 30,
  15, 14, 16, 10, 13, 15,
  '3', 700,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Life Drain","attack_bonus":4,"damage_dice":"1d6+2","damage_type":"necrotic"},{"name":"Longsword","attack_bonus":4,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Longbow","attack_bonus":4,"damage_dice":"1d8+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'will-o-wisp', 'Will-o''-Wisp', 'Tiny', 'undead',
  19, 22, '9d4', 30,
  1, 28, 10, 13, 14, 11,
  '2', 450,
  '[{"name":"Shock","attack_bonus":4,"damage_dice":"2d8","damage_type":"lightning"},{"name":"Invisibility","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'winter-wolf', 'Winter Wolf', 'Large', 'monstrosity',
  13, 75, '10d10', 50,
  18, 13, 14, 7, 12, 8,
  '3', 700,
  '[{"name":"Bite","attack_bonus":6,"damage_dice":"2d6+4","damage_type":"piercing"},{"name":"Cold Breath","attack_bonus":0,"damage_dice":"4d8","damage_type":"cold"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'wolf', 'Wolf', 'Medium', 'beast',
  13, 11, '2d8', 40,
  12, 15, 12, 3, 12, 6,
  '0.25', 50,
  '[{"name":"Bite","attack_bonus":4,"damage_dice":"2d4+2","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'worg', 'Worg', 'Large', 'monstrosity',
  13, 26, '4d10', 50,
  16, 13, 13, 7, 11, 8,
  '0.5', 100,
  '[{"name":"Bite","attack_bonus":5,"damage_dice":"2d6+3","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'wraith', 'Wraith', 'Medium', 'undead',
  13, 67, '9d8', 30,
  6, 16, 16, 12, 14, 15,
  '5', 1800,
  '[{"name":"Life Drain","attack_bonus":6,"damage_dice":"4d8+3","damage_type":"necrotic"},{"name":"Create Specter","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'wyvern', 'Wyvern', 'Large', 'dragon',
  13, 110, '13d10', 20,
  19, 10, 16, 5, 12, 6,
  '6', 2300,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"piercing"},{"name":"Claws","attack_bonus":7,"damage_dice":"2d8+4","damage_type":"slashing"},{"name":"Stinger","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"piercing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'xorn', 'Xorn', 'Medium', 'elemental',
  19, 73, '7d8', 20,
  17, 10, 22, 11, 10, 11,
  '5', 1800,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":6,"damage_dice":"3d6+3","damage_type":"piercing"},{"name":"Claw","attack_bonus":6,"damage_dice":"1d6+3","damage_type":"slashing"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'young-black-dragon', 'Young Black Dragon', 'Large', 'dragon',
  18, 127, '15d10', 40,
  19, 14, 17, 12, 11, 15,
  '7', 2900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"2d10+4","damage_type":"piercing"},{"name":"Claw","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"slashing"},{"name":"Acid Breath","attack_bonus":0,"damage_dice":"11d8","damage_type":"acid"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'young-blue-dragon', 'Young Blue Dragon', 'Large', 'dragon',
  18, 152, '16d10', 40,
  21, 10, 19, 14, 13, 17,
  '9', 5000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":9,"damage_dice":"2d10+5","damage_type":"piercing"},{"name":"Claw","attack_bonus":9,"damage_dice":"2d6+5","damage_type":"slashing"},{"name":"Lightning Breath","attack_bonus":0,"damage_dice":"10d10","damage_type":"lightning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'young-brass-dragon', 'Young Brass Dragon', 'Large', 'dragon',
  17, 110, '13d10', 40,
  19, 10, 17, 12, 11, 15,
  '6', 2300,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"2d10+4","damage_type":"piercing"},{"name":"Claw","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"slashing"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'young-bronze-dragon', 'Young Bronze Dragon', 'Large', 'dragon',
  18, 142, '15d10', 40,
  21, 10, 19, 14, 13, 17,
  '8', 3900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":8,"damage_dice":"2d10+5","damage_type":"piercing"},{"name":"Claw","attack_bonus":8,"damage_dice":"2d6+5","damage_type":"slashing"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'young-copper-dragon', 'Young Copper Dragon', 'Large', 'dragon',
  17, 119, '14d10', 40,
  19, 12, 17, 16, 13, 15,
  '7', 2900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"2d10+4","damage_type":"piercing"},{"name":"Claw","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"slashing"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'young-gold-dragon', 'Young Gold Dragon', 'Large', 'dragon',
  18, 178, '17d10', 40,
  23, 14, 21, 16, 13, 20,
  '10', 5900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":10,"damage_dice":"2d10+6","damage_type":"piercing"},{"name":"Claw","attack_bonus":10,"damage_dice":"2d6+6","damage_type":"slashing"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'young-green-dragon', 'Young Green Dragon', 'Large', 'dragon',
  18, 136, '16d10', 40,
  19, 12, 17, 16, 13, 15,
  '8', 3900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"2d10+4","damage_type":"piercing"},{"name":"Claw","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"slashing"},{"name":"Poison Breath","attack_bonus":0,"damage_dice":"12d6","damage_type":"poison"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'young-red-dragon', 'Young Red Dragon', 'Large', 'dragon',
  18, 178, '17d10', 40,
  23, 10, 21, 14, 11, 19,
  '10', 5900,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":10,"damage_dice":"2d10+6","damage_type":"piercing"},{"name":"Claw","attack_bonus":10,"damage_dice":"2d6+6","damage_type":"slashing"},{"name":"Fire Breath","attack_bonus":0,"damage_dice":"16d6","damage_type":"fire"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'young-silver-dragon', 'Young Silver Dragon', 'Large', 'dragon',
  18, 168, '16d10', 40,
  23, 10, 21, 14, 11, 19,
  '9', 5000,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":10,"damage_dice":"2d10+6","damage_type":"piercing"},{"name":"Claw","attack_bonus":10,"damage_dice":"2d6+6","damage_type":"slashing"},{"name":"Breath Weapons","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'young-white-dragon', 'Young White Dragon', 'Large', 'dragon',
  17, 133, '14d10', 40,
  18, 10, 18, 6, 11, 12,
  '6', 2300,
  '[{"name":"Multiattack","attack_bonus":0,"damage_dice":"1d6","damage_type":"bludgeoning"},{"name":"Bite","attack_bonus":7,"damage_dice":"2d10+4","damage_type":"piercing"},{"name":"Claw","attack_bonus":7,"damage_dice":"2d6+4","damage_type":"slashing"},{"name":"Cold Breath","attack_bonus":0,"damage_dice":"10d8","damage_type":"cold"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  'zombie', 'Zombie', 'Medium', 'undead',
  8, 22, '3d8', 20,
  13, 6, 16, 3, 6, 5,
  '0.25', 50,
  '[{"name":"Slam","attack_bonus":3,"damage_dice":"1d6+1","damage_type":"bludgeoning"}]',
  '[]',
  'srd'
) ON CONFLICT (slug) DO NOTHING;
