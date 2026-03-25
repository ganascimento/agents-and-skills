---
name: commit
description: Generates a commit message based on staged changes and commits. Run after staging files with git add.
---

Generate a commit message for the staged changes and commit them.

## Steps

### 1. Check staged changes
```bash
git diff --staged
git diff --staged --name-only
```

If nothing is staged, tell the user to run `git add` first and stop.

### 2. Detect commit convention
Check recent commits to identify the project's convention:
```bash
git log --oneline -10
```

Infer the style:
- **Conventional Commits**: `feat:`, `fix:`, `refactor:`, `chore:`, `docs:`, `test:`, `style:`, `perf:`
- **Imperative plain**: `Add login page`, `Fix null pointer on auth`
- **Other**: match whatever pattern is used

If no commits exist, default to Conventional Commits.

### 3. Analyze the changes

Understand what was actually done:
- What files changed and why
- Whether it's a new feature, bug fix, refactor, config change, test, etc.
- The intent behind the change, not just the mechanical description

### 4. Write the commit message

Rules:
- Subject line: max 72 characters, imperative mood, no period at the end
- If the change needs more context, add a body after a blank line
- Body: explain *why*, not *what* (the diff shows the what)
- Never write vague messages like "fix bug", "update code", "changes"

### 5. Commit
```bash
git commit -m "<message>"
```

If the subject + body is multi-line, use:
```bash
git commit -m "$(cat <<'EOF'
<subject>

<body>
EOF
)"
```

After committing, show the result of `git log --oneline -1` so the user can confirm.
