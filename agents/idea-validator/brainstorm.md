---
description: "[Idea Validator] Brainstorm a raw idea — applies devil's advocate pressure-testing before committing to validation work."
argument-hint: "<raw idea in one sentence>"
---

# Brainstorm — devil's-advocate pressure test

**Before doing anything else, load `references/devils-advocate-mode.md`.** That file defines the default posture for this command. Also keep `shared/references/idea-stage-principles.md` in mind.

The user's raw idea is in `$ARGUMENTS`. If `$ARGUMENTS` is empty, ask: "Give me the idea in one sentence."

Run this exact script — do not skip steps, do not collapse them into a single block of prose.

## Step 1 — Restate verbatim

Quote the user's idea back to them word-for-word (no rewording, no "improving"). This forces them to see what they actually said.

> "You said: <verbatim>"

## Step 2 — Three disconfirming-evidence directions

List **3 specific places to look for evidence that the idea is wrong**. Specific = a named segment, a named competitor, a named regulatory regime, a named historical attempt. Generic ("look at competitors") is rejected.

For each direction, state:
- What you'd go look for
- What finding would falsify the idea

## Step 3 — Three unstated assumptions

List **3 assumptions the idea silently depends on**. Things the user is treating as given that are actually load-bearing. For each:
- Name the assumption in one sentence
- Why it might not hold

## Step 4 — Smallest test for the riskiest assumption

Pick the single highest-risk assumption from Step 3. Propose the **smallest** test that could disconfirm it within a week — interview, landing page, manual concierge, document analysis, whatever. Prefer tests that produce qualitative signal over quant.

State the test, the success/failure criterion, and the time-box.

## Step 5 — Ask user how to continue

Ask exactly: "Continue to `hypothesis-sharpen`, pivot the idea, or stop?"

Wait for the answer. Do not write any artifact in this command — `brainstorm` is conversation only.
