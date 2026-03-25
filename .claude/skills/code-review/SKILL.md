---
name: code-review
description: Code review of staged changes. Validates quality, security, best practices, and modern standards before committing.
---

Perform a thorough code review of all staged changes. Your job is to catch real problems — not nitpick style — before they get committed.

## Steps

### 1. Get the staged diff

```bash
git diff --staged
git diff --staged --name-only
```

If nothing is staged, tell the user to run `git add` first and stop.

### 2. Check for unstaged changes

```bash
git diff --name-only
```

If there are unstaged changes, warn the user in pt-br **before proceeding** and ask for confirmation:

> ⚠️ **Atenção:** Existem alterações não staged nos seguintes arquivos:
> `<lista de arquivos>`
> Essas mudanças **não serão incluídas** no code review. Deseja continuar mesmo assim?

Wait for the user's response. If they say no (or anything that means no), stop. If they confirm, proceed.

### 3. Understand context

For each changed file, read enough surrounding code to understand intent. Use Read or Grep if the diff alone is insufficient to judge correctness.

Also check:
- Language/framework conventions in the repo
- Existing patterns for similar code nearby

### 4. Review the changes

Evaluate each change across these dimensions. Only flag items that are **actually present in the diff** — do not hallucinate issues.

#### Correctness
- Logic errors, off-by-one, incorrect conditionals
- Null/undefined dereferences, missing error handling at boundaries
- Race conditions, unhandled async/promise rejections
- Wrong data types or incorrect assumptions about input shape

#### Security (OWASP Top 10 + common issues)
- **Injection**: SQL injection, command injection, LDAP injection — especially with user-supplied input
- **XSS**: unescaped output rendered as HTML, `dangerouslySetInnerHTML`, `innerHTML` with user data
- **Sensitive data exposure**: hardcoded secrets, API keys, passwords, tokens in code or logs
- **Broken access control**: missing auth checks, IDOR, privilege escalation paths
- **Insecure deserialization**: `eval()`, `pickle.loads()`, unsafe `JSON.parse` on untrusted data
- **Dependency confusion**: new packages added — flag if unknown or unusual
- **Path traversal**: user input used in file paths without sanitization
- **SSRF**: user-controlled URLs passed to HTTP clients
- **Mass assignment**: binding all request params to models without allowlist

#### Reliability & Resilience
- Missing error handling at system boundaries (HTTP calls, DB, file I/O)
- Silent failures — errors swallowed or logged without action
- Unbounded loops or recursion
- Memory leaks (event listeners not removed, large objects in closures)

#### Maintainability
- Functions doing too many things (hard to test, hard to reason about)
- Magic numbers/strings without constants
- Dead code introduced
- Misleading variable/function names

#### Performance (only flag obvious regressions)
- N+1 queries
- Synchronous blocking in async context
- Unnecessary re-renders or re-computation in hot paths

### 5. Write the review

Structure your output as follows:

---

## Code Review

### Summary
One paragraph: what changed and overall assessment (looks good / minor issues / needs work before committing).

### Issues

For each issue found, use this format:

**[SEVERITY] Category — file:line**
> Brief description of the problem and why it matters.
> ```
> problematic code snippet
> ```
> **Fix:** What to do instead (concrete, not vague).

Severity levels:
- `BLOCKER` — must fix before committing (security vuln, data loss, broken logic)
- `WARNING` — should fix (reliability risk, bad pattern, maintainability hit)
- `INFO` — optional improvement (minor, style, or future consideration)

### Verdict

One of:
- ✅ **Approved** — no issues or only INFO items
- ⚠️ **Approved with warnings** — WARNING items present, no BLOCKERs
- ❌ **Changes requested** — one or more BLOCKERs found

---

## Rules

- Only report issues visible in the staged diff or directly caused by it
- Be specific: always include file name and approximate line number
- Provide concrete fixes, not vague advice like "handle this better"
- Do not flag style preferences (tabs vs spaces, naming conventions) unless they create ambiguity
- Do not invent issues to seem thorough — a clean diff should get a clean review
- If the verdict is ❌, do NOT suggest running /commit — tell the user to fix the BLOCKERs first
- If the verdict is ✅ or ⚠️, suggest running /commit when done
