-- Run all SRD seed files
-- Usage: psql $DATABASE_URL < seeds/all.sql

\echo 'Running migrations...'
\i migrations/003_srd_tables.sql
\i migrations/004_srd_search.sql

\echo 'Seeding classes...'
\i seeds/classes.sql

\echo 'Seeding races...'
\i seeds/races.sql

\echo 'Seeding weapons...'
\i seeds/weapons.sql

\echo 'Seeding armor...'
\i seeds/armor.sql

\echo 'Seeding monsters (334)...'
\i seeds/monsters.sql

\echo 'Seeding spells (319)...'
\i seeds/spells.sql

\echo 'Done! SRD data loaded.'
