# Test Strategy: <product name>

**Created:** <YYYY-MM-DD>
**Source:** `docs/prd-lite.md`, `docs/architecture.md`

## Critical user journey (the one journey that must not break)

1. <step>
2. <step>
3. <step>

## Smoke tests (run on every commit)

- [ ] App boots (server starts, no crash)
- [ ] Homepage renders 200
- [ ] Sign-in works
- [ ] <core-action> works end-to-end

## Happy-path E2E (run before ship)

- [ ] Full critical journey passes in browser
- [ ] Mobile responsive at 375px width
- [ ] Accessibility quick check (keyboard nav, alt text)

## Out of scope for this MVP

- Negative-path E2E for edge cases (covered manually)
- Cross-browser matrix (Chromium-only for MVP)
- Load / perf testing

## Tooling

- Unit / smoke: <Vitest | Jest | XCTest | flutter_test>
- E2E: <Playwright | Detox | Cypress | XCUITest>
