---
name: fix-pr
description: Reviews the current branch diff and applies all recommended fixes directly to the files. Use when you want to review and improve PR code in a single pass.
allowed-tools: Bash, Read, Grep, Glob, Edit
---

Review the changes in this branch and apply all identified improvements.

## Steps

1. Discover the base branch:
   ```
   git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's|refs/remotes/origin/||' || echo "main"
   ```

2. Get the full diff and list of modified files:
   ```
   git diff <base-branch>...HEAD
   git diff --name-only <base-branch>...HEAD
   ```

3. For each modified file, read the full file (not just the diff) to understand full context

4. Run a complete code review using the `code-reviewer` agent checklist, covering:
   - Correctness and bugs
   - Security (OWASP Top 10)
   - Performance
   - Quality and maintainability

5. Apply fixes directly to the files:
   - **Apply**: all Critical issues and Recommended improvements that are safe and unambiguous
   - **Skip**: changes that require broader refactoring, architectural decisions, or test coverage that doesn't exist yet — flag these instead
   - **Never**: change behavior beyond what the review identified (no scope creep)

6. Run tests if available:
   ```
   # detect test runner from package.json / Makefile / pyproject.toml / go.mod
   ```

7. Report using this format:

```
## fix-pr — <branch name>

### Applied fixes
- [FILE:LINE] What was fixed and why

### Skipped (flagged only)
- [FILE:LINE] Issue + reason it was not auto-applied

### Test status
- Before: passing / failing / not found
- After: passing / failing
```

Optional argument: base branch name (e.g. `/fix-pr main`).
