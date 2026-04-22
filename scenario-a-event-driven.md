# Bespoke Dress Tailor - Onboarding Flow Design

## Scenario A: Event-Driven First-Timer

### Context
Sarah has a gala in 10 weeks. She's been browsing the dress catalog, found styles she loves. Now she's ready to order but needs to onboard.

### See-Think-Do

**SEE:** Clicks "Order this style" → enters onboarding

**THINK:**
- "Should I request swatches first, or just order?"
- "If I request swatches, will I still have time for my event?"
- "I've never taken my own measurements - what if I get it wrong?"
- "How much is this going to cost?"

**DO:** Chooses between two paths:
- Path 1: Swatch detour (request swatches, receive them, return to order)
- Path 2: Order now (skip swatches, order immediately)

### Key Tensions
- Urgency (event deadline) vs. Anxiety (getting measurements right)
- Excitement (custom dress!) vs. Vulnerability (sharing body measurements online)
- Wants speed vs. Needs confidence

---

## Path 1: Swatch Detour + Return Flow

**File:** `index.html`

### Step 1: Swatch Decision

```
┌─────────────────────────────────────┐
│   [Grey dress image placeholder]   │
│                                     │
│   Ready to order your custom dress? │
│                                     │
│   [Button: Order now]               │
│   I'm ready with my measurements    │
│                                     │
│   [Button: Send me swatches first]  │
│   Overnight delivery                │
│                                     │
└─────────────────────────────────────┘
```

**Rationale:**
- Dress image placeholder provides visual context
- Forces choice upfront before collecting info
- Shows delivery speed to reduce friction on swatch path
- Reassures confident customers with "I'm ready"

---

**File:** `path-1-step-2.html`

### Step 2: Swatch Selection (with dress preview)

```
┌───────────────────────────────────────────────────────┐
│ Select up to 5 swatches                               │
│ We'll send them overnight                             │
│                                                       │
│ ┌─────────────────┐  Silk charmeuse                  │
│ │                 │  ☐ [navy] ☐ [blush] ☐ [emerald]  │
│ │   Dress image   │    ☐ [black]                      │
│ │   in selected   │                                   │
│ │     fabric      │  Silk crepe                       │
│ │                 │  ☐ [ivory] ☐ [burgundy] ☐ [slate]│
│ │   (updates      │    ☐ [champagne]                  │
│ │   as you        │                                   │
│ │   hover/click)  │  Cotton sateen                    │
│ │                 │  ☐ [white] ☐ [coral] ☐ [sage]    │
│ │                 │    ☐ [navy stripe]                │
│ └─────────────────┘                                   │
│                     Linen blend                       │
│                     ☐ [natural] ☐ [terracotta]       │
│                       ☐ [denim] ☐ [charcoal]         │
│                                                       │
│                     Wool crepe                        │
│                     ☐ [camel] ☐ [forest] ☐ [plum]    │
│                       ☐ [gray]                        │
│                                                       │
│ 0/5 selected                                          │
│                                                       │
│ [Button: Continue]                                    │
│ [Link: Cancel]                                        │
└───────────────────────────────────────────────────────┘
```

**Rationale:**
- Dress preview helps visualize each fabric option
- 4 color/pattern options per fabric type
- Checkboxes allow selecting up to 5 swatches
- Counter shows selection progress
- JavaScript enforces 5-swatch limit (disables remaining when 5 selected)
- Cancel button allows exit back to decision screen

---

**File:** `path-1-step-3.html`

### Step 3: Email + Shipping + Delivery Speed

```
┌─────────────────────────────────────┐
│ Where should we send your swatches? │
│                                     │
│ Email                               │
│ [                                 ] │
│ For order updates                   │
│                                     │
│ Full name                           │
│ [                                 ] │
│                                     │
│ Street address                      │
│ [                                 ] │
│ Apt/Suite (optional)                │
│ [                                 ] │
│                                     │
│ City                                │
│ [                                 ] │
│                                     │
│ State        ZIP                    │
│ [          ] [                    ] │
│                                     │
│ Delivery speed                      │
│ [ Overnight - $20            ▼]     │
│   2-3 days - $15                    │
│   5 days - $8                       │
│                                     │
│ [Button: Continue to payment]       │
│ [Link: Back]                        │
│                                     │
└─────────────────────────────────────┘
```

