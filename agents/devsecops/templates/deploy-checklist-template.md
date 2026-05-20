# Deploy Checklist: <product name>

**Created:** <YYYY-MM-DD>
**Target:** <Vercel | Fly.io | Railway | ...>

## Env Vars (set on host)

| Name | Purpose | Production value source |
|------|---------|------------------------|
| `DATABASE_URL` | Postgres connection | Supabase dashboard |
| `STRIPE_SECRET_KEY` | Payments | Stripe dashboard |
| ... | | |

## Domain

- Root: <example.com>
- DNS: <Cloudflare A → Vercel>
- SSL: auto (Vercel) | manual

## Analytics

- Provider: <Plausible | PostHog>
- Snippet installed in: `<file>`
- Verified firing on: <date>

## Smoke after deploy

- [ ] Homepage 200
- [ ] Sign-in works
- [ ] Core action works
- [ ] Analytics event lands

## Rollback Plan

<one line — e.g., "revert merge commit `abc123` and redeploy" or "Vercel dashboard → previous deployment → promote">

## Sign-off

- DevSecOps gate: PASS — <YYYY-MM-DD>
