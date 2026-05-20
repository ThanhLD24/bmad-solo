---
description: "[Solution Architect] Create docs/architecture.md from prd-lite + stack defaults."
argument-hint: ""
---

# Create Architecture

## Preconditions

- Required: `docs/prd-lite.md` exists.
- If missing → STOP and redirect to `/solo:product-owner:create-prd-lite`.

## Steps

1. Read `docs/prd-lite.md`.
2. Load `templates/arch-lite-template.md`.
3. Load `shared/references/lean-mvp-principles.md` defaults table.
4. Walk user through one section at a time:
   - **Stack** — accept each default or override (override = trigger `new-adr`)
   - **Components** — list with one-line responsibility each
   - **Data model** — ASCII ERD with entities + key fields + FKs
   - **API surface** — table: method | path | auth | purpose
   - **Deployment** — target, env vars, domain, rollback plan
   - **Out of scope** — explicit deferrals
5. Write `docs/architecture.md` from the template, populated.
6. Log handoff via `solo handoff` to `engineer` (or `ux-designer` if UI-heavy).
