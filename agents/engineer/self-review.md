---
description: "[Engineer] Self-review code before declaring story done. Checks for premature abstraction, untested branches, secrets, TODOs."
argument-hint: "<story path>"
---

# Engineer Self-Review

Read recent diff (`git diff <base>...HEAD`) and the story at `$ARGUMENTS`. Run this checklist.

## Checklist

- [ ] Each AC has at least one test that fails without the production code
- [ ] No `.env`, API key, password, or token in the diff (`git grep` patterns)
- [ ] No new abstraction without ≥2 callers (YAGNI)
- [ ] No `TODO` / `FIXME` left without a tracking story logged
- [ ] `npm audit` (or pnpm/yarn/cargo equivalent) reports no new High+ findings
- [ ] Manual smoke of the happy path passes in dev environment
- [ ] Story file Status field reflects reality (still draft if not actually done)
- [ ] All commits compile and pass tests (no broken intermediate commits)

## Output

- PASS → proceed to mark story done
- FAIL → list failing checks, do NOT mark done; fix first
