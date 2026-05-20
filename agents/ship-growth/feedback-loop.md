---
description: "[Ship+Grow] Triage incoming feedback into bug / feature / churn / praise. Updates docs/growth/feedback.md."
argument-hint: "<paste of new feedback or file path>"
---

# Feedback Loop

## Steps

1. Read `shared/references/indie-growth-playbook.md` Feedback triage table.
2. Read `$ARGUMENTS` — either pasted feedback text or a file path.
3. For each piece of feedback, classify:
   - **Bug** — fix today if blocks core flow, else log
   - **Feature request** — ask "what problem are you solving?" before building
   - **Pricing complaint** — log, do not adjust until 5+ similar
   - **Praise** — save quote for marketing
   - **Churn reason** — most important, interview the user
4. Load `templates/feedback-template.md` if `docs/growth/feedback.md` missing.
5. Append entry to the triage log with date, source, type, note, action.
6. Update active themes section if this is the 3rd+ mention of the same issue.
