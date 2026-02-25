-- 5e SRD Armor (CC-BY-4.0)
-- Generated: 2026-02-25T09:25:01.054Z
-- Source: https://www.dnd5eapi.co

INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'breastplate', 'Breastplate', 'medium', 14,
  '+DEX (max 2)', 0, false, 20, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'chain-mail', 'Chain Mail', 'heavy', 16,
  '', 13, true, 55, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'chain-shirt', 'Chain Shirt', 'medium', 13,
  '+DEX (max 2)', 0, false, 20, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'half-plate-armor', 'Half Plate Armor', 'medium', 15,
  '+DEX (max 2)', 0, true, 40, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'hide-armor', 'Hide Armor', 'medium', 12,
  '+DEX (max 2)', 0, false, 12, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'leather-armor', 'Leather Armor', 'light', 11,
  '+DEX', 0, false, 10, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'padded-armor', 'Padded Armor', 'light', 11,
  '+DEX', 0, true, 8, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'plate-armor', 'Plate Armor', 'heavy', 18,
  '', 15, true, 65, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'ring-mail', 'Ring Mail', 'heavy', 14,
  '', 0, true, 40, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'scale-mail', 'Scale Mail', 'medium', 14,
  '+DEX (max 2)', 0, true, 45, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'shield', 'Shield', 'shield', 2,
  '', 0, false, 6, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'splint-armor', 'Splint Armor', 'heavy', 17,
  '', 15, true, 60, 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  'studded-leather-armor', 'Studded Leather Armor', 'light', 12,
  '+DEX', 0, false, 13, 'srd'
) ON CONFLICT (slug) DO NOTHING;
