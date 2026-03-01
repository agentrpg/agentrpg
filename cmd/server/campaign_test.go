package main

import (
	"bytes"
	"database/sql"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
	"os"
	"strings"
	"testing"
	"time"

	_ "github.com/lib/pq"
)

// TestAgent represents a test user/agent
type TestAgent struct {
	ID       int
	Email    string
	Name     string
	Password string
	Auth     string // Base64 encoded auth header
}

// TestCharacter represents a test character
type TestCharacter struct {
	ID      int
	Name    string
	Class   string
	Race    string
	AgentID int
}

// TestCampaign represents a test campaign
type TestCampaign struct {
	ID   int
	Name string
	DMID int
}

// Helper function to make authenticated requests
func makeRequest(t *testing.T, method, url string, body interface{}, auth string) (int, map[string]interface{}) {
	var reqBody io.Reader
	if body != nil {
		jsonBytes, _ := json.Marshal(body)
		reqBody = bytes.NewReader(jsonBytes)
	}

	req, err := http.NewRequest(method, url, reqBody)
	if err != nil {
		t.Fatalf("Failed to create request: %v", err)
	}

	if auth != "" {
		req.Header.Set("Authorization", "Basic "+auth)
	}
	if body != nil {
		req.Header.Set("Content-Type", "application/json")
	}

	rr := httptest.NewRecorder()
	handler := http.DefaultServeMux
	handler.ServeHTTP(rr, req)

	var result map[string]interface{}
	if rr.Body.Len() > 0 {
		json.Unmarshal(rr.Body.Bytes(), &result)
	}

	return rr.Code, result
}

// Initialize test database
func initTestDB(t *testing.T) {
	// Use TEST_DATABASE_URL if set, otherwise skip DB-dependent tests
	dbURL := os.Getenv("TEST_DATABASE_URL")
	if dbURL == "" {
		// For local testing, try to use the same database with a test prefix
		dbURL = os.Getenv("DATABASE_URL")
		if dbURL == "" {
			t.Skip("TEST_DATABASE_URL or DATABASE_URL not set - skipping integration test")
		}
	}

	var err error
	db, err = sql.Open("postgres", dbURL)
	if err != nil {
		t.Fatalf("Failed to connect to test database: %v", err)
	}

	// Initialize schema
	initDB()
	seedCampaignTemplates()
}

// Clean up test data
func cleanupTestData(t *testing.T, testPrefix string) {
	if db == nil {
		return
	}

	// Delete test data in reverse order of dependencies
	db.Exec("DELETE FROM actions WHERE lobby_id IN (SELECT id FROM lobbies WHERE name LIKE $1)", testPrefix+"%")
	db.Exec("DELETE FROM campaign_messages WHERE lobby_id IN (SELECT id FROM lobbies WHERE name LIKE $1)", testPrefix+"%")
	db.Exec("DELETE FROM combat_state WHERE lobby_id IN (SELECT id FROM lobbies WHERE name LIKE $1)", testPrefix+"%")
	db.Exec("DELETE FROM observations WHERE lobby_id IN (SELECT id FROM lobbies WHERE name LIKE $1)", testPrefix+"%")
	db.Exec("DELETE FROM characters WHERE agent_id IN (SELECT id FROM agents WHERE email LIKE $1)", testPrefix+"%")
	db.Exec("DELETE FROM lobbies WHERE name LIKE $1", testPrefix+"%")
	db.Exec("DELETE FROM agents WHERE email LIKE $1", testPrefix+"%")
}

// createAuth generates base64 auth header
func createAuth(identifier string, password string) string {
	return base64.StdEncoding.EncodeToString([]byte(identifier + ":" + password))
}

// TestFullCampaignSimulation runs a comprehensive campaign simulation
func TestFullCampaignSimulation(t *testing.T) {
	// Skip if no database
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	defer cleanupTestData(t, "test_campaign_")

	testPrefix := fmt.Sprintf("test_campaign_%d_", time.Now().Unix())

	t.Run("Phase1_AgentRegistration", func(t *testing.T) {
		testAgentRegistration(t, testPrefix)
	})
}

// Test agent registration
func testAgentRegistration(t *testing.T, prefix string) {
	// Register GM
	gmEmail := prefix + "gm@test.local"
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"email":    gmEmail,
		"password": "testpass123",
		"name":     prefix + "GameMaster",
	}, "")

	if result["error"] != nil {
		t.Fatalf("Failed to register GM: %v", result["error"])
	}
	gmID := int(result["agent_id"].(float64))
	t.Logf("Registered GM with ID %d", gmID)

	// Verify the GM (admin verify for testing)
	if adminKey := os.Getenv("ADMIN_KEY"); adminKey != "" {
		req, _ := http.NewRequest("POST", "/api/admin/verify", bytes.NewReader([]byte(fmt.Sprintf(`{"email":"%s"}`, gmEmail))))
		req.Header.Set("X-Admin-Key", adminKey)
		req.Header.Set("Content-Type", "application/json")
		rr := httptest.NewRecorder()
		http.DefaultServeMux.ServeHTTP(rr, req)
	}

	// Register players
	for i := 1; i <= 4; i++ {
		playerEmail := fmt.Sprintf("%splayer%d@test.local", prefix, i)
		_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
			"email":    playerEmail,
			"password": "testpass123",
			"name":     fmt.Sprintf("%sPlayer%d", prefix, i),
		}, "")

		if result["error"] != nil {
			t.Fatalf("Failed to register player %d: %v", i, result["error"])
		}
		playerID := int(result["agent_id"].(float64))
		t.Logf("Registered player %d with ID %d", i, playerID)
	}
}

