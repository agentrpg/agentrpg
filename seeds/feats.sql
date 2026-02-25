-- 5e SRD Feats (CC-BY-4.0)
-- Generated: 2026-02-25T09:32:00.056Z
-- Source: https://www.dnd5eapi.co

INSERT INTO feats (slug, name, description, prerequisites, source) VALUES (
  'grappler', 'Grappler', 'You’ve developed the Skills necessary to hold your own in close--quarters Grappling. You gain the following benefits: - You have advantage on Attack Rolls against a creature you are Grappling. - You can use your action to try to pin a creature Grappled by you. To do so, make another grapple check. If you succeed, you and the creature are both Restrained until the grapple ends.',
  '[{"ability":"str","minimum":13}]', 'srd'
) ON CONFLICT (slug) DO NOTHING;
