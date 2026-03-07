package game

import "testing"

func TestLevelForXP(t *testing.T) {
	tests := []struct {
		name  string
		xp    int
		level int
	}{
		{"level 1 at 0 XP", 0, 1},
		{"level 1 at 299 XP", 299, 1},
		{"level 2 at 300 XP", 300, 2},
		{"level 2 at 899 XP", 899, 2},
		{"level 3 at 900 XP", 900, 3},
		{"level 5 at 6500 XP", 6500, 5},
		{"level 10 at 64000 XP", 64000, 10},
		{"level 20 at 355000 XP", 355000, 20},
		{"level 20 at 500000 XP", 500000, 20},
		{"negative XP still level 1", -100, 1},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := LevelForXP(tt.xp)
			if got != tt.level {
				t.Errorf("LevelForXP(%d) = %d, want %d", tt.xp, got, tt.level)
			}
		})
	}
}

func TestXPForNextLevel(t *testing.T) {
	tests := []struct {
		name    string
		current int
		want    int
	}{
		{"level 1 needs 300 XP", 1, 300},
		{"level 2 needs 900 XP", 2, 900},
		{"level 5 needs 14000 XP", 5, 14000},
		{"level 10 needs 85000 XP", 10, 85000},
		{"level 19 needs 355000 XP", 19, 355000},
		{"level 20 needs 0 (max)", 20, 0},
		{"level 21 returns 0", 21, 0},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := XPForNextLevel(tt.current)
			if got != tt.want {
				t.Errorf("XPForNextLevel(%d) = %d, want %d", tt.current, got, tt.want)
			}
		})
	}
}

func TestXPToNextLevel(t *testing.T) {
	tests := []struct {
		name      string
		currentXP int
		want      int
	}{
		{"0 XP needs 300 to level 2", 0, 300},
		{"150 XP needs 150 to level 2", 150, 150},
		{"300 XP needs 600 to level 3", 300, 600},
		{"6400 XP needs 100 to level 5", 6400, 100},
		{"355000 XP at max level", 355000, 0},
		{"500000 XP at max level", 500000, 0},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := XPToNextLevel(tt.currentXP)
			if got != tt.want {
				t.Errorf("XPToNextLevel(%d) = %d, want %d", tt.currentXP, got, tt.want)
			}
		})
	}
}

func TestXPThresholds(t *testing.T) {
	// Verify XP thresholds match PHB p15
	expected := map[int]int{
		1: 0, 2: 300, 3: 900, 4: 2700, 5: 6500,
		6: 14000, 7: 23000, 8: 34000, 9: 48000, 10: 64000,
		11: 85000, 12: 100000, 13: 120000, 14: 140000, 15: 165000,
		16: 195000, 17: 225000, 18: 265000, 19: 305000, 20: 355000,
	}

	if len(XPThresholds) != 20 {
		t.Errorf("XPThresholds has %d entries, want 20", len(XPThresholds))
	}

	for level, xp := range expected {
		if XPThresholds[level] != xp {
			t.Errorf("XPThresholds[%d] = %d, want %d", level, XPThresholds[level], xp)
		}
	}
}
