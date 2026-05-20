---
description: "[Idea Validator] 4-tier competitive analysis — direct, indirect, potential acquirers, adjacent. Steelman each competitor."
argument-hint: "<product space or hypothesis>"
---

# Competitor scan — 4 tiers, steelmanned

Goal: produce `docs/idea/competitors.md` — a competitive landscape that takes every competitor seriously as a winner.

Load:
- `references/devils-advocate-mode.md`
- `templates/competitor-template.md`
- `shared/references/idea-stage-principles.md`

Input is in `$ARGUMENTS` (product space or hypothesis). If empty, read `docs/idea/idea-brief.md`.

## Step 1 — Identify 3–5 competitors per tier

Use `WebSearch` (and `WebFetch` when you need to read a landing page in detail). Build 4 tiers:

- **Tier 1 — Direct competitors.** Same problem, same shape of solution, same ICP. The obvious ones.
- **Tier 2 — Indirect competitors.** Same problem, different solution shape. Spreadsheets, manual services, internal scripts, status-quo behaviour. The status quo is always a competitor and usually the strongest one.
- **Tier 3 — Potential acquirers.** Bigger players that could acquire a player in this space and bundle the capability. Adjacent suites that could buy in.
- **Tier 4 — Adjacent players.** Companies in nearby segments who could pivot into this space cheaply. Whose data, distribution, or platform makes the move trivial?

Aim for 3–5 entries per tier. Fewer is acceptable if you genuinely cannot find more — say so explicitly.

## Step 2 — Steelman each competitor

For every entry, write the **strongest argument that this competitor wins and the user loses**. Not a strawman. Not "they're old and slow". Write the argument a competent VC at that competitor's board meeting would make.

Fields per entry (from `templates/competitor-template.md`):
- Name + URL
- ICP
- Pricing
- Positioning
- **Why they could win this customer instead of us** — the steelman, 3-5 sentences

If a competitor's steelman is weak after honest effort, that itself is signal — note it.

## Step 3 — Demand a defensible differentiator

Close the document with this exact question to the user:

> "What is your defensible differentiator, and why is it actually defensible?"

Capture the answer in the doc under "Our differentiator", including:
- Claimed differentiator
- Why it is defensible (moat, distribution, data, regulation, switching cost)
- **Strongest argument against the differentiator** (devil's advocate on the user's own answer)

If the user cannot articulate a defensible differentiator after this prompt, flag it as a Phase 0 blocker — being undifferentiated against Tier 1 is a likely KILL signal in `kill-or-go`.

## Step 4 — Write the file

Write `docs/idea/competitors.md` from `templates/competitor-template.md`. Then tell the user the next command is `tam-bottomup`.
