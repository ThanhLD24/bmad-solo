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

1. Read all 3 input files + `docs/prd-lite.md` (for activation/D7/D30 targets + false-positive list).
2. Summarise:
   - Signups (cumulative)
   - Activation % (vs target from prd-lite)
   - D7 + D30 retention (vs targets)
   - Paying conversion %
   - Top 3 feedback themes
   - Top churn reason (verbatim quote)
3. Load `templates/decision-template.md`.
4. **Run PMF Litmus** (Playbook-mandated):
   - Sean Ellis test: poll active users with "How would you feel if you could no longer use this product?". PMF threshold = ≥40% "very disappointed". Capture % + sample size.
   - Effort test: classify retention as PULL (users return on their own) vs PUSH (founder must intervene). PUSH = not yet PMF.
   - False-positive check: cross-check current "wins" against false-positive list in `prd-lite.md`. Flag any matches.
5. **Run Pivot Diagnostic** (mandatory before ITERATE — Playbook 3 questions):
   - Segment question — any subset responding differently? Name + evidence.
   - Positioning vs product — is the gap a positioning problem or a product problem?
   - What-would-have-to-be-true — for current product to find PMF, is the required scenario realistic?
   - Diagnostic outcome → ADJUST | ITERATE | PIVOT | KILL.
6. Walk user through:
   - Data summary (above)
   - Rationale (3-5 sentences, first-principles, reference Litmus + Diagnostic outcomes)
   - Decision: ITERATE / KILL / SCALE (SCALE only if Litmus passes + Diagnostic clean)
   - Next step
7. Write `docs/growth/decision.md`.
8. Execute handoff based on decision (log every branch via `solo handoff`):
   - **ADJUST** (Diagnostic = positioning fix) → no PRD change; handoff to `ship-growth:feedback-loop` to iterate on messaging / onboarding
   - **ITERATE** (Diagnostic = product change, same hypothesis) → handoff to `product-owner` for PRD-lite revision; if WHO changes, handoff back to `idea-validator` instead
   - **PIVOT** (Diagnostic = fundamentally wrong) → handoff to `idea-validator:hypothesis-sharpen` with new hypothesis
   - **KILL** → `mv docs/ archive/<product>-<YYYY-MM-DD>/`, write a final post-mortem, log handoff to `archive`
   - **SCALE** → out of scope of bmad-solo v1.0; tell user to consider `bmad-sdlc-agents` for next phase; log handoff to `scale-exit`
