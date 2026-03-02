-- Class spell lists junction table
-- Maps which spells each class can learn/prepare

CREATE TABLE IF NOT EXISTS class_spells (
    id SERIAL PRIMARY KEY,
    class_slug VARCHAR(50) NOT NULL,
    spell_slug VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    UNIQUE(class_slug, spell_slug)
);

-- Index for efficient lookups
CREATE INDEX IF NOT EXISTS idx_class_spells_class ON class_spells(class_slug);
CREATE INDEX IF NOT EXISTS idx_class_spells_spell ON class_spells(spell_slug);
