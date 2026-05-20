---
description: "[DevSecOps] Final pre-ship checklist. Verifies env vars, domain, analytics, rollback. Writes Gate 2 sign-off."
argument-hint: ""
---

# Deploy Gate (Gate 2)

## Preconditions

- Required: `.bmad-solo/signals/mvp-ready` exists (tester-qe Gate 2 half done)
- Required: `pre-ship-scan` PASS

## Checklist

- [ ] MVP scope matches `prd-lite.md` (no scope creep at ship)
- [ ] Smoke + happy-path E2E pass (verify `mvp-ready` signal)
- [ ] No secrets in repo (`pre-ship-scan` PASS)
- [ ] Dependency audit clean (`pre-ship-scan` PASS)
- [ ] All required env vars listed in `docs/deploy-checklist.md`
- [ ] Domain configured (DNS + SSL)
- [ ] Analytics installed and firing
- [ ] Rollback plan in `docs/deploy-checklist.md`

## Steps

1. Load `templates/deploy-checklist-template.md` if `docs/deploy-checklist.md` missing.
2. Walk user through filling each section.
3. Verify each checkbox above. STOP at first unchecked → output what is missing, refuse sign-off.
4. If all PASS → append sign-off section to `docs/deploy-checklist.md`:
   ```
   ## Sign-off
   - DevSecOps gate: PASS — <YYYY-MM-DD>
   ```
5. Tell user to deploy. After deploy → handoff to `ship-growth:launch-checklist`.
