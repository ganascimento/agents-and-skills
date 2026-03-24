---
name: refactor-pr
description: Refactors only the files changed in the current branch. Use when you want to clean up code introduced in a PR before merging.
allowed-tools: Bash, Read, Grep, Glob, Edit
---

Refactor only the files modified in the current branch, without changing behavior.

## Steps

1. Find the base branch:
   ```
   git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's|refs/remotes/origin/||' || echo "main"
   ```

2. List modified files:
   ```
   git diff --name-only <base-branch>...HEAD
   ```

3. For each modified file:
   - Read the full file (not just the diff) to understand context
   - Apply the `refactor` agent checklist scoped to the changed code
   - Avoid touching stable surrounding code unless it directly couples with the changes

4. Run tests if available:
   ```
   # detect test runner from package.json / Makefile / pyproject.toml
   ```

5. Report changes using the standard refactor format

Keep the scope tight — only what was changed in this branch.
