# Design Decisions Database

This directory contains a queryable database of all design decisions made during the Tailor Onboarding project.

## Files

- `decisions.json` - Structured database of all design decisions
- `query-decisions.sh` - Command-line query tool
- `DECISIONS-README.md` - This file

## Quick Start

Make the script executable (if not already):
```bash
chmod +x query-decisions.sh
```

View available commands:
```bash
./query-decisions.sh
```

## Common Queries

### How many instances of a design pattern exist?
```bash
./query-decisions.sh count progressive-disclosure
# Output: Pattern 'progressive-disclosure' appears in 6 decisions
```

### Why did we choose this design pattern?
```bash
./query-decisions.sh why progressive-disclosure
# Shows all decisions using this pattern with full rationale
```

### What decisions were made for a user flow?
```bash
./query-decisions.sh flow swatch-detour
# Shows all 15 decisions that affected the swatch detour flow
```

### Show full details of a specific decision
```bash
./query-decisions.sh show DEC-009
# Displays complete decision record including context, alternatives, consequences
```

### Which screens use a specific pattern?
```bash
./query-decisions.sh coverage button-hierarchy
# Lists all screens where button hierarchy pattern was applied
```

### Search for decisions by keyword
```bash
./query-decisions.sh search payment
# Finds all decisions mentioning "payment"
```

### Show decisions by tag
```bash
./query-decisions.sh tag user-request
# Shows all decisions that came from user feedback
```

## All Commands

| Command | Description | Example |
|---------|-------------|---------|
| `count <pattern>` | Count instances of a design pattern | `count progressive-disclosure` |
| `why <pattern>` | Show rationale for pattern decisions | `why progressive-disclosure` |
| `flow <flow-name>` | Show decisions for a user flow | `flow swatch-detour` |
| `show <decision-id>` | Show full details of a decision | `show DEC-009` |
| `patterns` | List all design patterns used | `patterns` |
| `flows` | List all user flows | `flows` |
| `search <keyword>` | Search decisions by keyword | `search payment` |
| `tag <tag-name>` | Show decisions with specific tag | `tag user-request` |
| `coverage <pattern>` | Show which screens use a pattern | `coverage button-hierarchy` |
| `stats` | Show summary statistics | `stats` |

## Available Design Patterns

To see all design patterns in the database:
```bash
./query-decisions.sh patterns
```

Common patterns include:
- `progressive-disclosure` - Reveal information gradually
- `button-hierarchy` - Primary/secondary action distinction
- `session-persistence` - Maintain state across visits
- `trust-building` - Build user confidence
- `user-choice` - Respect user preferences

## Available User Flows

```bash
./query-decisions.sh flows
```

- `swatch-detour` - 10-screen path for users ordering swatches first
- `order-now` - 6-screen path for direct orders

## Decision Record Structure

Each decision in `decisions.json` contains:

```json
{
  "id": "DEC-XXX",
  "date": "2026-04-22",
  "title": "Short description",
  "context": "Why this decision was needed",
  "decision": "What we decided to do",
  "rationale": "Why we made this choice",
  "alternatives": ["Option 1", "Option 2", "Option 3"],
  "consequences": "Impact and trade-offs",
  "design_patterns": ["pattern-1", "pattern-2"],
  "user_flows": ["flow-1", "flow-2"],
  "screens_affected": ["file1.html", "file2.html"],
  "tags": ["category", "type", "source"]
}
```

## Advanced Queries with jq

For custom queries, use jq directly:

```bash
# Find all decisions affecting a specific screen
jq '.decisions[] | select(.screens_affected[] == "path-1-step-2.html")' decisions.json

# Count decisions by tag
jq '[.decisions[].tags[]] | group_by(.) | map({tag: .[0], count: length})' decisions.json

# Find decisions with multiple alternatives
jq '.decisions[] | select(.alternatives | length > 3)' decisions.json

# Get all unique tags
jq '[.decisions[].tags[]] | unique | sort' decisions.json
```

## Tags Reference

Common tags used in the database:

**Source**
- `user-request` - Decision came from user feedback
- `user-feedback` - Based on user response to prototype

**Category**
- `information-architecture` - Flow and structure decisions
- `interaction-design` - How users interact with interface
- `visual-design` - Visual and layout decisions
- `form-design` - Form input and validation

**Purpose**
- `conversion-optimization` - Improving completion rates
- `trust-building` - Building user confidence
- `ux-optimization` - Improving user experience
- `business-constraint` - Business requirements

## Examples by Use Case

### Understanding Pattern Usage
```bash
# How extensively do we use progressive disclosure?
./query-decisions.sh count progressive-disclosure
./query-decisions.sh coverage progressive-disclosure

# Why is this pattern important to our design?
./query-decisions.sh why progressive-disclosure
```

### Reviewing User Flow
```bash
# What shaped the swatch detour experience?
./query-decisions.sh flow swatch-detour

# Which were user-driven changes?
./query-decisions.sh tag user-request
```

### Preparing for Design Review
```bash
# Get overview
./query-decisions.sh stats

# Review all patterns
./query-decisions.sh patterns

# Deep dive on specific decisions
./query-decisions.sh show DEC-001
./query-decisions.sh show DEC-009
```

### Finding Related Decisions
```bash
# Everything about payment
./query-decisions.sh search payment

# All navigation decisions
./query-decisions.sh search navigation
```

## Maintaining the Database

### Adding New Decisions

When adding decisions to `decisions.json`, follow this checklist:

1. **Assign next sequential ID** (DEC-016, DEC-017, etc.)
2. **Use current date** in YYYY-MM-DD format
3. **Write clear title** (imperative form: "Add feature" not "Adding feature")
4. **Provide context** - Why was this decision needed?
5. **State decision** - What specifically did we decide?
6. **Explain rationale** - Why this choice over alternatives?
7. **List alternatives** - What other options were considered?
8. **Note consequences** - Trade-offs and impacts
9. **Tag patterns** - Which design patterns does this use/create?
10. **List flows** - Which user flows are affected?
11. **List screens** - Which HTML files changed?
12. **Add tags** - Category, source, purpose tags

### Consistency Guidelines

- Use kebab-case for pattern names: `progressive-disclosure`, not `Progressive Disclosure`
- Use consistent flow names: `swatch-detour`, `order-now`
- Include file extensions in screens: `path-1-step-2.html`
- Keep rationale focused on "why" not "what"
- List at least 2-3 alternatives to show deliberation
- Be specific about consequences and trade-offs

## Integration Ideas

This decision database can be integrated with:

- **Design system documentation** - Link patterns to decisions
- **Retrospectives** - Review what worked and what didn't
- **Onboarding** - Help new team members understand rationale
- **A/B test planning** - Revisit alternatives we didn't choose
- **Design audits** - Verify implementation matches decisions

## Future Enhancements

Potential additions to the query system:

- Web interface for browsing decisions
- Timeline view of decisions over time
- Decision dependency graph
- Export to ADR (Architecture Decision Record) format
- Integration with GitHub issues
- Link to commit history
- Visual pattern usage heatmap

---

*Last updated: April 22, 2026*
