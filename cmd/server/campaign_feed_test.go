package main

import (
	"database/sql"
	"encoding/json"
	"net/http/httptest"
	"testing"
)

func TestSQLiteCampaignFeedNullableRows(t *testing.T) {
	original := db
	database, err := sql.Open("sqlite3", ":memory:")
	if err != nil {
		t.Fatal(err)
	}
	db = database
	t.Cleanup(func() { database.Close(); db = original })
	for _, query := range []string{
		`CREATE TABLE actions (id INTEGER, lobby_id INTEGER, character_id INTEGER, action_type TEXT, description TEXT, result TEXT, created_at DATETIME)`,
		`CREATE TABLE campaign_messages (id INTEGER, lobby_id INTEGER, agent_id INTEGER, agent_name TEXT, message TEXT, created_at DATETIME)`,
		`INSERT INTO actions VALUES (1,6,NULL,'narration','The gate opens',NULL,'2026-11-06T10:00:00Z')`,
		`INSERT INTO actions VALUES (2,6,32,'other','Inspect the gate','Success','2026-11-06T11:00:00Z')`,
		`INSERT INTO actions VALUES (3,6,32,'poll','Old poll','','2026-11-05T10:00:00Z')`,
		`INSERT INTO actions VALUES (4,99,NULL,'narration','Other campaign',NULL,'2026-11-06T12:00:00Z')`,
		`INSERT INTO campaign_messages VALUES (1,6,NULL,NULL,'A message','2026-11-06T10:30:00Z')`,
	} {
		if _, err := db.Exec(query); err != nil {
			t.Fatal(err)
		}
	}
	for _, tc := range []struct {
		query string
		count int
	}{{"", 3}, {"?since=2026-11-06T09:00:00Z", 2}} {
		w := httptest.NewRecorder()
		handleCampaignFeed(w, httptest.NewRequest("GET", "/api/campaigns/6/feed"+tc.query, nil), 6)
		// Decode through the actual JSON field names, including underscores.
		var body struct {
			Actions  []map[string]interface{} `json:"actions"`
			Messages []map[string]interface{} `json:"messages"`
		}
		if err := json.Unmarshal(w.Body.Bytes(), &body); err != nil {
			t.Fatal(err)
		}
		if len(body.Actions) != tc.count || len(body.Messages) != 1 {
			t.Fatalf("unexpected counts: %s", w.Body.String())
		}
		for _, a := range body.Actions {
			if a["created_at"] == "0001-01-01T00:00:00Z" || a["type"] == "" {
				t.Fatalf("fabricated action: %v", a)
			}
			if a["id"] == float64(1) && (a["description"] != "The gate opens" || a["character_id"] != float64(0) || a["result"] != "") {
				t.Fatalf("lost narration: %v", a)
			}
		}
		if body.Messages[0]["message"] != "A message" || body.Messages[0]["created_at"] != "2026-11-06T10:30:00Z" {
			t.Fatalf("lost message: %v", body.Messages)
		}
	}
	// Missing message storage must not masquerade as a successful empty feed.
	if _, err := db.Exec("DROP TABLE campaign_messages"); err != nil {
		t.Fatal(err)
	}
	w := httptest.NewRecorder()
	handleCampaignFeed(w, httptest.NewRequest("GET", "/api/campaigns/6/feed", nil), 6)
	if w.Code != 500 {
		t.Fatalf("query failure returned %d: %s", w.Code, w.Body.String())
	}
	// Scan failures must not return partially populated, zero-timestamp actions.
	if _, err := db.Exec("UPDATE actions SET id = NULL WHERE id = 1"); err != nil {
		t.Fatal(err)
	}
	w = httptest.NewRecorder()
	handleCampaignFeed(w, httptest.NewRequest("GET", "/api/campaigns/6/feed", nil), 6)
	if w.Code != 500 {
		t.Fatalf("scan failure returned %d: %s", w.Code, w.Body.String())
	}

}
