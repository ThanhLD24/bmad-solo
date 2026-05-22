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

### 3. AI-generated code security review

AI-generated code is functional, not inherently secure. Playbook calls out 4 vuln classes that appear in shipped MVPs because the model never had a feedback loop telling it they were missing. Walk the codebase and check each.

**3a. Authentication & session handling**
- Sessions invalidated on logout (no orphan tokens)
- Session secret not hardcoded; loaded from env
- Password hashing uses a current algorithm (bcrypt / argon2 / scrypt), not raw SHA / MD5
- Auth middleware applied to every protected route — list any route lacking it

**3b. Data exposure in API responses**
- API responses do not leak fields not requested (no `SELECT *` shipped to client)
- Error messages do not include stack traces or DB schema in production
- User objects returned to client do not include password hash, internal IDs, or admin flags

**3c. Input validation & injection**
- Every user-input boundary validates type + length + allowlist (form fields, query params, JSON body, file uploads)
- DB queries use parameterized statements / ORM — no string concatenation building SQL
- Output to HTML uses framework escape (React auto-escape, `{% autoescape %}`, etc.); raw HTML insertion (`dangerouslySetInnerHTML`, `v-html`) reviewed case-by-case

**3d. Dependency vulnerabilities**
- Covered by step 1 above

Report each finding with: file:line, vuln class, severity, suggested patch. PASS only if no High+ unresolved.

### 4. Verdict

- PASS — all 4 checks clean → proceed to `deploy-gate`
- FAIL — list every finding, refuse to write Gate 2 sign-off, redirect to `engineer` for fix
