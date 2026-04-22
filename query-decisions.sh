#!/bin/bash
# Query script for decisions.json
# Usage examples at bottom of file

DB="decisions.json"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function: Count instances of a design pattern
count_pattern() {
    pattern=$1
    count=$(jq -r --arg pattern "$pattern" \
        '[.decisions[] | select(.design_patterns[] == $pattern)] | length' "$DB")
    echo -e "${GREEN}Pattern '$pattern' appears in $count decisions${NC}"
}

# Function: Why did we choose this pattern (show rationale)
why_pattern() {
    pattern=$1
    echo -e "${BLUE}=== Decisions using pattern: $pattern ===${NC}\n"
    jq -r --arg pattern "$pattern" \
        '.decisions[] | select(.design_patterns[] == $pattern) |
        "[\(.id)] \(.title)\n  Rationale: \(.rationale)\n"' "$DB"
}

# Function: What decisions were made for this user flow
decisions_for_flow() {
    flow=$1
    echo -e "${BLUE}=== Decisions for user flow: $flow ===${NC}\n"
    jq -r --arg flow "$flow" \
        '.decisions[] | select(.user_flows[] == $flow) |
        "[\(.id)] \(.title)\n  Decision: \(.decision)\n  Screens: \(.screens_affected | join(", "))\n"' "$DB"
}

# Function: Show full decision details
show_decision() {
    id=$1
    echo -e "${BLUE}=== Decision Details: $id ===${NC}\n"
    jq -r --arg id "$id" \
        '.decisions[] | select(.id == $id) |
        "Title: \(.title)
Date: \(.date)

Context:
\(.context)

Decision:
\(.decision)

Rationale:
\(.rationale)

Alternatives Considered:
\(.alternatives | map("  - " + .) | join("\n"))

Consequences:
\(.consequences)

Design Patterns: \(.design_patterns | join(", "))
User Flows: \(.user_flows | join(", "))
Tags: \(.tags | join(", "))

Screens Affected:
\(.screens_affected | map("  - " + .) | join("\n"))
"' "$DB"
}

# Function: List all available patterns
list_patterns() {
    echo -e "${BLUE}=== All Design Patterns ===${NC}\n"
    jq -r '[.decisions[].design_patterns[]] | unique | sort | .[]' "$DB"
}

# Function: List all user flows
list_flows() {
    echo -e "${BLUE}=== All User Flows ===${NC}\n"
    jq -r '[.decisions[].user_flows[]] | unique | sort | .[]' "$DB"
}

# Function: Search decisions by keyword
search_keyword() {
    keyword=$1
    echo -e "${BLUE}=== Decisions matching keyword: $keyword ===${NC}\n"
    jq -r --arg keyword "$keyword" \
        '.decisions[] | select(
            (.title | ascii_downcase | contains($keyword | ascii_downcase)) or
            (.context | ascii_downcase | contains($keyword | ascii_downcase)) or
            (.decision | ascii_downcase | contains($keyword | ascii_downcase)) or
            (.rationale | ascii_downcase | contains($keyword | ascii_downcase))
        ) | "[\(.id)] \(.title)"' "$DB"
}

# Function: Show decisions by tag
decisions_by_tag() {
    tag=$1
    echo -e "${BLUE}=== Decisions tagged: $tag ===${NC}\n"
    jq -r --arg tag "$tag" \
        '.decisions[] | select(.tags[] == $tag) |
        "[\(.id)] \(.title)"' "$DB"
}

# Function: Show pattern usage across screens
pattern_coverage() {
    pattern=$1
    echo -e "${BLUE}=== Screens using pattern: $pattern ===${NC}\n"
    jq -r --arg pattern "$pattern" \
        '[.decisions[] | select(.design_patterns[] == $pattern) | .screens_affected[]] |
        unique | sort | .[]' "$DB"
}

# Function: Summary statistics
show_stats() {
    echo -e "${YELLOW}=== Decision Database Statistics ===${NC}\n"

    total=$(jq '.decisions | length' "$DB")
    echo "Total Decisions: $total"

    patterns=$(jq '[.decisions[].design_patterns[]] | unique | length' "$DB")
    echo "Unique Design Patterns: $patterns"

    flows=$(jq '[.decisions[].user_flows[]] | unique | length' "$DB")
    echo "User Flows: $flows"

    screens=$(jq '[.decisions[].screens_affected[]] | unique | length' "$DB")
    echo "Screens Affected: $screens"

    user_requests=$(jq '[.decisions[] | select(.tags[] == "user-request")] | length' "$DB")
    echo "User-Requested Changes: $user_requests"
}

# Main script logic
case "$1" in
    count)
        count_pattern "$2"
        ;;
    why)
        why_pattern "$2"
        ;;
    flow)
        decisions_for_flow "$2"
        ;;
    show)
        show_decision "$2"
        ;;
    patterns)
        list_patterns
        ;;
    flows)
        list_flows
        ;;
    search)
        search_keyword "$2"
        ;;
    tag)
        decisions_by_tag "$2"
        ;;
    coverage)
        pattern_coverage "$2"
        ;;
    stats)
        show_stats
        ;;
    *)
        echo "Decision Database Query Tool"
        echo ""
        echo "Usage: ./query-decisions.sh <command> [argument]"
        echo ""
        echo "Commands:"
        echo "  count <pattern>       - Count instances of a design pattern"
        echo "  why <pattern>         - Show rationale for pattern decisions"
        echo "  flow <flow-name>      - Show decisions for a user flow"
        echo "  show <decision-id>    - Show full details of a decision"
        echo "  patterns              - List all design patterns used"
        echo "  flows                 - List all user flows"
        echo "  search <keyword>      - Search decisions by keyword"
        echo "  tag <tag-name>        - Show decisions with specific tag"
        echo "  coverage <pattern>    - Show which screens use a pattern"
        echo "  stats                 - Show summary statistics"
        echo ""
        echo "Examples:"
        echo "  ./query-decisions.sh count progressive-disclosure"
        echo "  ./query-decisions.sh why progressive-disclosure"
        echo "  ./query-decisions.sh flow swatch-detour"
        echo "  ./query-decisions.sh show DEC-009"
        echo "  ./query-decisions.sh search payment"
        echo "  ./query-decisions.sh tag user-request"
        echo "  ./query-decisions.sh coverage button-hierarchy"
        echo "  ./query-decisions.sh stats"
        ;;
esac
