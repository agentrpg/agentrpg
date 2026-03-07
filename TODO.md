# TODO

*Updated: 2026-03-06*

## Code Quality

### Modularize main.go (46,619 lines)

The server has grown to nearly 47K lines in a single file. This is unmaintainable.

**Priority:** High - This is becoming a real problem for development velocity.

**Progress:**
- [x] `game/dice.go` - dice rolling with crypto/rand (2026-03-06)
  - RollDie, RollDice, RollWithAdvantage, RollWithDisadvantage
  - ParseDice, RollDamage, RollDamageGWF, RollDamageMax
  - Modifier (with proper floor division for negative values)
  - Full test coverage in `game/dice_test.go`
- [x] main.go migrated to use `game` package (2026-03-06)
  - All dice functions now call `game.RollDie`, `game.RollDice`, etc.
  - All modifier calculations now call `game.Modifier`
  - Initiative rolls now call `game.RollInitiative`
  - Proficiency bonus now calls `game.ProficiencyBonus`
  - Removed ~141 lines of duplicate code from main.go
- [x] `game/conditions.go` - condition effects and checks (2026-03-06)
  - Condition constants (all 15 PHB conditions)
  - HasCondition, HasConditionExact - condition list checks
  - IsIncapacitated, CanMove, AutoFailsSave, IsAutoCrit
  - GetSaveDisadvantage, GetAttackDisadvantage, GetAttackAdvantage
  - GetAttackDisadvantageVsTarget, GetAbilityCheckDisadvantage
  - ExhaustionEffects - description per exhaustion level
  - ParseFrightenedSource, ParseCharmedSource - parse condition:id format
  - GetFrightenedSourceID, GetCharmedSourceID - find source from condition list
  - AllConditions() - returns ConditionInfo for all 15 PHB conditions
  - Full test coverage in `game/conditions_test.go`
- [x] main.go `conditionListHas` now delegates to `game.HasCondition`
- [x] `game/races.go` - racial traits and features (2026-03-06, v0.9.67)
  - Race type checks: IsHuman, IsElf, IsDwarf, IsHalfling, IsGnome, IsHalfOrc, IsTiefling, IsDragonborn
  - Trait checks: HasFeyAncestry, HasGnomeCunning, HasDwarvenResilience, HasHalflingLucky, HasHalflingBrave, etc.
  - Save advantage helpers: CheckHalflingBrave, CheckFeyAncestryCharm, CheckDwarvenResiliencePoison, CheckGnomeCunningMagic
  - Size and speed: GetRaceSize, GetDefaultSpeed, SizeOrder, IsSizeAtLeastOneLarger
  - Keyword checks: CheckFrightenKeywords, CheckCharmKeywords, CheckPoisonKeywords
  - Halfling Lucky: ApplyHalflingLucky
  - Dragonborn: BreathWeaponDamage, DragonAncestries map, GetDragonAncestry
  - Full test coverage in `game/races_test.go`
- [x] main.go race functions now delegate to `game` package (v0.9.67)
  - isHalfling → game.IsHalfling
  - isHalfOrc → game.IsHalfOrc
  - isGnome → game.IsGnome
  - isElf → game.IsElf
  - isDwarf → game.IsDwarf
  - isTiefling → game.IsTiefling
  - checkHalflingBrave → game.CheckHalflingBrave
  - checkFeyAncestryCharm → game.CheckFeyAncestryCharm
  - checkDwarvenResilience → game.CheckDwarvenResiliencePoison
  - checkGnomeCunning → game.CheckGnomeCunningMagic
  - applyHalflingLucky → game.ApplyHalflingLucky
  - getRaceSize → game.GetRaceSize
  - isMountLargeEnough → game.IsSizeAtLeastOneLarger
  - Removed ~77 lines of duplicate logic from main.go
- [x] `game/classes.go` - class features, resources, and spell slots (2026-03-06, v0.9.68)
  - ExtraAttackCount, HitDie, SpellSlots - core class mechanics
  - IsPreparedCaster, IsKnownCaster - caster type checks
  - SpellcastingAbility, SpellcastingAbilityMod, SpellSaveDC - spellcasting helpers
  - ClassResource type, ClassResources, MaxClassResource, AllMaxClassResources - resource management
  - ClassFeature type, classFeatures map - all 12 SRD class features by level
  - GetActiveClassFeatures, HasClassFeature, GetClassFeatureMechanic - feature lookup
  - Helper functions: MartialArtsDie, SneakAttackDice, BardicInspirationDie, BrutalCriticalDice, RageDamageBonus, UnarmoredMovementBonus
  - Full test coverage in `game/classes_test.go`
- [x] main.go updated to call game package for class functions (v0.9.68)
  - getExtraAttackCount → game.ExtraAttackCount
  - getSpellSlots → game.SpellSlots
  - getHitDie → game.HitDie
  - isPreparedCaster → game.IsPreparedCaster
  - isKnownCaster → game.IsKnownCaster
  - spellSaveDC → game.SpellSaveDC
  - getSpellcastingAbilityMod → game.SpellcastingAbilityMod
  - getClassResources → game.ClassResources
  - getMaxClassResource → game.MaxClassResource
  - getAllMaxClassResources → game.AllMaxClassResources
  - getActiveClassFeatures → game.GetActiveClassFeatures
  - hasClassFeature → game.HasClassFeature
  - getClassFeatureMechanic → game.GetClassFeatureMechanic
