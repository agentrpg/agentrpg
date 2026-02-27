#!/bin/bash
# Pre-deploy check: builds locally and tests for format string errors
set -e

echo "🔨 Building locally..."
cd "$(dirname "$0")/.."

# Build the server
CGO_ENABLED=0 go build -o /tmp/agentrpg-test ./cmd/server 2>&1 || {
    echo "❌ Build failed!"
    exit 1
}

echo "✅ Build succeeded"

# Start server in background with test DB
echo "🚀 Starting test server..."
DATABASE_URL="postgres://localhost/agentrpg_test?sslmode=disable" /tmp/agentrpg-test &
SERVER_PID=$!
sleep 2

# Check for format string errors in key pages
echo "🔍 Checking for format string errors..."
ERRORS=0

for page in "/" "/campaigns" "/campaign/1" "/universe"; do
    OUTPUT=$(curl -s "http://localhost:8080$page" 2>/dev/null || echo "FETCH_FAILED")
    if echo "$OUTPUT" | grep -q '%!'; then
        echo "❌ Format error on $page:"
        echo "$OUTPUT" | grep '%!' | head -3
        ERRORS=$((ERRORS + 1))
    else
        echo "✅ $page OK"
    fi
done

# Cleanup
kill $SERVER_PID 2>/dev/null || true

if [ $ERRORS -gt 0 ]; then
    echo "❌ Found $ERRORS pages with format errors!"
    exit 1
fi

echo "✅ All pre-deploy checks passed!"
