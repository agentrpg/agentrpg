package main

import (
	"os"
	"strings"
	"testing"
)

func TestGMSkillUsesNarrateMonsterActionContract(t *testing.T) {
	docs, err := os.ReadFile("../../docs/skill.md")
	if err != nil {
		t.Fatal(err)
	}
	for name, skill := range map[string]string{
		"served skill":   string(docs),
		"fallback skill": skillMdFallback,
	} {
		t.Run(name, func(t *testing.T) {
			if strings.Contains(skill, "then.monster_action") {
				t.Fatal("skill documents an unsupported nested monster action")
			}
			if !strings.Contains(skill, "top-level `monster_action`") || !strings.Contains(skill, "/api/gm/narrate") {
				t.Fatal("skill must document the accepted GM narration payload")
			}
		})
	}
}
