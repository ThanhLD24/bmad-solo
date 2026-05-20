# BMAD Solo — Developer Guide

Source of truth for the BMAD Solo agent squad. You develop agents here; `install-global.sh` deploys them to all detected AI coding tools. Do not edit files inside `~/.claude/commands/solo/`, `~/.codex/skills/solo-*`, etc — those are generated outputs.

## Key Commands

```bash
bash scripts/install-global.sh           # install
bash scripts/install-global.sh --dry-run # preview
bash scripts/scaffold-project.sh <path>  # scaffold project
bash scripts/update.sh                   # git pull + reinstall
```

## Repository Structure

```
bmad-solo/
├── agents/                  # 9 agents: solo, idea-validator, product-owner, solution-architect, ux-designer, engineer, tester-qe, devsecops, ship-growth
├── shared/
│   ├── BMAD-SOLO-CONTEXT.md
│   ├── references/          # idea-stage principles, lean MVP, indie growth
│   └── templates/
├── scripts/                 # install-global, scaffold-project, update
├── rules/                   # per-tool rule files
├── hooks/                   # PostToolUse hooks (minimal in v1)
└── mcp-configs/             # MCP stubs
```

## Agent File Conventions

### SKILL.md frontmatter (required)

```yaml
---
name: <lowercase-folder-name>
description: "Specific, mentions WHEN to invoke."
compatibility: "Works on Claude Code, Codex, Kiro, Gemini."
allowed-tools: "Read, Write, Edit, Glob, Grep, ..."
metadata:
  version: "1.0.0"
---
```

### Command file frontmatter

```yaml
---
description: "[Agent Name] What this command does."
argument-hint: "[what to pass as $ARGUMENTS]"
---
```

- Keep commands ≤ 150 lines. Detail goes in `references/` loaded on demand.
- Every agent has a `brainstorm.md`.

## Adding a Command to an Existing Agent

1. Create `agents/<agent>/<cmd>.md` with frontmatter.
2. `bash scripts/install-global.sh --dry-run` to verify.
3. `bash scripts/install-global.sh` to deploy.

## Adding a New Agent

1. `mkdir -p agents/<agent>/{references,templates}`
2. Write `SKILL.md` + `brainstorm.md`.
3. Add command files.
4. `bash scripts/install-global.sh --dry-run` → real install.

Naming:
- Folder: kebab-case
- `name:` in SKILL.md must match folder name
- Command files: kebab-case.md

## How the Installer Works

Same logic as `bmad-sdlc-agents/scripts/install-global.sh`, but with `solo-` skill prefix (Codex, Kiro, Cursor, Windsurf, Gemini) and `solo/` Claude Code namespace. Solo and enterprise install side-by-side without conflict.

Install destinations:
- Claude Code: `~/.claude/skills/solo/<agent>/`, `~/.claude/commands/solo/<agent>/<cmd>.md`
- Codex: `~/.codex/skills/solo-<agent>-<cmd>/`
- Kiro: `~/.kiro/skills/solo-<agent>-<cmd>/`
- Gemini: `~/.gemini/extensions/solo-<agent>/`
- Cursor: `~/.cursor/rules/solo-<agent>.md`
- Windsurf: `~/.windsurf/rules/solo-commands/`

## Phase Boundaries

- Phase 0 agents: `idea-validator`
- Phase 1 agents: `product-owner`, `solution-architect`, `ux-designer`, `engineer`, `tester-qe`, `devsecops`
- Phase 2 agents: `ship-growth`
- Orchestrator (all phases): `solo`

## Gates

Defined in `shared/BMAD-SOLO-CONTEXT.md`. Enforced by `idea-validator/kill-or-go.md` (Gate 1) and `devsecops/deploy-gate.md` (Gate 2). Signal files in `.bmad-solo/signals/`.

## Troubleshooting

- **Skill not appearing after install** — re-run installer.
- **Conflict with enterprise variant** — verify Solo install paths contain `solo`. If they don't, the prefix substitution in `install-global.sh` was missed.
