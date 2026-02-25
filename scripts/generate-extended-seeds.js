#!/usr/bin/env node
// Generate extended seed SQL files from 5e SRD API
// Run: node scripts/generate-extended-seeds.js
// Output: seeds/*.sql

const https = require('https');
const fs = require('fs');
const path = require('path');

const API_BASE = 'https://www.dnd5eapi.co/api/2014';
const SEEDS_DIR = path.join(__dirname, '..', 'seeds');

// Ensure seeds directory exists
if (!fs.existsSync(SEEDS_DIR)) {
  fs.mkdirSync(SEEDS_DIR, { recursive: true });
}

async function fetch(url) {
  return new Promise((resolve, reject) => {
    https.get(url, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          resolve(JSON.parse(data));
        } catch (e) {
          reject(e);
        }
      });
    }).on('error', reject);
  });
}

function escapeSQL(str) {
  if (str === null || str === undefined) return 'NULL';
  return "'" + String(str).replace(/'/g, "''").replace(/\\/g, '\\\\') + "'";
}

function joinDesc(desc) {
  if (!desc) return '';
  if (Array.isArray(desc)) return desc.join(' ').substring(0, 10000);
  return String(desc).substring(0, 10000);
}

async function generateAbilityScores() {
  console.log('Fetching ability scores...');
  const list = await fetch(`${API_BASE}/ability-scores`);
  console.log(`Found ${list.count} ability scores`);
  
  let sql = `-- 5e SRD Ability Scores (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const a = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const skills = (a.skills || []).map(s => s.index);
    const desc = joinDesc(a.desc);
    
    sql += `INSERT INTO ability_scores (slug, name, full_name, description, skills, source) VALUES (
  ${escapeSQL(a.index)}, ${escapeSQL(a.name)}, ${escapeSQL(a.full_name)},
  ${escapeSQL(desc)}, ${escapeSQL(JSON.stringify(skills))}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing ability_scores.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'ability_scores.sql'), sql);
  console.log(`Generated ${list.results.length} ability scores`);
}

async function generateSkills() {
  console.log('Fetching skills...');
  const list = await fetch(`${API_BASE}/skills`);
  console.log(`Found ${list.count} skills`);
  
  let sql = `-- 5e SRD Skills (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const s = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const desc = joinDesc(s.desc);
    const ability = s.ability_score?.index || '';
    
    sql += `INSERT INTO skills (slug, name, description, ability_score, source) VALUES (
  ${escapeSQL(s.index)}, ${escapeSQL(s.name)}, ${escapeSQL(desc)}, ${escapeSQL(ability)}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing skills.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'skills.sql'), sql);
  console.log(`Generated ${list.results.length} skills`);
}

async function generateConditions() {
  console.log('Fetching conditions...');
  const list = await fetch(`${API_BASE}/conditions`);
  console.log(`Found ${list.count} conditions`);
  
  let sql = `-- 5e SRD Conditions (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const c = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const desc = joinDesc(c.desc);
    
    sql += `INSERT INTO conditions (slug, name, description, source) VALUES (
  ${escapeSQL(c.index)}, ${escapeSQL(c.name)}, ${escapeSQL(desc)}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing conditions.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'conditions.sql'), sql);
  console.log(`Generated ${list.results.length} conditions`);
}

async function generateDamageTypes() {
  console.log('Fetching damage types...');
  const list = await fetch(`${API_BASE}/damage-types`);
  console.log(`Found ${list.count} damage types`);
  
  let sql = `-- 5e SRD Damage Types (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const d = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const desc = joinDesc(d.desc);
    
    sql += `INSERT INTO damage_types (slug, name, description, source) VALUES (
  ${escapeSQL(d.index)}, ${escapeSQL(d.name)}, ${escapeSQL(desc)}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing damage_types.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'damage_types.sql'), sql);
  console.log(`Generated ${list.results.length} damage types`);
}

async function generateMagicSchools() {
  console.log('Fetching magic schools...');
  const list = await fetch(`${API_BASE}/magic-schools`);
  console.log(`Found ${list.count} magic schools`);
  
  let sql = `-- 5e SRD Magic Schools (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const m = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const desc = m.desc || '';
    
    sql += `INSERT INTO magic_schools (slug, name, description, source) VALUES (
  ${escapeSQL(m.index)}, ${escapeSQL(m.name)}, ${escapeSQL(desc)}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing magic_schools.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'magic_schools.sql'), sql);
  console.log(`Generated ${list.results.length} magic schools`);
}

