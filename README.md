# BMAD Solo

Lean 9-agent SDLC framework for **solo indie founders** shipping products from raw idea to market.

Three phases, two strict gates between them.

## Why this exists

The full BMAD framework (`bmad-sdlc-agents`) targets enterprise teams with compliance, multi-env DR, FinOps, threat models, ADR boards, and 13 agents. A one-person operation drowns in that overhead.

BMAD Solo strips enterprise concerns and adds:

- **Phase 0 — Idea Stage** — devil's advocate methodology, past-tense customer discovery, 4-tier competitive analysis, bottom-up TAM. Forces validation before build. (Inherited from `idea-brainstorm/CLAUDE.md`.)
- **Phase 2 — Ship + Grow** — launch checklist, analytics setup, feedback triage, day-14 decision gate.

## 3-Phase Cycle

```
┌─────────────────┐  GATE 1  ┌──────────────────┐  GATE 2  ┌──────────────┐
│  PHASE 0: IDEA  │ ───────> │  PHASE 1: BUILD  │ ───────> │  PHASE 2:    │
│                 │          │                  │          │  SHIP+GROW   │
│ idea-validator  │          │  PO → SA → UX?   │          │              │
│                 │          │  → engineer      │          │ ship-growth  │
│                 │          │  → tester-qe     │          │              │
│                 │          │  → devsecops     │          │              │
└─────────────────┘          └──────────────────┘          └──────────────┘
```

**Gate 1 (Idea → Build):** ≥5 interviews, WHO+FREQ+SEVERITY+WORKAROUND, 4-tier competitor scan, bottom-up TAM, disconfirming-evidence-first, explicit GO/KILL/PIVOT decision.

**Gate 2 (Build → Ship):** MVP scope frozen, smoke + happy-path E2E pass, no secrets, dep audit clean, deploy checklist complete, rollback documented.

## Agents

| Agent | Phase | Role |
|-------|-------|------|
| `idea-validator` | 0 | Hypothesis sharpening, interviews, competitor scan, TAM, kill-or-go |
| `product-owner` | 1 | PRD-lite (1-pager), story creation |
| `solution-architect` | 1 | architecture.md (1 file), ADR on stack pivots |
| `ux-designer` | 1 (optional) | ASCII wireframes, design tokens — skip if API-only |
| `engineer` | 1 | Fullstack impl (BE+FE; mobile via flag) |
| `tester-qe` | 1 | Test strategy, smoke + happy-path E2E |
| `devsecops` | 1 | Dep audit, secrets scan, deploy gate |
| `ship-growth` | 2 | Launch checklist, analytics, feedback loop, day-14 decision |
| `solo` | All | Orchestrator — status, handoff, eval |

## Install

```bash
git clone https://github.com/ThanhLD24/bmad-solo
cd bmad-solo
bash scripts/install-global.sh
```

Installs to all detected AI coding tools (Claude Code, Codex, Kiro, Gemini, Cursor, Windsurf). Co-exists with `bmad-sdlc-agents` enterprise install (Solo uses `solo-` skill prefix).

## Use

Scaffold a project:

```bash
bash scripts/scaffold-project.sh ~/code/my-idea
cd ~/code/my-idea
```

Kick off Phase 0:

| Tool | Invocation |
|------|-----------|
| Claude Code | `/solo:idea-validator:brainstorm "<idea in one sentence>"` |
| Codex | `solo-idea-validator-brainstorm "<idea>"` |
| Kiro | `/solo-idea-validator-brainstorm` |
| Gemini | `/solo-idea-validator:brainstorm` |

Follow the agent prompts. Stop and pivot or kill at any gate.

## Verified

- 2026-05-20 — smoke install on macOS: 6 tools detected (Claude Code, Codex, Kiro, Cursor, Windsurf, Gemini). Co-exists with enterprise install side-by-side. Scaffold script produces the expected layout.

## License

MIT
