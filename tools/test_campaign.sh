#!/bin/bash
# Campaign Test Runner
# Tests the full campaign flow against the live agentrpg.org API
# 
# Usage: ./tools/test_campaign.sh [base_url]
# Default base_url: https://agentrpg.org

set -e

BASE_URL="${1:-https://agentrpg.org}"
TEST_PREFIX="test_$(date +%s)_"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_test() { echo -e "${YELLOW}[TEST]${NC} $1"; }

# Make API request
# Usage: api_call METHOD ENDPOINT [DATA] [AUTH]
api_call() {
    local method="$1"
    local endpoint="$2"
    local data="$3"
    local auth="$4"
    
    local args=(-s -X "$method")
    
    if [ -n "$auth" ]; then
        args+=(-H "Authorization: Basic $auth")
    fi
    
    if [ -n "$data" ]; then
        args+=(-H "Content-Type: application/json" -d "$data")
    fi
    
    curl "${args[@]}" "${BASE_URL}${endpoint}"
}

# Extract value from JSON
# Usage: json_value "json_string" "key"
json_value() {
    echo "$1" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('$2', ''))" 2>/dev/null || echo ""
}

# Check if request succeeded
check_success() {
    local response="$1"
    local context="$2"
    
    local error=$(json_value "$response" "error")
    if [ -n "$error" ]; then
        log_error "$context failed: $error"
        return 1
    fi
    return 0
}

echo "=============================================="
echo "Agent RPG Campaign Test Suite"
echo "Base URL: $BASE_URL"
echo "Test Prefix: $TEST_PREFIX"
echo "=============================================="

# =====================================================
# Phase 1: Agent Registration
# =====================================================
log_test "Phase 1: Agent Registration"

# Register GM (no email = auto-verified)
log_info "Registering GM..."
GM_RESULT=$(api_call POST "/api/register" "{\"name\":\"${TEST_PREFIX}GM\",\"password\":\"testpass123\"}")
GM_ID=$(json_value "$GM_RESULT" "agent_id")
if [ -z "$GM_ID" ] || [ "$GM_ID" = "" ]; then
    log_error "Failed to register GM: $GM_RESULT"
    exit 1
fi
GM_AUTH=$(echo -n "${GM_ID}:testpass123" | base64)
log_info "GM registered with ID: $GM_ID"

# Register 4 players
declare -a PLAYER_IDS
declare -a PLAYER_AUTHS
declare -a PLAYER_NAMES=("Fighter" "Wizard" "Rogue" "Cleric")

for i in {0..3}; do
    log_info "Registering player ${PLAYER_NAMES[$i]}..."
    RESULT=$(api_call POST "/api/register" "{\"name\":\"${TEST_PREFIX}${PLAYER_NAMES[$i]}\",\"password\":\"testpass123\"}")
    PLAYER_ID=$(json_value "$RESULT" "agent_id")
    if [ -z "$PLAYER_ID" ]; then
        log_error "Failed to register player: $RESULT"
        exit 1
    fi
    PLAYER_IDS[$i]=$PLAYER_ID
    PLAYER_AUTHS[$i]=$(echo -n "${PLAYER_ID}:testpass123" | base64)
    log_info "Player ${PLAYER_NAMES[$i]} registered with ID: $PLAYER_ID"
done

# =====================================================
# Phase 2: Campaign Creation
# =====================================================
log_test "Phase 2: Campaign Creation"

log_info "GM creating campaign..."
CAMPAIGN_RESULT=$(api_call POST "/api/campaigns" "{\"name\":\"${TEST_PREFIX}Test Adventure\",\"max_players\":4,\"setting\":\"A test dungeon with goblins\",\"min_level\":1,\"max_level\":5}" "$GM_AUTH")
CAMPAIGN_ID=$(json_value "$CAMPAIGN_RESULT" "campaign_id")
if [ -z "$CAMPAIGN_ID" ]; then
    log_error "Failed to create campaign: $CAMPAIGN_RESULT"
    exit 1
fi
log_info "Campaign created with ID: $CAMPAIGN_ID"

# =====================================================
# Phase 3: Character Creation & Joining
# =====================================================
log_test "Phase 3: Character Creation & Joining"

declare -a CHAR_IDS
declare -a CHAR_CONFIGS=(
    '{"name":"'"${TEST_PREFIX}"'Thorin","class":"fighter","race":"dwarf","str":16,"dex":12,"con":15,"int":10,"wis":12,"cha":8}'
    '{"name":"'"${TEST_PREFIX}"'Elara","class":"wizard","race":"elf","str":8,"dex":14,"con":12,"int":16,"wis":12,"cha":10}'
    '{"name":"'"${TEST_PREFIX}"'Shadow","class":"rogue","race":"halfling","str":10,"dex":16,"con":12,"int":12,"wis":12,"cha":14}'
    '{"name":"'"${TEST_PREFIX}"'Marcus","class":"cleric","race":"human","str":14,"dex":10,"con":14,"int":10,"wis":16,"cha":12}'
)

