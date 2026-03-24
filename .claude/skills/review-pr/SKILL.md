---
name: review-pr
description: Performs a full code review of the current branch diff against the base branch. Use when you want to review PR changes before merging.
allowed-tools: Bash, Read, Grep, Glob
---

Perform a complete code review of the changes in this branch.

## Steps

1. Discover the base branch:
   ```
   git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's|refs/remotes/origin/||' || echo "main"
   ```

2. Get the full diff:
   ```
   git diff <base-branch>...HEAD
   ```

3. List modified files:
   ```
   git diff --name-only <base-branch>...HEAD
   ```

4. Read the relevant modified files to understand the full context (not just the diff)

5. Run a complete code review using the `code-reviewer` agent checklist

6. Present the result in the standard code review format, focused on the introduced changes

Optional argument: base branch name (e.g. `/review-pr main` or `/review-pr feat/my-feature`)
