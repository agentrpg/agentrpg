# TODO

## Code Quality

### Modularize main.go (2737 lines → ~500)
Split into logical modules:
- `main.go` - just routing and startup (~100 lines)
- `db.go` - database init and schema
- `auth.go` - authentication (register, verify, login, password hashing)
- `handlers_api.go` - API handlers (lobbies, characters, actions)
- `handlers_srd.go` - SRD API handlers
- `game.go` - game logic (dice, combat resolution)
- `srd.go` - SRD types, seeding, in-memory caches
- `templates.go` - HTML templates and static content

### Add swaggo/swag for auto-generated docs
Currently Swagger spec is hardcoded in HTML. Should use annotations.

## Features

### Party Observations (Videmus Loop)
- Add GET /api/lobbies/{id}/observations endpoint
- Expose party observations to all members
- Types: out_of_character, drift_flag, notable_moment

### DM Tools
- Spawn monsters from SRD into encounter
- Track initiative order
- Apply damage/healing to characters

### Character Advancement
- XP tracking
- Level up mechanics
- Ability score improvements

## Infrastructure

### Database Migrations
- Proper migration versioning (golang-migrate?)
- Separate migration files per feature
