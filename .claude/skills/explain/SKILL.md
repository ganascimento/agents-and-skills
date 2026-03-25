---
name: explain
description: Explains a piece of code, function, file, or concept in plain language. Useful for understanding unfamiliar code, onboarding, or demystifying complex logic.
---

Explain the code or concept provided by the user in plain, clear language. Your goal is to build genuine understanding — not just describe what the code does line by line.

## Step 1 — Check for input

The user will provide one of:
- A file path or function name to explain
- A code snippet pasted directly
- A concept or pattern ("how does auth work here?", "what does this hook do?")

**If no input was provided**, stop and ask in pt-br:

> O que você quer que eu explique? Pode ser:
> - Um arquivo ou função (ex: `src/hooks/useAuth.ts`)
> - Um trecho de código (cole aqui)
> - Uma pergunta sobre o sistema (ex: "como funciona o fluxo de autenticação?")

## Step 2 — Gather context

If the user provided a file path or function name, read it:
- Read the full file if it's small (< 150 lines)
- If large, read the relevant function/section plus its imports and any types it uses
- If the code calls other functions that are important to understand, read those too (one level deep is usually enough)

If the user asked a conceptual question (e.g. "how does auth work?"), search for the relevant files first:
```bash
# example: find auth-related files
grep -r "auth\|login\|session\|token" src --include="*.ts" --include="*.tsx" -l | head -10
```

## Step 3 — Calibrate the explanation

Before explaining, consider:
- **What is the user asking?** A high-level "what does this do?" vs a deep "why is it written this way?"
- **What level of detail is needed?** A 10-line utility vs a 200-line state machine need different depths
- **Is there a simpler mental model?** Find the analogy or pattern name that unlocks understanding

## Step 4 — Explain

Structure your explanation based on what was asked:

### For a function or small module:
1. **What it does** — one sentence, plain language, no jargon
2. **Inputs and outputs** — what goes in, what comes out, what side effects exist
3. **How it works** — walk through the logic in plain language, not line-by-line but step-by-step
4. **Why it's written this way** — if there's a non-obvious design decision, explain the reason
5. **Example** — show a concrete usage example if it helps

### For a large file or system:
1. **Purpose** — what problem this file/module solves
2. **Key concepts** — 3-5 things the reader needs to understand first
3. **How the pieces fit** — the main flow or structure, with the important parts called out
4. **Entry points** — where does execution start? What are the main public APIs?
5. **Non-obvious parts** — flag anything that looks weird and explain why it exists

### For a conceptual question:
1. **Direct answer** — answer the question first, then explain
2. **Where in the code** — point to the specific files/functions that implement it
3. **The flow** — trace the path from trigger to outcome
4. **Edge cases or gotchas** — anything that would trip someone up

## Rules

- **Never explain line by line** — group related lines into meaningful steps
- **Use plain language** — define any technical term you use, don't assume jargon is shared
- **Be specific to this codebase** — reference actual function names, file paths, variable names from the code
- **Shorter is better** — if you can explain it in 3 paragraphs, don't write 10
- **Call out the non-obvious** — the obvious parts need no explanation; focus on what would genuinely confuse someone reading it for the first time
- **If something looks wrong or overly complex**, say so — "this works, but it's worth noting that X is unusual because Y"
