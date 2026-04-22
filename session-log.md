# Tailor Onboarding Project - Session Log

## Project Overview
Design and prototype an onboarding flow for an online bespoke dress tailor using Pair Design methodology (Noessel & Anderson).

**Date:** April 2026
**Methodology:** Pair Design (gen/synth collaboration)
**Roles:** Claude as generator (gen), Kathleen as synthesizer (synth)

---

## Pair Design Agreements

### Gen Agreements
- Work one step at a time
- Show work as we go
- Never dump multiple screens
- Ask before major decisions
- Swap roles when needed

### Synth Agreements
- Frame the problem clearly
- Give feedback on each step
- Make decisions when options presented
- Keep us on track

### Shared Agreements
- Progressive disclosure
- User-centered design
- Iterate based on feedback
- Document as we build

### Red Flags (Stop and Ask First)
- Multiple screen dumps
- Major architectural changes
- Skipping user feedback
- Assumptions about requirements

---

## Design Phase

### Scenario A: Event-Driven First-Timer
**User:** Sarah, 32, attorney, first online custom dress order for a gala

**Key Design Decisions:**

1. **Swatch Detour Added**
   - User requested overnight swatch delivery option
   - Pricing tiers: $20 overnight, $15 (2-3 days), $8 (5 days)
   - 5 swatch maximum to manage costs and decision-making

2. **Two Path Structure**
   - **Path 1 (Swatch Detour):** 10 screens with return flow
     - User orders swatches first
     - Returns to complete order with selected fabric
     - Gets 5% discount for ordering swatches
   - **Path 2 (Order Now):** 6 screens straight through
     - Choose fabric immediately
     - Complete order without swatches

3. **Progressive Disclosure**
   - Collect choices before personal information
   - Email captured after initial decisions made
   - Measurements before contact info

4. **Payment Screen Split**
   - Initially designed shipping and payment together
   - User requested: "I think we should have a separate screen for payment methods"
   - Split into separate screens for better focus

5. **Session Persistence**
   - Return flow resumes where user left off
   - Pre-filled with swatch selections
   - Maintains state across visits

---

## Implementation Phase

### Technology Stack
- HTML5
- Tailwind CSS (via CDN)
- Vanilla JavaScript for interactions
- shadcn-inspired component styling
- GitHub + GitHub Pages for hosting

### Files Created (16 HTML files)

#### Path 1: Swatch Detour (10 screens)
1. `index.html` - Entry point, swatch decision
2. `path-1-step-2.html` - Select up to 5 swatches
3. `path-1-step-3.html` - Shipping information
4. `path-1-step-3-payment.html` - Payment for swatches
5. `path-1-step-4.html` - Swatch order confirmation
6. `path-1-return-step-1.html` - Email to resume session
7. `path-1-return-step-2.html` - Choose from received swatches
8. `path-1-return-step-3.html` - Custom measurements
9. `path-1-return-step-4.html` - Payment with 5% discount
10. `path-1-return-step-5.html` - Order confirmation

#### Path 2: Order Now (6 screens)
1. `path-2-step-1.html` - Choose fabric directly
2. `path-2-step-2.html` - Custom measurements
3. `path-2-step-3.html` - Shipping information
4. `path-2-step-4.html` - Payment and order review
5. `path-2-step-5.html` - Order confirmation

#### Root Files
- `/index.html` - Landing page with scenario picker
- `/README.md` - Project documentation
- `/scenario-a-event-driven.md` - Design documentation

### Key Features Implemented

**Interactive Elements:**
- Swatch counter with 5-item limit
- Radio button fabric selection with visual feedback
- Measurements drawer (slides from right)
- Dynamic shipping options dropdown
- Form validation ready structure

**Design Patterns:**
- Three layout types: Standard (max-w-md), Wide (max-w-6xl), Flex-centered
- Consistent navigation throughout
- Placeholder dress image that "updates as you choose"
- Clear action hierarchy (primary/secondary buttons)

---

## Iterations and Fixes

### 1. Button Hierarchy Adjustment
**Issue:** "Continue to Order Now" too prominent on swatch confirmation
**Fix:** Made "Done" primary button, demoted "Continue" to small link

### 2. Payment Screen Separation
**Issue:** Shipping and payment combined
**Fix:** Created `path-1-step-3-payment.html` as separate screen

