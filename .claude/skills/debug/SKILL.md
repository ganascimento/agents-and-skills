---
name: debug
description: Investigates errors, exceptions, and unexpected behavior. Receives an error message or stack trace, locates the root cause in the code, and tells exactly what to fix.
---

Investigate the error or unexpected behavior described by the user. Your job is not just to explain what the error means — it is to find the exact location in the code causing it and tell the user what to fix.

## Step 1 — Understand the input

The user will provide one of:
- An error message or exception
- A stack trace
- A description of unexpected behavior ("X should do Y but does Z")
- A combination of the above

**If no input was provided** (skill was called with no arguments), stop immediately and ask in pt-br:

> Para investigar o problema, preciso de mais informações:
> 1. **O erro ou comportamento** — cole a mensagem de erro, stack trace, ou descreva o que está acontecendo
> 2. **Como reproduzir** — qual ação dispara o problema?

**If the input is too vague** (e.g. "it's not working", "está quebrando"), ask the same questions above.

Do not proceed without enough information to locate the problem.

## Step 2 — Parse the stack trace or error

From the error/stack trace, extract:
- **Error type**: (TypeError, ReferenceError, 404, ECONNREFUSED, etc.)
- **Error message**: the exact message
- **Origin**: the first file in the stack trace that belongs to the project (not node_modules)
- **Call chain**: the sequence of calls leading to the error

Ignore frames from `node_modules`, runtime internals, or framework boilerplate — focus on project code.

## Step 3 — Locate the root cause in the code

Starting from the origin file identified above:

```bash
# Find the file
# Read the relevant lines around the error
# Trace up the call chain if needed
```

For each candidate location:
1. Read the function/component where the error occurs
2. Identify what assumption is being violated (null value, wrong type, missing key, async not awaited, etc.)
3. Trace backwards: where does the bad value come from?

Keep tracing until you find the **root cause** — the earliest point where the bad state is introduced. Do not stop at the symptom.

Common root cause categories to check:
- **Null/undefined**: value used before being defined or after being cleared
- **Async**: `await` missing, promise not handled, race condition
- **Type mismatch**: string used as number, object used as array
- **Missing guard**: no check before accessing `.length`, `.map`, nested property
- **Wrong dependency**: useEffect/useMemo/useCallback with stale or missing deps (React)
- **Scope**: variable used outside its valid scope, closure capturing stale value
- **Network/API**: wrong endpoint, missing auth header, unexpected response shape
- **Environment**: env variable undefined, wrong value in a specific environment
- **Import/module**: circular import, wrong export (default vs named), missing file

## Step 4 — Verify the hypothesis

Before concluding, verify the root cause by:
- Reading the full function where the issue originates
- Checking if the fix would break anything else (callers, sibling components, related tests)
- If the issue is runtime data-dependent (e.g. API response), check the data shape being used

## Step 5 — Report

Structure your output as:

---

## Debug Report

### Error
```
<exact error message>
```

### Root cause
**File**: `path/to/file.ts` line X
**What's happening**: one clear sentence describing the actual problem (not the symptom).

### Why it happens
2-3 sentences explaining the chain of events that leads to this error. Mention the data flow or control flow path.

### The fix

Show the problematic code and the corrected version:

**Before:**
```ts
// problematic code
```

**After:**
```ts
// fixed code
```

Explain why the fix works.

### Watch out
If fixing this may affect other parts of the code (callers, related components, tests), list them here so the user knows what else to check.

---

## Rules

- Always find the root cause — never stop at the symptom
- Always show the exact file and line number
- Never suggest generic fixes like "add error handling" — show the exact code change
- If the root cause is in a dependency (node_modules), say so clearly and explain the workaround
- If the bug requires more context (e.g. runtime data you can't see), say what information is needed and how to get it (console.log, debugger, network tab)
- If there are multiple possible root causes, investigate each one and rank by likelihood before concluding
