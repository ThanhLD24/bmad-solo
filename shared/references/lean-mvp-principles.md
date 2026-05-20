# Lean MVP Principles for Solo Founders

## MVP = Smallest thing that proves the next hypothesis

Not "smallest viable product". Smallest thing that **answers one open question**.

## Critical-path rule

The MVP must do exactly one user-visible job end-to-end. Everything else is removed.

Test: if you delete a feature and the user can still complete the core job, that feature was not MVP.

## YAGNI — solo edition

- No user roles until 2nd customer asks
- No multi-tenancy until 5th customer
- No admin dashboard until manual SQL becomes painful
- No tests for code you might delete next week (do test the code you ship)
- No abstractions for code that exists in one place

## Ship cadence

- Idea → MVP in ≤ 2 weeks for a solo dev
- If it takes longer, MVP scope is wrong — cut more
- Daily commits to `main`. No long-lived branches.

## Defaults that just work

| Concern | Default | Override when |
|---------|---------|---------------|
| Stack | Next.js + Supabase + Vercel | You have stronger preference / different domain |
| Auth | Supabase Auth | OAuth-only product |
| DB | Supabase Postgres | Need MongoDB / vector DB / etc |
| Payments | Stripe (Checkout) | Crypto / regional / B2B invoicing |
| Email | Resend | Existing infra |
| Analytics | Plausible or PostHog | — |
| Deploy | Vercel | Need long-running jobs (then Fly.io / Railway) |
| Domain | Cloudflare | — |

## When to break MVP discipline

- Real user pays → expand scope to keep them
- Compliance forces a feature (e.g., GDPR delete-account) → add minimum
- Tests prevent shipping → write tests, do not skip
