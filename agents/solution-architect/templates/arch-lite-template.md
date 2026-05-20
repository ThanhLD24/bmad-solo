# Architecture: <product name>

**Created:** <YYYY-MM-DD>
**Source:** `docs/prd-lite.md`

## Stack

| Layer | Choice | Default? | Reason if not default |
|-------|--------|----------|----------------------|
| Frontend | | | |
| Backend | | | |
| Database | | | |
| Auth | | | |
| Payments | | | |
| Email | | | |
| Analytics | | | |
| Hosting | | | |

## Components

- <component name> — <responsibility>

## Data Model (high-level)

```
users (id, email, created_at, ...)
<entity> (id, ..., user_id fk users)
```

## API Surface

| Method | Path | Auth | Purpose |
|--------|------|------|---------|
| POST | /api/<route> | yes/no | |

## Deployment

- Target: <Vercel | Fly.io | Railway | ...>
- Env vars required: <list>
- Domain: <root domain>
- Rollback: <"revert commit + redeploy" or specific steps>

## Out-of-Scope (deferred)

-
-

## Changelog

- <YYYY-MM-DD>: initial draft
