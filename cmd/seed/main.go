// Seed SRD data into Postgres from 5e SRD API
// Usage: go run cmd/seed/main.go
package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"strings"

	_ "github.com/lib/pq"
)

const apiBase = "https://www.dnd5eapi.co/api/2014"

type APIList struct {
	Count   int `json:"count"`
	Results []struct {
		Index string `json:"index"`
		Name  string `json:"name"`
		URL   string `json:"url"`
	} `json:"results"`
}

func fetch(url string) ([]byte, error) {
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	return io.ReadAll(resp.Body)
}

func main() {
	dbURL := os.Getenv("DATABASE_URL")
	if dbURL == "" {
		log.Fatal("DATABASE_URL required")
	}

	db, err := sql.Open("postgres", dbURL)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	// Run migrations first
	migration, err := os.ReadFile("migrations/003_srd_tables.sql")
	if err != nil {
		log.Fatal("Can't read migration:", err)
	}
	if _, err := db.Exec(string(migration)); err != nil {
		log.Println("Migration warning:", err)
	}

	seedMonsters(db)
	seedSpells(db)
	seedClasses(db)
	seedRaces(db)
	seedEquipment(db)

	fmt.Println("Done!")
}

func seedMonsters(db *sql.DB) {
	fmt.Print("Fetching monsters...")
	data, _ := fetch(apiBase + "/monsters")
	var list APIList
	json.Unmarshal(data, &list)

	fmt.Printf(" %d found\n", list.Count)

	stmt, _ := db.Prepare(`
		INSERT INTO monsters (slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)
		ON CONFLICT (slug) DO UPDATE SET
			name=$2, size=$3, type=$4, ac=$5, hp=$6, hit_dice=$7, speed=$8,
			str=$9, dex=$10, con=$11, intl=$12, wis=$13, cha=$14, cr=$15, xp=$16, actions=$17
	`)

	for i, item := range list.Results {
		detail, _ := fetch("https://www.dnd5eapi.co" + item.URL)
		var m map[string]interface{}
		json.Unmarshal(detail, &m)

		ac := 10
		if acArr, ok := m["armor_class"].([]interface{}); ok && len(acArr) > 0 {
			if acMap, ok := acArr[0].(map[string]interface{}); ok {
				ac = int(acMap["value"].(float64))
			}
		}

		speed := 30
		if speedMap, ok := m["speed"].(map[string]interface{}); ok {
			if walk, ok := speedMap["walk"].(string); ok {
				fmt.Sscanf(walk, "%d", &speed)
			}
		}

		actions := []map[string]interface{}{}
		if actArr, ok := m["actions"].([]interface{}); ok {
			for _, a := range actArr {
				if act, ok := a.(map[string]interface{}); ok {
					action := map[string]interface{}{
						"name":         act["name"],
						"attack_bonus": 0,
						"damage_dice":  "1d6",
						"damage_type":  "bludgeoning",
					}
					if ab, ok := act["attack_bonus"].(float64); ok {
						action["attack_bonus"] = int(ab)
					}
					if dmgArr, ok := act["damage"].([]interface{}); ok && len(dmgArr) > 0 {
						if dmg, ok := dmgArr[0].(map[string]interface{}); ok {
							if dice, ok := dmg["damage_dice"].(string); ok {
								action["damage_dice"] = dice
							}
							if dtype, ok := dmg["damage_type"].(map[string]interface{}); ok {
								action["damage_type"] = dtype["name"]
							}
						}
					}
					actions = append(actions, action)
				}
			}
		}
		actionsJSON, _ := json.Marshal(actions)

		stmt.Exec(
			item.Index,
			m["name"],
			m["size"],
			m["type"],
			ac,
			int(m["hit_points"].(float64)),
			m["hit_dice"],
			speed,
			int(m["strength"].(float64)),
			int(m["dexterity"].(float64)),
			int(m["constitution"].(float64)),
			int(m["intelligence"].(float64)),
			int(m["wisdom"].(float64)),
			int(m["charisma"].(float64)),
			fmt.Sprintf("%v", m["challenge_rating"]),
			int(m["xp"].(float64)),
			string(actionsJSON),
		)

		if (i+1)%50 == 0 {
			fmt.Printf("  %d/%d\n", i+1, list.Count)
		}
	}
	fmt.Printf("  Inserted %d monsters\n", list.Count)
}