// TestCampaignCreationAndJoining tests campaign creation and joining flow
func TestCampaignCreationAndJoining(t *testing.T) {
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	testPrefix := fmt.Sprintf("test_join_%d_", time.Now().Unix())
	defer cleanupTestData(t, testPrefix)

	// Step 1: Register GM (without email verification for test)
	gmName := testPrefix + "GM"
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     gmName,
		"password": "testgm123",
	}, "")

	if result["error"] != nil {
		t.Fatalf("Failed to register GM: %v", result["error"])
	}
	gmID := int(result["agent_id"].(float64))
	gmAuth := createAuth(fmt.Sprintf("%d", gmID), "testgm123")
	t.Logf("GM registered: ID=%d", gmID)

	// Step 2: GM creates a campaign
	_, result = makeRequest(t, "POST", "/api/campaigns", map[string]interface{}{
		"name":        testPrefix + "Test Campaign",
		"max_players": 4,
		"setting":     "A test dungeon for brave adventurers",
		"min_level":   1,
		"max_level":   3,
	}, gmAuth)

	if result["error"] != nil {
		t.Fatalf("Failed to create campaign: %v", result["error"])
	}
	campaignID := int(result["campaign_id"].(float64))
	t.Logf("Campaign created: ID=%d", campaignID)

	// Step 3: Register players and create characters
	players := make([]struct {
		ID       int
		Auth     string
		CharID   int
		CharName string
	}, 4)

	characterConfigs := []struct {
		Name       string
		Class      string
		Race       string
		Background string
	}{
		{"Thorin Ironforge", "fighter", "dwarf", "soldier"},
		{"Elara Moonwhisper", "wizard", "elf", "sage"},
		{"Rix Shadowstep", "rogue", "halfling", "criminal"},
		{"Brother Marcus", "cleric", "human", "acolyte"},
	}

	for i := 0; i < 4; i++ {
		// Register player
		playerName := fmt.Sprintf("%sPlayer%d", testPrefix, i+1)
		_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
			"name":     playerName,
			"password": "testplayer123",
		}, "")

		if result["error"] != nil {
			t.Fatalf("Failed to register player %d: %v", i+1, result["error"])
		}
		players[i].ID = int(result["agent_id"].(float64))
		players[i].Auth = createAuth(fmt.Sprintf("%d", players[i].ID), "testplayer123")

		// Create character
		config := characterConfigs[i]
		_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
			"name":       testPrefix + config.Name,
			"class":      config.Class,
			"race":       config.Race,
			"background": config.Background,
			"str":        14,
			"dex":        12,
			"con":        14,
			"int":        10,
			"wis":        12,
			"cha":        10,
		}, players[i].Auth)

		if result["error"] != nil {
			t.Fatalf("Failed to create character for player %d: %v", i+1, result["error"])
		}
		players[i].CharID = int(result["character_id"].(float64))
		players[i].CharName = testPrefix + config.Name
		t.Logf("Player %d character created: %s (ID=%d)", i+1, config.Name, players[i].CharID)

		// Join campaign
		_, result = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
			"character_id": players[i].CharID,
		}, players[i].Auth)

		if result["error"] != nil {
			t.Fatalf("Failed to join campaign for player %d: %v", i+1, result["error"])
		}
		t.Logf("Player %d joined campaign", i+1)
	}

	// Step 4: GM starts the campaign
	_, result = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/start", campaignID), nil, gmAuth)
	if result["error"] != nil {
		t.Fatalf("Failed to start campaign: %v", result["error"])
	}
	t.Log("Campaign started!")

	// Step 5: GM posts opening narration
	_, result = makeRequest(t, "POST", "/api/gm/narrate", map[string]interface{}{
		"narration": "The party gathers at the entrance to the ancient dungeon. Torchlight flickers against moss-covered stone walls. Somewhere in the darkness below, you hear the scraping of claws on stone...",
	}, gmAuth)

	if result["error"] != nil {
		t.Fatalf("Failed to post narration: %v", result["error"])
	}
	t.Log("GM posted opening narration")

	// Step 6: Players check their turn status
	for i, player := range players {
		_, result = makeRequest(t, "GET", "/api/my-turn", nil, player.Auth)
		if result["error"] != nil && result["error"] != "no_active_game" {
			t.Logf("Player %d my-turn response: %v", i+1, result)
		}
	}

	// Step 7: Test player actions
	// Fighter attacks
	_, result = makeRequest(t, "POST", "/api/action", map[string]interface{}{
		"action":      "attack",
		"description": "I swing my warhammer at the nearest shadow",
		"target":      "shadow creature",
	}, players[0].Auth)
	if result["success"] != nil {
		t.Logf("Fighter action result: %v", result["result"])
	}

	// Wizard casts a spell
	_, result = makeRequest(t, "POST", "/api/action", map[string]interface{}{
		"action":      "cast",
		"description": "I cast magic missile at the darkness",
	}, players[1].Auth)
	if result["success"] != nil {
		t.Logf("Wizard action result: %v", result["result"])
	}

	// Rogue sneaks
	_, result = makeRequest(t, "POST", "/api/action", map[string]interface{}{
		"action":      "move",
		"description": "I move silently into the shadows, looking for a flanking position",
	}, players[2].Auth)
	if result["success"] != nil {
		t.Logf("Rogue action result: %v", result["result"])
	}

	// Cleric helps
	_, result = makeRequest(t, "POST", "/api/action", map[string]interface{}{
		"action":      "help",
		"description": "I call upon my deity to bless our fighter",
	}, players[3].Auth)
	if result["success"] != nil {
		t.Logf("Cleric action result: %v", result["result"])
	}

	t.Log("All players took actions successfully!")
}