**Rationale:**
- Collect minimum info needed to ship swatches
- Delivery speed options balance cost vs. urgency
- Session is saved for return
- Payment separated to its own screen for clarity

---

**File:** `path-1-step-3-payment.html`

### Step 3a: Payment for Swatches

```
┌─────────────────────────────────────┐
│ Payment                             │
│                                     │
│ Order summary                       │
│ ─────────────────────────────────   │
│ 5 fabric swatches                   │
│ Delivery: Overnight                 │
│ Total: $20                          │
│                                     │
│ ✓ Get 5% off your dress when you   │
│   order                             │
│                                     │
│ Card number                         │
│ [                                 ] │
│                                     │
│ Expiry date    CVC                  │
│ [          ]   [                  ] │
│                                     │
│ Billing ZIP code                    │
│ [                                 ] │
│                                     │
│ [Button: Send my swatches - $20]    │
│ [Link: Back]                        │
│                                     │
└─────────────────────────────────────┘
```

**Rationale:**
- Separate payment screen reduces cognitive load
- Order summary shows what they're paying for
- 5% discount incentivizes completing the dress order later
- Button shows final price clearly

---

**File:** `path-1-step-4.html`

### Step 4: Swatch Order Confirmation

```
┌─────────────────────────────────────┐
│ ✓ Your swatches are on the way      │
│                                     │
│ Arriving: Thursday, May 2           │
│ (2-3 day delivery)                  │
│                                     │
│ We're sending 5 swatches to:        │
│ Sarah Chen                          │
│ 847 Pine St, Apt 3B                 │
│ Portland, OR 97214                  │
│                                     │
│ ──────────────────────────────────  │
│                                     │
│ What's next?                        │
│                                     │
│ When your swatches arrive, we'll    │
│ email you at sarah@email.com with   │
│ a link to complete your dress order.│
│                                     │
│ We've saved your info - you'll just │
│ need measurements and fabric choice.│
│                                     │
│ [Button: Done]                      │
│                                     │
│ Changed your mind?                  │
│ [Link: Continue to order now]       │
│                                     │
└─────────────────────────────────────┘
```

**Rationale:**
- Shows specific delivery date
- Confirms address (error catching)
- Sets expectations for return flow
- "Done" is primary action (she just paid for swatches)
- "Continue to order now" demoted to small link for those who change their mind

---

**File:** `path-1-return-step-1.html`

### Step 5 (Return): Welcome Back

*User clicks email link after swatches arrive*

```
┌─────────────────────────────────────┐
│ Welcome back, Sarah                 │
│                                     │
│ Ready to complete your dress order? │
│                                     │
│ We have on file:                    │
│ • Your shipping address             │
│ • 5 fabric swatches you requested   │
│                                     │
│ You'll need to:                     │
│ • Choose your fabric                │
│ • Provide measurements              │
│ • Complete payment                  │
│                                     │
│ This will take about 5 minutes.     │
│                                     │
│ [Button: Let's go]                  │
│                                     │
│ [Link: Not ready yet]               │
│                                     │
└─────────────────────────────────────┘
```

**Rationale:**
- Personalized greeting
- Shows what we already have (reduces perceived effort)
- Shows what's still needed (sets expectations)
- Time estimate builds confidence

---

**File:** `path-1-return-step-2.html`

### Step 6 (Return): Fabric Selection from Swatches

```
┌───────────────────────────────────────────────────────┐
│ Which fabric would you like for your dress?           │
│                                                       │
│ ┌─────────────────┐  Your swatches:                  │
│ │                 │                                   │
│ │                 │  ○ Silk charmeuse, navy           │
│ │   Dress image   │                                   │
│ │   in selected   │  ○ Silk crepe, burgundy           │
│ │     fabric      │                                   │
│ │                 │  ○ Cotton sateen, white            │
│ │   (updates      │                                   │
│ │   as you        │  ○ Linen blend, natural           │
│ │   choose)       │                                   │
│ │                 │  ○ Wool crepe, camel              │
│ │                 │                                   │
│ └─────────────────┘                                   │
│                                                       │
│ [Button: Continue]                                    │
│                                                       │
└───────────────────────────────────────────────────────┘
```