func seedSpells(db *sql.DB) {
	fmt.Print("Fetching spells...")
	data, _ := fetch(apiBase + "/spells")
	var list APIList
	json.Unmarshal(data, &list)

	fmt.Printf(" %d found\n", list.Count)

	stmt, _ := db.Prepare(`
		INSERT INTO spells (slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
		ON CONFLICT (slug) DO UPDATE SET
			name=$2, level=$3, school=$4, casting_time=$5, range=$6, components=$7, duration=$8,
			description=$9, damage_dice=$10, damage_type=$11, saving_throw=$12, healing=$13
	`)

	for i, item := range list.Results {
		detail, _ := fetch("https://www.dnd5eapi.co" + item.URL)
		var s map[string]interface{}
		json.Unmarshal(detail, &s)

		school := "evocation"
		if sch, ok := s["school"].(map[string]interface{}); ok {
			school = strings.ToLower(sch["name"].(string))
		}

		components := ""
		if comp, ok := s["components"].([]interface{}); ok {
			parts := []string{}
			for _, c := range comp {
				parts = append(parts, c.(string))
			}
			components = strings.Join(parts, ", ")
		}

		desc := ""
		if descArr, ok := s["desc"].([]interface{}); ok && len(descArr) > 0 {
			desc = descArr[0].(string)
			if len(desc) > 500 {
				desc = desc[:500]
			}
		}

		damageDice := ""
		damageType := ""
		if dmg, ok := s["damage"].(map[string]interface{}); ok {
			if slot, ok := dmg["damage_at_slot_level"].(map[string]interface{}); ok {
				for _, v := range slot {
					damageDice = v.(string)
					break
				}
			}
			if dtype, ok := dmg["damage_type"].(map[string]interface{}); ok {
				damageType = strings.ToLower(dtype["name"].(string))
			}
		}

		savingThrow := ""
		if dc, ok := s["dc"].(map[string]interface{}); ok {
			if dcType, ok := dc["dc_type"].(map[string]interface{}); ok {
				savingThrow = strings.ToUpper(dcType["index"].(string))
			}
		}

		healing := ""
		if heal, ok := s["heal_at_slot_level"].(map[string]interface{}); ok {
			for _, v := range heal {
				healing = v.(string)
				break
			}
		}

		stmt.Exec(
			item.Index,
			s["name"],
			int(s["level"].(float64)),
			school,
			s["casting_time"],
			s["range"],
			components,
			s["duration"],
			desc,
			damageDice,
			damageType,
			savingThrow,
			healing,
		)

		if (i+1)%50 == 0 {
			fmt.Printf("  %d/%d\n", i+1, list.Count)
		}
	}
	fmt.Printf("  Inserted %d spells\n", list.Count)
}

func seedClasses(db *sql.DB) {
	fmt.Print("Fetching classes...")
	data, _ := fetch(apiBase + "/classes")
	var list APIList
	json.Unmarshal(data, &list)

	fmt.Printf(" %d found\n", list.Count)

	stmt, _ := db.Prepare(`
		INSERT INTO classes (slug, name, hit_die, primary_ability, saving_throws, spellcasting_ability)
		VALUES ($1, $2, $3, $4, $5, $6)
		ON CONFLICT (slug) DO UPDATE SET name=$2, hit_die=$3, primary_ability=$4, saving_throws=$5, spellcasting_ability=$6
	`)

	for _, item := range list.Results {
		detail, _ := fetch("https://www.dnd5eapi.co" + item.URL)
		var c map[string]interface{}
		json.Unmarshal(detail, &c)

		saves := []string{}
		if saveArr, ok := c["saving_throws"].([]interface{}); ok {
			for _, s := range saveArr {
				if sMap, ok := s.(map[string]interface{}); ok {
					saves = append(saves, strings.ToUpper(sMap["index"].(string)))
				}
			}
		}

		spellcasting := ""
		if sc, ok := c["spellcasting"].(map[string]interface{}); ok {
			if ability, ok := sc["spellcasting_ability"].(map[string]interface{}); ok {
				spellcasting = strings.ToUpper(ability["index"].(string))
			}
		}

		stmt.Exec(
			item.Index,
			c["name"],
			int(c["hit_die"].(float64)),
			"", // primary ability not in API
			strings.Join(saves, ", "),
			spellcasting,
		)
	}
	fmt.Printf("  Inserted %d classes\n", list.Count)
}