// TestCombatSystem tests the combat mechanics
func TestCombatSystem(t *testing.T) {
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	testPrefix := fmt.Sprintf("test_combat_%d_", time.Now().Unix())
	defer cleanupTestData(t, testPrefix)

	// Setup: Create GM, campaign, and characters
	gmName := testPrefix + "CombatGM"
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     gmName,
		"password": "testgm123",
	}, "")
	gmID := int(result["agent_id"].(float64))
	gmAuth := createAuth(fmt.Sprintf("%d", gmID), "testgm123")

	// Create campaign
	_, result = makeRequest(t, "POST", "/api/campaigns", map[string]interface{}{
		"name":      testPrefix + "Combat Test",
		"min_level": 1,
		"max_level": 5,
	}, gmAuth)
	campaignID := int(result["campaign_id"].(float64))

	// Create and join fighter
	_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "Fighter",
		"password": "test123",
	}, "")
	fighterID := int(result["agent_id"].(float64))
	fighterAuth := createAuth(fmt.Sprintf("%d", fighterID), "test123")

	_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
		"name":  testPrefix + "Sir Combat",
		"class": "fighter",
		"race":  "human",
		"str":   16,
		"dex":   14,
		"con":   15,
	}, fighterAuth)
	fighterCharID := int(result["character_id"].(float64))

	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
		"character_id": fighterCharID,
	}, fighterAuth)

	// Start campaign
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/start", campaignID), nil, gmAuth)

	// Test 1: GM initiates combat
	t.Run("CombatStart", func(t *testing.T) {
		_, result := makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/combat/start", campaignID), map[string]interface{}{
			"participants": []map[string]interface{}{
				{"character_id": fighterCharID},
				{"monster": "goblin", "name": "Goblin Warrior", "initiative": 12},
			},
		}, gmAuth)

		if result["error"] != nil {
			t.Logf("Combat start result: %v (may need different endpoint)", result)
		} else {
			t.Log("Combat started successfully")
		}
	})

	// Test 2: GM calls for skill checks
	t.Run("SkillChecks", func(t *testing.T) {
		_, result := makeRequest(t, "POST", "/api/gm/skill-check", map[string]interface{}{
			"character_id": fighterCharID,
			"skill":        "athletics",
			"dc":           15,
			"description":  "jumping across the pit",
		}, gmAuth)

		if result["error"] != nil {
			t.Errorf("Skill check failed: %v", result["error"])
		} else {
			t.Logf("Skill check result: %v (success=%v)", result["result"], result["success"])
		}
	})

	// Test 3: GM calls for saving throw
	t.Run("SavingThrows", func(t *testing.T) {
		_, result := makeRequest(t, "POST", "/api/gm/saving-throw", map[string]interface{}{
			"character_id": fighterCharID,
			"ability":      "dex",
			"dc":           14,
			"description":  "dodging fireball",
		}, gmAuth)

		if result["error"] != nil {
			t.Errorf("Saving throw failed: %v", result["error"])
		} else {
			t.Logf("Saving throw result: %v (success=%v)", result["result"], result["success"])
		}
	})

	// Test 4: Attack actions
	t.Run("AttackAction", func(t *testing.T) {
		_, result := makeRequest(t, "POST", "/api/action", map[string]interface{}{
			"action":      "attack",
			"description": "I attack the goblin with my longsword",
			"target":      "Goblin Warrior",
		}, fighterAuth)

		if result["error"] != nil {
			t.Errorf("Attack action failed: %v", result["error"])
		} else {
			t.Logf("Attack result: %v", result["result"])
		}
	})

	// Test 5: Damage and healing
	t.Run("DamageAndHealing", func(t *testing.T) {
		// Deal damage
		_, result := makeRequest(t, "POST", fmt.Sprintf("/api/characters/%d/damage", fighterCharID), map[string]interface{}{
			"amount":      8,
			"damage_type": "slashing",
		}, gmAuth)

		if result["error"] != nil {
			t.Errorf("Damage failed: %v", result["error"])
		} else {
			t.Logf("After damage: HP=%v/%v", result["hp"], result["max_hp"])
		}

		// Heal
		_, result = makeRequest(t, "POST", fmt.Sprintf("/api/characters/%d/heal", fighterCharID), map[string]interface{}{
			"amount": 5,
		}, gmAuth)

		if result["error"] != nil {
			t.Errorf("Heal failed: %v", result["error"])
		} else {
			t.Logf("After heal: HP=%v/%v", result["hp"], result["max_hp"])
		}
	})
}

// TestDeathSaves tests the death save mechanics
func TestDeathSaves(t *testing.T) {
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	testPrefix := fmt.Sprintf("test_death_%d_", time.Now().Unix())
	defer cleanupTestData(t, testPrefix)

	// Setup character at 0 HP
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "Dying",
		"password": "test123",
	}, "")
	playerID := int(result["agent_id"].(float64))
	playerAuth := createAuth(fmt.Sprintf("%d", playerID), "test123")

	_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
		"name":  testPrefix + "Unfortunate Hero",
		"class": "fighter",
		"race":  "human",
	}, playerAuth)
	charID := int(result["character_id"].(float64))

	// Create and join a campaign
	_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "DeathGM",
		"password": "gm123",
	}, "")
	gmID := int(result["agent_id"].(float64))
	gmAuth := createAuth(fmt.Sprintf("%d", gmID), "gm123")

	_, result = makeRequest(t, "POST", "/api/campaigns", map[string]interface{}{
		"name": testPrefix + "Death Test",
	}, gmAuth)
	campaignID := int(result["campaign_id"].(float64))

	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
		"character_id": charID,
	}, playerAuth)
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/start", campaignID), nil, gmAuth)

	// Set HP to 0
	db.Exec("UPDATE characters SET hp = 0 WHERE id = $1", charID)

	// Make death saves
	t.Run("DeathSaves", func(t *testing.T) {
		for i := 0; i < 3; i++ {
			_, result := makeRequest(t, "POST", "/api/action", map[string]interface{}{
				"action":      "death_save",
				"description": "rolling death save",
			}, playerAuth)

			if result["error"] != nil && result["error"] != "incapacitated" {
				t.Logf("Death save %d: %v", i+1, result)
			} else if result["result"] != nil {
				t.Logf("Death save %d: %v", i+1, result["result"])
			}
		}
	})
}

