-- 5e SRD Alignments (CC-BY-4.0)
-- Generated: 2026-02-25T09:31:59.616Z
-- Source: https://www.dnd5eapi.co

INSERT INTO alignments (slug, name, abbreviation, description, source) VALUES (
  'chaotic-evil', 'Chaotic Evil', 'CE',
  'Chaotic evil (CE) creatures act with arbitrary violence, spurred by their greed, hatred, or bloodlust. Demons, red dragons, and orcs are chaotic evil.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO alignments (slug, name, abbreviation, description, source) VALUES (
  'chaotic-good', 'Chaotic Good', 'CG',
  'Chaotic good (CG) creatures act as their conscience directs, with little regard for what others expect. Copper dragons, many elves, and unicorns are chaotic good.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO alignments (slug, name, abbreviation, description, source) VALUES (
  'chaotic-neutral', 'Chaotic Neutral', 'CN',
  'Chaotic neutral (CN) creatures follow their whims, holding their personal freedom above all else. Many barbarians and rogues, and some bards, are chaotic neutral.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO alignments (slug, name, abbreviation, description, source) VALUES (
  'lawful-evil', 'Lawful Evil', 'LE',
  'Lawful evil (LE) creatures methodically take what they want, within the limits of a code of tradition, loyalty, or order. Devils, blue dragons, and hobgoblins are lawful evil.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO alignments (slug, name, abbreviation, description, source) VALUES (
  'lawful-good', 'Lawful Good', 'LG',
  'Lawful good (LG) creatures can be counted on to do the right thing as expected by society. Gold dragons, paladins, and most dwarves are lawful good.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO alignments (slug, name, abbreviation, description, source) VALUES (
  'lawful-neutral', 'Lawful Neutral', 'LN',
  'Lawful neutral (LN) individuals act in accordance with law, tradition, or personal codes. Many monks and some wizards are lawful neutral.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO alignments (slug, name, abbreviation, description, source) VALUES (
  'neutral', 'Neutral', 'N',
  'Neutral (N) is the alignment of those who prefer to steer clear of moral questions and don''t take sides, doing what seems best at the time. Lizardfolk, most druids, and many humans are neutral.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO alignments (slug, name, abbreviation, description, source) VALUES (
  'neutral-evil', 'Neutral Evil', 'NE',
  'Neutral evil (NE) is the alignment of those who do whatever they can get away with, without compassion or qualms. Many drow, some cloud giants, and goblins are neutral evil.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO alignments (slug, name, abbreviation, description, source) VALUES (
  'neutral-good', 'Neutral Good', 'NG',
  'Neutral good (NG) folk do the best they can to help others according to their needs. Many celestials, some cloud giants, and most gnomes are neutral good.', 'srd'
) ON CONFLICT (slug) DO NOTHING;
