---
description: "[Solo Orchestrator] Show project status — current phase, gate progress, artifact checklist, recommended next action."
argument-hint: ""
---

# Solo Orchestrator — Status

Print the canonical BMAD Solo status board. No prose, no padding. Read-only.

## Steps

### 1. Read project state

```
Read .bmad-solo/project-state.md
```

If the file does not exist, output:
```
PROJECT: <unknown>
PHASE: uninitialized
GATE: n/a
LAST AGENT: none
NEXT: run scripts/scaffold-project.sh to initialize .bmad-solo/
BLOCKERS: project not scaffolded
```
and stop.

### 2. Detect phase from signals

```
ls .bmad-solo/signals/ 2>/dev/null
```

Map to phase using the table in `SKILL.md`:
- no signals → Idea
- `idea-validated` only → Build
- `mvp-ready` present → Build (gate 2 in progress)
- `launched` present → Ship+Grow

If multiple signals, use the latest (`launched` > `mvp-ready` > `idea-validated`).

### 3. List artifacts

```
find docs -type f -name '*.md' 2>/dev/null | sort
```

### 4. Compute gate progress

Open `.bmad-solo/project-state.md`. Count checklist items:
- Total `- [ ]` + `- [x]` lines under the current gate's heading
- Completed = `- [x]` count
- `GATE: <name>, <completed>/<total> (<pct>%)`

If no checklist found in project-state.md, fall back to the gate definition in `BMAD-SOLO-CONTEXT.md` and mark all items as unknown.

### 5. Determine last agent

Tail `.bmad-solo/handoff-log.md` (last line). Extract the `-> <agent>` token. If file missing or empty, `LAST AGENT: none`.

### 6. Recommend next agent

Apply the Phase detection table from `SKILL.md`. For Phase 1 (Build), pick the sub-step based on which artifact is missing first:
1. `docs/prd-lite.md` missing → `product-owner :create-prd`
2. `docs/architecture.md` missing → `solution-architect :create-solution-arch`
3. `docs/stories/` empty → `product-owner :new-story`
4. stories exist, no test report → `tester-qe :create-test-plan`
5. all artifacts present, no `mvp-ready` signal → `devsecops :security-gate`

### 7. Identify blockers

Scan project-state.md for any `BLOCKER:` lines or unchecked gate items past their phase. List them. Otherwise `BLOCKERS: none`.

## Output

Print exactly this board, nothing else:

```
PROJECT: <name>
PHASE: <Idea | Build | Ship+Grow>
GATE: <which gate, % complete>
LAST AGENT: <name>
NEXT: <recommended agent + command>
BLOCKERS: <none | list>
```
