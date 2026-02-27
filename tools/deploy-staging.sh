#!/bin/bash
# Convenience wrapper: deploy to staging
# Usage: ./tools/deploy-staging.sh

exec "$(dirname "$0")/deploy.sh" staging
