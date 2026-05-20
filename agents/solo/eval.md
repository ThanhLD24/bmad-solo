---
description: "[Solo Orchestrator] Collect solo productivity metrics — phase durations, gate retries, agents invoked — output JSON snapshot."
argument-hint: ""
---

# Solo Orchestrator — Eval

Compute a productivity snapshot for the current project and output it as JSON. Read-only. Do **not** write the JSON to disk unless the founder explicitly asks.

## Inputs

1. `.bmad-solo/handoff-log.md` — source of truth for agent activity and timestamps.
2. `.bmad-solo/project-state.md` — project name, current phase, gate state.
3. `.bmad-solo/signals/` — phase transition markers (file mtime = transition time).

If `handoff-log.md` is missing or empty, output:
```json
{ "error": "no handoff log — project not yet started" }
```
and stop.

## Computation

### Phase durations (days, floor to integer)

- **ideaDays** — minutes from first `idea-validator` handoff entry to the appearance of `.bmad-solo/signals/idea-validated` (use file mtime). If signal absent, phase is in-progress; report elapsed days from first idea-validator entry to now.
- **buildDays** — `signals/idea-validated` mtime → `signals/mvp-ready` mtime. If `mvp-ready` absent, elapsed days from `idea-validated` to now.
- **shipToDecisionDays** — `signals/launched` mtime → last `ship-growth` handoff entry (or now if still running).

Floor any partial day. Use UTC throughout.

### Gate retries

A **gate retry** = a handoff to an earlier-phase agent after the project had already moved out of that phase.

- **gate1** — count of handoffs to `idea-validator` after `signals/idea-validated` exists.
- **gate2** — count of handoffs to `engineer` or `tester-qe` after `signals/mvp-ready` exists, where the artifact in the handoff line is a deploy/security fix.

If you cannot determine from the artifact field, default to 0 and add a `"_note"` field explaining the ambiguity.

### Agent invocations

Count handoff lines per `to-agent` value. Output as a map. Include only agents with count ≥ 1.

### Lead time

**leadTimeIdeaToShipDays** — first handoff entry timestamp → `signals/launched` mtime. If `launched` absent, omit this field.

## Output

Emit exactly one JSON object. No prose before or after. Example shape:

```json
{
  "project": "<name from project-state.md>",
  "phaseDurations": {
    "ideaDays": 7,
    "buildDays": 12,
    "shipToDecisionDays": 14
  },
  "gateRetries": {
    "gate1": 0,
    "gate2": 1
  },
  "agentInvocations": {
    "idea-validator": 9,
    "product-owner": 3,
    "solution-architect": 2,
    "engineer": 18,
    "tester-qe": 5,
    "devsecops": 2,
    "ship-growth": 4
  },
  "leadTimeIdeaToShipDays": 19
}
```

## Rules

- Never fabricate counts. If unknown, omit the field and add a `"_note"` string explaining why.
- Round phase durations down to the nearest whole day.
- Use UTC for all timestamp math.
- If `signals/` is unreadable, fall back to handoff-log timestamps only and add `"_note": "phase durations estimated from handoffs; signal files unavailable"`.