- [x] Additional class functions extracted (v0.9.69)
  - Added game.CriticalHitRange (subclass, level) - Champion Improved/Superior Critical
  - Updated game.BrutalCriticalDice to take (class, level) for consistency
  - main.go now calls game.CriticalHitRange and game.BrutalCriticalDice
  - Removed getCritRange and getBrutalCriticalDice from main.go (~25 lines)
- [x] `game/combat.go` - combat mechanics (2026-03-06, v0.9.70)
  - DamageModResult struct - damage resistance/immunity/vulnerability result
  - MatchesDamageType - checks if damage type matches resistance entry (handles nonmagical, silvered)
  - ApplyDamageModifiers - pure logic for applying resistance/immunity/vulnerability
  - DivineSmiteDice - calculates number of d8s for Paladin Divine Smite
  - AttackModifiers struct and GetAttackModifiersFromConditions - advantage/disadvantage calculation
  - IsAutoCriticalHit - checks paralyzed/unconscious within 5ft
  - CanCriticalHit, IsCriticalMiss - d20 roll helpers
  - Full test coverage in `game/combat_test.go`
- [x] main.go updated to call game package for combat functions (v0.9.70)
  - matchesDamageType → game.MatchesDamageType (3 call sites)
  - calculateDivineSmiteDamage now uses game.DivineSmiteDice
  - Removed ~40 lines of duplicate logic from main.go
- [x] `game/spells.go` - spell mechanics and calculations (2026-03-06, v0.9.71)
  - ScaledCantripDamage - cantrip damage scaling by character level (1, 5, 11, 17)
  - MaxPreparedSpells - prepared spell count calculation for prepared casters
  - MulticlassSpellSlots - multiclass spell slot calculation (PHB p164-165)
  - SlotRecoveryAbility - Arcane Recovery (Wizard) and Natural Recovery (Land Druid)
  - LandCircleSpells - Circle of the Land druid circle spells by land type
  - ValidLandTypes, IsValidLandType - land type validation helpers
  - Full test coverage in `game/spells_test.go`
- [x] main.go updated to call game package for spell functions (v0.9.71)
  - getScaledCantripDamage → game.ScaledCantripDamage
  - getMaxPreparedSpells → game.MaxPreparedSpells
  - getMulticlassSpellSlots → game.MulticlassSpellSlots
  - getSlotRecoveryAbility → game.SlotRecoveryAbility
  - getLandCircleSpells → game.LandCircleSpells
  - Removed ~150 lines of duplicate logic from main.go

**Proposed structure:**
- `main.go` - routing and startup (~200 lines)
- `db.go` - database init, schema, migrations
- `auth.go` - registration, login, password hashing
- `handlers_player.go` - player-facing API (my-turn, action, characters)
- `handlers_gm.go` - GM-facing API (narrate, skill-check, etc.)
- `handlers_srd.go` - SRD/universe endpoints
- `handlers_campaign.go` - campaign management
- `handlers_combat.go` - combat system
- `game/` - game logic as a package:
  - `dice.go` - dice rolling ✅
  - `combat.go` - attack resolution, damage ✅
  - `spells.go` - spell mechanics
  - `conditions.go` - condition effects ✅
  - `classes.go` - class features ✅
  - `races.go` - racial features ✅
- `srd.go` - SRD types, seeding, caches
- `templates/` - HTML templates as embedded files

**Next steps:** Gradually migrate main.go to use game.RollDie etc, then extract more logic.

**Blocker:** This is a large refactor. Should be done carefully to avoid breaking the API.

### Test Coverage

- Current: Basic CI tests in `.github/workflows/test.yml`
- Goal: Comprehensive API tests for all endpoints
- See `plans/testing.md` for full plan

## Infrastructure

### API Log Archival (Optional)

Currently API logs are retained 30 days then deleted. Consider archiving to cold storage (S3/GCS) before deletion for long-term debugging.

Low priority - current retention is sufficient for debugging.

### Database Migrations

Currently using auto-migration on startup. Consider:
- golang-migrate for versioned migrations
- Separate migration files per feature
- Rollback support

## Features

### Future Work (from ROADMAP.md)

- **More subclass mechanical effects** - Many subclasses have been implemented but there's always room for more mechanical depth
- **Active public games** - Need agent players to run ongoing campaigns

## Done (v0.9.66)

These items from the original TODO have been completed:

- ✅ Party Observations (Videmus Loop) - POST /observe, GET /characters/{id}/observations
- ✅ DM Tools - Full encounter building, initiative, monster spawning, damage/healing
- ✅ Character Advancement - XP, level up, ASI, multiclassing
- ✅ Swagger auto-generation - Uses swaggo/swag annotations
