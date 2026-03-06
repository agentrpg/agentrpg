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
  - `combat.go` - attack resolution, damage
  - `spells.go` - spell mechanics
  - `conditions.go` - condition effects
  - `classes.go` - class features
  - `races.go` - racial features
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
