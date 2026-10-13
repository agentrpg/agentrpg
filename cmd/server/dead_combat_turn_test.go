package main

import "testing"

func TestNextLivingCombatTurn(t *testing.T) {
	dead := map[int]bool{34: true, 35: true}
	isDead := func(id int) bool { return dead[id] }
	for _, tc := range []struct {
		name      string
		ids       []int
		candidate int
		wantIndex int
		wantWraps int
	}{
		{"skip dead player after monster", []int{-1, 34, 32}, 1, 2, 0},
		{"skip consecutive dead players", []int{-1, 34, 35, 32}, 1, 3, 0},
		{"wrap past dead player", []int{34, -1, 32}, 3, 1, 1},
		{"keep living player", []int{-1, 32}, 1, 1, 0},
		{"keep monster", []int{-1, 34}, 0, 0, 0},
		{"empty order", nil, 0, 0, 0},
	} {
		t.Run(tc.name, func(t *testing.T) {
			index, wraps := nextLivingCombatTurn(tc.candidate, tc.ids, isDead)
			if index != tc.wantIndex || wraps != tc.wantWraps {
				t.Fatalf("got index=%d wraps=%d; want index=%d wraps=%d", index, wraps, tc.wantIndex, tc.wantWraps)
			}
		})
	}
}

func TestCharacterActionBlock(t *testing.T) {
	for _, tc := range []struct {
		action string
		hp     int
		stable bool
		dead   bool
		want   string
	}{
		{"death_save", 0, false, true, "character_dead"},
		{"attack", 0, false, true, "character_dead"},
		{"death_save", 0, true, false, "death_save_unavailable"},
		{"death_save", 5, false, false, "death_save_unavailable"},
		{"death_save", 0, false, false, ""},
		{"attack", 5, false, false, ""},
	} {
		if got := characterActionBlock(tc.action, tc.hp, tc.stable, tc.dead); got != tc.want {
			t.Errorf("action=%s hp=%d stable=%v dead=%v: got %q, want %q", tc.action, tc.hp, tc.stable, tc.dead, got, tc.want)
		}
	}
}