**Rationale:**
- Limited to the 5 swatches she received
- Radio buttons (choose ONE)
- Dress preview maintains consistency
- Simpler than full fabric selection

---

**File:** `path-1-return-step-3.html`

### Step 7 (Return): Measurements

```
┌─────────────────────────────────────────────┐
│ Your measurements                           │
│                                             │
│ We'll use these to create your perfect fit  │
│                                             │
│ [Link: How to measure yourself]             │
│                                             │
│ Bust                                        │
│ [        ] inches                           │
│ Measure around the fullest part             │
│                                             │
│ Waist                                       │
│ [        ] inches                           │
│ Measure around natural waistline            │
│                                             │
│ Hips                                        │
│ [        ] inches                           │
│ Measure around the fullest part             │
│                                             │
│ Shoulder width                              │
│ [        ] inches                           │
│ Measure across back, shoulder to shoulder   │
│                                             │
│ Arm length                                  │
│ [        ] inches                           │
│ Measure from shoulder to wrist              │
│                                             │
│ Dress length                                │
│ [        ] inches                           │
│ Measure from shoulder to desired hem        │
│                                             │
│ [Button: Continue]                          │
│                                             │
└─────────────────────────────────────────────┘
```

**Note:** Arm length field only shows for dress styles with sleeves.

**Rationale:**
- Brief instructions under each field
- "How to measure yourself" link for detailed guidance
- Reassurance messaging ("perfect fit")

---

**File:** `path-1-return-step-4.html`

### Step 8 (Return): Payment with 5% Discount

```
┌─────────────────────────────────────┐
│ Complete your order                 │
│                                     │
│ Order summary                       │
│ ────────────────────────────────    │
│ Dress style: [Style name]           │
│                                     │
│ Fabric: Silk charmeuse, navy        │
│ [Link: Edit]                        │
│                                     │
│ Custom measurements                 │
│ [Link: View] [Link: Edit]           │
│                                     │
│ Shipping to: Sarah Chen             │
│ 847 Pine St, Apt 3B...              │
│ sarah@email.com                     │
│ [Link: Edit]                        │
│                                     │
│ Estimated delivery: 4-6 weeks       │
│                                     │
│ Subtotal          $850              │
│ Swatch discount   -$42.50 (5%)      │
│ ────────────────────────────────    │
│ Total             $807.50           │
│                                     │
│ Payment method                      │
│ [                                 ] │
│                                     │
│ [Button: Place order - $807.50]     │
│                                     │
│ [Link: Save and finish later]       │
│                                     │
└─────────────────────────────────────┘
```

**Key features:**
- Shipping info shown (not collected) - pulled from swatch order
- 5% discount applied as promised
- "View" measurements opens flyout drawer from right
- Individual edit links for each section
- "Save and finish later" preserves session

**Measurements drawer (slides from right):**
```
                              ┌─────────────────────┐
                              │ Your measurements  ×│
                              │                     │
                              │ Bust: 36 inches     │
                              │ Waist: 28 inches    │
                              │ Hips: 38 inches     │
                              │ Shoulder: 15 inches │
                              │ Arm length: 23 in   │
                              │ Dress length: 42 in │
                              │                     │
                              │ [Button: Edit]      │
                              └─────────────────────┘
```

---

**File:** `path-1-return-step-5.html`

### Step 9 (Return): Order Confirmation

```
┌─────────────────────────────────────┐
│ ✓ Your dress is confirmed           │
│                                     │
│ Order #BD-47291                     │
│                                     │
│ We'll send updates to:              │
│ sarah@email.com                     │
│                                     │
│ ──────────────────────────────────  │
│                                     │
│ What happens next?                  │
│                                     │
│ Week 1-2: We'll create your dress   │
│ Week 3: Quality check & finishing   │
│ Week 4: Ships to you                │
│                                     │
│ Estimated delivery: June 15, 2026   │
│                                     │
│ ──────────────────────────────────  │
│                                     │
│ Your order                          │
│ Silk charmeuse, navy                │
│ Custom fit                          │
│ Shipping to: 847 Pine St...         │
│                                     │
│ Questions? Email help@tailor.com    │
│                                     │
│ [Button: Done]                      │
│                                     │
└─────────────────────────────────────┘
```

