---
description: "[Product Owner] Create a new user story under docs/stories/ from the shared story template."
argument-hint: "<story title>"
---

# New Story

## Steps

1. Slugify `$ARGUMENTS` to kebab-case (e.g., "Add Stripe Checkout" → `add-stripe-checkout`).
2. Load `shared/templates/story-template.md`.
3. Ask user one-at-a-time:
   - Epic (or "standalone")
   - User-facing description (who wants to do what, so that why)
   - Acceptance criteria (≥2 Given-When-Then)
   - Out of scope
   - Files touched (best estimate)
   - New dependencies (or "none")
   - Migration needed (yes/no)
4. Write to `docs/stories/<slug>.md`.
5. Print path so user can hand to `engineer:implement-story`.