func seedRaces(db *sql.DB) {
	fmt.Print("Fetching races...")
	data, _ := fetch(apiBase + "/races")
	var list APIList
	json.Unmarshal(data, &list)

	fmt.Printf(" %d found\n", list.Count)

	stmt, _ := db.Prepare(`
		INSERT INTO races (slug, name, size, speed, ability_mods, traits)
		VALUES ($1, $2, $3, $4, $5, $6)
		ON CONFLICT (slug) DO UPDATE SET name=$2, size=$3, speed=$4, ability_mods=$5, traits=$6
	`)

	for _, item := range list.Results {
		detail, _ := fetch("https://www.dnd5eapi.co" + item.URL)
		var r map[string]interface{}
		json.Unmarshal(detail, &r)

		abilityMods := map[string]int{}
		if bonuses, ok := r["ability_bonuses"].([]interface{}); ok {
			for _, b := range bonuses {
				if bonus, ok := b.(map[string]interface{}); ok {
					if ability, ok := bonus["ability_score"].(map[string]interface{}); ok {
						abilityMods[strings.ToUpper(ability["index"].(string))] = int(bonus["bonus"].(float64))
					}
				}
			}
		}
		modsJSON, _ := json.Marshal(abilityMods)

		traits := []string{}
		if traitArr, ok := r["traits"].([]interface{}); ok {
			for _, t := range traitArr {
				if trait, ok := t.(map[string]interface{}); ok {
					traits = append(traits, trait["name"].(string))
				}
			}
		}

		stmt.Exec(
			item.Index,
			r["name"],
			r["size"],
			int(r["speed"].(float64)),
			string(modsJSON),
			strings.Join(traits, ", "),
		)
	}
	fmt.Printf("  Inserted %d races\n", list.Count)
}

func seedEquipment(db *sql.DB) {
	fmt.Print("Fetching equipment...")
	data, _ := fetch(apiBase + "/equipment")
	var list APIList
	json.Unmarshal(data, &list)

	fmt.Printf(" %d found\n", list.Count)

	weaponStmt, _ := db.Prepare(`
		INSERT INTO weapons (slug, name, type, damage, damage_type, weight, properties)
		VALUES ($1, $2, $3, $4, $5, $6, $7)
		ON CONFLICT (slug) DO UPDATE SET name=$2, type=$3, damage=$4, damage_type=$5, weight=$6, properties=$7
	`)

	armorStmt, _ := db.Prepare(`
		INSERT INTO armor (slug, name, type, ac, ac_bonus, str_req, stealth_disadvantage, weight)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
		ON CONFLICT (slug) DO UPDATE SET name=$2, type=$3, ac=$4, ac_bonus=$5, str_req=$6, stealth_disadvantage=$7, weight=$8
	`)

	weapons, armors := 0, 0
	for _, item := range list.Results {
		detail, _ := fetch("https://www.dnd5eapi.co" + item.URL)
		var e map[string]interface{}
		json.Unmarshal(detail, &e)

		cat, _ := e["equipment_category"].(map[string]interface{})
		category := ""
		if cat != nil {
			category = cat["index"].(string)
		}

		if category == "weapon" {
			damageDice := "1d6"
			damageType := "bludgeoning"
			if dmg, ok := e["damage"].(map[string]interface{}); ok {
				if dice, ok := dmg["damage_dice"].(string); ok {
					damageDice = dice
				}
				if dtype, ok := dmg["damage_type"].(map[string]interface{}); ok {
					damageType = strings.ToLower(dtype["name"].(string))
				}
			}

			props := []string{}
			if propArr, ok := e["properties"].([]interface{}); ok {
				for _, p := range propArr {
					if prop, ok := p.(map[string]interface{}); ok {
						props = append(props, prop["name"].(string))
					}
				}
			}

			weight := 0.0
			if w, ok := e["weight"].(float64); ok {
				weight = w
			}

			weaponType := "simple"
			if wc, ok := e["weapon_category"].(string); ok {
				weaponType = strings.ToLower(wc)
			}

			weaponStmt.Exec(item.Index, e["name"], weaponType, damageDice, damageType, weight, strings.Join(props, ", "))
			weapons++
		} else if category == "armor" {
			ac := 10
			acBonus := ""
			if acMap, ok := e["armor_class"].(map[string]interface{}); ok {
				if base, ok := acMap["base"].(float64); ok {
					ac = int(base)
				}
				if dexBonus, ok := acMap["dex_bonus"].(bool); ok && dexBonus {
					if maxBonus, ok := acMap["max_bonus"].(float64); ok {
						acBonus = fmt.Sprintf("+DEX (max %d)", int(maxBonus))
					} else {
						acBonus = "+DEX"
					}
				}
			}

			strReq := 0
			if sr, ok := e["str_minimum"].(float64); ok {
				strReq = int(sr)
			}

			stealth := false
			if sd, ok := e["stealth_disadvantage"].(bool); ok {
				stealth = sd
			}

			weight := 0.0
			if w, ok := e["weight"].(float64); ok {
				weight = w
			}

			armorType := "light"
			if ac, ok := e["armor_category"].(string); ok {
				armorType = strings.ToLower(ac)
			}

			armorStmt.Exec(item.Index, e["name"], armorType, ac, acBonus, strReq, stealth, weight)
			armors++
		}
	}
	fmt.Printf("  Inserted %d weapons, %d armor\n", weapons, armors)
}
