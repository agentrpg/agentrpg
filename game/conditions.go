// Package game provides core D&D 5e game mechanics.
// conditions.go handles 5e condition effects and checks.
package game

import "strings"

// Condition constants for the 15 PHB conditions
const (
	ConditionBlinded       = "blinded"
	ConditionCharmed       = "charmed"
	ConditionDeafened      = "deafened"
	ConditionFrightened    = "frightened"
	ConditionGrappled      = "grappled"
	ConditionIncapacitated = "incapacitated"
	ConditionInvisible     = "invisible"
	ConditionParalyzed     = "paralyzed"
	ConditionPetrified     = "petrified"
	ConditionPoisoned      = "poisoned"
	ConditionProne         = "prone"
	ConditionRestrained    = "restrained"
	ConditionStunned       = "stunned"
	ConditionUnconscious   = "unconscious"
	ConditionExhaustion    = "exhaustion"
)

// ConditionInfo describes the mechanical effects of a condition.
type ConditionInfo struct {
	Name        string
	Description string
	Effects     []string
}

// AllConditions returns info about all 15 PHB conditions.
func AllConditions() []ConditionInfo {
	return []ConditionInfo{
		{ConditionBlinded, "A blinded creature can't see and automatically fails any ability check that requires sight.",
			[]string{"Auto-fail checks requiring sight", "Attack rolls have disadvantage", "Attacks against have advantage"}},
		{ConditionCharmed, "A charmed creature can't attack the charmer or target them with harmful abilities.",
			[]string{"Can't attack charmer", "Charmer has advantage on social checks"}},
		{ConditionDeafened, "A deafened creature can't hear and automatically fails any ability check that requires hearing.",
			[]string{"Auto-fail checks requiring hearing"}},
		{ConditionFrightened, "A frightened creature has disadvantage on ability checks and attack rolls while source is visible.",
			[]string{"Disadvantage on ability checks while source visible", "Disadvantage on attacks while source visible", "Can't willingly move closer to source"}},
		{ConditionGrappled, "A grappled creature's speed becomes 0, and it can't benefit from any bonus to speed.",
			[]string{"Speed becomes 0", "Ends if grappler incapacitated", "Ends if effect moves creature out of reach"}},
		{ConditionIncapacitated, "An incapacitated creature can't take actions or reactions.",
			[]string{"Can't take actions", "Can't take reactions"}},
		{ConditionInvisible, "An invisible creature is impossible to see without special sense.",
			[]string{"Attack rolls have advantage", "Attacks against have disadvantage"}},
		{ConditionParalyzed, "A paralyzed creature is incapacitated and can't move or speak.",
			[]string{"Incapacitated (no actions/reactions)", "Can't move or speak", "Auto-fail STR/DEX saves", "Attacks have advantage", "Melee hits within 5ft are crits"}},
		{ConditionPetrified, "A petrified creature is transformed to stone with weight x10.",
			[]string{"Incapacitated (no actions/reactions)", "Can't move or speak, unaware", "Resistance to all damage", "Immune to poison and disease", "Weight x10"}},
		{ConditionPoisoned, "A poisoned creature has disadvantage on attack rolls and ability checks.",
			[]string{"Disadvantage on attack rolls", "Disadvantage on ability checks"}},
		{ConditionProne, "A prone creature's only movement option is to crawl (1ft costs 2ft).",
			[]string{"Disadvantage on attack rolls", "Attacks within 5ft have advantage", "Attacks from further have disadvantage", "Must crawl or use half movement to stand"}},
		{ConditionRestrained, "A restrained creature's speed becomes 0 and can't benefit from speed bonuses.",
			[]string{"Speed becomes 0", "Attacks have disadvantage", "Attacks against have advantage", "Disadvantage on DEX saves"}},
		{ConditionStunned, "A stunned creature is incapacitated, can't move, and can only speak falteringly.",
			[]string{"Incapacitated (no actions/reactions)", "Can't move", "Auto-fail STR/DEX saves", "Attacks have advantage"}},
		{ConditionUnconscious, "An unconscious creature is incapacitated, can't move or speak, and is unaware.",
			[]string{"Incapacitated (no actions/reactions)", "Can't move or speak", "Drops held items", "Falls prone", "Auto-fail STR/DEX saves", "Attacks have advantage", "Melee hits within 5ft are crits"}},
	}
}

