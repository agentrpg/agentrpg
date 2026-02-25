-- 5e SRD Extended Content Tables
-- Run: psql $DATABASE_URL < migrations/005_srd_extended_tables.sql

-- Ability Scores (STR, DEX, CON, INT, WIS, CHA)
CREATE TABLE IF NOT EXISTS ability_scores (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    full_name TEXT NOT NULL,
    description TEXT,
    skills JSONB DEFAULT '[]',
    source TEXT DEFAULT 'srd'
);

-- Skills (18 skills with their governing abilities)
CREATE TABLE IF NOT EXISTS skills (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    ability_score TEXT NOT NULL,
    source TEXT DEFAULT 'srd'
);

-- Conditions (blinded, charmed, frightened, etc.)
CREATE TABLE IF NOT EXISTS conditions (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    source TEXT DEFAULT 'srd'
);

-- Damage Types (fire, cold, lightning, etc.)
CREATE TABLE IF NOT EXISTS damage_types (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    source TEXT DEFAULT 'srd'
);

-- Magic Schools (evocation, necromancy, etc.)
CREATE TABLE IF NOT EXISTS magic_schools (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    source TEXT DEFAULT 'srd'
);

-- Equipment Categories
CREATE TABLE IF NOT EXISTS equipment_categories (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    equipment_count INTEGER DEFAULT 0,
    source TEXT DEFAULT 'srd'
);

-- Proficiencies
CREATE TABLE IF NOT EXISTS proficiencies (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT,
    reference_slug TEXT,
    reference_type TEXT,
    classes JSONB DEFAULT '[]',
    races JSONB DEFAULT '[]',
    source TEXT DEFAULT 'srd'
);

-- Languages
CREATE TABLE IF NOT EXISTS languages (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT,
    typical_speakers JSONB DEFAULT '[]',
    script TEXT,
    source TEXT DEFAULT 'srd'
);

-- Alignments
CREATE TABLE IF NOT EXISTS alignments (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    abbreviation TEXT,
    description TEXT,
    source TEXT DEFAULT 'srd'
);

-- Backgrounds
CREATE TABLE IF NOT EXISTS backgrounds (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    starting_proficiencies JSONB DEFAULT '[]',
    language_options JSONB,
    starting_equipment JSONB DEFAULT '[]',
    feature_name TEXT,
    feature_desc TEXT,
    personality_traits JSONB DEFAULT '[]',
    ideals JSONB DEFAULT '[]',
    bonds JSONB DEFAULT '[]',
    flaws JSONB DEFAULT '[]',
    source TEXT DEFAULT 'srd'
);

-- Feats
CREATE TABLE IF NOT EXISTS feats (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    prerequisites JSONB DEFAULT '[]',
    source TEXT DEFAULT 'srd'
);

-- Class Features
CREATE TABLE IF NOT EXISTS features (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    class_slug TEXT,
    subclass_slug TEXT,
    level INTEGER,
    description TEXT,
    prerequisites JSONB DEFAULT '[]',
    source TEXT DEFAULT 'srd'
);

-- Racial Traits
CREATE TABLE IF NOT EXISTS traits (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    races JSONB DEFAULT '[]',
    subraces JSONB DEFAULT '[]',
    proficiencies JSONB DEFAULT '[]',
    source TEXT DEFAULT 'srd'
);

-- Rule Sections
CREATE TABLE IF NOT EXISTS rule_sections (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    source TEXT DEFAULT 'srd'
);

-- Subclasses
CREATE TABLE IF NOT EXISTS subclasses (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    class_slug TEXT NOT NULL,
    subclass_flavor TEXT,
    description TEXT,
    spells JSONB DEFAULT '[]',
    source TEXT DEFAULT 'srd'
);

-- Subraces
CREATE TABLE IF NOT EXISTS subraces (
    slug TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    race_slug TEXT NOT NULL,
    description TEXT,
    ability_bonuses JSONB DEFAULT '{}',
    racial_traits JSONB DEFAULT '[]',
    source TEXT DEFAULT 'srd'
);

-- Create indexes for common lookups
CREATE INDEX IF NOT EXISTS idx_skills_ability ON skills(ability_score);
CREATE INDEX IF NOT EXISTS idx_features_class ON features(class_slug);
CREATE INDEX IF NOT EXISTS idx_features_level ON features(level);
CREATE INDEX IF NOT EXISTS idx_subclasses_class ON subclasses(class_slug);
CREATE INDEX IF NOT EXISTS idx_subraces_race ON subraces(race_slug);
CREATE INDEX IF NOT EXISTS idx_proficiencies_type ON proficiencies(type);
