## Proposal #1 — token-optimizer

**Date:** 2026-04-29  
**Priority:** HIGH  
**Type:** REWRITE  
**Agent(s) affected:** Nova (main session), Idea Research Agent, Market Digest Agent  
**Status:** applied  

### Problem
The `token-optimizer` skill currently contains ineffective guidance and items that feel like aspirational goals rather than actionable items for agents. This results in unnecessary token consumption and confusion about the skill's operational directives.

### Proposed Change

Remove the ineffective section and promote actionable rules:
```diff
-## Quick Wins to Implement
-
-- [ ] Switch heartbeat checks to use a cheaper model (Haiku/Flash) — they don't need Sonnet
-- [ ] Set auto-updater cron to run at 4AM with isolated session (separate from main context)
-- [ ] Use `summarize` skill for long docs instead of reading raw content
-- [ ] Grep before read: use `rg` to find relevant sections before loading full files
```

Promote the two actionable items into a permanent guidance section:
```
Add to "File Reading Strategy":
- Prefer `rg` for targeted lookups before reading whole files
- Use the `summarize` skill for documents larger than 10k tokens instead of reading raw content
```

### Why It Matters
Removing passive and aspirational content reduces confusion while enhancing token efficiency and operational clarity for agents.

### Estimated Token Delta
`-120 tokens`  

### Applied At
2026-04-30T09:00:00Z

---

## Proposal #2 — orchestration-doctrine

**Date:** 2026-04-29  
**Priority:** MEDIUM  
**Type:** REMOVE  
**Agent(s) affected:** Nova (main session)  
**Status:** applied  

### Problem
The `orchestration-doctrine` skill contains redundant information with the Decision Brief template appearing in two places. This duplication leads to increased token usage without providing any additional value.

### Proposed Change

Remove duplicative template section:
```diff
-## 📋 Decision Brief Template (Quick Copy)
-
-```
-## 🎯 Task: [NAME]
-
-**What will happen:** [Plain English summary]
-
-**Who does what:**
-- [Agent]: [Task] — [Model] (~$[cost])
-
-**Decisions needed:**
-1. [Question]
-
-**Nova recommends:** [Recommendation]
-
-**Alternatives:** [Option B], [Option C]
-
-➡️ Approve / Reject / Modify?
-```
```

### Why It Matters
Eliminating unnecessary duplication in this CORE skill streamlines loading and saves tokens without losing any critical information.

### Estimated Token Delta
`-50 tokens`

### Applied At
2026-04-30T09:00:00Z

---

## Proposal #3 — skill-auditor

**Date:** 2026-04-29  
**Priority:** HIGH  
**Type:** REWRITE  
**Agent(s) affected:** Nova (main session)  
**Status:** applied  

### Problem
The `skill-auditor` skill has a hardcoded section describing Sky's active projects. As projects change, this creates misleading information since the skill depends on stale data.

### Proposed Change

Replace the static section with a directive to reference MEMORY.md:
```diff
-## Sky's Active Projects (as of 2026-04-29)
-
-See `MEMORY.md` for current active projects. Projects:
-- **PropSprint** — RE deal analyzer app (Next.js, Supabase, Claude)
-+## Sky's Active Projects
+
+Always reference MEMORY.md for the current state of active projects.
```

### Why It Matters
Pointing agents to the live source of truth ensures they always have the correct information, avoiding stale data pitfalls.

### Estimated Token Delta
`-20 tokens`

### Applied At
2026-04-30T09:00:00Z

---

## Proposal #4 — token-optimizer

**Date:** 2026-05-01  
**Priority:** HIGH  
**Type:** REMOVE  
**Agent(s) affected:** Nova (main session), all cron agents  
**Status:** applied  

### Problem
The `token-optimizer` skill contains a redundant line repeated three times at the top: "Focus on defining explicit token-saving strategies to enhance efficiency." This repetition adds no value and wastes tokens on every load.

### Proposed Change

```diff
-## Actionable Strategies
-- Focus on defining explicit token-saving strategies to enhance efficiency.
-- Focus on defining explicit token-saving strategies to enhance efficiency.
-- Focus on defining explicit token-saving strategies to enhance efficiency. Avoid vague aspirational guidance.
+## Actionable Strategies
+Focus on defining explicit token-saving strategies to enhance efficiency. Avoid vague aspirational guidance.
```

### Why It Matters
Removes wasteful repetition in a CORE skill loaded frequently by Nova and all cron agents. Clean, concise guidance is more effective than repeated filler text.

### Estimated Token Delta
`-30 tokens`

### Applied At
_(pending approval)_

---

## Proposal #5 — weather

