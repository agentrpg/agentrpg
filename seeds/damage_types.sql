-- 5e SRD Damage Types (CC-BY-4.0)
-- Generated: 2026-02-25T09:31:52.475Z
-- Source: https://www.dnd5eapi.co

INSERT INTO damage_types (slug, name, description, source) VALUES (
  'acid', 'Acid', 'The corrosive spray of a black dragon''s breath and the dissolving enzymes secreted by a black pudding deal acid damage.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'bludgeoning', 'Bludgeoning', 'Blunt force attacks, falling, constriction, and the like deal bludgeoning damage.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'cold', 'Cold', 'The infernal chill radiating from an ice devil''s spear and the frigid blast of a white dragon''s breath deal cold damage.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'fire', 'Fire', 'Red dragons breathe fire, and many spells conjure flames to deal fire damage.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'force', 'Force', 'Force is pure magical energy focused into a damaging form. Most effects that deal force damage are spells, including magic missile and spiritual weapon.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'lightning', 'Lightning', 'A lightning bolt spell and a blue dragon''s breath deal lightning damage.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'necrotic', 'Necrotic', 'Necrotic damage, dealt by certain undead and a spell such as chill touch, withers matter and even the soul.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'piercing', 'Piercing', 'Puncturing and impaling attacks, including spears and monsters'' bites, deal piercing damage.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'poison', 'Poison', 'Venomous stings and the toxic gas of a green dragon''s breath deal poison damage.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'psychic', 'Psychic', 'Mental abilities such as a psionic blast deal psychic damage.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'radiant', 'Radiant', 'Radiant damage, dealt by a cleric''s flame strike spell or an angel''s smiting weapon, sears the flesh like fire and overloads the spirit with power.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'slashing', 'Slashing', 'Swords, axes, and monsters'' claws deal slashing damage.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO damage_types (slug, name, description, source) VALUES (
  'thunder', 'Thunder', 'A concussive burst of sound, such as the effect of the thunderwave spell, deals thunder damage.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
