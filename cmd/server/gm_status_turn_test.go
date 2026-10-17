package main

import "testing"

func TestActionableCombatCharacterID(t *testing.T) {
	order := []byte(`[{"id":-1,"is_monster":true},{"id":34,"is_monster":false},{"id":33,"is_monster":false}]`)
	for _, tc := range []struct {
		name  string
		order []byte
		index int
		want  int
	}{
		{"monster turn does not prompt stale player skip", order, 0, 0},
		{"current player only", order, 1, 34},
		{"another current player", order, 2, 33},
		{"out of range", order, 3, 0},
		{"negative index", order, -1, 0},
		{"invalid order", []byte(`bad`), 0, 0},
	} {
		t.Run(tc.name, func(t *testing.T) {
			if got := actionableCombatCharacterID(tc.order, tc.index); got != tc.want {
				t.Fatalf("got %d, want %d", got, tc.want)
			}
		})
	}
}

func TestAllPartyUnableToAct(t *testing.T) {
	for _, tc := range []struct {
		name     string
		statuses []string
		want     bool
	}{
		{"empty roster", nil, false},
		{"all stable or dead", []string{"stable", "dead", "stable"}, true},
		{"death save still pending", []string{"stable", "dying"}, false},
		{"conscious survivor", []string{"stable", "critical"}, false},
		{"unknown status fails closed", []string{"stable", "unknown"}, false},
	} {
		t.Run(tc.name, func(t *testing.T) {
			party := make([]map[string]interface{}, 0, len(tc.statuses))
			for _, status := range tc.statuses {
				party = append(party, map[string]interface{}{"status": status})
			}
			if got := allPartyUnableToAct(party); got != tc.want {
				t.Fatalf("allPartyUnableToAct(%v) = %v, want %v", tc.statuses, got, tc.want)
			}
		})
	}
}
