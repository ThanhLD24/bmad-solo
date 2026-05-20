---
description: "[Tester/QE] Create docs/test-strategy.md from prd-lite + architecture. Smoke + happy-path only."
argument-hint: ""
---

# Create Test Plan

## Preconditions

- Required: `docs/prd-lite.md`, `docs/architecture.md`

## Steps

1. Read PRD + architecture.
2. Load `templates/test-plan-lite-template.md`.
3. Walk through:
   - Critical user journey — 3-7 steps
   - Smoke tests — boots, homepage 200, sign-in, core action
   - Happy-path E2E — full critical journey end-to-end
   - Accessibility quick checks — keyboard nav, alt text, contrast
   - Out of scope — explicit (negative-path E2E, cross-browser matrix, load testing)
   - Tooling — unit/smoke runner, E2E runner per stack
4. Write `docs/test-strategy.md`.
5. Recommend engineer adds tests as part of `implement-story`; tester-qe owns the final `run-quality-gate`.