async function generateEquipmentCategories() {
  console.log('Fetching equipment categories...');
  const list = await fetch(`${API_BASE}/equipment-categories`);
  console.log(`Found ${list.count} equipment categories`);
  
  let sql = `-- 5e SRD Equipment Categories (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (let i = 0; i < list.results.length; i++) {
    const item = list.results[i];
    process.stdout.write(`\rProcessing equipment category ${i + 1}/${list.results.length}`);
    
    const e = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const equipCount = e.equipment?.length || 0;
    
    sql += `INSERT INTO equipment_categories (slug, name, equipment_count, source) VALUES (
  ${escapeSQL(e.index)}, ${escapeSQL(e.name)}, ${equipCount}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('\nWriting equipment_categories.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'equipment_categories.sql'), sql);
  console.log(`Generated ${list.results.length} equipment categories`);
}

async function generateProficiencies() {
  console.log('Fetching proficiencies...');
  const list = await fetch(`${API_BASE}/proficiencies`);
  console.log(`Found ${list.count} proficiencies`);
  
  let sql = `-- 5e SRD Proficiencies (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (let i = 0; i < list.results.length; i++) {
    const item = list.results[i];
    process.stdout.write(`\rProcessing proficiency ${i + 1}/${list.results.length}`);
    
    const p = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const refSlug = p.reference?.index || '';
    const refType = p.reference?.url?.split('/')[3] || '';
    const classes = (p.classes || []).map(c => c.index);
    const races = (p.races || []).map(r => r.index);
    
    sql += `INSERT INTO proficiencies (slug, name, type, reference_slug, reference_type, classes, races, source) VALUES (
  ${escapeSQL(p.index)}, ${escapeSQL(p.name)}, ${escapeSQL(p.type)},
  ${escapeSQL(refSlug)}, ${escapeSQL(refType)},
  ${escapeSQL(JSON.stringify(classes))}, ${escapeSQL(JSON.stringify(races))}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('\nWriting proficiencies.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'proficiencies.sql'), sql);
  console.log(`Generated ${list.results.length} proficiencies`);
}

async function generateLanguages() {
  console.log('Fetching languages...');
  const list = await fetch(`${API_BASE}/languages`);
  console.log(`Found ${list.count} languages`);
  
  let sql = `-- 5e SRD Languages (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const l = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const speakers = l.typical_speakers || [];
    
    sql += `INSERT INTO languages (slug, name, type, typical_speakers, script, source) VALUES (
  ${escapeSQL(l.index)}, ${escapeSQL(l.name)}, ${escapeSQL(l.type)},
  ${escapeSQL(JSON.stringify(speakers))}, ${escapeSQL(l.script)}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing languages.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'languages.sql'), sql);
  console.log(`Generated ${list.results.length} languages`);
}

async function generateAlignments() {
  console.log('Fetching alignments...');
  const list = await fetch(`${API_BASE}/alignments`);
  console.log(`Found ${list.count} alignments`);
  
  let sql = `-- 5e SRD Alignments (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const a = await fetch(`https://www.dnd5eapi.co${item.url}`);
    
    sql += `INSERT INTO alignments (slug, name, abbreviation, description, source) VALUES (
  ${escapeSQL(a.index)}, ${escapeSQL(a.name)}, ${escapeSQL(a.abbreviation)},
  ${escapeSQL(a.desc)}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing alignments.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'alignments.sql'), sql);
  console.log(`Generated ${list.results.length} alignments`);
}

async function generateBackgrounds() {
  console.log('Fetching backgrounds...');
  const list = await fetch(`${API_BASE}/backgrounds`);
  console.log(`Found ${list.count} backgrounds`);
  
  let sql = `-- 5e SRD Backgrounds (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const b = await fetch(`https://www.dnd5eapi.co${item.url}`);
    
    const profs = (b.starting_proficiencies || []).map(p => p.index);
    const equipment = (b.starting_equipment || []).map(e => ({
      item: e.equipment?.index,
      quantity: e.quantity
    }));
    const featureName = b.feature?.name || '';
    const featureDesc = joinDesc(b.feature?.desc);
    
    // Extract personality options
    const personalityTraits = b.personality_traits?.from?.options?.map(o => o.string || o.desc) || [];
    const ideals = b.ideals?.from?.options?.map(o => o.desc) || [];
    const bonds = b.bonds?.from?.options?.map(o => o.string || o.desc) || [];
    const flaws = b.flaws?.from?.options?.map(o => o.string || o.desc) || [];
    
    sql += `INSERT INTO backgrounds (slug, name, starting_proficiencies, language_options, starting_equipment, feature_name, feature_desc, personality_traits, ideals, bonds, flaws, source) VALUES (
  ${escapeSQL(b.index)}, ${escapeSQL(b.name)},
  ${escapeSQL(JSON.stringify(profs))},
  ${escapeSQL(JSON.stringify(b.language_options || {}))},
  ${escapeSQL(JSON.stringify(equipment))},
  ${escapeSQL(featureName)}, ${escapeSQL(featureDesc)},
  ${escapeSQL(JSON.stringify(personalityTraits))},
  ${escapeSQL(JSON.stringify(ideals))},
  ${escapeSQL(JSON.stringify(bonds))},
  ${escapeSQL(JSON.stringify(flaws))}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing backgrounds.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'backgrounds.sql'), sql);
  console.log(`Generated ${list.results.length} backgrounds`);
}

async function generateFeats() {
  console.log('Fetching feats...');
  const list = await fetch(`${API_BASE}/feats`);
  console.log(`Found ${list.count} feats`);
  
  let sql = `-- 5e SRD Feats (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const f = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const desc = joinDesc(f.desc);
    const prereqs = (f.prerequisites || []).map(p => ({
      ability: p.ability_score?.index,
      minimum: p.minimum_score
    }));
    
    sql += `INSERT INTO feats (slug, name, description, prerequisites, source) VALUES (
  ${escapeSQL(f.index)}, ${escapeSQL(f.name)}, ${escapeSQL(desc)},
  ${escapeSQL(JSON.stringify(prereqs))}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing feats.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'feats.sql'), sql);
  console.log(`Generated ${list.results.length} feats`);
}

async function generateFeatures() {
  console.log('Fetching features...');
  const list = await fetch(`${API_BASE}/features`);
  console.log(`Found ${list.count} features`);
  
  let sql = `-- 5e SRD Class Features (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (let i = 0; i < list.results.length; i++) {
    const item = list.results[i];
    process.stdout.write(`\rProcessing feature ${i + 1}/${list.results.length}`);
    
    const f = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const desc = joinDesc(f.desc);
    const classSlug = f.class?.index || '';
    const subclassSlug = f.subclass?.index || '';
    const prereqs = (f.prerequisites || []).map(p => ({
      type: p.type,
      feature: p.feature?.index,
      level: p.level
    }));
    
    sql += `INSERT INTO features (slug, name, class_slug, subclass_slug, level, description, prerequisites, source) VALUES (
  ${escapeSQL(f.index)}, ${escapeSQL(f.name)}, ${escapeSQL(classSlug)}, ${escapeSQL(subclassSlug)},
  ${f.level || 0}, ${escapeSQL(desc)}, ${escapeSQL(JSON.stringify(prereqs))}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('\nWriting features.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'features.sql'), sql);
  console.log(`Generated ${list.results.length} features`);
}

async function generateTraits() {
  console.log('Fetching traits...');
  const list = await fetch(`${API_BASE}/traits`);
  console.log(`Found ${list.count} traits`);
  
  let sql = `-- 5e SRD Racial Traits (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (let i = 0; i < list.results.length; i++) {
    const item = list.results[i];
    process.stdout.write(`\rProcessing trait ${i + 1}/${list.results.length}`);
    
    const t = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const desc = joinDesc(t.desc);
    const races = (t.races || []).map(r => r.index);
    const subraces = (t.subraces || []).map(s => s.index);
    const profs = (t.proficiencies || []).map(p => p.index);
    
    sql += `INSERT INTO traits (slug, name, description, races, subraces, proficiencies, source) VALUES (
  ${escapeSQL(t.index)}, ${escapeSQL(t.name)}, ${escapeSQL(desc)},
  ${escapeSQL(JSON.stringify(races))}, ${escapeSQL(JSON.stringify(subraces))},
  ${escapeSQL(JSON.stringify(profs))}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('\nWriting traits.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'traits.sql'), sql);
  console.log(`Generated ${list.results.length} traits`);
}

async function generateRuleSections() {
  console.log('Fetching rule sections...');
  const list = await fetch(`${API_BASE}/rule-sections`);
  console.log(`Found ${list.count} rule sections`);
  
  let sql = `-- 5e SRD Rule Sections (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (let i = 0; i < list.results.length; i++) {
    const item = list.results[i];
    process.stdout.write(`\rProcessing rule section ${i + 1}/${list.results.length}`);
    
    const r = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const desc = r.desc || '';
    
    sql += `INSERT INTO rule_sections (slug, name, description, source) VALUES (
  ${escapeSQL(r.index)}, ${escapeSQL(r.name)}, ${escapeSQL(desc)}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('\nWriting rule_sections.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'rule_sections.sql'), sql);
  console.log(`Generated ${list.results.length} rule sections`);
}

async function generateSubclasses() {
  console.log('Fetching subclasses...');
  const list = await fetch(`${API_BASE}/subclasses`);
  console.log(`Found ${list.count} subclasses`);
  
  let sql = `-- 5e SRD Subclasses (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const s = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const desc = joinDesc(s.desc);
    const classSlug = s.class?.index || '';
    const spells = (s.spells || []).map(sp => sp.spell?.index);
    
    sql += `INSERT INTO subclasses (slug, name, class_slug, subclass_flavor, description, spells, source) VALUES (
  ${escapeSQL(s.index)}, ${escapeSQL(s.name)}, ${escapeSQL(classSlug)},
  ${escapeSQL(s.subclass_flavor)}, ${escapeSQL(desc)},
  ${escapeSQL(JSON.stringify(spells))}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing subclasses.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'subclasses.sql'), sql);
  console.log(`Generated ${list.results.length} subclasses`);
}

async function generateSubraces() {
  console.log('Fetching subraces...');
  const list = await fetch(`${API_BASE}/subraces`);
  console.log(`Found ${list.count} subraces`);
  
  let sql = `-- 5e SRD Subraces (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const s = await fetch(`https://www.dnd5eapi.co${item.url}`);
    const raceSlug = s.race?.index || '';
    
    const abilityBonuses = {};
    for (const bonus of (s.ability_bonuses || [])) {
      abilityBonuses[bonus.ability_score?.index?.toUpperCase()] = bonus.bonus;
    }
    
    const traits = (s.racial_traits || []).map(t => t.index);
    
    sql += `INSERT INTO subraces (slug, name, race_slug, description, ability_bonuses, racial_traits, source) VALUES (
  ${escapeSQL(s.index)}, ${escapeSQL(s.name)}, ${escapeSQL(raceSlug)},
  ${escapeSQL(s.desc)}, ${escapeSQL(JSON.stringify(abilityBonuses))},
  ${escapeSQL(JSON.stringify(traits))}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing subraces.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'subraces.sql'), sql);
  console.log(`Generated ${list.results.length} subraces`);
}

async function main() {
  console.log('Generating extended seed SQL files from 5e SRD API...\n');
  
  await generateAbilityScores();
  console.log('');
  await generateSkills();
  console.log('');
  await generateConditions();
  console.log('');
  await generateDamageTypes();
  console.log('');
  await generateMagicSchools();
  console.log('');
  await generateEquipmentCategories();
  console.log('');
  await generateProficiencies();
  console.log('');
  await generateLanguages();
  console.log('');
  await generateAlignments();
  console.log('');
  await generateBackgrounds();
  console.log('');
  await generateFeats();
  console.log('');
  await generateFeatures();
  console.log('');
  await generateTraits();
  console.log('');
  await generateRuleSections();
  console.log('');
  await generateSubclasses();
  console.log('');
  await generateSubraces();
  
  console.log('\n✓ All extended seed files generated in seeds/');
}

main().catch(console.error);
