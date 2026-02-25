-- Run all SRD seed files
-- Usage: psql $DATABASE_URL < seeds/all.sql

\echo 'Running base migrations...'
\i migrations/003_srd_tables.sql
\i migrations/004_srd_search.sql

\echo 'Running extended content migrations...'
\i migrations/005_srd_extended_tables.sql

\echo '=== Core Content ==='

\echo 'Seeding classes (12)...'
\i seeds/classes.sql

\echo 'Seeding races (9)...'
\i seeds/races.sql

\echo 'Seeding weapons (37)...'
\i seeds/weapons.sql

\echo 'Seeding armor (13)...'
\i seeds/armor.sql

\echo 'Seeding monsters (334)...'
\i seeds/monsters.sql

\echo 'Seeding spells (319)...'
\i seeds/spells.sql

\echo '=== Extended Content ==='

\echo 'Seeding ability scores (6)...'
\i seeds/ability_scores.sql

\echo 'Seeding skills (18)...'
\i seeds/skills.sql

\echo 'Seeding conditions (15)...'
\i seeds/conditions.sql

\echo 'Seeding damage types (13)...'
\i seeds/damage_types.sql

\echo 'Seeding magic schools (8)...'
\i seeds/magic_schools.sql

\echo 'Seeding equipment categories (39)...'
\i seeds/equipment_categories.sql

\echo 'Seeding proficiencies (117)...'
\i seeds/proficiencies.sql

\echo 'Seeding languages (16)...'
\i seeds/languages.sql

\echo 'Seeding alignments (9)...'
\i seeds/alignments.sql

\echo 'Seeding backgrounds (1)...'
\i seeds/backgrounds.sql

\echo 'Seeding feats (1)...'
\i seeds/feats.sql

\echo 'Seeding class features (407)...'
\i seeds/features.sql

\echo 'Seeding racial traits (38)...'
\i seeds/traits.sql

\echo 'Seeding rule sections (33)...'
\i seeds/rule_sections.sql

\echo 'Seeding subclasses (12)...'
\i seeds/subclasses.sql

\echo 'Seeding subraces (4)...'
\i seeds/subraces.sql

\echo ''
\echo '=== SRD Data Load Complete ==='
\echo 'Total content loaded:'
\echo '  - 12 classes, 12 subclasses'
\echo '  - 9 races, 4 subraces'
\echo '  - 407 class features'
\echo '  - 38 racial traits'
\echo '  - 319 spells'
\echo '  - 334 monsters'
\echo '  - 37 weapons, 13 armor'
\echo '  - 6 ability scores, 18 skills'
\echo '  - 15 conditions, 13 damage types'
\echo '  - 8 magic schools'
\echo '  - 117 proficiencies'
\echo '  - 16 languages, 9 alignments'
\echo '  - 39 equipment categories'
\echo '  - 33 rule sections'
\echo '  - 1 background (Acolyte), 1 feat (Grappler)'

-- Campaign Templates
\i seeds/campaign_templates.sql
