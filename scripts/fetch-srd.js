#!/usr/bin/env node
// Fetch all 5e SRD data and generate Go code

const https = require('https');
const fs = require('fs');

const API_BASE = 'https://www.dnd5eapi.co/api/2014';

async function fetch(url) {
  return new Promise((resolve, reject) => {
    https.get(url, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => resolve(JSON.parse(data)));
    }).on('error', reject);
  });
}

async function fetchAll(endpoint) {
  const list = await fetch(`${API_BASE}/${endpoint}`);
  const items = [];
  for (const item of list.results.slice(0, 100)) { // Limit to 100 for now
    const detail = await fetch(`https://www.dnd5eapi.co${item.url}`);
    items.push(detail);
    process.stderr.write('.');
  }
  process.stderr.write('\n');
  return items;
}

function toGoKey(name) {
  return name.toLowerCase().replace(/[^a-z0-9]+/g, '_').replace(/^_|_$/g, '');
}

async function main() {
  console.log('Fetching monsters...');
  const monsters = await fetchAll('monsters');
  
  console.log('Fetching spells...');
  const spells = await fetchAll('spells');
  
  // Generate Go code
  let go = `// Generated from 5e SRD API - DO NOT EDIT
// Source: https://www.dnd5eapi.co (CC-BY-4.0)
// Generated: ${new Date().toISOString()}

package main

`;

  // Monsters
  go += `var srdMonsters = map[string]SRDMonster{\n`;
  for (const m of monsters) {
    const actions = (m.actions || []).slice(0, 3).map(a => {
      const dmg = a.damage?.[0]?.damage_dice || '1d6';
      const dtype = a.damage?.[0]?.damage_type?.name || 'bludgeoning';
      const bonus = a.attack_bonus || 0;
      return `{Name: "${a.name}", AttackBonus: ${bonus}, DamageDice: "${dmg}", DamageType: "${dtype.toLowerCase()}"}`;
    });
    
    go += `\t"${m.index}": {Name: "${m.name}", Size: "${m.size}", Type: "${m.type}", AC: ${m.armor_class?.[0]?.value || 10}, HP: ${m.hit_points || 10}, HitDice: "${m.hit_dice || '1d8'}", Speed: ${m.speed?.walk?.replace(' ft.','') || 30}, STR: ${m.strength || 10}, DEX: ${m.dexterity || 10}, CON: ${m.constitution || 10}, INT: ${m.intelligence || 10}, WIS: ${m.wisdom || 10}, CHA: ${m.charisma || 10}, CR: "${m.challenge_rating || '0'}", XP: ${m.xp || 0}, Actions: []SRDAction{${actions.join(', ')}}},\n`;
  }
  go += `}\n\n`;

  // Spells
  go += `var srdSpells = map[string]SRDSpell{\n`;
  for (const s of spells) {
    const dmg = s.damage?.damage_at_slot_level?.['1'] || s.damage?.damage_at_character_level?.['1'] || '';
    const dtype = s.damage?.damage_type?.name?.toLowerCase() || '';
    const save = s.dc?.dc_type?.index?.toUpperCase() || '';
    const heal = s.heal_at_slot_level?.['1'] || '';
    
    go += `\t"${s.index}": {Name: "${s.name}", Level: ${s.level}, School: "${s.school?.name?.toLowerCase() || 'evocation'}", CastingTime: "${s.casting_time || '1 action'}", Range: "${s.range || 'Self'}", Components: "${(s.components || []).join(', ')}", Duration: "${s.duration || 'Instantaneous'}", DamageDice: "${dmg}", DamageType: "${dtype}", SavingThrow: "${save}", Healing: "${heal}", Description: "${(s.desc?.[0] || '').slice(0, 100).replace(/"/g, '\\"').replace(/\n/g, ' ')}"},\n`;
  }
  go += `}\n`;

  fs.writeFileSync('srd_generated.go', go);
  console.log(`Generated srd_generated.go with ${monsters.length} monsters and ${spells.length} spells`);
}

main().catch(console.error);
