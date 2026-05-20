---
description: "[Ship+Grow] Install + verify analytics. Default Plausible (privacy) or PostHog (product-led)."
argument-hint: "[plausible | posthog]"
---

# Analytics Setup

## Steps

1. Pick provider from `$ARGUMENTS` or ask user. Defaults:
   - `plausible` — privacy-first, simple page views + custom events
   - `posthog` — product-led, full event taxonomy + session replay
2. Walk user through:
   - Create account on provider's site
   - Add tracking snippet to root layout (`src/app/layout.tsx` for Next.js App Router)
   - Define top 3 events: `signup_started`, `signup_completed`, `<core_action>_completed`
3. Verify by:
   - Loading the production URL
   - Confirming the first event appears in the provider dashboard
4. Load `templates/metrics-template.md` and write `docs/growth/metrics.md`.
5. Fill the daily snapshot table — agent will be updated each day post-launch.
