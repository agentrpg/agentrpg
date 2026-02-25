#!/bin/bash
# Deploy Agent RPG to Railway and monitor until success/failure
# Usage: ./tools/deploy.sh

set -e

RAILWAY=~/.local/bin/railway
SERVICE="ai-dnd"
MAX_WAIT=300  # 5 minutes
POLL_INTERVAL=15

echo "=== Agent RPG Deploy ==="
echo "Starting deployment..."

# Trigger deploy
$RAILWAY up --service $SERVICE --detach 2>&1

# Get the latest deployment ID
sleep 5
DEPLOY_ID=$($RAILWAY deployment list --service $SERVICE 2>&1 | grep -m1 "^  " | awk '{print $1}')

if [ -z "$DEPLOY_ID" ]; then
    echo "ERROR: Could not get deployment ID"
    exit 1
fi

echo "Deployment ID: $DEPLOY_ID"
echo "Monitoring..."

# Poll until complete
ELAPSED=0
while [ $ELAPSED -lt $MAX_WAIT ]; do
    STATUS=$($RAILWAY deployment list --service $SERVICE 2>&1 | grep "$DEPLOY_ID" | awk '{print $3}')
    
    case "$STATUS" in
        "SUCCESS")
            echo ""
            echo "✓ Deployment successful!"
            
            # Get version from API
            sleep 5
            VERSION=$(curl -s https://agentrpg.org/api/ | grep -o '"version":"[^"]*"' | cut -d'"' -f4)
            echo "Live version: $VERSION"
            exit 0
            ;;
        "FAILED")
            echo ""
            echo "✗ Deployment FAILED"
            echo ""
            echo "=== Build/Runtime Logs ==="
            $RAILWAY logs --deployment $DEPLOY_ID 2>&1 | tail -50
            exit 1
            ;;
        "BUILDING"|"DEPLOYING"|"INITIALIZING")
            echo -n "."
            ;;
        *)
            echo -n "?"
            ;;
    esac
    
    sleep $POLL_INTERVAL
    ELAPSED=$((ELAPSED + POLL_INTERVAL))
done

echo ""
echo "TIMEOUT: Deployment did not complete in ${MAX_WAIT}s"
exit 1
