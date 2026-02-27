# Agent RPG Testing Plan

## Overview

Local testing using SQLite for fast iteration. Tests should run without network dependencies.

## Architecture

```
tests/
├── api/                  # API endpoint tests
│   ├── auth_test.go      # Registration, login, password reset
│   ├── character_test.go # Character CRUD, leveling
│   ├── campaign_test.go  # Campaign creation, joining
│   ├── combat_test.go    # Combat mechanics, turn order
│   ├── spells_test.go    # Spell casting, slots, concentration
│   ├── inventory_test.go # Items, equipment, currency
│   └── gm_test.go        # GM-specific endpoints
├── mechanics/            # Game rule tests
│   ├── dice_test.go      # Dice rolling, advantage/disadvantage
│   ├── damage_test.go    # Damage types, resistance, vulnerability
│   ├── conditions_test.go# Status effects
│   └── combat_rules_test.go # Action economy, opportunity attacks
├── integration/          # End-to-end flows
│   ├── full_combat_test.go    # Complete combat encounter
│   ├── campaign_flow_test.go  # Create → join → play → end
│   └── password_reset_test.go # Full reset flow (mocked email)
└── website/              # Frontend tests
    ├── pages_test.go     # Page rendering, no 500s
    └── forms_test.go     # Form submissions
```

## Test Database

Use SQLite for local tests (same schema, swap driver):

```go
// test_helpers.go
func setupTestDB() *sql.DB {
    db, _ := sql.Open("sqlite3", ":memory:")
    // Run schema migrations
    runMigrations(db)
    // Seed test data
    seedTestData(db)
    return db
}
```

## API Test Categories

### 1. Auth Tests (`auth_test.go`)

| Test | Description |
|------|-------------|
| `TestRegisterWithPassword` | Register without email, get agent_id |
| `TestRegisterWithEmail` | Register with email, verification sent |
| `TestLoginById` | Auth with agent_id:password |
| `TestLoginByEmail` | Auth with email:password |
| `TestLoginByName` | Auth with name:password |
| `TestInvalidCredentials` | Wrong password returns 401 |
| `TestPasswordResetRequest` | Request reset, token created |
| `TestPasswordResetConfirm` | Use token, password updated |
| `TestPasswordResetExpired` | Expired token rejected |
| `TestUnverifiedCanPlay` | Unverified accounts can access /api/my-turn |

### 2. Character Tests (`character_test.go`)

| Test | Description |
|------|-------------|
| `TestCreateCharacter` | Create with class/race |
| `TestCharacterStats` | Stats calculated correctly |
| `TestLevelUp` | XP threshold, HP increase |
| `TestASIChoice` | Ability score improvement at level 4 |
| `TestEquipWeapon` | Equip, AC/damage updated |
| `TestEquipArmor` | Armor proficiency check |

### 3. Combat Tests (`combat_test.go`)

| Test | Description |
|------|-------------|
| `TestInitiativeRoll` | Roll initiative, sort order |
| `TestTurnOrder` | Correct turn advancement |
| `TestAttackRoll` | Hit/miss calculation |
| `TestDamageRoll` | Damage dealt, HP reduced |
| `TestAdvantage` | Roll twice, take higher |
| `TestDisadvantage` | Roll twice, take lower |
| `TestCriticalHit` | Nat 20 doubles dice |
| `TestCriticalMiss` | Nat 1 always misses |
| `TestOpportunityAttack` | Trigger on movement |
| `TestDeathSaves` | 3 successes/failures |
| `TestUnderwaterCombat` | Disadvantage, fire resistance |

### 4. Spell Tests (`spells_test.go`)

| Test | Description |
|------|-------------|
| `TestCastSpell` | Slot consumed, effect applied |
| `TestCantrip` | No slot consumed |
| `TestConcentration` | One concentration at a time |
| `TestConcentrationBreak` | Damage forces CON save |
| `TestBonusActionSpell` | Only cantrip as action |
| `TestCounterspell` | Counter enemy spell |
| `TestDispelMagic` | End ongoing effect |
| `TestUpcast` | Higher slot, better effect |

### 5. GM Tests (`gm_test.go`)

| Test | Description |
|------|-------------|
| `TestGMStatus` | Returns campaign state |
| `TestNarrate` | Post narration, action logged |
| `TestAddMonster` | Monster in turn order |
| `TestLairAction` | Once per round |
| `TestGoldAward` | Currency updated |
| `TestXPAward` | XP distributed |
| `TestEnvironmentalDamage` | Falling, suffocation |

### 6. Website Tests (`pages_test.go`)

| Test | Description |
|------|-------------|
| `TestHomepage` | Returns 200, has content |
| `TestCampaignPage` | No format string errors |
| `TestProfilePage` | Character info rendered |
| `TestAPIDocsPage` | Swagger loads |
| `TestHealthEndpoint` | Returns "ok" |
| `Test404Page` | Invalid route handled |

## Running Tests

```bash
# All tests
go test ./tests/...

# Specific category
go test ./tests/api/...

# Single test
go test ./tests/api -run TestPasswordResetConfirm

# With coverage
go test ./tests/... -cover -coverprofile=coverage.out
go tool cover -html=coverage.out
```

## CI Integration

```yaml
# .github/workflows/test.yml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-go@v5
        with:
          go-version: '1.21'
      - run: go test ./tests/... -v -cover
```

## Mocking

### Email (Resend)
```go
type MockEmailSender struct {
    SentEmails []Email
}
func (m *MockEmailSender) Send(to, subject, body string) error {
    m.SentEmails = append(m.SentEmails, Email{to, subject, body})
    return nil
}
```

### Dice Rolls
```go
type MockRoller struct {
    NextRolls []int
}
func (m *MockRoller) Roll(sides int) int {
    if len(m.NextRolls) == 0 {
        return sides / 2  // Default to average
    }
    roll := m.NextRolls[0]
    m.NextRolls = m.NextRolls[1:]
    return roll
}
```

## Priority Order

1. **Auth tests** — most critical, gate everything
2. **Combat tests** — core gameplay
3. **Spell tests** — complex rules
4. **Website tests** — catch format string bugs
5. **Integration tests** — full flows

## Coverage Goals

| Category | Target |
|----------|--------|
| Auth | 90% |
| Combat | 80% |
| Spells | 80% |
| GM endpoints | 70% |
| Website | 60% |
| Overall | 75% |

---

*Created: 2026-02-27*
*Status: Planning*
