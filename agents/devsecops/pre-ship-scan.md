---
description: "[DevSecOps] Run dep audit + secrets scan. Reports findings inline. Refuses ship if critical."
argument-hint: ""
---

# Pre-Ship Scan

## Steps

### 1. Dependency audit

Run the audit appropriate for the stack:

```bash
# npm / pnpm
npm audit --omit=dev
pnpm audit --prod
# Python
pip-audit
# Cargo
cargo audit
```

Report High+ severity findings. PASS only if zero High+ unfixed.

### 2. Secrets scan

Search for common secret patterns in tracked files (NOT in `.gitignore`):

```bash
git grep -E '(api[_-]?key|secret|password|token|bearer)\s*[:=]\s*["'\''][^"'\'']{8,}' -- ':!*.md'
```

Also check:

```bash
# .env should NOT be tracked
git ls-files | grep -E '^\.env$|^\.env\.local$'
# Should output nothing
```

Report any matches as blockers.

### 3. Verdict

- PASS — both checks clean → proceed to `deploy-gate`
- FAIL — list every finding, refuse to write Gate 2 sign-off, redirect to `engineer` for fix
