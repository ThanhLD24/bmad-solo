# Day-14 Decision: <product name>

**Date:** <YYYY-MM-DD>
**Decision:** ITERATE | KILL | SCALE

## Data summary

- Signups: <n>
- Activation %: <n> (target: <from prd-lite>)
- D7 retention: <%> (target: <from prd-lite>)
- D30 retention: <%> (target: <from prd-lite>)
- Paying conversion %: <n>
- Top feedback theme: <quote>
- Top churn reason: <quote>

## PMF Litmus (Playbook-mandated)

- **Sean Ellis test:** asked active users "How would you feel if you could no longer use this product?" → <%> answered "very disappointed". PMF threshold = ≥40%.
- **Effort test:** is retention pulling (users return on their own) or pushing (founder must intervene with outreach / incentives / personal follow-up)? → PULL | PUSH
- **False-positive check:** are any "wins" actually on the false-positive list from `prd-lite.md`? → list any that apply

## Pivot Diagnostic (run BEFORE choosing ITERATE)

> Playbook: after 3 iteration cycles without PMF movement, answer these 3 questions honestly.

1. **Segment question** — is any subset of users responding differently from the rest? Often the right audience is already in the data, just underweighted. Identify the segment + evidence.
2. **Positioning vs product** — is the gap between designed value and experienced value a positioning problem (messaging, onboarding, emphasis) or a product problem (the thing itself doesn't do what users need)?
3. **What-would-have-to-be-true** — for the current product to find PMF, what conditions must hold? Is that scenario realistic given what you're seeing?

Answers determine: ADJUST (positioning fix) | ITERATE (product change, same hypothesis) | PIVOT (back to Phase 0 with new hypothesis) | KILL.

## Rationale

<3-5 sentences. Reference Litmus + Diagnostic outcomes.>

## Next step

- ITERATE → new hypothesis (revise `prd-lite.md` via product-owner); if WHO changes, route back to `idea-validator`
- KILL → archive learnings to <path>
- SCALE → Phase 3 (deferred — pricing strategy, paid acquisition, hiring; see `bmad-sdlc-agents`)
