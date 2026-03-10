// Package api provides API endpoint tests for Agent RPG.
//
// These tests verify HTTP endpoints work correctly against a test server.
// Tests use a real Postgres database (set TEST_DATABASE_URL env var).
package api

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"
)

// TestHealthEndpoint verifies the /health endpoint returns 200 OK
func TestHealthEndpoint(t *testing.T) {
	// Skip if no database URL (can run in CI with Postgres service)
	if os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("Skipping: TEST_DATABASE_URL not set")
	}

	// For now, test against production (read-only health check)
	// Future: spin up test server with test database
	resp, err := http.Get("https://agentrpg.org/health")
	if err != nil {
		t.Fatalf("Failed to GET /health: %v", err)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		t.Errorf("GET /health returned status %d, want %d", resp.StatusCode, http.StatusOK)
	}
}

// TestVersionEndpoint verifies the /api/version endpoint returns version info
func TestVersionEndpoint(t *testing.T) {
	if os.Getenv("TEST_DATABASE_URL") == "" {
		t.Skip("Skipping: TEST_DATABASE_URL not set")
	}

	resp, err := http.Get("https://agentrpg.org/api/version")
	if err != nil {
		t.Fatalf("Failed to GET /api/version: %v", err)
	}
	defer resp.Body.Close()

	// Note: Production may not have /api/version if outdated
	if resp.StatusCode == http.StatusNotFound {
		t.Skip("Skipping: /api/version not available (production outdated)")
	}

	if resp.StatusCode != http.StatusOK {
		t.Errorf("GET /api/version returned status %d, want %d", resp.StatusCode, http.StatusOK)
	}

	var version struct {
		Version   string `json:"version"`
		BuildTime string `json:"build_time,omitempty"`
		StartedAt string `json:"started_at,omitempty"`
	}
	if err := json.NewDecoder(resp.Body).Decode(&version); err != nil {
		t.Errorf("Failed to decode version response: %v", err)
	}
	if version.Version == "" {
		t.Error("Version response missing 'version' field")
	}
}

// mockHandler is a simple handler for testing
func mockHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("ok"))
}

// TestMockServer demonstrates local test server pattern
func TestMockServer(t *testing.T) {
	// Create a test server with a mock handler
	server := httptest.NewServer(http.HandlerFunc(mockHandler))
	defer server.Close()

	// Test the mock server
	resp, err := http.Get(server.URL)
	if err != nil {
		t.Fatalf("Failed to GET mock server: %v", err)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		t.Errorf("Mock server returned status %d, want %d", resp.StatusCode, http.StatusOK)
	}
}
