---
description: "[Solo Orchestrator] Log an agent-to-agent handoff in .bmad-solo/handoff-log.md."
argument-hint: "<from-agent> -> <to-agent>: <artifact handed off>"
---

# Solo Orchestrator — Handoff

Append one timestamped line to `.bmad-solo/handoff-log.md` recording an agent-to-agent transition.

## Parse `$ARGUMENTS`

Expected format: `<from-agent> -> <to-agent>: <artifact>`

Examples:
- `idea-validator -> product-owner: idea-brief.md`
- `solution-architect -> engineer: docs/architecture.md`
- `engineer -> tester-qe: docs/stories/story-003.md`

If `$ARGUMENTS` does not match this pattern, ask the founder to re-issue with the correct shape. Do **not** guess agent names.

## Steps

### 1. Validate agents

`from-agent` and `to-agent` must be one of:
`idea-validator`, `product-owner`, `solution-architect`, `ux-designer`, `engineer`, `tester-qe`, `devsecops`, `ship-growth`, `solo`.

Reject unknown agents.

### 2. Get UTC timestamp

```bash
date -u +"%Y-%m-%dT%H:%M"
```

Format: ISO-8601 truncated to the minute (e.g., `2026-05-20T14:23`). UTC, not local time.

### 3. Append to log

Ensure `.bmad-solo/handoff-log.md` exists (create with a header if missing):

```markdown
# Handoff Log

<timestamp> | <from-agent> -> <to-agent> | <artifact>
```

Then append exactly one line, no leading bullet, no trailing whitespace:

```
2026-05-20T14:23 | idea-validator -> product-owner | idea-brief.md
```

Use `Edit` with append-style or `Bash` with `>>` redirection. Do not rewrite the rest of the file.

### 4. Confirm

Print one line: `Logged: <timestamp> | <from> -> <to> | <artifact>`

Then print the standard status board (from `SKILL.md` § Output format) reflecting the new `LAST AGENT: <to-agent>`.

## Failure modes

- File system error → report path + error, do not retry silently.
- Malformed `$ARGUMENTS` → ask for the canonical shape; do not partially log.
- Unknown agent name → reject with the allowed list above.
