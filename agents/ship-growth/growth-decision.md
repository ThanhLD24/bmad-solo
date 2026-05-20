---
description: "[Ship+Grow] Day-14 decision: iterate / kill / scale. Writes docs/growth/decision.md."
argument-hint: ""
---

# Growth Decision (Day-14 Gate)

## Preconditions

- Required: `docs/growth/launch-log.md` with launch ≥ 14 days ago
- Required: `docs/growth/metrics.md` with daily snapshots
- Required: `docs/growth/feedback.md` with triage entries

## Steps

1. Read all 3 input files.
2. Summarise:
   - Signups (cumulative)
   - Activation %
   - Paying conversion %
   - Top 3 feedback themes
   - Top churn reason (verbatim quote)
3. Load `templates/decision-template.md`.
4. Walk user through:
   - Data summary (above)
   - Rationale (3-5 sentences, first-principles)
   - Decision: ITERATE / KILL / SCALE
   - Next step
5. Write `docs/growth/decision.md`.
6. Execute handoff based on decision:
   - **ITERATE** → handoff to `product-owner` for PRD-lite revision; new hypothesis goes back to validation if it changes the WHO
   - **KILL** → `mv docs/ archive/<product>-<YYYY-MM-DD>/`, write a final post-mortem
   - **SCALE** → out of scope of bmad-solo v1.0; tell user to consider `bmad-sdlc-agents` for next phase
