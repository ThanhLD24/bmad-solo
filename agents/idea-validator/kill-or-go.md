---
description: "[Idea Validator] Final Phase 0 gate — verifies ≥5 interviews, 4-tier competitor scan, bottom-up TAM, and writes explicit GO / KILL / PIVOT decision."
argument-hint: ""
---

# Kill or Go — Phase 0 decision gate

Goal: the single decision that ends Phase 0. Writes `docs/idea/decision-go.md` and, on GO, the signal file that unlocks Phase 1.

Load:
- `references/devils-advocate-mode.md`
- `references/anti-patterns.md`
- `templates/decision-go-template.md`
- `shared/references/idea-stage-principles.md`
- `shared/BMAD-SOLO-CONTEXT.md` (Gate 1 definition)

Ignore `$ARGUMENTS` — this command takes none.

## Step 1 — Verify artifacts exist

Check all of these:

- `docs/idea/idea-brief.md`
- `docs/idea/interviews/` containing **≥ 5** `*.md` files
- `docs/idea/interview-synthesis.md`
- `docs/idea/competitors.md`
- `docs/idea/tam-som.md`
- `docs/idea/trends.md`

If any are missing, **list every missing artifact** and the command that produces it, then refuse to write a decision. No half-decisions.

### Step 1b — Validate hypothesis format

Open `docs/idea/idea-brief.md` and confirm all 4 fields are populated and non-trivial:

- `WHO:` — specific segment (not "users", "people", "businesses")
- `FREQUENCY:` — quantified (per day / week / month) or explicit "rarely"
- `SEVERITY:` — concrete cost (time, money, lost opportunity)
- `WORKAROUND:` — what the WHO does today (named tool / hack / spreadsheet / nothing)

Quick check:
```bash
grep -E "^(WHO|FREQUENCY|SEVERITY|WORKAROUND):" docs/idea/idea-brief.md
```

If any field is missing, empty, or vague (one word, generic noun) → refuse to write a decision. Redirect to `hypothesis-sharpen`.

## Step 2 — Summarise evidence, CHALLENGES first

Once all artifacts are present, present a summary in this order (this order matters — see `references/devils-advocate-mode.md`):

1. **Challenging the hypothesis (presented first)**
   - Strongest disconfirming signals from `interview-synthesis.md`
   - Strongest steelmanned competitor from `competitors.md`
   - Headwind trends from `trends.md`
   - Fragility from the TAM halving stress test
2. **Supporting the hypothesis**
   - Strongest confirming signals from `interview-synthesis.md`
   - Real, costly, frequent workarounds observed
   - Tailwind trends
   - Defensible differentiator (if any)

Be honest. Do not adjust the weight to match what the user clearly wants.

## Step 3 — Walk the user through the decision

Load `templates/decision-go-template.md`. With the evidence in front of both of you, ask:

> "Given this evidence — challenges first — what is the call: **GO**, **KILL**, or **PIVOT**?"

Then push for reasoning. The 3-5 sentence rationale matters more than the label. Capture:

- **Decision** — GO / KILL / PIVOT
- **Rationale** — 3-5 sentences. Why this and not the others.
- **Next step** —
  - GO → which Phase 1 agent and what input file
  - KILL → what was learned (so it isn't relearned), archive location
  - PIVOT → new hypothesis (reuse `templates/idea-brief-template.md`), loop back to `hypothesis-sharpen`

## Step 4 — Write the file

Write `docs/idea/decision-go.md` from `templates/decision-go-template.md`. The user signs (name + date) at the bottom — this is a commitment.

## Step 5 — On GO only: drop the signal file

If and only if the decision is **GO**, run:

```bash
mkdir -p .bmad-solo/signals && touch .bmad-solo/signals/idea-validated
```

This signal is the gate Phase 1 agents check. Without it they will refuse to start.

On **KILL** — archive the `docs/idea/` directory under `docs/archive/<date>-<title>/` and stop. Do not write the signal.

On **PIVOT** — do not write the signal. Tell the user to start a fresh `hypothesis-sharpen` cycle with the new hypothesis.

## Step 6 — Log handoff

On GO, log the handoff to `product-owner` via `solo handoff` (or `/solo:handoff`). The next command for the user is `product-owner:create-prd-lite`, with `docs/idea/idea-brief.md` + `docs/idea/decision-go.md` as inputs.
