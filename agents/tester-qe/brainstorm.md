---
description: "[Tester/QE] Brainstorm test plan — pick critical path, smoke targets, accessibility checks."
argument-hint: "<feature name>"
---

# Tester / QE Brainstorm

## Questions

1. **Critical user journey** — which single journey must not break? List 3-7 steps.
2. **Top 3 things that must not break** — list specific user-visible behaviours (e.g., "checkout completes", "email lands", "login persists").
3. **Accessibility baseline** — WCAG 2.2 AA / AAA / none-required? Default AA. Skip if API-only.

End with: recommend `create-test-plan` and list the test tooling to install if missing (Vitest, Playwright, etc.).