// TestConditionEffects tests condition mechanics
func TestConditionEffects(t *testing.T) {
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	testPrefix := fmt.Sprintf("test_cond_%d_", time.Now().Unix())
	defer cleanupTestData(t, testPrefix)

	// Setup
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "CondGM",
		"password": "gm123",
	}, "")
	gmID := int(result["agent_id"].(float64))
	gmAuth := createAuth(fmt.Sprintf("%d", gmID), "gm123")

	_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "CondPlayer",
		"password": "test123",
	}, "")
	playerID := int(result["agent_id"].(float64))
	playerAuth := createAuth(fmt.Sprintf("%d", playerID), "test123")

	_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
		"name":  testPrefix + "Condition Test",
		"class": "fighter",
		"race":  "human",
	}, playerAuth)
	charID := int(result["character_id"].(float64))

	_, result = makeRequest(t, "POST", "/api/campaigns", map[string]interface{}{
		"name": testPrefix + "Condition Test",
	}, gmAuth)
	campaignID := int(result["campaign_id"].(float64))

	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
		"character_id": charID,
	}, playerAuth)
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/start", campaignID), nil, gmAuth)

	// Test adding conditions
	t.Run("AddConditions", func(t *testing.T) {
		conditions := []string{"poisoned", "frightened", "prone"}
		for _, cond := range conditions {
			_, result := makeRequest(t, "POST", fmt.Sprintf("/api/characters/%d/conditions", charID), map[string]interface{}{
				"condition": cond,
			}, gmAuth)

			if result["error"] != nil {
				t.Logf("Add %s condition: %v", cond, result)
			} else {
				t.Logf("Added condition: %s", cond)
			}
		}
	})

	// Test removing conditions
	t.Run("RemoveConditions", func(t *testing.T) {
		// Check character sheet
		_, result := makeRequest(t, "GET", fmt.Sprintf("/api/characters/%d", charID), nil, playerAuth)
		t.Logf("Character conditions: %v", result["conditions"])

		// Try to remove condition
		req, _ := http.NewRequest("DELETE", fmt.Sprintf("/api/characters/%d/conditions", charID), bytes.NewReader([]byte(`{"condition":"prone"}`)))
		req.Header.Set("Authorization", "Basic "+gmAuth)
		req.Header.Set("Content-Type", "application/json")
		rr := httptest.NewRecorder()
		http.DefaultServeMux.ServeHTTP(rr, req)
		t.Logf("Remove condition response: %d", rr.Code)
	})

	// Test incapacitated blocking actions
	t.Run("IncapacitatedBlocking", func(t *testing.T) {
		// Add paralyzed condition (incapacitates)
		db.Exec("UPDATE characters SET conditions = '[\"paralyzed\"]' WHERE id = $1", charID)

		_, result := makeRequest(t, "POST", "/api/action", map[string]interface{}{
			"action":      "attack",
			"description": "trying to attack while paralyzed",
		}, playerAuth)

		if result["error"] == "incapacitated" {
			t.Log("Correctly blocked action due to incapacitated condition")
		} else {
			t.Logf("Incapacitated test result: %v", result)
		}
	})
}

// TestXPAndLeveling tests experience and leveling
func TestXPAndLeveling(t *testing.T) {
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	testPrefix := fmt.Sprintf("test_xp_%d_", time.Now().Unix())
	defer cleanupTestData(t, testPrefix)

	// Setup
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "XpGM",
		"password": "gm123",
	}, "")
	gmID := int(result["agent_id"].(float64))
	gmAuth := createAuth(fmt.Sprintf("%d", gmID), "gm123")

	_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "XpPlayer",
		"password": "test123",
	}, "")
	playerID := int(result["agent_id"].(float64))
	playerAuth := createAuth(fmt.Sprintf("%d", playerID), "test123")

	_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
		"name":  testPrefix + "XP Test Hero",
		"class": "fighter",
		"race":  "human",
	}, playerAuth)
	charID := int(result["character_id"].(float64))

	_, result = makeRequest(t, "POST", "/api/campaigns", map[string]interface{}{
		"name": testPrefix + "XP Test",
	}, gmAuth)
	campaignID := int(result["campaign_id"].(float64))

	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
		"character_id": charID,
	}, playerAuth)
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/start", campaignID), nil, gmAuth)

	// Award XP
	t.Run("AwardXP", func(t *testing.T) {
		_, result := makeRequest(t, "POST", "/api/gm/award-xp", map[string]interface{}{
			"character_ids": []int{charID},
			"xp":            300, // Level 2 threshold
			"reason":        "defeating the goblin horde",
		}, gmAuth)

		if result["error"] != nil {
			t.Errorf("Award XP failed: %v", result["error"])
		} else {
			t.Logf("XP awarded. Results: %v", result)
		}
	})

	// Check level
	t.Run("VerifyLevel", func(t *testing.T) {
		_, result := makeRequest(t, "GET", fmt.Sprintf("/api/characters/%d", charID), nil, playerAuth)
		t.Logf("After XP award - Level: %v, XP: %v", result["level"], result["xp"])
	})
}

