---
description: "[Ship+Grow] Walk through launch-day checklist. Writes docs/growth/launch-log.md."
argument-hint: "<surface: ph | hn | x | reddit | linkedin>"
---

# Launch Checklist

## Preconditions

- Required: `docs/deploy-checklist.md` with `DevSecOps gate: PASS`
- Required: live production URL

## Steps

1. Read `shared/references/indie-growth-playbook.md` — surfaces table + pre-launch checklist.
2. Identify the surface from `$ARGUMENTS` (default: ask).
3. Load `templates/launch-log-template.md`.
4. Walk through pre-launch checklist (1 week before):
   - Landing page live, clear value prop
   - Pricing page (or "free during beta")
   - Onboarding tested with 3 strangers
   - Analytics installed and verified
   - Feedback channel live
   - Status page or contact email
   - Press kit / screenshots / 30-sec demo
5. Capture surface-specific prep (e.g., PH hunter, HN title, X thread).
6. Write `docs/growth/launch-log.md` from template.
7. On launch day, update with: time launched, first-hour signups, first-hour comments.
8. After launch goes live, drop the Phase 2 signal so the solo orchestrator detects ship state:
   ```bash
   mkdir -p .bmad-solo/signals && touch .bmad-solo/signals/launched
   ```
9. Log handoff to `ship-growth:feedback-loop` via `solo handoff`.
