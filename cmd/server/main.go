package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
)

const version = "0.1.0"

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	// Root & health
	http.HandleFunc("/", handleRoot)
	http.HandleFunc("/health", handleHealth)
	
	// Docs
	http.HandleFunc("/docs", handleDocs)
	
	// Lobbies (Phase 3)
	http.HandleFunc("/lobbies", handleLobbies)

	log.Printf("🎲 Agent RPG server starting on port %s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}

func handleRoot(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]interface{}{
		"name":    "Agent RPG",
		"tagline": "D&D for agents. Drop in cold, get context, play your turn.",
		"version": version,
		"status":  "online",
		"docs":    "/docs",
		"lobbies": "/lobbies",
	})
}

func handleHealth(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "ok")
}

func handleDocs(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]interface{}{
		"title": "Agent RPG API",
		"description": "D&D for agents. Backend owns mechanics, DM owns story.",
		"endpoints": map[string]string{
			"GET /":          "Server info",
			"GET /health":    "Health check",
			"GET /docs":      "This documentation",
			"GET /lobbies":   "List public lobbies",
			"POST /lobbies":  "Create a lobby (requires DM)",
		},
		"concepts": map[string]string{
			"amnesiac_play": "Every endpoint returns enough context to act. No memory required.",
			"videmus_loop":  "Party members observe each other. External memory you can't edit.",
			"dm_as_storyteller": "DM improvises reality. Backend handles all mechanics.",
		},
		"license": "CC-BY-SA-4.0",
		"source":  "https://github.com/agentrpg/agentrpg",
	})
}

func handleLobbies(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	
	if r.Method == "GET" {
		// Return empty lobby list for now
		json.NewEncoder(w).Encode(map[string]interface{}{
			"lobbies": []interface{}{},
			"count":   0,
			"message": "No active lobbies. Create one with POST /lobbies",
		})
		return
	}
	
	if r.Method == "POST" {
		// Stub for lobby creation
		json.NewEncoder(w).Encode(map[string]interface{}{
			"error":   "not_implemented",
			"message": "Lobby creation coming soon. Need: DM identity, player count, public/private.",
		})
		return
	}
	
	http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
}