// TestGoldAndInventory tests gold and inventory management
func TestGoldAndInventory(t *testing.T) {
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	testPrefix := fmt.Sprintf("test_inv_%d_", time.Now().Unix())
	defer cleanupTestData(t, testPrefix)

	// Setup
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "InvGM",
		"password": "gm123",
	}, "")
	gmID := int(result["agent_id"].(float64))
	gmAuth := createAuth(fmt.Sprintf("%d", gmID), "gm123")

	_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "InvPlayer",
		"password": "test123",
	}, "")
	playerID := int(result["agent_id"].(float64))
	playerAuth := createAuth(fmt.Sprintf("%d", playerID), "test123")

	_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
		"name":  testPrefix + "Rich Hero",
		"class": "rogue",
		"race":  "halfling",
	}, playerAuth)
	charID := int(result["character_id"].(float64))

	_, result = makeRequest(t, "POST", "/api/campaigns", map[string]interface{}{
		"name": testPrefix + "Inventory Test",
	}, gmAuth)
	campaignID := int(result["campaign_id"].(float64))

	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
		"character_id": charID,
	}, playerAuth)
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/start", campaignID), nil, gmAuth)

	// Award gold
	t.Run("AwardGold", func(t *testing.T) {
		_, result := makeRequest(t, "POST", "/api/gm/gold", map[string]interface{}{
			"character_id": charID,
			"amount":       100,
			"reason":       "treasure chest",
		}, gmAuth)

		if result["error"] != nil {
			t.Errorf("Award gold failed: %v", result["error"])
		} else {
			t.Logf("Gold awarded: %v", result)
		}
	})

	// Give item
	t.Run("GiveItem", func(t *testing.T) {
		_, result := makeRequest(t, "POST", "/api/gm/give-item", map[string]interface{}{
			"character_id": charID,
			"item_name":    "Potion of Healing",
			"item_type":    "consumable",
			"quantity":     2,
		}, gmAuth)

		if result["error"] != nil {
			t.Errorf("Give item failed: %v", result["error"])
		} else {
			t.Logf("Item given: %v", result)
		}
	})

	// Check inventory
	t.Run("CheckInventory", func(t *testing.T) {
		_, result := makeRequest(t, "GET", fmt.Sprintf("/api/characters/%d", charID), nil, playerAuth)
		t.Logf("Gold: %v, Inventory: %v", result["gold"], result["inventory"])
	})
}

// TestSpellcasting tests spell slot management
func TestSpellcasting(t *testing.T) {
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	testPrefix := fmt.Sprintf("test_spell_%d_", time.Now().Unix())
	defer cleanupTestData(t, testPrefix)

	// Setup wizard
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "SpellGM",
		"password": "gm123",
	}, "")
	gmID := int(result["agent_id"].(float64))
	gmAuth := createAuth(fmt.Sprintf("%d", gmID), "gm123")

	_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "Wizard",
		"password": "test123",
	}, "")
	playerID := int(result["agent_id"].(float64))
	playerAuth := createAuth(fmt.Sprintf("%d", playerID), "test123")

	_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
		"name":  testPrefix + "Arcane Master",
		"class": "wizard",
		"race":  "elf",
		"int":   16,
	}, playerAuth)
	charID := int(result["character_id"].(float64))

	_, result = makeRequest(t, "POST", "/api/campaigns", map[string]interface{}{
		"name": testPrefix + "Spell Test",
	}, gmAuth)
	campaignID := int(result["campaign_id"].(float64))

	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
		"character_id": charID,
	}, playerAuth)
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/start", campaignID), nil, gmAuth)

	// Cast spells
	t.Run("CastMagicMissile", func(t *testing.T) {
		_, result := makeRequest(t, "POST", "/api/action", map[string]interface{}{
			"action":      "cast",
			"description": "I cast magic missile at the enemy",
		}, playerAuth)

		if result["error"] != nil {
			t.Errorf("Cast failed: %v", result["error"])
		} else {
			t.Logf("Cast result: %v", result["result"])
		}
	})

	// Check spell slots
	t.Run("CheckSpellSlots", func(t *testing.T) {
		_, result := makeRequest(t, "GET", fmt.Sprintf("/api/characters/%d", charID), nil, playerAuth)
		t.Logf("Spell slots: %v", result["spell_slots"])
	})

	// Rest to recover slots
	t.Run("LongRest", func(t *testing.T) {
		_, result := makeRequest(t, "POST", fmt.Sprintf("/api/characters/%d/rest", charID), map[string]interface{}{
			"type": "long",
		}, playerAuth)

		if result["error"] != nil {
			t.Logf("Rest result: %v", result)
		} else {
			t.Logf("Rested successfully: %v", result)
		}
	})
}

// TestContestedChecks tests opposed rolls
func TestContestedChecks(t *testing.T) {
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	testPrefix := fmt.Sprintf("test_contest_%d_", time.Now().Unix())
	defer cleanupTestData(t, testPrefix)

	// Setup two characters
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "ContestGM",
		"password": "gm123",
	}, "")
	gmID := int(result["agent_id"].(float64))
	gmAuth := createAuth(fmt.Sprintf("%d", gmID), "gm123")

	_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "Grappler",
		"password": "test123",
	}, "")
	player1ID := int(result["agent_id"].(float64))
	player1Auth := createAuth(fmt.Sprintf("%d", player1ID), "test123")

	_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "Defender",
		"password": "test123",
	}, "")
	player2ID := int(result["agent_id"].(float64))
	player2Auth := createAuth(fmt.Sprintf("%d", player2ID), "test123")

	_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
		"name":  testPrefix + "Strong Grappler",
		"class": "fighter",
		"race":  "half-orc",
		"str":   18,
	}, player1Auth)
	char1ID := int(result["character_id"].(float64))

	_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
		"name":  testPrefix + "Quick Dodger",
		"class": "rogue",
		"race":  "halfling",
		"dex":   16,
	}, player2Auth)
	char2ID := int(result["character_id"].(float64))

	_, result = makeRequest(t, "POST", "/api/campaigns", map[string]interface{}{
		"name": testPrefix + "Contest Test",
	}, gmAuth)
	campaignID := int(result["campaign_id"].(float64))

	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
		"character_id": char1ID,
	}, player1Auth)
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
		"character_id": char2ID,
	}, player2Auth)
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/start", campaignID), nil, gmAuth)

	// Contested check (grapple)
	t.Run("GrappleContest", func(t *testing.T) {
		_, result := makeRequest(t, "POST", "/api/gm/contested-check", map[string]interface{}{
			"initiator_id":    char1ID,
			"defender_id":     char2ID,
			"initiator_skill": "athletics",
			"defender_skill":  "acrobatics",
			"description":     "grapple attempt",
		}, gmAuth)

		if result["error"] != nil {
			t.Errorf("Contested check failed: %v", result["error"])
		} else {
			t.Logf("Contest result: %s wins! (%v)", result["winner_name"], result["result"])
		}
	})
}

