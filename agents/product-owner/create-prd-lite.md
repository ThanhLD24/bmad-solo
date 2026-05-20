---
description: "[Product Owner] Create docs/prd-lite.md from idea-brief + decision-go. 1-page PRD only."
argument-hint: ""
---

# Create PRD-Lite

## Preconditions

1. Read `.bmad-solo/signals/idea-validated` — must exist.
2. Read `docs/idea/decision-go.md` — must have `Decision: GO`.
3. Read `docs/idea/idea-brief.md` — load WHO + PROBLEM.

If any precondition fails → STOP. Output the missing artifact and redirect user to `/solo:idea-validator:kill-or-go`.

## Steps

1. Load `templates/prd-lite-template.md`.
2. Ask user one question at a time, in this order:
   - **Problem** — confirm/edit the one-sentence problem statement from idea-brief
   - **Solution** — one paragraph, what we are building and why it solves the problem
   - **MVP scope** — ≤5 features, each tagged with why it is critical path
   - **Success metric** — one metric, one target, one timeframe
   - **Out of scope** — explicit list of features deliberately deferred
3. Write `docs/prd-lite.md` from the template, populated.
4. Log handoff to `solution-architect` via `solo handoff`.
5. Tell user to next invoke `/solo:solution-architect:create-arch`.
