-- SRD data tables
-- Run with: psql $DATABASE_URL < migrations/003_srd_tables.sql

-- Monsters
CREATE TABLE IF NOT EXISTS monsters (
    id SERIAL PRIMARY KEY,
    slug VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    size VARCHAR(20),
    type VARCHAR(50),
    ac INT,
    hp INT,
    hit_dice VARCHAR(20),
    speed INT,
    str INT, dex INT, con INT, intl INT, wis INT, cha INT,
    cr VARCHAR(10),
    xp INT,
    actions JSONB DEFAULT '[]',
    source VARCHAR(50) DEFAULT 'srd',
    created_at TIMESTAMP DEFAULT NOW()
);

-- Spells
CREATE TABLE IF NOT EXISTS spells (
    id SERIAL PRIMARY KEY,
    slug VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    level INT,
    school VARCHAR(50),
    casting_time VARCHAR(50),
    range VARCHAR(50),
    components VARCHAR(50),
    duration VARCHAR(100),
    description TEXT,
    damage_dice VARCHAR(20),
    damage_type VARCHAR(30),
    saving_throw VARCHAR(10),
    healing VARCHAR(20),
    source VARCHAR(50) DEFAULT 'srd',
    created_at TIMESTAMP DEFAULT NOW()
);

-- Classes
CREATE TABLE IF NOT EXISTS classes (
    id SERIAL PRIMARY KEY,
    slug VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL,
    hit_die INT,
    primary_ability VARCHAR(20),
    saving_throws VARCHAR(50),
    armor_proficiencies TEXT,
    weapon_proficiencies TEXT,
    spellcasting_ability VARCHAR(10),
    source VARCHAR(50) DEFAULT 'srd',
    created_at TIMESTAMP DEFAULT NOW()
);

-- Races
CREATE TABLE IF NOT EXISTS races (
    id SERIAL PRIMARY KEY,
    slug VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL,
    size VARCHAR(20),
    speed INT,
    ability_mods JSONB DEFAULT '{}',
    traits TEXT,
    source VARCHAR(50) DEFAULT 'srd',
    created_at TIMESTAMP DEFAULT NOW()
);

-- Weapons
CREATE TABLE IF NOT EXISTS weapons (
    id SERIAL PRIMARY KEY,
    slug VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(20),
    damage VARCHAR(20),
    damage_type VARCHAR(20),
    weight DECIMAL(5,2),
    properties TEXT,
    source VARCHAR(50) DEFAULT 'srd',
    created_at TIMESTAMP DEFAULT NOW()
);

-- Armor
CREATE TABLE IF NOT EXISTS armor (
    id SERIAL PRIMARY KEY,
    slug VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(20),
    ac INT,
    ac_bonus VARCHAR(20),
    str_req INT,
    stealth_disadvantage BOOLEAN DEFAULT FALSE,
    weight DECIMAL(5,2),
    source VARCHAR(50) DEFAULT 'srd',
    created_at TIMESTAMP DEFAULT NOW()
);

-- Indexes for common queries
CREATE INDEX IF NOT EXISTS idx_monsters_cr ON monsters(cr);
CREATE INDEX IF NOT EXISTS idx_monsters_type ON monsters(type);
CREATE INDEX IF NOT EXISTS idx_spells_level ON spells(level);
CREATE INDEX IF NOT EXISTS idx_spells_school ON spells(school);
