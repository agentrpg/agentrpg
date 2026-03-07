package game

import "testing"

func TestGetBackground(t *testing.T) {
	tests := []struct {
		slug     string
		wantName string
		wantNil  bool
	}{
		{"acolyte", "Acolyte", false},
		{"criminal", "Criminal", false},
		{"noble", "Noble", false},
		{"sage", "Sage", false},
		{"soldier", "Soldier", false},
		{"urchin", "Urchin", false},
		{"invalid", "", true},
		{"", "", true},
	}

	for _, tt := range tests {
		t.Run(tt.slug, func(t *testing.T) {
			bg := GetBackground(tt.slug)
			if tt.wantNil {
				if bg != nil {
					t.Errorf("GetBackground(%q) = %v, want nil", tt.slug, bg)
				}
				return
			}
			if bg == nil {
				t.Errorf("GetBackground(%q) = nil, want %s", tt.slug, tt.wantName)
				return
			}
			if bg.Name != tt.wantName {
				t.Errorf("GetBackground(%q).Name = %q, want %q", tt.slug, bg.Name, tt.wantName)
			}
		})
	}
}

func TestBackgroundSkillProficiencies(t *testing.T) {
	tests := []struct {
		slug   string
		skills []string
	}{
		{"acolyte", []string{"insight", "religion"}},
		{"criminal", []string{"deception", "stealth"}},
		{"sage", []string{"arcana", "history"}},
		{"soldier", []string{"athletics", "intimidation"}},
	}

	for _, tt := range tests {
		t.Run(tt.slug, func(t *testing.T) {
			bg := GetBackground(tt.slug)
			if bg == nil {
				t.Fatalf("GetBackground(%q) returned nil", tt.slug)
			}
			if len(bg.SkillProficiencies) != len(tt.skills) {
				t.Errorf("Expected %d skills, got %d", len(tt.skills), len(bg.SkillProficiencies))
				return
			}
			for i, skill := range tt.skills {
				if bg.SkillProficiencies[i] != skill {
					t.Errorf("Skill %d: got %q, want %q", i, bg.SkillProficiencies[i], skill)
				}
			}
		})
	}
}

func TestBackgroundToolProficiencies(t *testing.T) {
	tests := []struct {
		slug  string
		tools []string
	}{
		{"criminal", []string{"thieves' tools", "gaming set"}},
		{"charlatan", []string{"disguise kit", "forgery kit"}},
		{"hermit", []string{"herbalism kit"}},
		{"sage", []string{}}, // No tools
	}

	for _, tt := range tests {
		t.Run(tt.slug, func(t *testing.T) {
			bg := GetBackground(tt.slug)
			if bg == nil {
				t.Fatalf("GetBackground(%q) returned nil", tt.slug)
			}
			if len(bg.ToolProficiencies) != len(tt.tools) {
				t.Errorf("Expected %d tools, got %d", len(tt.tools), len(bg.ToolProficiencies))
			}
		})
	}
}

func TestBackgroundLanguages(t *testing.T) {
	tests := []struct {
		slug      string
		languages int
	}{
		{"acolyte", 2},
		{"sage", 2},
		{"noble", 1},
		{"criminal", 0},
		{"soldier", 0},
	}

	for _, tt := range tests {
		t.Run(tt.slug, func(t *testing.T) {
			bg := GetBackground(tt.slug)
			if bg == nil {
				t.Fatalf("GetBackground(%q) returned nil", tt.slug)
			}
			if bg.Languages != tt.languages {
				t.Errorf("Languages = %d, want %d", bg.Languages, tt.languages)
			}
		})
	}
}

func TestBackgroundGold(t *testing.T) {
	tests := []struct {
		slug string
		gold int
	}{
		{"noble", 25},
		{"acolyte", 15},
		{"hermit", 5},
		{"outlander", 10},
	}

	for _, tt := range tests {
		t.Run(tt.slug, func(t *testing.T) {
			bg := GetBackground(tt.slug)
			if bg == nil {
				t.Fatalf("GetBackground(%q) returned nil", tt.slug)
			}
			if bg.Gold != tt.gold {
				t.Errorf("Gold = %d, want %d", bg.Gold, tt.gold)
			}
		})
	}
}

func TestGetAllBackgrounds(t *testing.T) {
	all := GetAllBackgrounds()
	
	// Should have 13 PHB backgrounds
	if len(all) != 13 {
		t.Errorf("Expected 13 backgrounds, got %d", len(all))
	}
	
	// Check some specific backgrounds exist
	expected := []string{"acolyte", "criminal", "noble", "sage", "soldier", "urchin"}
	for _, slug := range expected {
		if _, ok := all[slug]; !ok {
			t.Errorf("Missing background: %s", slug)
		}
	}
}

func TestGetAllBackgroundSlugs(t *testing.T) {
	slugs := GetAllBackgroundSlugs()
	
	if len(slugs) != 13 {
		t.Errorf("Expected 13 slugs, got %d", len(slugs))
	}
	
	// Check sorted order
	for i := 0; i < len(slugs)-1; i++ {
		if slugs[i] > slugs[i+1] {
			t.Errorf("Slugs not sorted: %s > %s", slugs[i], slugs[i+1])
		}
	}
}

func TestIsValidBackground(t *testing.T) {
	tests := []struct {
		slug  string
		valid bool
	}{
		{"acolyte", true},
		{"criminal", true},
		{"sage", true},
		{"invalid", false},
		{"", false},
		{"ACOLYTE", false}, // Case sensitive
	}

	for _, tt := range tests {
		t.Run(tt.slug, func(t *testing.T) {
			if got := IsValidBackground(tt.slug); got != tt.valid {
				t.Errorf("IsValidBackground(%q) = %v, want %v", tt.slug, got, tt.valid)
			}
		})
	}
}

func TestBackgroundCount(t *testing.T) {
	if count := BackgroundCount(); count != 13 {
		t.Errorf("BackgroundCount() = %d, want 13", count)
	}
}

func TestBackgroundFeatures(t *testing.T) {
	tests := []struct {
		slug    string
		feature string
	}{
		{"acolyte", "Shelter of the Faithful"},
		{"criminal", "Criminal Contact"},
		{"noble", "Position of Privilege"},
		{"urchin", "City Secrets"},
	}

	for _, tt := range tests {
		t.Run(tt.slug, func(t *testing.T) {
			bg := GetBackground(tt.slug)
			if bg == nil {
				t.Fatalf("GetBackground(%q) returned nil", tt.slug)
			}
			if bg.Feature != tt.feature {
				t.Errorf("Feature = %q, want %q", bg.Feature, tt.feature)
			}
			if bg.FeatureDesc == "" {
				t.Error("FeatureDesc should not be empty")
			}
		})
	}
}

func TestBackgroundEquipment(t *testing.T) {
	tests := []struct {
		slug     string
		minItems int
	}{
		{"acolyte", 5},
		{"criminal", 2},
		{"noble", 3},
	}

	for _, tt := range tests {
		t.Run(tt.slug, func(t *testing.T) {
			bg := GetBackground(tt.slug)
			if bg == nil {
				t.Fatalf("GetBackground(%q) returned nil", tt.slug)
			}
			if len(bg.Equipment) < tt.minItems {
				t.Errorf("Equipment has %d items, want at least %d", len(bg.Equipment), tt.minItems)
			}
		})
	}
}