---

## Path 2: Order Now (Skip Swatches)

### Step 1: Swatch Decision

**File:** `index.html`

*Same as Path 1 - user clicks "Order now" instead*

---

**File:** `path-2-step-1.html`

### Step 2: Fabric Selection (All Options)

```
┌───────────────────────────────────────────────────────┐
│ Choose your fabric                                    │
│                                                       │
│ ┌─────────────────┐  Silk charmeuse                  │
│ │                 │  Luxe drape, subtle sheen         │
│ │                 │  ○ [navy] ○ [blush] ○ [emerald]  │
│ │   Dress image   │    ○ [black]                      │
│ │   in selected   │                                   │
│ │     fabric      │  Silk crepe                       │
│ │                 │  Matte finish, fluid movement     │
│ │   (updates      │  ○ [ivory] ○ [burgundy] ○ [slate]│
│ │   as you        │    ○ [champagne]                  │
│ │   choose)       │                                   │
│ │                 │  Cotton sateen                    │
│ │                 │  Crisp structure, natural feel    │
│ └─────────────────┘  ○ [white] ○ [coral] ○ [sage]    │
│                      ○ [navy stripe]                  │
│                                                       │
│                      Linen blend                      │
│                      Textured, breathable             │
│                      ○ [natural] ○ [terracotta]      │
│                        ○ [denim] ○ [charcoal]        │
│                                                       │
│                      Wool crepe                       │
│                      Year-round weight, holds shape   │
│                      ○ [camel] ○ [forest] ○ [plum]   │
│                        ○ [gray]                       │
│                                                       │
│ [Button: Continue]                                    │
│ [Link: Cancel]                                        │
└───────────────────────────────────────────────────────┘
```

**Rationale:**
- Radio buttons (choose ONE fabric)
- All fabric options available (not limited to swatches)
- Dress preview helps decide without physical swatches
- Short descriptions aid decision-making (Luxe drape, Matte finish, etc.)
- Cancel button allows exit back to decision screen

---

**File:** `path-2-step-2.html`

### Step 3: Measurements

*Same as Path 1 Return Step 7*

---

**File:** `path-2-step-3.html`

### Step 4: Contact Info + Shipping

```
┌─────────────────────────────────────┐
│ Where should we send your dress?    │
│                                     │
│ Email                               │
│ [                                 ] │
│ For order updates                   │
│                                     │
│ Full name                           │
│ [                                 ] │
│                                     │
│ Street address                      │
│ [                                 ] │
│ Apt/Suite (optional)                │
│ [                                 ] │
│                                     │
│ City                                │
│ [                                 ] │
│                                     │
│ State        ZIP                    │
│ [          ] [                    ] │
│                                     │
│ [Button: Continue to payment]       │
│                                     │
└─────────────────────────────────────┘
```

**Rationale:**
- Standard shipping form
- Button signals payment is next
- Email labeled "For order updates"

---

**File:** `path-2-step-4.html`

### Step 5: Payment (Full Price)

```
┌─────────────────────────────────────┐
│ Complete your order                 │
│                                     │
│ Order summary                       │
│ ────────────────────────────────    │
│ Dress style: [Style name]           │
│                                     │
│ Fabric: Silk charmeuse, navy        │
│ [Link: Edit]                        │
│                                     │
│ Custom measurements                 │
│ [Link: View] [Link: Edit]           │
│                                     │
│ Shipping to: Sarah Chen             │
│ 847 Pine St, Apt 3B...              │
│ [Link: Edit]                        │
│                                     │
│ Estimated delivery: 4-6 weeks       │
│                                     │
│ Subtotal          $850              │
│ ────────────────────────────────    │
│ Total             $850              │
│                                     │
│ Payment method                      │
│ [                                 ] │
│                                     │
│ [Button: Place order - $850]        │
│                                     │
│ [Link: Save and finish later]       │
│                                     │
└─────────────────────────────────────┘
```