### 3. Navigation Link Positioning
**Issues encountered:**
- Link initially inside white box
- Link at top of page
- Inconsistent positioning across screens

**Final fix:**
- Positioned at bottom of page
- Outside white bounding box
- Left-aligned to white box edge
- Applied consistently across all 15 screens

### 4. Structural HTML Fixes
**Issue:** Automation script removed script tags in wide layout files
**Files affected:**
- `path-1-step-2.html`
- `path-1-return-step-2.html`
- `path-2-step-1.html`

**Fix:** Restored missing `<script>` opening tags and `</body>` closing tags

---

## Git & GitHub

### Repository Setup
- **Repository:** mary13/tailor-onboarding
- **Visibility:** Public
- **Hosting:** GitHub Pages enabled
- **URL:** https://mary13.github.io/tailor-onboarding/

### Commit History

**Commit 1:** Initial prototype with all 16 screens
**Commit 2:** Added landing page and updated documentation
**Commit 3:** Add consistent back navigation to all prototype screens
- Added "Back to all scenarios" links
- Fixed structural HTML issues
- 15 files modified

All commits include:
```
Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

---

## Design Rationale

### Why Two Paths?
Some users want to see/feel fabric before committing to a $850 purchase. Others are ready to order immediately. Both paths respect user preferences.

### Why Measurements After Fabric?
Fabric choice is lower commitment than providing body measurements. Progressive disclosure builds trust.

### Why 5% Discount for Swatches?
Rewards users who invest in swatches, acknowledges their commitment, and incentivizes order completion.

### Why Email Before Personal Info?
Enables session recovery without requiring full personal details upfront. Lower barrier to entry.

---

## Key Learnings

1. **One Screen at a Time Works**
   - Prevented scope creep
   - Allowed for feedback at each step
   - Made iterations manageable

2. **Layout Patterns Matter**
   - Three distinct layouts emerged naturally
   - Categorizing helped with systematic fixes
   - Consistency improves user experience

3. **Automation Requires Verification**
   - Script removed critical tags
   - Manual verification caught errors
   - Trust but verify approach needed

4. **Documentation Alongside Development**
   - README updated incrementally
   - Design rationale captured in real-time
   - Easier than reconstructing later

---

## Project Structure

```
Tailor/
├── index.html                          # Landing page
├── README.md                           # Project documentation
├── scenario-a-event-driven.md         # Design documentation
├── session-log.md                     # This file
└── Scenario A/
    ├── index.html                     # Swatch decision
    ├── path-1-step-2.html            # Select swatches
    ├── path-1-step-3.html            # Shipping info
    ├── path-1-step-3-payment.html    # Payment for swatches
    ├── path-1-step-4.html            # Swatch confirmation
    ├── path-1-return-step-1.html     # Resume email
    ├── path-1-return-step-2.html     # Choose from swatches
    ├── path-1-return-step-3.html     # Measurements
    ├── path-1-return-step-4.html     # Payment with discount
    ├── path-1-return-step-5.html     # Order confirmation
    ├── path-2-step-1.html            # Choose fabric
    ├── path-2-step-2.html            # Measurements
    ├── path-2-step-3.html            # Shipping info
    ├── path-2-step-4.html            # Payment
    └── path-2-step-5.html            # Order confirmation
```

---

## Deliverables

✅ 16 clickable HTML prototype screens
✅ Comprehensive design documentation
✅ Public GitHub repository
✅ Live GitHub Pages deployment
✅ Session log documenting process

---

## Future Scenarios (Planned)

- **Scenario B:** Repeat Customer
- **Scenario C:** Gift Giver
- **Scenario D:** Corporate/Bulk Order

Each will follow the same Pair Design methodology established in Scenario A.

---

## Notes on Methodology

The Pair Design approach worked exceptionally well for this project:

- **Clear roles** prevented confusion and overlapping work
- **Step-by-step progression** allowed for thoughtful design decisions
- **Regular feedback loops** caught issues early
- **Collaborative decision-making** resulted in better outcomes than either role alone

The "never dump multiple screens" agreement was particularly valuable - it forced us to think through each interaction point and make deliberate choices rather than rushing to completion.

---

*End of Session Log*
