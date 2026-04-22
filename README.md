# Bespoke Dress Tailor - Onboarding Flow Design

An exploration of onboarding flows for an online bespoke dress shop, designed using Pair Design methodology.

## About This Project

This project applies **Pair Design** principles from Noessel & Anderson, where design decisions emerge through collaborative gen/synth iteration rather than upfront deliverables.

### Design Approach

- **Gen (Generator):** Proposes options, explores possibilities, generates alternatives
- **Synth (Synthesizer):** Evaluates, refines, decides direction
- **One step at a time:** No multi-screen dumps—every decision built and validated together
- **Reuse > reinvent:** Establish patterns, then apply consistently

## What's Included

### Scenario A: Event-Driven First-Timer
Sarah needs a custom dress for a gala in 10 weeks. She's browsing the catalog and ready to order.

**Key tension:** Urgency (deadline) vs. Confidence (measurements, fabric choice)

**Two paths designed:**

1. **Path 1: Swatch Detour + Return** (10 screens)
   - Request fabric swatches first
   - Receive swatches overnight/2-3 days/5 days
   - Return to complete order
   - 5% discount for ordering swatches

2. **Path 2: Order Now** (6 screens)
   - Skip swatches, order immediately
   - Choose fabric from images/descriptions
   - Full price, faster checkout

## Files & Structure

```
Tailor/
├── index.html                          # Landing page - START HERE
├── README.md                           # This file
├── scenario-a-event-driven.md          # Full design documentation
├── session-log.md                      # Session log with project history
├── decisions.json                      # Queryable design decisions database
├── query-decisions.sh                  # Query tool for decisions
├── DECISIONS-README.md                 # Decision database documentation
├── Scenario A/                         # Scenario A prototype
│   ├── index.html                      # Scenario A entry point
│   ├── path-1-step-2.html             # Swatch selection
│   ├── path-1-step-3.html             # Shipping info
│   ├── path-1-step-3-payment.html     # Payment for swatches
│   ├── path-1-step-4.html             # Swatch confirmation
│   ├── path-1-return-step-1.html      # Welcome back
│   ├── path-1-return-step-2.html      # Fabric from swatches
│   ├── path-1-return-step-3.html      # Measurements
│   ├── path-1-return-step-4.html      # Payment (5% off)
│   ├── path-1-return-step-5.html      # Final confirmation
│   ├── path-2-step-1.html             # Fabric selection (all)
│   ├── path-2-step-2.html             # Measurements
│   ├── path-2-step-3.html             # Contact/shipping
│   ├── path-2-step-4.html             # Payment (full price)
│   └── path-2-step-5.html             # Final confirmation
├── Scenario B/                         # Coming soon
├── Scenario C/                         # Coming soon
└── Scenario D/                         # Coming soon
```

## How to Use

### Local Viewing

1. **Start at the landing page:**
   - Open `index.html` in a web browser
   - Browse all scenarios (A is complete, B/C/D coming soon)
   - Click into Scenario A to explore the prototype

2. **Explore Scenario A:**
   - Two complete paths: Swatch detour (10 screens) or Order now (6 screens)
   - Click through the interactive prototype

3. **Read the design rationale:**
   - See `scenario-a-event-driven.md` for:
     - See-think-do scenarios
     - Wireframes with rationale
     - Reusable patterns
     - Design decisions

4. **Query design decisions:**
   - Run `./query-decisions.sh` to explore 15 documented design decisions
   - Examples:
     - `./query-decisions.sh count progressive-disclosure`
     - `./query-decisions.sh why progressive-disclosure`
     - `./query-decisions.sh flow swatch-detour`
   - See `DECISIONS-README.md` for full documentation

### GitHub Pages (Live Demo)

Visit the live prototype at:
**https://mary13.github.io/tailor-onboarding/**

No download required - explore the prototype directly in your browser.

## Technical Details

- **Framework:** Static HTML + Tailwind CSS (CDN)
- **Component style:** shadcn-inspired components
- **Interactive features:**
  - Dynamic swatch counter (enforces 5-limit)
  - Sliding measurements drawer
  - Responsive two-column layouts
  - Form validation

## Key Design Patterns Established

1. **Dress Preview:** Updates as user selects fabric options
2. **Measurements Form:** Consistent 6-field form with help link
3. **Edit Links:** Individual edit links for each order section
4. **Measurements Drawer:** Slides from right with overlay
5. **Save for Later:** Preserves session at payment step
6. **Confirmation Flow:** Success icon, timeline, support contact

## Design Decision Database

This project includes a queryable database of all design decisions made during development.

**15 decisions documented** covering:
- Progressive disclosure strategy
- Two-path flow structure
- Payment screen separation
- Session persistence
- Button hierarchy
- Navigation positioning
- And more...

Each decision includes context, rationale, alternatives considered, consequences, design patterns used, and affected screens.

**Query the database:**
```bash
./query-decisions.sh count progressive-disclosure    # Count pattern usage
./query-decisions.sh why progressive-disclosure      # Show rationale
./query-decisions.sh flow swatch-detour             # Decisions by flow
./query-decisions.sh search payment                  # Keyword search
./query-decisions.sh stats                          # Summary statistics
```

See `DECISIONS-README.md` for complete documentation.

## Session Log

`session-log.md` contains a comprehensive record of the project development process, including:
- Pair Design methodology and agreements
- All design decisions and iterations
- Implementation details
- Fixes and refinements
- Git workflow

## Next Steps

Additional scenarios to explore:
- **Scenario C:** Measurement-anxious first-timer
- **Scenario B:** Exploratory customer (browsing, not buying)
- **Scenario D:** Returning customer

## Design Principles Applied

- **Progressive disclosure:** Collect choices before personal info
- **Show before tell:** Dress preview materializes decisions
- **Reduce perceived effort:** Show what's saved vs. still needed
- **Build confidence:** Measurement guides, realistic timelines
- **Consistency:** Reuse patterns across paths
- **Flexibility:** Edit options, save for later, delivery speeds

---

**Methodology:** Pair Design (Noessel & Anderson)
**Designed:** April 2026
**Status:** Scenario A complete, ready for user testing
