---
description: "[Idea Validator] Design an interview script audited against the leading/future-facing/broad/socially-desirable checklist."
argument-hint: "<hypothesis to test>"
---

# Interview script designer

Goal: produce `docs/idea/interview-script.md` — an 8–12 question script that survives a quality audit before the user goes into the field.

Load:
- `references/devils-advocate-mode.md`
- `shared/references/idea-stage-principles.md` (section on past-tense > future-tense discovery)
- `templates/interview-notes-template.md` (so the script aligns with how notes will be captured)

The hypothesis is in `$ARGUMENTS`. If empty, read `docs/idea/idea-brief.md`. If that does not exist, refuse and tell the user to run `hypothesis-sharpen` first.

## Step 1 — Draft 8–12 past-tense questions

Anchor every question in **the last specific time the interviewee experienced the problem**. Examples of the right shape:

- "Tell me about the last time you <did X>. Walk me through what happened."
- "When was the most recent time <problem occurred>? What did you do?"
- "Show me how you currently <workaround>. What did you do last week?"

Avoid future-tense ("would you use…?"), hypothetical ("if there was a tool that…"), and feature-pitch ("how important is <feature>?").

## Step 2 — Audit every question with the 4-box checklist

For each drafted question, tick whether it falls into any of these failure modes:

| Box | Failure mode | Example of failure |
|-----|--------------|--------------------|
| Leading | Telegraphs the desired answer | "Don't you find <X> frustrating?" |
| Future-facing | Asks them to predict their own behaviour | "Would you pay for…?" |
| Too broad | Cannot be answered with a specific story | "Tell me about your workflow" |
| Socially-desirable | Answer protects ego or social standing | "Do you keep up with industry trends?" |

**Pass = zero boxes ticked.** Any question that hits one or more boxes must be rewritten before the script is finalised.

## Step 3 — Rewrite failed questions

For every question that failed the audit, rewrite it into past-tense, specific, story-eliciting form. Re-audit the rewrite.

## Step 4 — Write the script

Write `docs/idea/interview-script.md` with:
- The hypothesis being tested (copied from `docs/idea/idea-brief.md`)
- Recruiting criteria (who counts as a valid interviewee — derived from the WHO line of the hypothesis)
- The final 8–12 audited questions, numbered
- Probes for each question (1–2 follow-up prompts to push for specificity)
- Reminder at top: "Stay in past tense. Shut up and listen. No pitching."

## Step 5 — Next step

Tell the user: run ≥ 5 interviews, capture each in `docs/idea/interviews/<id>.md` using `templates/interview-notes-template.md`. Then return for `interview-synthesize`.