**Date:** 2026-05-01  
**Priority:** MEDIUM  
**Type:** ADD  
**Agent(s) affected:** Market Digest Agent, Nova (main session)  
**Status:** applied  

### Problem
The `weather` skill provides minimal context about when to use each service or how to handle failures. Agents may not know to fall back to Open-Meteo when wttr.in is down, or how to extract location from context.

### Proposed Change

Add a "Usage Guidance" section after the service descriptions:

```markdown
## Usage Guidance

**Default flow:**
1. Try wttr.in with compact format first (fastest, no key needed)
2. If wttr.in fails or times out, fall back to Open-Meteo
3. For programmatic parsing (scripts, data logging), prefer Open-Meteo JSON

**Location detection:**
- User timezone (from session context) → use city name
- Explicit location mention → use that directly
- Airport codes work great: "JFK", "ORD", "LAX"
- URL-encode spaces: "New York" → "New+York"

**Error handling:**
- wttr.in timeout (>3s) → switch to Open-Meteo
- Invalid location → ask user or try nearest major city
- No internet → report gracefully, don't retry in loop
```

### Why It Matters
Provides operational clarity for agents using the weather skill, reducing confusion and improving reliability when services are unavailable.

### Estimated Token Delta
`+150 tokens`

### Applied At
_(pending approval)_

---

## Proposal #6 — decision-executor

**Date:** 2026-05-01  
**Priority:** HIGH  
**Type:** ADD  
**Agent(s) affected:** Nova (main session)  
**Status:** applied  

### Problem
The `decision-executor` skill lacks error handling guidance and doesn't specify what to do when task specs are missing, agents are unavailable, or spawning fails. This leads to silent failures or inconsistent behavior.

### Proposed Change

Add an "Error Handling" section after the "Marking executed" section:

```markdown
## Error Handling

### Missing task spec
If a decision references a task ID not found in sprint.json:
1. Log error to activity-log.jsonl with `"status": "error", "reason": "task-not-found"`
2. Mark decision as `executed: true` (don't retry)
3. Message Sky: "⚠️ Cannot execute [taskId]: task spec not found"

### Agent spawn failure
If sessions_spawn returns an error:
1. Do NOT mark as executed (allow retry on next run)
2. Log error to activity-log.jsonl
3. Message Sky: "⚠️ Failed to start [taskTitle]: [error message]"
4. If same task fails 3x, mark executed and escalate

### Rejected/deferred tasks
- Mark `executed: true` immediately (no spawn needed)
- Log to activity-log.jsonl with final status
- No user notification needed (Sky already made the decision)

### Malformed queue entries
If entry lacks required fields (id, taskId, action):
1. Log warning to activity-log.jsonl
2. Skip entry (don't mark executed)
3. Daily digest reports malformed entries for manual cleanup
```

### Why It Matters
Prevents silent failures and provides clear recovery paths when execution goes wrong. Critical for reliable automated task execution.

### Estimated Token Delta
`+180 tokens`

### Applied At
_(pending approval)_

---

## Proposal #7 — security-auditor

**Date:** 2026-05-01  
**Priority:** MEDIUM  
**Type:** RESTRUCTURE  
**Agent(s) affected:** PropSprint Builder Agent  
**Status:** applied  

### Problem
The `security-auditor` skill is 350+ lines with extensive code examples. Most of this content should be in `references/` to reduce token load when the skill is activated. Agents only need the checklist and reference pointers up front.

### Proposed Change

Move detailed code examples to reference files:

**Keep in SKILL.md (condensed to ~100 lines):**
- Role definition
- Audit process
- OWASP Top 10 checklist (summary only, no code examples)
- Security headers (condensed)
- Reference file index

**Move to references/:**
- `references/owasp-examples.md` — All code examples for OWASP Top 10
- `references/input-validation.md` — Zod patterns, file upload validation
- `references/auth-patterns.md` — JWT, cookies, rate limiting examples
- `references/security-headers.md` — Full headers configuration with explanations

**Add to SKILL.md:**
```markdown
## Quick Reference

| Topic | Read when... |
|-------|-------------|
| [owasp-examples.md](references/owasp-examples.md) | Need code examples for injection, XSS, access control |
| [input-validation.md](references/input-validation.md) | Implementing form validation or file uploads |
| [auth-patterns.md](references/auth-patterns.md) | Building authentication flows or sessions |
| [security-headers.md](references/security-headers.md) | Configuring CSP, CORS, HSTS |
```

### Why It Matters
Reduces token load by 250+ tokens on skill activation while preserving all guidance through lazy-loaded references. Builder agents get faster, cheaper security checks.

### Estimated Token Delta
`-250 tokens` (main skill) / `+250 tokens` (only when references are read)

### Applied At
_(pending approval)_

---
