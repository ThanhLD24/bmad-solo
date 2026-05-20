# Stack Defaults for `engineer`

Reference: `shared/references/lean-mvp-principles.md`

## When to use the default vs override

- Override only when an ADR justifies it (see `solution-architect/new-adr.md`)
- Default for new project: Next.js (App Router) + Supabase + Vercel

## Boilerplate commands (cheatsheet)

```bash
# Init Next.js (App Router, TS, Tailwind, ESLint)
pnpm create next-app@latest --typescript --tailwind --eslint --app

# Init Supabase locally
pnpm dlx supabase init

# Install Plausible analytics
pnpm add next-plausible
```

## Where things live in the default stack

- App routes: `src/app/**`
- API routes: `src/app/api/**/route.ts`
- DB migrations: `supabase/migrations/`
- Types: `src/types/`
- Tests: `src/**/*.test.ts` (Vitest)
