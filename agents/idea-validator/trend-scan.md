---
description: "[Idea Validator] Identify 3 external trends (regulatory / technological / demographic) over 24 months and classify as tailwind or headwind."
argument-hint: "<hypothesis>"
---

# Trend scan

Goal: produce `docs/idea/trends.md` — a sober read of the macro forces acting on this idea over a 24-month horizon.

Load:
- `references/devils-advocate-mode.md`
- `shared/references/idea-stage-principles.md`

Hypothesis is in `$ARGUMENTS`. If empty, read `docs/idea/idea-brief.md`.

## Step 1 — Find 3 trends across 3 categories

Use `WebSearch` (limit to sources from the last ≤ 12 months when possible). Identify at least one trend in each of these categories:

- **Regulatory** — new laws, enforcement actions, standards changes, certification regimes. (GDPR, AI Act, FDA guidance, SOC2 changes, sector-specific compliance.)
- **Technological** — capability shifts that change what is possible or what is cheap. (Model capability, hardware price/performance, infra primitives, protocol adoption.)
- **Demographic / behavioural** — who the customers are or how they work is changing. (Remote work, generational handover, workforce composition, buying-committee shifts.)

For each, capture:
- Trend name (one sentence)
- 2-3 sentences of what is actually happening, with at least one cited source (URL + date)
- Direction over the next 24 months — is it accelerating, plateauing, or reversing?

## Step 2 — Classify tailwind / headwind / neutral

For each trend, state with explicit reasoning:

- **Tailwind** — increases demand for the idea, lowers cost to deliver, removes a friction, or hurts incumbents.
- **Headwind** — reduces demand, raises cost, increases competition, or shields incumbents.
- **Neutral** — present but no directional effect on this specific idea.

A label without reasoning is rejected. "AI is a tailwind because AI" is not analysis.

## Step 3 — Aggregate read

Close with a 3-5 sentence aggregate read: across the trends, is the macro context **with** the idea, **against** the idea, or **mixed**? Mixed is the most honest answer most of the time — say so.

## Step 4 — Write the file

Write `docs/idea/trends.md`. Tell the user the next (and likely final) Phase 0 command is `kill-or-go`.
