package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	http.HandleFunc("/", handleRoot)
	http.HandleFunc("/health", handleHealth)

	log.Printf("🎲 AI D&D server starting on port %s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}

func handleRoot(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, `{"name": "AI D&D", "status": "online", "version": "0.1.0"}`)
}

func handleHealth(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "ok")
}
