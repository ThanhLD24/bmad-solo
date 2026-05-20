---
description: "[UX Designer] Create ASCII wireframes under docs/ux/wireframes/."
argument-hint: "<screen name>"
---

# Create Wireframe

## Steps

1. Slugify `$ARGUMENTS` (e.g., "Sign Up" → `sign-up`).
2. Load `templates/wireframe-template.md`.
3. Walk user through:
   - Layout — ASCII boxes (header, hero, body, footer)
   - Components used (button, input, card, etc.)
   - Interactions — click [CTA] → route or modal
   - Accessibility notes — focus order, keyboard support, contrast ratio target
4. Write to `docs/ux/wireframes/<slug>.md`.
