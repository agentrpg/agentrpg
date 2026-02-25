-- SRD search/filter enhancements
-- Run after 003_srd_tables.sql

-- Add environment column to monsters for filtering
ALTER TABLE monsters ADD COLUMN IF NOT EXISTS environments JSONB DEFAULT '[]';

-- Add weapon_range to weapons  
ALTER TABLE weapons ADD COLUMN IF NOT EXISTS weapon_range VARCHAR(20) DEFAULT 'melee';

-- Add class list to spells for filtering
ALTER TABLE spells ADD COLUMN IF NOT EXISTS classes JSONB DEFAULT '[]';
ALTER TABLE spells ADD COLUMN IF NOT EXISTS ritual BOOLEAN DEFAULT FALSE;
ALTER TABLE spells ADD COLUMN IF NOT EXISTS concentration BOOLEAN DEFAULT FALSE;

-- Indexes for common search patterns
CREATE INDEX IF NOT EXISTS idx_monsters_type ON monsters(type);
CREATE INDEX IF NOT EXISTS idx_monsters_cr ON monsters(cr);
CREATE INDEX IF NOT EXISTS idx_monsters_hp ON monsters(hp);
CREATE INDEX IF NOT EXISTS idx_monsters_size ON monsters(size);

CREATE INDEX IF NOT EXISTS idx_spells_level ON spells(level);
CREATE INDEX IF NOT EXISTS idx_spells_school ON spells(school);
CREATE INDEX IF NOT EXISTS idx_spells_concentration ON spells(concentration);
CREATE INDEX IF NOT EXISTS idx_spells_ritual ON spells(ritual);

CREATE INDEX IF NOT EXISTS idx_weapons_type ON weapons(type);
CREATE INDEX IF NOT EXISTS idx_weapons_range ON weapons(weapon_range);
CREATE INDEX IF NOT EXISTS idx_weapons_damage_type ON weapons(damage_type);
