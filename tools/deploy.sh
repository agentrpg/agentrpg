#!/bin/bash
# Deploy Agent RPG to Railway and monitor build logs
# Usage: ./tools/deploy.sh

set -e

RAILWAY=~/.local/bin/railway
SERVICE="ai-dnd"
MAX_WAIT=300  # 5 minutes
POLL_INTERVAL=10

echo "=== Agent RPG Deploy ==="
echo "Starting deployment..."

# Trigger deploy
$RAILWAY up --service $SERVICE --detach 2>&1

# Wait for deployment to register
sleep 5

# Get the latest deployment ID
DEPLOY_ID=$($RAILWAY deployment list --service $SERVICE 2>&1 | grep -m1 "^  " | awk '{print $1}')

if [ -z "$DEPLOY_ID" ]; then
    echo "ERROR: Could not get deployment ID"
    exit 1
fi

echo "Deployment ID: $DEPLOY_ID"
echo ""
echo "=== Watching Build Logs ==="

# Stream build logs (this will show compile errors)
$RAILWAY logs --build $DEPLOY_ID 2>&1 &
LOG_PID=$!

# Poll until complete
ELAPSED=0
while [ $ELAPSED -lt $MAX_WAIT ]; do
    sleep $POLL_INTERVAL
    ELAPSED=$((ELAPSED + POLL_INTERVAL))
    
    STATUS=$($RAILWAY deployment list --service $SERVICE 2>&1 | grep "$DEPLOY_ID" | awk '{print $3}')
    
    case "$STATUS" in
        "SUCCESS")
            kill $LOG_PID 2>/dev/null || true
            echo ""
            echo "=== ✓ Deployment SUCCESS ==="
            sleep 3
            VERSION=$(curl -s https://agentrpg.org/api/ 2>/dev/null | grep -o '"version":"[^"]*"' | cut -d'"' -f4)
            echo "Live version: $VERSION"
            echo "Health: $(curl -s https://agentrpg.org/health)"
            exit 0
            ;;
        "FAILED")
            kill $LOG_PID 2>/dev/null || true
            echo ""
            echo "=== ✗ Deployment FAILED ==="
            echo ""
            echo "Build logs above show the error."
            echo "Common fixes:"
            echo "  - undefined: X → check variable/function exists"
            echo "  - cannot find package → check go.mod"
            echo "  - COPY failed → check Dockerfile paths"
            exit 1
            ;;
        "REMOVED")
            kill $LOG_PID 2>/dev/null || true
            echo ""
            echo "Deployment was removed (superseded by newer deploy)"
            exit 0
            ;;
    esac
done

kill $LOG_PID 2>/dev/null || true
echo ""
echo "TIMEOUT: Deployment did not complete in ${MAX_WAIT}s"
exit 1
