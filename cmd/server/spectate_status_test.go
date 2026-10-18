package main

import "testing"

func TestSpectatorHPStatus(t *testing.T) {
	for _, tc := range []struct {
		hp, maxHP int
		dead      bool
		want      string
	}{
		{0, 7, true, "dead"},
		{0, 7, false, "down"},
		{1, 9, false, "critical"},
		{4, 9, false, "bloodied"},
		{6, 9, false, "wounded"},
		{9, 9, false, "healthy"},
		{1, 0, false, "healthy"},
	} {
		if got := spectatorHPStatus(tc.hp, tc.maxHP, tc.dead); got != tc.want {
			t.Errorf("hp=%d maxHP=%d dead=%t: got %q, want %q", tc.hp, tc.maxHP, tc.dead, got, tc.want)
		}
	}
}
