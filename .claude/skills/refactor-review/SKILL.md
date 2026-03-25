---
name: refactor-review
description: Applies fixes to staged files based on issues found by /code-review. Requires code-review output in the conversation context.
---

Apply fixes to staged files based on the issues identified by `/code-review`.

## Step 1 — Check for code-review context

Look back at the current conversation for output that matches the `/code-review` format:
- A section titled `## Code Review`
- Contains issues with severity levels (`BLOCKER`, `WARNING`, `INFO`)
- Has a `### Verdict` section

If no such output exists in the conversation, **stop immediately** and tell the user (in pt-br):

> ❌ Nenhum resultado de `/code-review` encontrado nesta conversa.
> Execute `/code-review` primeiro para que eu possa analisar os problemas antes de refatorar.

Do NOT proceed without this context.

## Step 2 — Parse the issues

From the code-review output in the conversation, extract all issues. For each issue note:
- Severity (`BLOCKER`, `WARNING`, `INFO`)
- File and approximate line
- Description of the problem
- The suggested fix

Skip `INFO` items — only act on `BLOCKER` and `WARNING` issues.

If there are no `BLOCKER` or `WARNING` issues (verdict is ✅ Approved), tell the user:

> ✅ Nenhum problema BLOCKER ou WARNING encontrado no code review. Nada a refatorar.

And stop.

## Step 3 — Read the affected files

For each file that has `BLOCKER` or `WARNING` issues, read the full file to understand the surrounding context before editing.

## Step 4 — Apply the fixes

For each `BLOCKER` issue (fix these first), then each `WARNING` issue:

1. Read the relevant section of the file
2. Apply the fix using the Edit tool
3. Verify the edit looks correct in context — do not introduce new bugs while fixing

Rules for editing:
- Fix exactly what was identified — do not refactor unrelated code
- Preserve the existing code style (indentation, naming conventions, etc.)
- If a fix requires adding an import, add it at the top with the other imports
- If a fix is ambiguous or risky (e.g., changes public API, affects many call sites), **skip it** and note it explicitly

## Step 5 — Report

After all edits, output a summary:

---

## Refactor Summary

### Applied fixes

For each fix applied:
**[SEVERITY] file:line** — brief description of what was changed

### Skipped

For each issue that was skipped and why (if any).

### Next steps

- If all BLOCKERs were fixed: suggest running `/code-review` again to validate, then `/commit`
- If any BLOCKERs were skipped: tell the user to fix them manually before committing

---

## Rules

- Never fix `INFO` items — those are optional and belong to the developer's discretion
- Never change logic unless the code-review explicitly identified it as wrong
- Never add features, comments, docstrings, or refactor beyond the identified issues
- If unsure whether a fix is safe, skip it and explain why
