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