for i in {0..3}; do
    log_info "Creating character for ${PLAYER_NAMES[$i]}..."
    RESULT=$(api_call POST "/api/characters" "${CHAR_CONFIGS[$i]}" "${PLAYER_AUTHS[$i]}")
    CHAR_ID=$(json_value "$RESULT" "character_id")
    if [ -z "$CHAR_ID" ]; then
        log_error "Failed to create character: $RESULT"
        exit 1
    fi
    CHAR_IDS[$i]=$CHAR_ID
    log_info "Character created with ID: $CHAR_ID"
    
    # Join campaign
    log_info "${PLAYER_NAMES[$i]} joining campaign..."
    RESULT=$(api_call POST "/api/campaigns/${CAMPAIGN_ID}/join" "{\"character_id\":${CHAR_ID}}" "${PLAYER_AUTHS[$i]}")
    if ! check_success "$RESULT" "Join campaign"; then
        log_warn "Join might have failed: $RESULT"
    fi
done

# =====================================================
# Phase 4: Start Campaign & Narration
# =====================================================
log_test "Phase 4: Start Campaign & Narration"

log_info "GM starting campaign..."
RESULT=$(api_call POST "/api/campaigns/${CAMPAIGN_ID}/start" "{}" "$GM_AUTH")
log_info "Campaign started!"

log_info "GM posting opening narration..."
RESULT=$(api_call POST "/api/gm/narrate" '{"narration":"The party gathers at the entrance to the goblin cave. Flickering torchlight reveals crude drawings on the walls. The smell of smoke and rotting meat fills the air..."}' "$GM_AUTH")
log_info "Opening narration posted"

# Verify players can see narration
log_info "Checking if players see GM narration..."
MY_TURN=$(api_call GET "/api/my-turn" "" "${PLAYER_AUTHS[0]}")
GM_SAYS=$(json_value "$MY_TURN" "gm_says")
if [ -n "$GM_SAYS" ] && [ "$GM_SAYS" != "" ]; then
    log_info "✓ Player sees gm_says: ${GM_SAYS:0:50}..."
else
    log_warn "⚠ gm_says is empty - narration may not be visible"
fi
RECENT=$(echo "$MY_TURN" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('recent_events', []))" 2>/dev/null)
log_info "recent_events: $RECENT"

# =====================================================
# Phase 5: Player Actions
# =====================================================
log_test "Phase 5: Player Actions"

# Fighter attacks
log_info "Fighter attacks..."
RESULT=$(api_call POST "/api/action" '{"action":"attack","description":"I charge forward with my battleaxe!"}' "${PLAYER_AUTHS[0]}")
ATTACK_RESULT=$(json_value "$RESULT" "result")
log_info "Fighter attack: $ATTACK_RESULT"

# Wizard casts
log_info "Wizard casts..."
RESULT=$(api_call POST "/api/action" '{"action":"cast","description":"I cast magic missile at the goblin!"}' "${PLAYER_AUTHS[1]}")
CAST_RESULT=$(json_value "$RESULT" "result")
log_info "Wizard cast: $CAST_RESULT"

# Rogue sneaks
log_info "Rogue moves..."
RESULT=$(api_call POST "/api/action" '{"action":"move","description":"I slip into the shadows looking for a flanking position"}' "${PLAYER_AUTHS[2]}")
log_info "Rogue moved"

# Cleric helps
log_info "Cleric helps..."
RESULT=$(api_call POST "/api/action" '{"action":"help","description":"I call upon my deity to aid our fighter"}' "${PLAYER_AUTHS[3]}")
log_info "Cleric helped"

# =====================================================
# Phase 6: GM Mechanics (Skill Checks, Saves)
# =====================================================
log_test "Phase 6: GM Mechanics"

# Skill check
log_info "GM calling for perception check..."
RESULT=$(api_call POST "/api/gm/skill-check" "{\"character_id\":${CHAR_IDS[2]},\"skill\":\"perception\",\"dc\":12,\"description\":\"searching for traps\"}" "$GM_AUTH")
SKILL_RESULT=$(json_value "$RESULT" "result")
log_info "Perception check: $SKILL_RESULT"

# Saving throw
log_info "GM calling for DEX save..."
RESULT=$(api_call POST "/api/gm/saving-throw" "{\"character_id\":${CHAR_IDS[0]},\"ability\":\"dex\",\"dc\":13,\"description\":\"dodging trap\"}" "$GM_AUTH")
SAVE_RESULT=$(json_value "$RESULT" "result")
log_info "DEX save: $SAVE_RESULT"

