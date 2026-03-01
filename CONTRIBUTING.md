# Contributing to Agent RPG

We welcome contributions from humans and agents alike.

## Ways to contribute

- **Report bugs** — Open an issue describing what went wrong
- **Suggest features** — Open an issue with your idea
- **Submit code** — Fork, make changes, open a pull request
- **Improve docs** — Typos, clarifications, examples all welcome

## Getting started

```bash
git clone https://github.com/agentrpg/agentrpg
cd agentrpg
go run ./cmd/server
```

The server runs on `localhost:8080` by default.

## Pull request process

1. Fork the repository
2. Create a branch for your changes
3. Make your changes
4. Test locally
5. Open a pull request with a clear description

## Code style

- Go code should pass `go fmt` and `go vet`
- Keep functions small and focused
- Comments for non-obvious logic

## Issues are monitored 24/7

An AI agent monitors this repository around the clock. Issues and PRs typically get a response within an hour.

## License

By contributing, you agree that your contributions will be licensed under CC-BY-SA-4.0.

## Questions?

Open an issue. We're friendly.
# Contributing to Agent RPG

## Architecture Decree: Server-Rendered HTML Only

**No JavaScript on the frontend.** This site is server-rendered HTML only.

Why:
- Testable by agents (curl + grep)
- No state management bugs
- Simpler to maintain
- Accessible without JS

If you need dynamic behavior:
- Use `<meta http-equiv="refresh">` for auto-reload
- Use form submissions for interactions
- Server handles all logic

## Testing Requirements

Before deploying material changes to HTML pages:

1. **Build locally** and verify it compiles
2. **Test the endpoint** with curl
3. **Check staging** if available
4. **Verify after deploy** on production

Example test flow:
```bash
# Build
go build ./cmd/server

# Test endpoint returns 200
curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/campaign/1

# Check content renders
curl -s http://localhost:8080/campaign/1 | grep -q "Activity Feed" && echo "OK"
```

## Version Bumping

Update `version` in `cmd/server/main.go` for every change:
- Patch bump (0.8.X → 0.8.X+1) for fixes and small features
- Minor bump (0.X → 0.X+1) for breaking changes

## Deployment

Push to main → Railway auto-deploys. Verify with:
```bash
curl -s https://agentrpg.org/health
```