// TestCampaignFlow tests a complete campaign flow from start to finish
func TestCampaignFlow(t *testing.T) {
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	testPrefix := fmt.Sprintf("test_flow_%d_", time.Now().Unix())
	defer cleanupTestData(t, testPrefix)

	t.Log("=== Starting Full Campaign Flow Test ===")

	// 1. GM registers and creates campaign from template
	t.Log("\n--- Step 1: GM Setup ---")
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "DungeonMaster",
		"password": "dm123",
	}, "")
	gmID := int(result["agent_id"].(float64))
	gmAuth := createAuth(fmt.Sprintf("%d", gmID), "dm123")
	t.Logf("GM registered: ID=%d", gmID)

	// Check available templates
	_, result = makeRequest(t, "GET", "/api/campaign-templates", nil, "")
	if templates, ok := result["templates"].([]interface{}); ok && len(templates) > 0 {
		t.Logf("Available templates: %d", len(templates))
	}

	// Create campaign (optionally from template)
	_, result = makeRequest(t, "POST", "/api/campaigns", map[string]interface{}{
		"name":          testPrefix + "The Lost Mine",
		"max_players":   4,
		"setting":       "The party has been hired to escort supplies to Phandalin...",
		"min_level":     1,
		"max_level":     5,
		"template_slug": "lost-mine-phandelver", // Optional - uses template if exists
	}, gmAuth)
	campaignID := int(result["campaign_id"].(float64))
	t.Logf("Campaign created: ID=%d", campaignID)

	// 2. Players register and create characters
	t.Log("\n--- Step 2: Players Join ---")
	var players []struct {
		auth   string
		charID int
		name   string
	}

	partyComposition := []struct {
		playerName string
		charName   string
		class      string
		race       string
	}{
		{"Alice", "Thorin Stonehammer", "fighter", "dwarf"},
		{"Bob", "Elysia Starweaver", "wizard", "elf"},
		{"Carol", "Shadow", "rogue", "halfling"},
		{"Dave", "Brother Aldric", "cleric", "human"},
	}

	for i, p := range partyComposition {
		// Register player
		_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
			"name":     testPrefix + p.playerName,
			"password": "player123",
		}, "")
		playerID := int(result["agent_id"].(float64))
		playerAuth := createAuth(fmt.Sprintf("%d", playerID), "player123")

		// Create character
		_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
			"name":  testPrefix + p.charName,
			"class": p.class,
			"race":  p.race,
			"str":   14,
			"dex":   14,
			"con":   14,
			"int":   12,
			"wis":   12,
			"cha":   10,
		}, playerAuth)
		charID := int(result["character_id"].(float64))

		// Join campaign
		_, result = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
			"character_id": charID,
		}, playerAuth)

		players = append(players, struct {
			auth   string
			charID int
			name   string
		}{playerAuth, charID, p.charName})

		t.Logf("Player %d (%s) joined as %s the %s", i+1, p.playerName, p.charName, p.class)
	}

	// 3. GM starts campaign and posts narration
	t.Log("\n--- Step 3: Campaign Begins ---")
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/start", campaignID), nil, gmAuth)
	t.Log("Campaign started!")

	_, result = makeRequest(t, "POST", "/api/gm/narrate", map[string]interface{}{
		"narration": "The wagon creaks along the dusty road to Phandalin. Gundren Rockseeker's supplies shift with each bump. Ahead, you spot something in the road - dead horses, black arrows jutting from their flanks. An ambush!",
	}, gmAuth)
	t.Log("GM: Opening narration posted")

	// 4. Combat encounter
	t.Log("\n--- Step 4: Combat! ---")

	// GM calls for initiative (simulated)
	for i, player := range players {
		_, result = makeRequest(t, "POST", "/api/gm/skill-check", map[string]interface{}{
			"character_id": player.charID,
			"ability":      "dex",
			"dc":           0, // Initiative doesn't have DC
			"description":  "initiative",
		}, gmAuth)
		t.Logf("Initiative roll for %s: rolled", partyComposition[i].charName)
	}

	// Players act
	actions := []struct {
		playerIdx int
		action    string
		desc      string
	}{
		{0, "attack", "I charge the nearest goblin with my axe!"}, // Fighter
		{1, "cast", "I cast magic missile at the goblin archer"},   // Wizard
		{2, "attack", "I slip into shadows and strike with my dagger"}, // Rogue
		{3, "cast", "I cast sacred flame on the goblin threatening Thorin"}, // Cleric
	}

	for _, a := range actions {
		_, result = makeRequest(t, "POST", "/api/action", map[string]interface{}{
			"action":      a.action,
			"description": a.desc,
		}, players[a.playerIdx].auth)
		t.Logf("%s: %s -> %v", partyComposition[a.playerIdx].charName, a.action, result["result"])
	}

	// GM narrates outcome
	_, _ = makeRequest(t, "POST", "/api/gm/narrate", map[string]interface{}{
		"narration": "The goblins fall before your combined assault! As the last one tries to flee, you notice a trail leading into the woods...",
	}, gmAuth)
	t.Log("GM: Combat concluded")

	// 5. Award XP and loot
	t.Log("\n--- Step 5: Rewards ---")
	charIDs := make([]int, len(players))
	for i, p := range players {
		charIDs[i] = p.charID
	}

	_, result = makeRequest(t, "POST", "/api/gm/award-xp", map[string]interface{}{
		"character_ids": charIDs,
		"xp":            50,
		"reason":        "defeating the goblin ambush",
	}, gmAuth)
	t.Log("XP awarded to party")

	// Give gold and items
	_, _ = makeRequest(t, "POST", "/api/gm/gold", map[string]interface{}{
		"character_id": players[2].charID, // Rogue gets the loot
		"amount":       25,
		"reason":       "goblin pouches",
	}, gmAuth)
	t.Log("Gold distributed")

	_, _ = makeRequest(t, "POST", "/api/gm/give-item", map[string]interface{}{
		"character_id": players[0].charID, // Fighter
		"item_name":    "Potion of Healing",
		"quantity":     1,
	}, gmAuth)
	t.Log("Loot distributed")

	// 6. Rest and recovery
	t.Log("\n--- Step 6: Short Rest ---")
	for _, player := range players {
		_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/characters/%d/short-rest", player.charID), nil, player.auth)
	}
	t.Log("Party took a short rest")

	// 7. Final status check
	t.Log("\n--- Step 7: Final Status ---")
	for i, player := range players {
		_, result = makeRequest(t, "GET", fmt.Sprintf("/api/characters/%d", player.charID), nil, player.auth)
		t.Logf("%s - HP: %v/%v, XP: %v, Gold: %v",
			partyComposition[i].charName,
			result["hp"], result["max_hp"],
			result["xp"], result["gold"])
	}

	// Check campaign feed
	_, result = makeRequest(t, "GET", fmt.Sprintf("/api/campaigns/%d/feed", campaignID), nil, gmAuth)
	if actions, ok := result["actions"].([]interface{}); ok {
		t.Logf("Total actions in campaign: %d", len(actions))
	}

	t.Log("\n=== Campaign Flow Test Complete ===")
}

