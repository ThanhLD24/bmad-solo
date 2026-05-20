---
description: "[DevSecOps] Brainstorm pre-ship security. Surfaces secrets risk, dep risk, deploy unknowns."
argument-hint: "<deploy target or area>"
---

# DevSecOps Brainstorm

## Questions

1. **What secrets exist?** — list every external service (DB, Stripe, email, AI APIs). Confirm each has a value source documented.
2. **Where are they stored?** — host env vars only? Any committed to git? `.env` in `.gitignore`?
3. **Deps audit clean?** — `npm audit` / `pnpm audit` output. Any High+ unfixed?
4. **Rollback present?** — one-line rollback plan in `docs/deploy-checklist.md`?

End with: recommend `pre-ship-scan` next.
