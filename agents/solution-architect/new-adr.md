---
description: "[Solution Architect] Create a new ADR under docs/adr/ when changing the default stack or making an irreversible architectural decision."
argument-hint: "<decision title>"
---

# New ADR

## Steps

1. Determine next ADR number: scan `docs/adr/` for highest existing `ADR-NNN-*.md`, increment by 1. If none, start at 001.
2. Slugify `$ARGUMENTS` to kebab-case for the filename.
3. Load `templates/adr-template.md`.
4. Walk user through filling:
   - Context — what forced this decision
   - Decision — what we chose
   - Alternatives — at least 2 rejected options with reasons
   - Consequences — positive, negative, neutral
5. Write to `docs/adr/ADR-<NNN>-<slug>.md`.
6. Append a one-line reference in `docs/architecture.md` Stack table where applicable.
