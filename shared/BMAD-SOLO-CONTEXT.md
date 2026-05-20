# BMAD Solo — Shared Context for All Agents

## What is BMAD Solo?

BMAD Solo is the lean variant of the BMAD (Breakthrough Method of Agile AI-Driven Development) framework, designed for **one founder** shipping products from raw idea to market. It strips enterprise concerns (compliance, FinOps, multi-env DR, threat modelling) and adds an **Idea Stage** that enforces validation before any engineering time is spent.

## BMAD Solo 3-Phase Cycle

1. **Idea** — Validate hypothesis with real users; produce idea-brief + decision-go (GO / KILL / PIVOT)
2. **Build** — Ship MVP from validated idea; critical path only
3. **Ship + Grow** — Launch, measure, iterate from real feedback

## Work Types

| Work Type | Agent Chain |
|-----------|------------|
| New idea → product | idea-validator → product-owner → solution-architect → (ux-designer) → engineer → tester-qe → devsecops → ship-growth |
| Feature on shipped product | product-owner → solution-architect (delta) → engineer → tester-qe → devsecops |
| Bug fix | engineer (self-diagnose + fix) → tester-qe (verify) |
| Idea kill | idea-validator → decision-go.md = KILL → stop |
| Pivot | idea-validator re-run with new hypothesis |

## Gates Between Phases

### Gate 1: Idea → Build (strict)

- [ ] ≥5 problem interviews completed (past-tense)
- [ ] Hypothesis passes WHO + FREQUENCY + SEVERITY + WORKAROUND format
- [ ] Competitor analysis across 4 tiers (direct / indirect / acquirer / adjacent)
- [ ] TAM bottom-up with sourced numbers
- [ ] Disconfirming evidence presented BEFORE confirming evidence
- [ ] `decision-go.md` explicit: GO / KILL / PIVOT

### Gate 2: Build → Ship

- [ ] MVP scope frozen in `prd-lite.md`
- [ ] Smoke + happy-path E2E pass
- [ ] No secrets in repo
- [ ] Dependency audit clean
- [ ] Deploy checklist complete
- [ ] Rollback plan documented

## Anti-Patterns (call out immediately)

| Pattern | Response |
|---------|----------|
| Build MVP before ≥5 problem interviews | Blocker — return to idea-validator |
| "Validate this idea" expecting confirming evidence | Reframe — present 2-sided evidence |
| Solution-first ("I want to use AI/blockchain/X") | Pull back to problem-first |
| TAM = "1% of $X billion" | Reject — demand bottom-up |
| Prototype existence = validation | Name it: "this is a prop, not proof" |
| "Users will love this" without interview quote | Demand specific evidence |

## Solo-Specific Conventions

- **One founder = no inter-human handoffs** — agent-to-agent handoffs logged in `.bmad-solo/handoff-log.md` for self-audit
- **Skip BRD** — `idea-brief.md` replaces it
- **ADR only on major stack pivots**
- **Skip threat model** — security = `.env` not committed, `npm audit`, basic CSP
- **No SOC2 / GDPR / HIPAA by default** — opt-in references only
- **Default stack:** Next.js + Supabase + Vercel (override per project)
- **Analytics default:** Plausible (privacy) or PostHog (product-led)

## Standard Artifact Structure

```
<project>/
├── .bmad-solo/
│   ├── PROJECT-CONTEXT.md
│   ├── project-state.md
│   ├── handoff-log.md
│   └── signals/{idea-validated,mvp-ready,launched}
└── docs/
    ├── idea/{idea-brief,interviews/,competitors,tam-som,trends,decision-go}.md
    ├── prd-lite.md
    ├── architecture.md
    ├── adr/
    ├── ux/wireframes/                 # optional
    ├── stories/
    ├── test-strategy.md
    ├── deploy-checklist.md
    └── growth/{launch-log,metrics,feedback,decision}.md
```

## Output Style (Karpathy-Inherited)

- Dense, first-principles, no marketing fluff
- Every claim ships with reasoning or source
- When unsure → say so. Never fabricate numbers or sources.
- Prose > bullets for analysis. Bullets only for actionable checklists.
- Push back on weak assumptions. Kindness ≠ agreement.

## Artifact Versioning

When an agent modifies an artifact:
1. Add changelog note at top of the file
2. Log handoff in `.bmad-solo/handoff-log.md`
3. Reference artifact version in handoff
