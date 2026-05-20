---
description: "[Tester/QE] Run Gate 2 quality checks. Writes .bmad-solo/signals/mvp-ready on pass."
argument-hint: ""
---

# Run Quality Gate (Gate 2 — test half)

## Checklist

- [ ] All smoke tests pass — run the project's smoke script (`pnpm test:smoke`, `npm test`, etc.)
- [ ] Happy-path E2E passes — run Playwright / Detox / equivalent against the critical journey
- [ ] No console errors on critical pages — manual or scripted check
- [ ] Manual run of critical journey by founder — confirmed

## Steps

1. Identify the test runner from `docs/architecture.md` Tooling section.
2. Run smoke and E2E suites. Report PASS / FAIL per suite with the actual command output.
3. If any FAIL → STOP. Output what failed, refuse to write the signal, redirect to `engineer` for fix.
4. If all PASS → `touch .bmad-solo/signals/mvp-ready` from the project root.
5. Log handoff to `devsecops` via `solo handoff`.
