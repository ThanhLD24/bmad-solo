---
description: "[Engineer] Implement a story file end-to-end with TDD. Updates story status to done on completion."
argument-hint: "<path to story file>"
---

# Implement Story

## Preconditions

- Required: `$ARGUMENTS` = path to a story file under `docs/stories/`
- Required: `docs/architecture.md` exists

## Steps

1. Read story at `$ARGUMENTS`. Restate AC back to user.
2. If any AC is ambiguous → STOP and ask user to clarify (or invoke `product-owner` to refine).
3. For each AC:
   - Write the failing test
   - Run it, confirm it fails for the right reason
   - Write minimal implementation
   - Run test, confirm green
   - Refactor if obvious improvement, otherwise leave
   - Commit with message `feat(<area>): <AC summary>` or `fix(<area>): ...`
4. After all AC complete:
   - Run full smoke (`pnpm test` or equivalent)
   - Manual run of the happy path
5. Run `self-review` (next command).
6. If self-review passes:
   - Update story file: `Status: done`
   - Append changelog line: `- <YYYY-MM-DD>: implemented (commits <range>)`
   - Commit story update
7. **Session log** — Playbook: persistent context prevents per-session drift. Append a short entry to project root `CLAUDE.md` (under a `## Session Log` section, create if missing):
   ```
   ### <YYYY-MM-DD> — <story slug>
   - Built: <what shipped>
   - Decisions: <any non-obvious choice + 1-line reason>
   - Assumptions introduced: <any assumption a future session must respect>
   ```
   Five minutes per session — cheap insurance against architectural drift compounding across sessions.
8. Recommend next step: another story, or `tester-qe:run-quality-gate` if pre-ship.