// HasCondition checks if a condition list contains a specific condition.
// Case-insensitive matching.
func HasCondition(conditions []string, condition string) bool {
	condition = strings.ToLower(condition)
	for _, c := range conditions {
		if strings.ToLower(c) == condition {
			return true
		}
		// Handle prefixed conditions like "charmed:123" or "frightened:456"
		if strings.HasPrefix(strings.ToLower(c), condition+":") {
			return true
		}
	}
	return false
}

// HasConditionExact checks for exact condition match (case-insensitive).
// Does not match prefixed conditions like "charmed:123".
func HasConditionExact(conditions []string, condition string) bool {
	condition = strings.ToLower(condition)
	for _, c := range conditions {
		if strings.ToLower(c) == condition {
			return true
		}
	}
	return false
}

// IsIncapacitated checks if conditions prevent taking actions or reactions.
// Per 5e: paralyzed, stunned, unconscious, petrified, and incapacitated all prevent actions.
func IsIncapacitated(conditions []string) bool {
	incapConditions := []string{
		ConditionIncapacitated, ConditionParalyzed, ConditionStunned,
		ConditionUnconscious, ConditionPetrified,
	}
	for _, inc := range incapConditions {
		if HasCondition(conditions, inc) {
			return true
		}
	}
	return false
}

// CanMove checks if conditions allow movement.
// Grappled, restrained, stunned, paralyzed, unconscious, petrified set speed to 0.
// Also checks exhaustion level 5+.
func CanMove(conditions []string, exhaustionLevel int) bool {
	speedZeroConditions := []string{
		ConditionGrappled, ConditionRestrained, ConditionStunned,
		ConditionParalyzed, ConditionUnconscious, ConditionPetrified,
	}
	for _, cond := range speedZeroConditions {
		if HasCondition(conditions, cond) {
			return false
		}
	}
	// Exhaustion level 5+ also reduces speed to 0
	if exhaustionLevel >= 5 {
		return false
	}
	return true
}

// AutoFailsSave checks if conditions cause automatic save failure.
// Paralyzed, stunned, unconscious auto-fail STR/DEX saves.
func AutoFailsSave(conditions []string, ability string) bool {
	ability = strings.ToUpper(ability)
	if ability != "STR" && ability != "DEX" {
		return false
	}
	// These conditions cause auto-fail on STR/DEX saves
	autoFailConditions := []string{
		ConditionParalyzed, ConditionStunned, ConditionUnconscious,
	}
	for _, cond := range autoFailConditions {
		if HasCondition(conditions, cond) {
			return true
		}
	}
	return false
}

// IsAutoCrit checks if conditions make melee attacks automatic crits.
// Paralyzed and unconscious targets take auto-crits from melee hits within 5ft.
func IsAutoCrit(conditions []string) bool {
	autoCritConditions := []string{ConditionParalyzed, ConditionUnconscious}
	for _, cond := range autoCritConditions {
		if HasCondition(conditions, cond) {
			return true
		}
	}
	return false
}

// GetSaveDisadvantage checks if conditions grant disadvantage on a saving throw.
// Restrained gives disadvantage on DEX saves.
// Exhaustion 3+ gives disadvantage on all saves.
func GetSaveDisadvantage(conditions []string, exhaustionLevel int, ability string) bool {
	ability = strings.ToUpper(ability)
	
	// Exhaustion 3+ = disadvantage on all saves
	if exhaustionLevel >= 3 {
		return true
	}
	
	// Restrained = disadvantage on DEX saves
	if ability == "DEX" && HasCondition(conditions, ConditionRestrained) {
		return true
	}
	
	return false
}

// GetAttackDisadvantage checks if conditions grant disadvantage on attack rolls.
// Blinded, frightened, poisoned, prone, restrained, exhaustion 3+ cause disadvantage.
// frightenedSourceVisible should be true if the source of fright is visible.
func GetAttackDisadvantage(conditions []string, exhaustionLevel int, frightenedSourceVisible bool) bool {
	// Exhaustion 3+ = disadvantage on attacks
	if exhaustionLevel >= 3 {
		return true
	}
	
	// These conditions always give attack disadvantage
	directDisadvantage := []string{
		ConditionBlinded, ConditionPoisoned, ConditionProne, ConditionRestrained,
	}
	for _, cond := range directDisadvantage {
		if HasCondition(conditions, cond) {
			return true
		}
	}
	
	// Frightened gives disadvantage only if source is visible
	if frightenedSourceVisible && HasCondition(conditions, ConditionFrightened) {
		return true
	}
	
	return false
}

