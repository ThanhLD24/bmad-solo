---
description: "[Product Owner] Brainstorm MVP scope before writing the PRD-lite. Pressure-tests scope against the critical-path rule."
argument-hint: "<feature or scope question>"
---

# Product Owner Brainstorm

Walk user through 5 questions one-at-a-time. Goal = pressure-test MVP scope before writing `docs/prd-lite.md`.

Pass context from `$ARGUMENTS` into question 1 if provided.

## Questions

1. **The one job** — What is the ONE user-visible job this MVP must do end-to-end? State as a single sentence.
2. **The user** — Who is the user? Reference `docs/idea/idea-brief.md` WHO field. Confirm or sharpen.
3. **Success metric** — One metric, one target, one timeframe. Example: "20 paid signups within 30 days of launch."
4. **What can be cut** — List 5 features you might want. Cross out anything that fails the "delete and still works" test.
5. **What cannot be cut** — What is the minimum set such that removing any one breaks the core job?

End with a recommendation: ready for `create-prd-lite`, or needs another sharpening loop.