**Difference from Path 1:**
- No swatch discount (full price $850)
- All other features same (edit links, view measurements, save for later)

---

**File:** `path-2-step-5.html`

### Step 6: Order Confirmation

*Same as Path 1 Return Step 9*

---

## Design Decisions & Rationale

### Reusable Patterns Established

1. **Dress Preview with Fabric Selection**
   - Grey placeholder box for dress image
   - Shows dress style in selected fabric
   - Updates in real-time as user hovers/clicks options
   - Used in both swatch selection and fabric selection
   - Sticky positioning on scroll

2. **Measurements Collection**
   - Same form across all paths
   - Conditional fields (arm length only for sleeved dresses)
   - "How to measure yourself" help link
   - 6 core measurements: bust, waist, hips, shoulder, arm length, dress length
   - Number inputs with 0.25 step for precision
   - Inline "inches" label

3. **Edit Links Pattern**
   - Individual edit links for each section (fabric, measurements, shipping)
   - "View" link for measurements opens flyout drawer from right
   - Drawer includes edit button and overlay backdrop
   - Maintains flow continuity

4. **Save for Later**
   - Available at payment step
   - Preserves session with email link to return
   - Secondary action (link, not button)

5. **Confirmation Screens**
   - Large success checkmark icon
   - Order number
   - Timeline breakdown (builds realistic expectations)
   - Contact info for support
   - Simple "Done" action returns to start

6. **Navigation**
   - Back/Cancel buttons on all screens (except final confirmation)
   - Cancel returns to swatch decision
   - Back returns to previous step in flow
   - Consistent button hierarchy (primary dark, secondary text-only)

### Key Design Principles

- **Progressive disclosure:** Collect choices before personal info
- **Show before tell:** Dress preview materializes decisions
- **Reduce perceived effort:** Show what's saved, what's still needed
- **Build confidence:** Measurement guides, realistic timelines, support contact
- **Consistency:** Reuse patterns across paths
- **Flexibility:** Edit options, save for later, multiple delivery speeds

### Discarded Ideas

*(To be added as we continue with other scenarios)*

---

## Clickable Prototype Files

All HTML files are located in `/Users/kathleenmoynahan/Research/Tailor/Scenario A/`

**To access this scenario:**
- From project root: Open `index.html` (landing page) → Click "Scenario A"
- Direct access: Open `Scenario A/index.html`
- Live demo: https://mary13.github.io/tailor-onboarding/

### Path 1: Swatch Detour + Return (10 screens)
1. `index.html` - Swatch decision
2. `path-1-step-2.html` - Swatch selection (up to 5)
3. `path-1-step-3.html` - Email + shipping + delivery speed
4. `path-1-step-3-payment.html` - Payment for swatches
5. `path-1-step-4.html` - Swatch order confirmation
6. `path-1-return-step-1.html` - Welcome back
7. `path-1-return-step-2.html` - Fabric selection from swatches
8. `path-1-return-step-3.html` - Measurements
9. `path-1-return-step-4.html` - Payment with 5% discount
10. `path-1-return-step-5.html` - Final order confirmation

### Path 2: Order Now (6 screens)
1. `index.html` - Swatch decision
2. `path-2-step-1.html` - Fabric selection (all options)
3. `path-2-step-2.html` - Measurements
4. `path-2-step-3.html` - Contact info + shipping
5. `path-2-step-4.html` - Payment (full price, no discount)
6. `path-2-step-5.html` - Final order confirmation

### Technical Implementation
- **Framework:** Static HTML with Tailwind CSS (via CDN)
- **Component style:** shadcn-inspired components
- **Interactive features:**
  - Dynamic swatch counter with 5-limit enforcement
  - Sliding measurements drawer with overlay
  - Navigation between screens via links
  - Form field validation (HTML5)

---

## Next Scenarios

- Scenario C: Measurement-anxious first-timer
- Scenario B: Exploratory first-timer
- Scenario D: Returning customer
