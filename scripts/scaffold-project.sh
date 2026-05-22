#!/bin/bash
# BMAD Solo Project Scaffolder
# Usage: ./scripts/scaffold-project.sh <project-path>

set -e

if [[ -z "$1" ]]; then
    echo "Usage: scaffold-project.sh <project-path>"
    exit 1
fi

PROJECT_DIR="$1"
TODAY="$(date +%Y-%m-%d)"

mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# .bmad-solo state
mkdir -p .bmad-solo/signals

cat > .bmad-solo/PROJECT-CONTEXT.md <<EOF
# Project Context

**Name:** <fill in>
**Owner:** <fill in>
**Created:** ${TODAY}

## One-line description



## Current phase

- [ ] Phase 0: Idea
- [ ] Phase 1: Build
- [ ] Phase 2: Ship+Grow

(See .bmad-solo/project-state.md for live status.)
EOF

cat > .bmad-solo/project-state.md <<'EOF'
# Project State

**Current phase:** Idea
**Gate status:** Gate 1 — 0/6
**Last agent invoked:** none
**Last handoff:** none
**Blockers:** none

## Phase 0 artifacts

- [ ] docs/idea/idea-brief.md
- [ ] docs/idea/interviews/ (≥5)
- [ ] docs/idea/competitors.md
- [ ] docs/idea/tam-som.md
- [ ] docs/idea/trends.md
- [ ] docs/idea/interview-synthesis.md
- [ ] docs/idea/decision-go.md

## Phase 1 artifacts

- [ ] docs/prd-lite.md
- [ ] docs/architecture.md
- [ ] docs/stories/
- [ ] docs/test-strategy.md
- [ ] docs/deploy-checklist.md

## Phase 2 artifacts

- [ ] docs/growth/launch-log.md
- [ ] docs/growth/metrics.md
- [ ] docs/growth/feedback.md
- [ ] docs/growth/decision.md
EOF

touch .bmad-solo/handoff-log.md

# docs/ skeleton
mkdir -p docs/idea/interviews
mkdir -p docs/adr
mkdir -p docs/ux/wireframes
mkdir -p docs/stories
mkdir -p docs/growth

# Project-level CLAUDE.md — Playbook calls this the "first artifact of your build".
# Persistent memory for every future Claude Code session in this project.
# Solution-architect fills the Architecture pointer; engineer appends session log entries.
if [[ ! -f CLAUDE.md ]]; then
cat > CLAUDE.md <<'EOF'
# Project Memory (CLAUDE.md)

Persistent context for every Claude Code session in this project. Update when architecture or scope changes; append a session log entry at the end of each engineer session.

## Source of Truth

- Problem + scope: `docs/prd-lite.md`
- Architecture + stack + dependencies: `docs/architecture.md`
- ADRs: `docs/adr/`
- BMAD Solo conventions: `.bmad-solo/PROJECT-CONTEXT.md` + framework `shared/BMAD-SOLO-CONTEXT.md`

## Coding Conventions

<fill after solution-architect produces docs/architecture.md — language, framework, test runner, formatter, lint, commit style>

## Out of Scope

<copied from docs/prd-lite.md "Out of Scope" — what NOT to build>

## Session Log

> Engineer appends one entry per implement-story session. Format:
> ### YYYY-MM-DD — <story-slug>
> - Built: <what shipped>
> - Decisions: <non-obvious choice + 1-line reason>
> - Assumptions introduced: <anything a future session must respect>
EOF
fi

echo "Scaffolded BMAD Solo project at: $PROJECT_DIR"
echo "Next: invoke /solo:idea-validator:brainstorm to kick off Phase 0"