// GetAbilityCheckDisadvantage checks if conditions grant disadvantage on ability checks.
// Exhaustion 1+, poisoned, frightened (if source visible) cause disadvantage.
func GetAbilityCheckDisadvantage(conditions []string, exhaustionLevel int, frightenedSourceVisible bool) bool {
	// Exhaustion 1+ = disadvantage on ability checks
	if exhaustionLevel >= 1 {
		return true
	}
	
	// Poisoned = disadvantage on ability checks
	if HasCondition(conditions, ConditionPoisoned) {
		return true
	}
	
	// Frightened = disadvantage if source visible
	if frightenedSourceVisible && HasCondition(conditions, ConditionFrightened) {
		return true
	}
	
	return false
}

// GetAttackAdvantage checks if target's conditions grant advantage to attackers.
// Blinded, paralyzed, prone (within 5ft), restrained, stunned, unconscious targets
// give attackers advantage.
func GetAttackAdvantage(targetConditions []string, isMelee bool, withinFiveFeet bool) bool {
	// Always advantage against these
	advantageConditions := []string{
		ConditionBlinded, ConditionParalyzed, ConditionRestrained,
		ConditionStunned, ConditionUnconscious,
	}
	for _, cond := range advantageConditions {
		if HasCondition(targetConditions, cond) {
			return true
		}
	}
	
	// Prone: advantage if within 5ft, disadvantage otherwise
	if HasCondition(targetConditions, ConditionProne) {
		return withinFiveFeet
	}
	
	return false
}

// GetAttackDisadvantageVsTarget checks if target's conditions grant disadvantage to attackers.
// Invisible targets grant disadvantage (unless attacker has blindsight/truesight).
// Prone targets grant disadvantage on ranged attacks from > 5ft.
func GetAttackDisadvantageVsTarget(targetConditions []string, isRanged bool, withinFiveFeet bool) bool {
	// Invisible = disadvantage (blindsight/truesight should be checked separately)
	if HasCondition(targetConditions, ConditionInvisible) {
		return true
	}
	
	// Prone = disadvantage if ranged (not within 5ft)
	if HasCondition(targetConditions, ConditionProne) && isRanged && !withinFiveFeet {
		return true
	}
	
	return false
}

// ExhaustionEffects returns a description of effects for a given exhaustion level.
func ExhaustionEffects(level int) string {
	switch level {
	case 0:
		return "No exhaustion"
	case 1:
		return "Disadvantage on ability checks"
	case 2:
		return "Speed halved; Disadvantage on ability checks"
	case 3:
		return "Speed halved; Disadvantage on ability checks, attack rolls, and saving throws"
	case 4:
		return "Speed halved; HP maximum halved; Disadvantage on ability checks, attack rolls, and saving throws"
	case 5:
		return "Speed reduced to 0; HP maximum halved; Disadvantage on ability checks, attack rolls, and saving throws"
	default:
		return "DEAD (exhaustion level 6)"
	}
}

// ParseFrightenedSource extracts the source ID from a "frightened:123" condition.
// Returns 0 if not a frightened condition or no source specified.
func ParseFrightenedSource(condition string) int {
	lower := strings.ToLower(condition)
	if !strings.HasPrefix(lower, "frightened:") {
		return 0
	}
	parts := strings.SplitN(condition, ":", 2)
	if len(parts) != 2 {
		return 0
	}
	return parseIntFromString(parts[1])
}

// parseIntFromString parses an int from string, returning 0 on error.
func parseIntFromString(s string) int {
	var i int
	for _, c := range s {
		if c >= '0' && c <= '9' {
			i = i*10 + int(c-'0')
		} else {
			break
		}
	}
	return i
}

// ParseCharmedSource extracts the source ID from a "charmed:123" condition.
// Returns 0 if not a charmed condition or no source specified.
func ParseCharmedSource(condition string) int {
	lower := strings.ToLower(condition)
	if !strings.HasPrefix(lower, "charmed:") {
		return 0
	}
	parts := strings.SplitN(condition, ":", 2)
	if len(parts) != 2 {
		return 0
	}
	return parseIntFromString(parts[1])
}

// GetFrightenedSourceID finds the source ID of a frightened condition in a list.
// Returns 0 if not frightened or no specific source.
func GetFrightenedSourceID(conditions []string) int {
	for _, c := range conditions {
		if id := ParseFrightenedSource(c); id > 0 {
			return id
		}
	}
	return 0
}

// GetCharmedSourceID finds the source ID of a charmed condition in a list.
// Returns 0 if not charmed or no specific source.
func GetCharmedSourceID(conditions []string) int {
	for _, c := range conditions {
		if id := ParseCharmedSource(c); id > 0 {
			return id
		}
	}
	return 0
}
