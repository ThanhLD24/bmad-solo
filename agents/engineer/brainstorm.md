---
description: "[Engineer] Brainstorm implementation approach before writing a story. Confirms scope, surfaces unknowns, lists files to touch."
argument-hint: "<story path or feature name>"
---

# Engineer Brainstorm

If `$ARGUMENTS` is a story path, load it. Otherwise treat as feature name.

## Questions

1. **What files?** — list paths to be created or modified.
2. **What test first?** — the smallest failing test that proves the AC.
3. **What dependencies?** — new packages, env vars, infra. Each one tagged "added" or "already present".
4. **What unknowns?** — anything that needs research or a spike before coding. If non-trivial, recommend a spike story.

End with: recommendation to invoke `implement-story <story-path>` or to clarify with `product-owner` first.
