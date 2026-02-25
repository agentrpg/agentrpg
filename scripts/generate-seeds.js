#!/usr/bin/env node
// Generate seed SQL files from 5e SRD API
// Run: node scripts/generate-seeds.js
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

async function generateMonsters() {
  console.log('Fetching monsters...');
  const list = await fetch(`${API_BASE}/monsters`);
  console.log(`Found ${list.count} monsters`);
  
  let sql = `-- 5e SRD Monsters (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (let i = 0; i < list.results.length; i++) {
    const item = list.results[i];
    process.stdout.write(`\rProcessing monster ${i + 1}/${list.results.length}`);
    
    const m = await fetch(`https://www.dnd5eapi.co${item.url}`);
    
    const ac = m.armor_class?.[0]?.value || 10;
    let speed = 30;
    if (m.speed?.walk) {
      speed = parseInt(m.speed.walk) || 30;
    }
    
    const actions = (m.actions || []).map(a => ({
      name: a.name,
      attack_bonus: a.attack_bonus || 0,
      damage_dice: a.damage?.[0]?.damage_dice || '1d6',
      damage_type: a.damage?.[0]?.damage_type?.name?.toLowerCase() || 'bludgeoning'
    }));
    
    // Extract environment/habitat from tags or type
    const environments = m.environments || [];
    
    sql += `INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions, environments, source) VALUES (
  ${escapeSQL(item.index)}, ${escapeSQL(m.name)}, ${escapeSQL(m.size)}, ${escapeSQL(m.type)},
  ${ac}, ${m.hit_points || 10}, ${escapeSQL(m.hit_dice)}, ${speed},
  ${m.strength || 10}, ${m.dexterity || 10}, ${m.constitution || 10}, ${m.intelligence || 10}, ${m.wisdom || 10}, ${m.charisma || 10},
  ${escapeSQL(String(m.challenge_rating))}, ${m.xp || 0},
  ${escapeSQL(JSON.stringify(actions))},
  ${escapeSQL(JSON.stringify(environments))},
  'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('\nWriting monsters.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'monsters.sql'), sql);
  console.log(`Generated ${list.results.length} monsters`);
}

async function generateSpells() {
  console.log('Fetching spells...');
  const list = await fetch(`${API_BASE}/spells`);
  console.log(`Found ${list.count} spells`);
  
  let sql = `-- 5e SRD Spells (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (let i = 0; i < list.results.length; i++) {
    const item = list.results[i];
    process.stdout.write(`\rProcessing spell ${i + 1}/${list.results.length}`);
    
    const s = await fetch(`https://www.dnd5eapi.co${item.url}`);
    
    const school = s.school?.name?.toLowerCase() || 'evocation';
    const components = (s.components || []).join(', ');
    const desc = (s.desc || []).join(' ').substring(0, 1000);
    
    let damageDice = '';
    let damageType = '';
    if (s.damage?.damage_at_slot_level) {
      damageDice = Object.values(s.damage.damage_at_slot_level)[0] || '';
    } else if (s.damage?.damage_at_character_level) {
      damageDice = Object.values(s.damage.damage_at_character_level)[0] || '';
    }
    if (s.damage?.damage_type?.name) {
      damageType = s.damage.damage_type.name.toLowerCase();
    }
    
    const savingThrow = s.dc?.dc_type?.index?.toUpperCase() || '';
    const healing = s.heal_at_slot_level ? Object.values(s.heal_at_slot_level)[0] || '' : '';
    
    // Classes that can cast this spell
    const classes = (s.classes || []).map(c => c.index);
    
    sql += `INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing, classes, ritual, concentration, source) VALUES (
  ${escapeSQL(item.index)}, ${escapeSQL(s.name)}, ${s.level || 0}, ${escapeSQL(school)},
  ${escapeSQL(s.casting_time)}, ${escapeSQL(s.range)}, ${escapeSQL(components)}, ${escapeSQL(s.duration)},
  ${escapeSQL(desc)}, ${escapeSQL(damageDice)}, ${escapeSQL(damageType)}, ${escapeSQL(savingThrow)}, ${escapeSQL(healing)},
  ${escapeSQL(JSON.stringify(classes))},
  ${s.ritual || false}, ${s.concentration || false},
  'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('\nWriting spells.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'spells.sql'), sql);
  console.log(`Generated ${list.results.length} spells`);
}

async function generateClasses() {
  console.log('Fetching classes...');
  const list = await fetch(`${API_BASE}/classes`);
  console.log(`Found ${list.count} classes`);
  
  let sql = `-- 5e SRD Classes (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const c = await fetch(`https://www.dnd5eapi.co${item.url}`);
    
    const saves = (c.saving_throws || []).map(s => s.index.toUpperCase()).join(', ');
    const spellcasting = c.spellcasting?.spellcasting_ability?.index?.toUpperCase() || '';
    
    sql += `INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability, source) VALUES (
  ${escapeSQL(item.index)}, ${escapeSQL(c.name)}, ${c.hit_die || 8},
  ${escapeSQL('')}, ${escapeSQL(saves)}, ${escapeSQL(spellcasting)}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing classes.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'classes.sql'), sql);
  console.log(`Generated ${list.results.length} classes`);
}

async function generateRaces() {
  console.log('Fetching races...');
  const list = await fetch(`${API_BASE}/races`);
  console.log(`Found ${list.count} races`);
  
  let sql = `-- 5e SRD Races (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  for (const item of list.results) {
    const r = await fetch(`https://www.dnd5eapi.co${item.url}`);
    
    const abilityMods = {};
    for (const bonus of (r.ability_bonuses || [])) {
      abilityMods[bonus.ability_score.index.toUpperCase()] = bonus.bonus;
    }
    
    const traits = (r.traits || []).map(t => t.name).join(', ');
    
    sql += `INSERT INTO races (slug, name, size, speed, ability_mods, traits, source) VALUES (
  ${escapeSQL(item.index)}, ${escapeSQL(r.name)}, ${escapeSQL(r.size)}, ${r.speed || 30},
  ${escapeSQL(JSON.stringify(abilityMods))}, ${escapeSQL(traits)}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
  }
  
  console.log('Writing races.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'races.sql'), sql);
  console.log(`Generated ${list.results.length} races`);
}

async function generateEquipment() {
  console.log('Fetching equipment...');
  const list = await fetch(`${API_BASE}/equipment`);
  console.log(`Found ${list.count} equipment items`);
  
  let weaponsSql = `-- 5e SRD Weapons (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  let armorSql = `-- 5e SRD Armor (CC-BY-4.0)
-- Generated: ${new Date().toISOString()}
-- Source: https://www.dnd5eapi.co

`;

  let weapons = 0, armors = 0;
  
  for (let i = 0; i < list.results.length; i++) {
    const item = list.results[i];
    process.stdout.write(`\rProcessing equipment ${i + 1}/${list.results.length}`);
    
    const e = await fetch(`https://www.dnd5eapi.co${item.url}`);
    
    const category = e.equipment_category?.index || '';
    
    if (category === 'weapon') {
      const damage = e.damage?.damage_dice || '1d6';
      const damageType = e.damage?.damage_type?.name?.toLowerCase() || 'bludgeoning';
      const props = (e.properties || []).map(p => p.name).join(', ');
      const weaponType = (e.weapon_category || 'simple').toLowerCase();
      const weaponRange = e.weapon_range?.toLowerCase() || 'melee';
      
      weaponsSql += `INSERT INTO weapons (slug, name, type, weapon_range, damage, damage_type, weight, properties, source) VALUES (
  ${escapeSQL(item.index)}, ${escapeSQL(e.name)}, ${escapeSQL(weaponType)}, ${escapeSQL(weaponRange)},
  ${escapeSQL(damage)}, ${escapeSQL(damageType)}, ${e.weight || 0}, ${escapeSQL(props)}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
      weapons++;
    } else if (category === 'armor') {
      const ac = e.armor_class?.base || 10;
      let acBonus = '';
      if (e.armor_class?.dex_bonus) {
        acBonus = e.armor_class?.max_bonus ? `+DEX (max ${e.armor_class.max_bonus})` : '+DEX';
      }
      const strReq = e.str_minimum || 0;
      const stealth = e.stealth_disadvantage || false;
      const armorType = (e.armor_category || 'light').toLowerCase();
      
      armorSql += `INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight, source) VALUES (
  ${escapeSQL(item.index)}, ${escapeSQL(e.name)}, ${escapeSQL(armorType)}, ${ac},
  ${escapeSQL(acBonus)}, ${strReq}, ${stealth}, ${e.weight || 0}, 'srd'
) ON CONFLICT (slug) DO NOTHING;\n`;
      armors++;
    }
  }
  
  console.log('\nWriting weapons.sql and armor.sql...');
  fs.writeFileSync(path.join(SEEDS_DIR, 'weapons.sql'), weaponsSql);
  fs.writeFileSync(path.join(SEEDS_DIR, 'armor.sql'), armorSql);
  console.log(`Generated ${weapons} weapons, ${armors} armor`);
}

async function main() {
  console.log('Generating seed SQL files from 5e SRD API...\n');
  
  await generateMonsters();
  console.log('');
  await generateSpells();
  console.log('');
  await generateClasses();
  console.log('');
  await generateRaces();
  console.log('');
  await generateEquipment();
  
  console.log('\n✓ All seed files generated in seeds/');
  console.log('Run: psql $DATABASE_URL < seeds/monsters.sql');
}

main().catch(console.error);
