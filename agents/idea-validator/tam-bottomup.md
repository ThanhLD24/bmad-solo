---
description: "[Idea Validator] Bottom-up TAM/SAM/SOM with sources. Rejects '1% of $X billion' top-down framings."
argument-hint: "<target customer segment>"
---

# TAM bottom-up

Goal: produce `docs/idea/tam-som.md` — a defensible bottom-up market sizing with every number sourced or flagged.

Load:
- `references/devils-advocate-mode.md`
- `references/anti-patterns.md` (the "1% of $X billion" anti-pattern lives there)
- `shared/references/idea-stage-principles.md`

Segment is in `$ARGUMENTS`. If empty, read `docs/idea/idea-brief.md` and lift the WHO line.

## Step 1 — Demand a sharp segment definition

Before computing anything, confirm the segment is defined by all three of:

- **Geography** — country / region / global. "Global" is rarely defensible at Phase 0.
- **Size** — employee count, revenue band, or other capacity proxy. Ranges, not adjectives.
- **Role** — the specific buyer/user inside the customer org.

If any of these are missing or vague, **stop** and demand them. Vague segments produce vapor TAM.

## Step 2 — Build the bottom-up calc

The formula is:

```
TAM = # of accounts in segment × annual contract value × addressable adoption %
```

Walk through it step by step:

1. **# of accounts** — count actual companies/people in the segment. Use govt statistics, industry registries, LinkedIn Sales Navigator counts, Crunchbase filters, public databases. Cite the source for every number.
2. **Price** — what does this segment realistically pay per year? Anchor to comparable products' published pricing or interview signal. Cite or flag.
3. **Adoption %** — what fraction of the segment could realistically buy within 5 years? Be brutal. Most categories cap at 20-30% even at maturity.

Each number ships with:
- A citation (URL or doc reference) **or**
- An explicit `[ESTIMATE]` flag with the reasoning behind the estimate

Compute TAM, SAM (subset you can serve given geography/language/segment focus), SOM (realistic 3-year capture given GTM constraints).

## Step 3 — Reject top-down framings

If at any point the user says "it's a $X billion market, we just need 1%", refuse. Cite `references/anti-patterns.md`. Force the bottom-up path.

## Step 4 — Halving stress test

After the calc, ask:

> "If you halve the primary assumption, does the conclusion change?"

The primary assumption is usually adoption %, sometimes price. Run the halved scenario. If the conclusion (worth building / not worth building) flips, the model is fragile and the user should know.

## Step 5 — Classify market dynamics

Tag the market as one of:

- **Expanding** — new buyers entering, budgets growing, category being created. Tailwind.
- **Consolidating** — fewer, bigger buyers; M&A activity; share concentrating. Neutral-to-headwind.
- **Mature** — flat or shrinking, established incumbents, low switching. Headwind.

State the reasoning, not just the label.

## Step 6 — Write the file

Write `docs/idea/tam-som.md` with sections: Segment definition, TAM / SAM / SOM calc with citations, halving stress test, market classification, conclusion. Tell the user the next command is `trend-scan`.