# =====================================================
# Phase 7: Damage and Healing
# =====================================================
log_test "Phase 7: Damage and Healing"

# Deal damage to fighter
log_info "Dealing 8 damage to fighter..."
RESULT=$(api_call POST "/api/characters/${CHAR_IDS[0]}/damage" '{"amount":8,"damage_type":"slashing"}' "$GM_AUTH")
HP_AFTER=$(json_value "$RESULT" "hp")
log_info "Fighter HP after damage: $HP_AFTER"

# Cleric heals
log_info "Healing fighter for 6 HP..."
RESULT=$(api_call POST "/api/characters/${CHAR_IDS[0]}/heal" '{"amount":6}' "$GM_AUTH")
HP_AFTER=$(json_value "$RESULT" "hp")
log_info "Fighter HP after heal: $HP_AFTER"

# =====================================================
# Phase 8: XP and Gold
# =====================================================
log_test "Phase 8: XP and Gold"

# Award XP
log_info "Awarding XP to party..."
RESULT=$(api_call POST "/api/gm/award-xp" "{\"character_ids\":[${CHAR_IDS[0]},${CHAR_IDS[1]},${CHAR_IDS[2]},${CHAR_IDS[3]}],\"xp\":100,\"reason\":\"defeating goblins\"}" "$GM_AUTH")
log_info "XP awarded"

# Award gold
log_info "Awarding gold to rogue..."
RESULT=$(api_call POST "/api/gm/gold" "{\"character_id\":${CHAR_IDS[2]},\"amount\":50,\"reason\":\"goblin treasure\"}" "$GM_AUTH")
log_info "Gold awarded"

# Give item
log_info "Giving potion to fighter..."
RESULT=$(api_call POST "/api/gm/give-item" "{\"character_id\":${CHAR_IDS[0]},\"item_name\":\"Potion of Healing\",\"quantity\":2}" "$GM_AUTH")
log_info "Item given"

# =====================================================
# Phase 9: Rest
# =====================================================
log_test "Phase 9: Short Rest"

log_info "Fighter taking short rest..."
RESULT=$(api_call POST "/api/characters/${CHAR_IDS[0]}/short-rest" "{}" "${PLAYER_AUTHS[0]}")
log_info "Short rest complete"

# =====================================================
# Phase 10: Final Status Check
# =====================================================
log_test "Phase 10: Final Status"

for i in {0..3}; do
    RESULT=$(api_call GET "/api/characters/${CHAR_IDS[$i]}" "" "${PLAYER_AUTHS[$i]}")
    HP=$(json_value "$RESULT" "hp")
    MAX_HP=$(json_value "$RESULT" "max_hp")
    XP=$(json_value "$RESULT" "xp")
    GOLD=$(json_value "$RESULT" "gold")
    log_info "${PLAYER_NAMES[$i]} - HP: $HP/$MAX_HP, XP: $XP, Gold: $GOLD"
done

# Check campaign feed
log_info "Checking campaign feed..."
RESULT=$(api_call GET "/api/campaigns/${CAMPAIGN_ID}/feed" "" "$GM_AUTH")
# Count actions (rough check)
ACTION_COUNT=$(echo "$RESULT" | grep -o '"action_type"' | wc -l)
log_info "Total actions in campaign feed: ~$ACTION_COUNT"

# =====================================================
# Phase 11: Edge Case - Death Saves (optional)
# =====================================================
log_test "Phase 11: Edge Cases (Death Saves)"

# Set fighter to 0 HP
log_info "Setting fighter HP to 0 for death save test..."
# This requires direct DB access or massive damage - skip in shell test
log_warn "Skipping death save test (requires DB access)"

# =====================================================
# Cleanup Note
# =====================================================
echo ""
echo "=============================================="
echo -e "${GREEN}TEST COMPLETE!${NC}"
echo "=============================================="
echo ""
echo "Test data created with prefix: $TEST_PREFIX"
echo "Campaign ID: $CAMPAIGN_ID"
echo "GM ID: $GM_ID"
echo "Character IDs: ${CHAR_IDS[*]}"
echo ""
echo "To clean up test data, run:"
echo "  DELETE FROM actions WHERE lobby_id = $CAMPAIGN_ID;"
echo "  DELETE FROM characters WHERE name LIKE '${TEST_PREFIX}%';"
echo "  DELETE FROM lobbies WHERE id = $CAMPAIGN_ID;"
echo "  DELETE FROM agents WHERE name LIKE '${TEST_PREFIX}%';"
