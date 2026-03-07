package game

import (
	"testing"
)

func TestGetFeat(t *testing.T) {
	tests := []struct {
		slug     string
		expected string // expected name
		wantNil  bool
	}{
		{"grappler", "Grappler", false},
		{"alert", "Alert", false},
		{"lucky", "Lucky", false},
		{"war_caster", "War Caster", false},
		{"nonexistent", "", true},
	}

	for _, tt := range tests {
		t.Run(tt.slug, func(t *testing.T) {
			feat := GetFeat(tt.slug)
			if tt.wantNil {
				if feat != nil {
					t.Errorf("GetFeat(%q) = %v, want nil", tt.slug, feat)
				}
			} else {
				if feat == nil {
					t.Errorf("GetFeat(%q) = nil, want non-nil", tt.slug)
				} else if feat.Name != tt.expected {
					t.Errorf("GetFeat(%q).Name = %q, want %q", tt.slug, feat.Name, tt.expected)
				}
			}
		})
	}
}

func TestHasFeatFeature(t *testing.T) {
	tests := []struct {
		name     string
		feats    []string
		feature  string
		expected bool
	}{
		{"war caster has somatic bypass", []string{"war_caster"}, "somatic_with_hands_full", true},
		{"alert has initiative bonus", []string{"alert"}, "initiative_bonus", true},
		{"grappler has grapple advantage", []string{"grappler"}, "grapple_advantage", true},
		{"sentinel has opportunity stops movement", []string{"sentinel"}, "opportunity_stops_movement", true},
		{"no feat has feature", []string{}, "somatic_with_hands_full", false},
		{"wrong feat doesn't have feature", []string{"alert"}, "somatic_with_hands_full", false},
		{"multiple feats checks all", []string{"alert", "war_caster"}, "somatic_with_hands_full", true},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := HasFeatFeature(tt.feats, tt.feature)
			if result != tt.expected {
				t.Errorf("HasFeatFeature(%v, %q) = %v, want %v", tt.feats, tt.feature, result, tt.expected)
			}
		})
	}
}

func TestHasFeat(t *testing.T) {
	tests := []struct {
		name     string
		feats    []string
		slug     string
		expected bool
	}{
		{"has alert", []string{"alert", "lucky"}, "alert", true},
		{"has lucky", []string{"alert", "lucky"}, "lucky", true},
		{"does not have sentinel", []string{"alert", "lucky"}, "sentinel", false},
		{"empty list", []string{}, "alert", false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := HasFeat(tt.feats, tt.slug)
			if result != tt.expected {
				t.Errorf("HasFeat(%v, %q) = %v, want %v", tt.feats, tt.slug, result, tt.expected)
			}
		})
	}
}

func TestGetFeatFeatureValue(t *testing.T) {
	tests := []struct {
		name     string
		slug     string
		feature  string
		expected string
	}{
		{"alert initiative bonus", "alert", "initiative_bonus", "5"},
		{"tough hp bonus", "tough", "hp_bonus_per_level", "2"},
		{"mobile speed bonus", "mobile", "speed_bonus", "10"},
		{"nonexistent feat", "fake", "anything", ""},
		{"feat without feature", "alert", "nonexistent", ""},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := GetFeatFeatureValue(tt.slug, tt.feature)
			if result != tt.expected {
				t.Errorf("GetFeatFeatureValue(%q, %q) = %q, want %q", tt.slug, tt.feature, result, tt.expected)
			}
		})
	}
}

func TestAllFeats(t *testing.T) {
	feats := AllFeats()
	if len(feats) != len(AvailableFeats) {
		t.Errorf("AllFeats() returned %d feats, want %d", len(feats), len(AvailableFeats))
	}

	// Check that expected feats are present
	expected := []string{"grappler", "alert", "lucky", "tough", "sentinel", "war_caster", "mobile", "observant", "resilient", "savage_attacker"}
	for _, slug := range expected {
		found := false
		for _, f := range feats {
			if f == slug {
				found = true
				break
			}
		}
		if !found {
			t.Errorf("AllFeats() missing expected feat %q", slug)
		}
	}
}

