---
name: review-file
description: Performs a code review of a specific file. Use when you want to review a single file in depth.
argument-hint: <path/to/file>
allowed-tools: Read, Grep, Glob
---

Perform a detailed code review of the file provided as argument.

## Steps

1. Read the full file using the Read tool
2. Understand the file's purpose and its role in the project
3. If it's a class or module, read the files that use it to understand the expected contract
4. Run a complete code review using the `code-reviewer` agent checklist
5. Present the result in the standard code review format

If no file is provided as argument, ask the user which file they want reviewed.
