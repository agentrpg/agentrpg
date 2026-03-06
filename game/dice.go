// Package game provides core D&D 5e game mechanics.
// This package is part of the Agent RPG modularization effort to break up
// the 46K+ line main.go into manageable, testable components.
package game

import (
	"crypto/rand"
	"math/big"
	"strconv"
	"strings"
)

// RollDie rolls a single die with the given number of sides using crypto/rand.
// Returns a value from 1 to sides (inclusive).
func RollDie(sides int) int {
	if sides < 1 {
		sides = 1
	}
	n, _ := rand.Int(rand.Reader, big.NewInt(int64(sides)))
	return int(n.Int64()) + 1
}

// RollDice rolls multiple dice and returns individual rolls and total.
// Example: RollDice(2, 6) rolls 2d6.
func RollDice(count, sides int) ([]int, int) {
	if count < 1 {
		count = 1
	}
	rolls := make([]int, count)
	total := 0
	for i := 0; i < count; i++ {
		rolls[i] = RollDie(sides)
		total += rolls[i]
	}
	return rolls, total
}

// RollWithAdvantage rolls 2d20 and returns (result, roll1, roll2).
// Result is the higher of the two rolls.
func RollWithAdvantage() (int, int, int) {
	roll1 := RollDie(20)
	roll2 := RollDie(20)
	result := roll1
	if roll2 > roll1 {
		result = roll2
	}
	return result, roll1, roll2
}

// RollWithDisadvantage rolls 2d20 and returns (result, roll1, roll2).
// Result is the lower of the two rolls.
func RollWithDisadvantage() (int, int, int) {
	roll1 := RollDie(20)
	roll2 := RollDie(20)
	result := roll1
	if roll2 < roll1 {
		result = roll2
	}
	return result, roll1, roll2
}

// ParseDice parses a dice string like "2d6" or "1d8+2" and returns (count, sides).
// The +modifier is ignored for pure dice parsing.
func ParseDice(dice string) (count int, sides int) {
	dice = strings.ToLower(dice)
	// Remove any +X modifier
	if idx := strings.Index(dice, "+"); idx > 0 {
		dice = dice[:idx]
	}

	parts := strings.Split(dice, "d")
	if len(parts) != 2 {
		return 1, 6 // Default to 1d6
	}

	count, _ = strconv.Atoi(parts[0])
	sides, _ = strconv.Atoi(parts[1])
	if count < 1 {
		count = 1
	}
	if sides < 1 {
		sides = 6
	}
	return count, sides
}

// RollDamage rolls damage dice from a string like "2d6" or "1d8+2".
// If critical is true, dice are doubled (but not the modifier).
// Returns the total of all dice rolled.
func RollDamage(dice string, critical bool) int {
	count, sides := ParseDice(dice)

	if critical {
		count *= 2 // Double dice on crit
	}

	_, total := RollDice(count, sides)
	return total
}

// RollDamageGWF rolls damage with Great Weapon Fighting style.
// Rerolls 1s and 2s once (must use new roll, per PHB).
func RollDamageGWF(dice string, critical bool) int {
	count, sides := ParseDice(dice)

	if critical {
		count *= 2 // Double dice on crit
	}

	total := 0
	for i := 0; i < count; i++ {
		roll := RollDie(sides)
		// GWF: reroll 1s and 2s once
		if roll == 1 || roll == 2 {
			roll = RollDie(sides) // Must use new roll
		}
		total += roll
	}
	return total
}

// RollDamageMax returns the maximum possible roll for a dice string.
// Used for features like Life Domain's Supreme Healing.
func RollDamageMax(dice string) int {
	count, sides := ParseDice(dice)
	return count * sides // Max roll = count * sides
}

// RollD20 is a convenience function for rolling a single d20.
func RollD20() int {
	return RollDie(20)
}

// Modifier calculates the ability modifier from an ability score.
// Standard 5e formula: (score - 10) / 2, rounded down (floor).
// Go's integer division truncates toward zero, so we need special handling
// for negative results to ensure proper floor behavior.
func Modifier(stat int) int {
	diff := stat - 10
	// For negative differences, we need floor division
	// e.g., -9/2 should be -5, not -4
	if diff < 0 && diff%2 != 0 {
		return diff/2 - 1
	}
	return diff / 2
}
