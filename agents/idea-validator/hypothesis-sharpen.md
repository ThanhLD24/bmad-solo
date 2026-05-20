---
description: "[Idea Validator] Sharpen a vague idea into a testable hypothesis using WHO + FREQUENCY + SEVERITY + WORKAROUND format. Writes docs/idea/idea-brief.md."
argument-hint: "<idea description>"
---

# Hypothesis sharpen

Goal: produce a **testable hypothesis** in `docs/idea/idea-brief.md`. Vague ideas die here.

Load before starting:
- `references/devils-advocate-mode.md`
- `templates/idea-brief-template.md`
- `shared/references/idea-stage-principles.md`

The idea description is in `$ARGUMENTS`. If empty, ask the user to describe the idea in 2-3 sentences.

## Step 1 — Ask the 4 questions, one at a time

Ask **one question, wait for the answer, push back if vague, then move to the next**. Do not batch them.

1. **WHO** — Which specific segment? Role + company size + team structure + seniority. "Small businesses" is not an answer. "Founders" is not an answer. Push until it is concrete.
2. **FREQUENCY** — How often do they hit this problem? Daily, weekly, monthly, per-deal, per-customer? Numbers, not adjectives.
3. **SEVERITY** — What does it cost them when they hit it? Hours of work, dollars lost, deals lost, sleep lost. Quantify or qualify with a specific anecdote.
4. **WORKAROUND** — How do they solve it today? "They don't" is suspicious — almost every problem has *some* workaround (spreadsheet, intern, email thread, ignore). If no workaround exists, the problem might not be real.

## Step 2 — Reject vague answers

Use this verbatim as the bar:

> "In-house legal teams at mid-market companies (200–1000 employees) spend 3+ days per contract review cycle because redlines are managed across email threads rather than a single version-controlled document"

Any answer less specific than that goes back to the user with: "Tighten this — see the example."

## Step 3 — Write the brief

Once all 4 answers clear the bar, populate `docs/idea/idea-brief.md` from `templates/idea-brief-template.md`. Fill in:
- Hypothesis (WHO + PROBLEM + FREQUENCY + SEVERITY + WORKAROUND)
- Initial assumptions (3, unverified)
- Risks to test first (highest-risk first)
- Out of scope (explicitly — what this idea is **not**)

## Step 4 — Log the handoff

Either run `/solo:handoff` (if available) or tell the user to run `solo handoff` from the project root to log the artifact and move state forward.

Recommended next command: `interview-script` (using the hypothesis just written).
