// Complete SRD import - adds races, magic items, and verifies all data
// Usage: DATABASE_URL=... go run cmd/seed-complete/main.go
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

	// Ensure magic_items table exists
	_, err = db.Exec(`
		CREATE TABLE IF NOT EXISTS magic_items (
			id SERIAL PRIMARY KEY,
			slug VARCHAR(100) UNIQUE NOT NULL,
			name VARCHAR(150) NOT NULL,
			rarity VARCHAR(30),
			type VARCHAR(50),
			attunement BOOLEAN DEFAULT FALSE,
			description TEXT,
			source VARCHAR(50) DEFAULT 'srd',
			created_at TIMESTAMP DEFAULT NOW()
		);
		CREATE INDEX IF NOT EXISTS idx_magic_items_rarity ON magic_items(rarity);
	`)
	if err != nil {
		log.Println("Table creation warning:", err)
	}

	// Check current counts
	var count int
	db.QueryRow("SELECT COUNT(*) FROM monsters").Scan(&count)
	fmt.Printf("Current monsters: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM spells").Scan(&count)
	fmt.Printf("Current spells: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM classes").Scan(&count)
	fmt.Printf("Current classes: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM races").Scan(&count)
	fmt.Printf("Current races: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM weapons").Scan(&count)
	fmt.Printf("Current weapons: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM armor").Scan(&count)
	fmt.Printf("Current armor: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM magic_items").Scan(&count)
	fmt.Printf("Current magic_items: %d\n", count)

	fmt.Println("\n--- Starting import ---")

	// Import races (was 0)
	seedRaces(db)
	
	// Import magic items (new)
	seedMagicItems(db)

	// Verify final counts
	fmt.Println("\n--- Final counts ---")
	db.QueryRow("SELECT COUNT(*) FROM monsters").Scan(&count)
	fmt.Printf("Monsters: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM spells").Scan(&count)
	fmt.Printf("Spells: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM classes").Scan(&count)
	fmt.Printf("Classes: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM races").Scan(&count)
	fmt.Printf("Races: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM weapons").Scan(&count)
	fmt.Printf("Weapons: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM armor").Scan(&count)
	fmt.Printf("Armor: %d\n", count)
	db.QueryRow("SELECT COUNT(*) FROM magic_items").Scan(&count)
	fmt.Printf("Magic Items: %d\n", count)

	fmt.Println("\nDone!")
}

func seedRaces(db *sql.DB) {
	fmt.Print("Fetching races...")
	data, err := fetch(apiBase + "/races")
	if err != nil {
		log.Printf("Error fetching races: %v", err)
		return
	}
	var list APIList
	json.Unmarshal(data, &list)

	fmt.Printf(" %d found\n", list.Count)

	stmt, err := db.Prepare(`
		INSERT INTO races (slug, name, size, speed, ability_mods, traits)
		VALUES ($1, $2, $3, $4, $5, $6)
		ON CONFLICT (slug) DO UPDATE SET name=$2, size=$3, speed=$4, ability_mods=$5, traits=$6
	`)
	if err != nil {
		log.Printf("Prepare error: %v", err)
		return
	}
	defer stmt.Close()

	for _, item := range list.Results {
		detail, err := fetch("https://www.dnd5eapi.co" + item.URL)
		if err != nil {
			log.Printf("Error fetching %s: %v", item.Index, err)
			continue
		}
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

		size := "Medium"
		if s, ok := r["size"].(string); ok {
			size = s
		}

		speed := 30
		if s, ok := r["speed"].(float64); ok {
			speed = int(s)
		}

		_, err = stmt.Exec(
			item.Index,
			r["name"],
			size,
			speed,
			string(modsJSON),
			strings.Join(traits, ", "),
		)
		if err != nil {
			log.Printf("Insert error for %s: %v", item.Index, err)
		}
	}
	fmt.Printf("  Inserted %d races\n", list.Count)
}

func seedMagicItems(db *sql.DB) {
	fmt.Print("Fetching magic items...")
	data, err := fetch(apiBase + "/magic-items")
	if err != nil {
		log.Printf("Error fetching magic items: %v", err)
		return
	}
	var list APIList
	json.Unmarshal(data, &list)

	fmt.Printf(" %d found\n", list.Count)

	stmt, err := db.Prepare(`
		INSERT INTO magic_items (slug, name, rarity, type, attunement, description)
		VALUES ($1, $2, $3, $4, $5, $6)
		ON CONFLICT (slug) DO UPDATE SET name=$2, rarity=$3, type=$4, attunement=$5, description=$6
	`)
	if err != nil {
		log.Printf("Prepare error: %v", err)
		return
	}
	defer stmt.Close()

	for i, item := range list.Results {
		detail, err := fetch("https://www.dnd5eapi.co" + item.URL)
		if err != nil {
			log.Printf("Error fetching %s: %v", item.Index, err)
			continue
		}
		var m map[string]interface{}
		json.Unmarshal(detail, &m)

		rarity := "common"
		if r, ok := m["rarity"].(map[string]interface{}); ok {
			if name, ok := r["name"].(string); ok {
				rarity = strings.ToLower(name)
			}
		}

		itemType := "wondrous item"
		if cat, ok := m["equipment_category"].(map[string]interface{}); ok {
			if name, ok := cat["name"].(string); ok {
				itemType = strings.ToLower(name)
			}
		}

		attunement := false
		if desc, ok := m["desc"].([]interface{}); ok {
			for _, d := range desc {
				if s, ok := d.(string); ok && strings.Contains(strings.ToLower(s), "requires attunement") {
					attunement = true
					break
				}
			}
		}

		desc := ""
		if descArr, ok := m["desc"].([]interface{}); ok {
			parts := []string{}
			for _, d := range descArr {
				if s, ok := d.(string); ok {
					parts = append(parts, s)
				}
			}
			desc = strings.Join(parts, "\n")
			if len(desc) > 2000 {
				desc = desc[:2000]
			}
		}

		_, err = stmt.Exec(
			item.Index,
			m["name"],
			rarity,
			itemType,
			attunement,
			desc,
		)
		if err != nil {
			log.Printf("Insert error for %s: %v", item.Index, err)
		}

		if (i+1)%50 == 0 {
			fmt.Printf("  %d/%d\n", i+1, list.Count)
		}
	}
	fmt.Printf("  Inserted %d magic items\n", list.Count)
}
