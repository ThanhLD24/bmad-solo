---
description: "[Solution Architect] Brainstorm architecture before writing docs/architecture.md. Surfaces stack-fit and integration risks."
argument-hint: "<area to explore: stack | data | api | deploy>"
---

# Solution Architect Brainstorm

Cross-reference `shared/references/lean-mvp-principles.md` defaults table.

If `$ARGUMENTS` specifies an area, focus there. Otherwise run the full loop.

## Stack fit

1. Does the default Next.js + Supabase + Vercel stack fit the PRD?
2. What in the PRD pushes you off defaults? Be specific.
3. If off-defaults, what's the cost to learn / operate that piece?

## Data shape

1. List the top 5 entities.
2. Which entity owns the user_id foreign key?
3. Any blob / file storage need?

## API surface

1. List the endpoints needed for MVP critical path.
2. Server-only or also need client-side reactive queries?
3. Realtime requirement (subscriptions / websockets)?

## Deployment

1. Vercel functions cover all server work, or need long-running jobs?
2. What env vars are needed in production?
3. Rollback plan in one sentence.

End with recommendation: ready for `create-arch` or needs more research.