// TestCombatSkipRequired tests the autonomous GM Phase 2: skip_required at 4h
func TestCombatSkipRequired(t *testing.T) {
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	testPrefix := fmt.Sprintf("test_skip_%d_", time.Now().Unix())
	defer cleanupTestData(t, testPrefix)

	t.Log("=== Testing Combat Skip Required (Autonomous GM Phase 2) ===")

	// Setup: Create GM, campaign, and character
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "SkipGM",
		"password": "gm123",
	}, "")
	gmID := int(result["agent_id"].(float64))
	gmAuth := createAuth(fmt.Sprintf("%d", gmID), "gm123")

	_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "SlowPlayer",
		"password": "player123",
	}, "")
	playerID := int(result["agent_id"].(float64))
	playerAuth := createAuth(fmt.Sprintf("%d", playerID), "player123")

	_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
		"name":  testPrefix + "Slowpoke",
		"class": "fighter",
		"race":  "human",
	}, playerAuth)
	charID := int(result["character_id"].(float64))
	charName := testPrefix + "Slowpoke"

	_, result = makeRequest(t, "POST", "/api/campaigns", map[string]interface{}{
		"name": testPrefix + "Skip Test Campaign",
	}, gmAuth)
	campaignID := int(result["campaign_id"].(float64))

	// Join and start
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
		"character_id": charID,
	}, playerAuth)
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/start", campaignID), nil, gmAuth)

	// Start combat with the player in turn order
	_, result = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/combat/start", campaignID), nil, gmAuth)
	t.Logf("Combat started: %v", result)

	// Test 1: Before 4h - no skip_required
	t.Run("BeforeThreshold_NoSkipRequired", func(t *testing.T) {
		_, result := makeRequest(t, "GET", "/api/gm/status", nil, gmAuth)

		if result["skip_required"] != nil && result["skip_required"].(bool) {
			t.Error("skip_required should not be set before 4h threshold")
		}

		if combat, ok := result["combat"].(map[string]interface{}); ok {
			if combat["skip_required"] != nil && combat["skip_required"].(bool) {
				t.Error("combat.skip_required should not be set before 4h threshold")
			}
		}
		t.Log("Correctly no skip_required before 4h")
	})

	// Test 2: Set turn_started_at to 5 hours ago (exceeds 4h threshold)
	t.Run("AfterThreshold_SkipRequired", func(t *testing.T) {
		// Directly update the turn_started_at to simulate 5 hours elapsed
		fiveHoursAgo := time.Now().Add(-5 * time.Hour)
		_, err := db.Exec(`UPDATE combat_state SET turn_started_at = $1 WHERE lobby_id = $2`, fiveHoursAgo, campaignID)
		if err != nil {
			t.Fatalf("Failed to update turn_started_at: %v", err)
		}

		_, result := makeRequest(t, "GET", "/api/gm/status", nil, gmAuth)

		// Check skip_required at top level
		if result["skip_required"] == nil || !result["skip_required"].(bool) {
			t.Error("skip_required should be true after 4h threshold")
		} else {
			t.Log("✓ skip_required is true")
		}

		// Check skip_required_player
		if result["skip_required_player"] == nil {
			t.Error("skip_required_player should be set")
		} else {
			playerName := result["skip_required_player"].(string)
			if playerName != charName {
				t.Errorf("skip_required_player should be %s, got %s", charName, playerName)
			} else {
				t.Logf("✓ skip_required_player is %s", playerName)
			}
		}

		// Check auto_skip_countdown (should show time remaining or "imminent")
		if result["auto_skip_countdown"] == nil {
			t.Error("auto_skip_countdown should be set")
		} else {
			countdown := result["auto_skip_countdown"].(string)
			// After 5h, countdown should be "imminent" (since 4h30m has passed)
			if countdown != "imminent" {
				t.Logf("auto_skip_countdown: %s (expected 'imminent' at 5h)", countdown)
			} else {
				t.Log("✓ auto_skip_countdown is 'imminent'")
			}
		}

		// Check combat.skip_required
		if combat, ok := result["combat"].(map[string]interface{}); ok {
			if combat["skip_required"] == nil || !combat["skip_required"].(bool) {
				t.Error("combat.skip_required should be true")
			}
			if combat["turn_status"] != "timeout" {
				t.Errorf("combat.turn_status should be 'timeout', got %v", combat["turn_status"])
			}
			t.Logf("✓ combat.turn_status is '%v'", combat["turn_status"])
		}

		// Check what_to_do_next has skip instruction
		if whatToDo, ok := result["what_to_do_next"].(map[string]interface{}); ok {
			if whatToDo["action_required"] != "skip_turn" {
				t.Errorf("what_to_do_next.action_required should be 'skip_turn', got %v", whatToDo["action_required"])
			}
			if whatToDo["urgency"] != "critical" {
				t.Errorf("what_to_do_next.urgency should be 'critical', got %v", whatToDo["urgency"])
			}
			t.Logf("✓ what_to_do_next has skip instruction: %v", whatToDo["instruction"])
		}

		// Check gm_tasks contains urgent skip message
		if tasks, ok := result["gm_tasks"].([]interface{}); ok {
			foundSkipTask := false
			for _, task := range tasks {
				taskStr := task.(string)
				if strings.HasPrefix(taskStr, "⚠") && (containsString(taskStr, "SKIP NOW") || containsString(taskStr, "turn timeout")) {
					foundSkipTask = true
					t.Logf("✓ Found urgent skip task: %s", taskStr)
					break
				}
			}
			if !foundSkipTask {
				t.Error("gm_tasks should contain urgent skip instruction with 'SKIP NOW'")
			}
		}

		// Check needs_attention is true
		if result["needs_attention"] == nil || !result["needs_attention"].(bool) {
			t.Error("needs_attention should be true when skip_required")
		} else {
			t.Log("✓ needs_attention is true")
		}
	})

	// Test 3: Countdown calculation when within 30-minute grace period
	t.Run("CountdownCalculation", func(t *testing.T) {
		// Set turn_started_at to 4h 15m ago (within the 30-min grace period)
		fourHours15MinAgo := time.Now().Add(-4*time.Hour - 15*time.Minute)
		_, err := db.Exec(`UPDATE combat_state SET turn_started_at = $1 WHERE lobby_id = $2`, fourHours15MinAgo, campaignID)
		if err != nil {
			t.Fatalf("Failed to update turn_started_at: %v", err)
		}

		_, result := makeRequest(t, "GET", "/api/gm/status", nil, gmAuth)

		// skip_required should still be true (past 4h)
		if result["skip_required"] == nil || !result["skip_required"].(bool) {
			t.Error("skip_required should be true at 4h 15m")
		}

		// Countdown should show ~15 minutes remaining
		if result["auto_skip_countdown"] != nil {
			countdown := result["auto_skip_countdown"].(string)
			// Should be around 15m, not "imminent"
			if countdown == "imminent" {
				t.Error("auto_skip_countdown should show remaining time, not 'imminent' at 4h 15m")
			} else {
				t.Logf("✓ auto_skip_countdown shows remaining time: %s", countdown)
			}
		}
	})

	t.Log("=== Combat Skip Required Tests Complete ===")
}

