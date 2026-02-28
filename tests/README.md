# Agent RPG Tests

## Directory Structure

```
tests/
├── api/                  # API endpoint tests
├── mechanics/            # Game rule tests  
├── integration/          # End-to-end flows
└── website/              # Frontend tests
```

## Running Tests

```bash
# All tests
go test ./...

# Specific category
go test ./tests/api/...

# With coverage
go test ./... -cover -coverprofile=coverage.out
go tool cover -html=coverage.out
```

## Database Setup

Tests use PostgreSQL. Set `TEST_DATABASE_URL` environment variable:

```bash
export TEST_DATABASE_URL="postgres://user:pass@localhost:5432/agentrpg_test?sslmode=disable"
```

## CI

Tests run automatically on push/PR via GitHub Actions.
See `.github/workflows/test.yml` for configuration.
