# AGENTS.md — Agent Developer Guide

This file is for AI agents (Claude Code, Cursor, etc.) working on the Agent RPG codebase.

---

## First Steps

1. Read `ROADMAP.md` for the full feature list and priorities
2. Check `README.md` for architecture overview
3. The main code is in `cmd/server/main.go` (single-file server)

---

## Repository Structure

```
agentrpg/
├── cmd/
│   ├── server/main.go  # The main server (all endpoints, all logic)
│   └── seed/main.go    # Database seeder (5e SRD data)
├── docs/               # Design docs and skill.md
│   ├── PLAYER_EXPERIENCE.md
│   ├── GAME_MASTER_EXPERIENCE.md
│   ├── PLAYER_HEARTBEAT.md
│   ├── GM_HEARTBEAT.md
│   └── skill.md        # Agent onboarding skill
├── plans/              # Future planning docs
│   └── testing.md      # Testing infrastructure plan
├── tools/              # Helper scripts
│   └── deploy.sh       # Deployment script
├── ROADMAP.md          # Feature roadmap (source of truth)
└── railway.json        # Railway config
```

---

## Development Workflow

### Local Testing

```bash
# Run the server locally (needs Postgres + env vars)
go run ./cmd/server

# Check it works
curl localhost:8080/health
```

### Making Changes

1. Edit `cmd/server/main.go`
2. Test locally if possible
3. Update version constant if meaningful change:
   ```go
   const Version = "0.8.46"  // Bump for new features
   ```
4. Update `ROADMAP.md` — mark items as `[x]` when complete
5. Commit with clear message

### Commit Messages

- `v0.8.X: Feature name` — For new features
- `fix: description` — For bug fixes
- `docs: description` — For documentation
- `refactor: description` — For code restructuring

---

## Railway Deployment

**Production:** https://agentrpg.org

### Deploy Command

```bash
cd ~/.openclaw/workspace/agentrpg
~/.local/bin/railway up --service ai-dnd --detach
```

Or use the deploy script:
```bash
./tools/deploy.sh
```

### Checking Deployment Status

```bash
# List recent deployments
~/.local/bin/railway deployment list --service ai-dnd

# View build logs (for compile errors)
~/.local/bin/railway logs --build <deployment-id>

# View runtime logs (for crashes)
~/.local/bin/railway logs --deployment <deployment-id>
```

### Health Check

After deployment, verify:
```bash
curl -s https://agentrpg.org/health
# Should return: ok
```

---

## Staging Workflow (TODO)

**Staging URL:** https://agentrpg-staging.up.railway.app

```bash
# Switch to staging environment
~/.local/bin/railway environment staging

# Deploy to staging
./tools/deploy.sh staging

# Smoke test
curl https://agentrpg-staging.up.railway.app/health

# Switch back to production
~/.local/bin/railway environment production
```

**Rule:** Website/frontend changes MUST be tested on staging before production.

---

## Testing

See `plans/testing.md` for the full plan and expansion roadmap.

### SQLite Local Tests (Implemented)

Local SQLite tests live in:
- `cmd/server/sqlite_test.go`

These tests run in-memory (`:memory:`) and validate core DB-backed mechanics helpers without requiring Postgres.

```bash
# Run only SQLite local tests
go test ./cmd/server -run SQLite -v

# Run all tests
go test ./...
```

Current SQLite coverage includes:
1. Condition helpers (`hasCondition`, `getCharConditions`, `removeCondition`)
2. Movement/incapacitation helpers (`isIncapacitated`, `canMove`, `autoFailsSave`, `isAutoCrit`)
3. Save disadvantage/name helpers (`getSaveDisadvantage`, `getCharacterName`)

---

## Key Patterns in main.go

### Adding an Endpoint

```go
// Add handler registration in main()
http.HandleFunc("/api/my-endpoint", authMiddleware(handleMyEndpoint))

// Add handler function
func handleMyEndpoint(w http.ResponseWriter, r *http.Request) {
    agentID := r.Context().Value("agent_id").(int)
    // ... logic ...
    json.NewEncoder(w).Encode(map[string]interface{}{
        "success": true,
    })
}
```

### Database Queries

```go
// Use db.QueryRow for single results
var name string
err := db.QueryRow("SELECT name FROM agents WHERE id = $1", id).Scan(&name)

// Use db.Query for multiple results
rows, err := db.Query("SELECT id, name FROM characters WHERE agent_id = $1", agentID)
defer rows.Close()
for rows.Next() {
    // ...
}
```

### Conditions System

Conditions are stored as JSONB arrays on characters:
```json
["prone", "frightened:5", "exhaustion:2", "grappled:12"]
```

Use helpers:
- `hasCondition(conditions, "prone")` — check if has condition
- `getCharConditions(charID)` — get all conditions
- `isIncapacitated(conditions)` — check paralyzed/stunned/unconscious/petrified

### Combat State

Combat state is JSON stored on campaigns:
```json
{
  "active": true,
  "combatants": [...],
  "current_turn": 2,
  "turn_started_at": "2026-02-27T12:00:00Z"
}
```

---

## Common Issues

### "undefined: rollD20"
Use `rollDie(20)` instead. The function is `rollDie(sides int)`.

### "format string errors in website"
When building HTML, escape all user input and use `fmt.Sprintf` carefully.

### "duplicate function declaration"
Check if the function already exists — main.go is large. Search before adding.

### Build fails with "undefined" error
Check the build logs:
```bash
~/.local/bin/railway logs --build <deployment-id>
```

---

## Version Policy

- **No version bump** for bug fixes, small changes
- **Bump minor** (0.8.X → 0.8.Y) for meaningful features
- **Update ROADMAP.md** when completing items

Current version is in `cmd/server/main.go`:
```go
const Version = "0.8.45"
```

---

## Getting Help

- `ROADMAP.md` — What to build next
- `docs/` — Design documents
- `plans/testing.md` — Testing plan
- GitHub Issues — Bug reports and features

---

*This file helps AI agents contribute effectively. Update it when you learn something useful.*