func TestFeatMeetsPrerequisite(t *testing.T) {
	tests := []struct {
		name         string
		prereq       string
		abilities    map[string]int
		isSpellcaster bool
		expected     bool
	}{
		{"empty prereq", "", nil, false, true},
		{"spellcaster required and is", "spellcaster", nil, true, true},
		{"spellcaster required but not", "spellcaster", nil, false, false},
		{"str:13 meets requirement", "str:13", map[string]int{"str": 14}, false, true},
		{"str:13 exactly meets", "str:13", map[string]int{"str": 13}, false, true},
		{"str:13 does not meet", "str:13", map[string]int{"str": 12}, false, false},
		{"dex:15 meets", "dex:15", map[string]int{"dex": 16}, false, true},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := FeatMeetsPrerequisite(tt.prereq, tt.abilities, tt.isSpellcaster)
			if result != tt.expected {
				t.Errorf("FeatMeetsPrerequisite(%q, %v, %v) = %v, want %v", 
					tt.prereq, tt.abilities, tt.isSpellcaster, result, tt.expected)
			}
		})
	}
}

func TestGetInitiativeBonus(t *testing.T) {
	tests := []struct {
		name     string
		feats    []string
		expected int
	}{
		{"no feats", []string{}, 0},
		{"alert gives +5", []string{"alert"}, 5},
		{"non-initiative feat", []string{"lucky"}, 0},
		{"multiple feats one with bonus", []string{"lucky", "alert", "tough"}, 5},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := GetInitiativeBonus(tt.feats)
			if result != tt.expected {
				t.Errorf("GetInitiativeBonus(%v) = %d, want %d", tt.feats, result, tt.expected)
			}
		})
	}
}

func TestGetSpeedBonus(t *testing.T) {
	tests := []struct {
		name     string
		feats    []string
		expected int
	}{
		{"no feats", []string{}, 0},
		{"mobile gives +10", []string{"mobile"}, 10},
		{"non-speed feat", []string{"alert"}, 0},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := GetSpeedBonus(tt.feats)
			if result != tt.expected {
				t.Errorf("GetSpeedBonus(%v) = %d, want %d", tt.feats, result, tt.expected)
			}
		})
	}
}

func TestGetPassiveBonus(t *testing.T) {
	tests := []struct {
		name     string
		feats    []string
		expected int
	}{
		{"no feats", []string{}, 0},
		{"observant gives +5", []string{"observant"}, 5},
		{"non-passive feat", []string{"alert"}, 0},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := GetPassiveBonus(tt.feats)
			if result != tt.expected {
				t.Errorf("GetPassiveBonus(%v) = %d, want %d", tt.feats, result, tt.expected)
			}
		})
	}
}

func TestGetHPBonusPerLevel(t *testing.T) {
	tests := []struct {
		name     string
		feats    []string
		expected int
	}{
		{"no feats", []string{}, 0},
		{"tough gives +2 per level", []string{"tough"}, 2},
		{"non-hp feat", []string{"alert"}, 0},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := GetHPBonusPerLevel(tt.feats)
			if result != tt.expected {
				t.Errorf("GetHPBonusPerLevel(%v) = %d, want %d", tt.feats, result, tt.expected)
			}
		})
	}
}

func TestFeatConvenienceFunctions(t *testing.T) {
	// Test all the convenience functions
	tests := []struct {
		name     string
		fn       func([]string) bool
		feats    []string
		expected bool
	}{
		{"HasAlertFeat true", HasAlertFeat, []string{"alert"}, true},
		{"HasAlertFeat false", HasAlertFeat, []string{"lucky"}, false},
		{"HasWarCasterFeat true", HasWarCasterFeat, []string{"war_caster"}, true},
		{"HasWarCasterFeat false", HasWarCasterFeat, []string{"alert"}, false},
		{"HasSentinelFeat true", HasSentinelFeat, []string{"sentinel"}, true},
		{"HasSentinelFeat false", HasSentinelFeat, []string{"alert"}, false},
		{"HasMobileFeat true", HasMobileFeat, []string{"mobile"}, true},
		{"HasMobileFeat false", HasMobileFeat, []string{"alert"}, false},
		{"HasGrapplerFeat true", HasGrapplerFeat, []string{"grappler"}, true},
		{"HasGrapplerFeat false", HasGrapplerFeat, []string{"alert"}, false},
		{"HasSavageAttackerFeat true", HasSavageAttackerFeat, []string{"savage_attacker"}, true},
		{"HasSavageAttackerFeat false", HasSavageAttackerFeat, []string{"alert"}, false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := tt.fn(tt.feats)
			if result != tt.expected {
				t.Errorf("%s(%v) = %v, want %v", tt.name, tt.feats, result, tt.expected)
			}
		})
	}
}
