---
description: "[Idea Validator] Synthesize interview notes — split into confirms/challenges columns, flag asymmetry, surface recurring themes."
argument-hint: "<path to interview notes folder, default docs/idea/interviews/>"
---

# Interview synthesis

Goal: produce `docs/idea/interview-synthesis.md` — the qualitative evidence base for the Phase 0 decision gate.

Load:
- `references/devils-advocate-mode.md`
- `shared/references/idea-stage-principles.md`

Notes folder path is in `$ARGUMENTS`. If empty, default to `docs/idea/interviews/`.

## Step 1 — Read all interview notes

Glob `*.md` under the path. If fewer than 5 files exist, **stop** and tell the user: "Phase 0 exit requires ≥ 5 interviews. You have <N>. Run more interviews and come back."

## Step 2 — Two-column synthesis per interview

For each interview, produce a per-interview table:

| Confirms hypothesis | Challenges hypothesis |
|---------------------|----------------------|
| <quote / signal>    | <quote / signal>     |

Pull from the interviewee's own words wherever possible. If only one column has content, that itself is a finding — note it.

## Step 3 — Flag asymmetry

After tabulating all interviews, count the totals.

If the `confirms` column is ≥ 3× the `challenges` column, **stop and ask this exact question verbatim**:

> "Does this asymmetry reflect the data or what you wanted to find?"

Wait for an honest answer. If the user concedes confirmation bias crept into question design or note-taking, recommend re-running 2-3 interviews with a colleague auditing the questions before proceeding.

## Step 4 — Synthesis across interviews

Produce these sections in `docs/idea/interview-synthesis.md`:

1. **Recurring themes** — patterns that appeared in ≥ 3 interviews (confirming or challenging).
2. **Contradictions** — places where interviewees told opposing stories. These are gold; they expose segmentation.
3. **Strongest 2-sided signals** — the single strongest piece of confirming evidence AND the single strongest piece of challenging evidence. Both must be presentable.
4. **Workarounds observed** — what people actually do today. If the workaround is "they live with it", that is a kill signal.
5. **WHO sharpening** — does the data refine the segment definition from `docs/idea/idea-brief.md`? If yes, propose the sharpened WHO.

## Step 5 — Recommendation

End the synthesis with a one-line recommendation: **continue to competitor-scan**, **return to hypothesis-sharpen with revised WHO**, or **abort (problem not real enough)**. The recommendation is advisory — the actual decision happens in `kill-or-go`.