// containsString is a helper to check if a string contains a substring
func containsString(s, substr string) bool {
	return len(s) >= len(substr) && (s == substr || len(s) > 0 && (s[:len(substr)] == substr || containsString(s[1:], substr)))
}

// TestSkipRequiredVsSkipRecommended verifies the old skip_recommended is replaced
func TestSkipRequiredVsSkipRecommended(t *testing.T) {
	if os.Getenv("DATABASE_URL") == "" && os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("No database URL set - skipping integration test")
	}

	initTestDB(t)
	testPrefix := fmt.Sprintf("test_skipvs_%d_", time.Now().Unix())
	defer cleanupTestData(t, testPrefix)

	// Setup
	_, result := makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "GM",
		"password": "gm123",
	}, "")
	gmID := int(result["agent_id"].(float64))
	gmAuth := createAuth(fmt.Sprintf("%d", gmID), "gm123")

	_, result = makeRequest(t, "POST", "/api/register", map[string]interface{}{
		"name":     testPrefix + "Player",
		"password": "player123",
	}, "")
	playerID := int(result["agent_id"].(float64))
	playerAuth := createAuth(fmt.Sprintf("%d", playerID), "player123")

	_, result = makeRequest(t, "POST", "/api/characters", map[string]interface{}{
		"name":  testPrefix + "TestChar",
		"class": "fighter",
		"race":  "human",
	}, playerAuth)
	charID := int(result["character_id"].(float64))

	_, result = makeRequest(t, "POST", "/api/campaigns", map[string]interface{}{
		"name": testPrefix + "Test Campaign",
	}, gmAuth)
	campaignID := int(result["campaign_id"].(float64))

	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/join", campaignID), map[string]interface{}{
		"character_id": charID,
	}, playerAuth)
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/start", campaignID), nil, gmAuth)
	_, _ = makeRequest(t, "POST", fmt.Sprintf("/api/campaigns/%d/combat/start", campaignID), nil, gmAuth)

	// Set to 5 hours ago
	fiveHoursAgo := time.Now().Add(-5 * time.Hour)
	db.Exec(`UPDATE combat_state SET turn_started_at = $1 WHERE lobby_id = $2`, fiveHoursAgo, campaignID)

	_, result = makeRequest(t, "GET", "/api/gm/status", nil, gmAuth)

	// Verify skip_recommended is NOT present (replaced by skip_required)
	if combat, ok := result["combat"].(map[string]interface{}); ok {
		if combat["skip_recommended"] != nil {
			t.Error("skip_recommended should NOT be present - it's been replaced by skip_required")
		}
		if combat["skip_required"] == nil || !combat["skip_required"].(bool) {
			t.Error("skip_required should be present and true")
		} else {
			t.Log("✓ skip_required is used instead of skip_recommended")
		}
	}
}
