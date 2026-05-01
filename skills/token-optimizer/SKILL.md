---
name: token-optimizer
version: 1.0.0
description: Expert token usage management. Use when cost is a concern, before long tasks, or when selecting models for agent workflows. Keeps quality high while cutting spend.
---

# Token Optimizer

## Actionable Strategies
Focus on defining explicit token-saving strategies to enhance efficiency. Avoid vague aspirational guidance.

Claude Sonnet at $3/$15 per 1M tokens is the right model for complex reasoning and final responses — but NOT for every subtask. Most cost comes from:

1. **Wrong model for the task** — using Sonnet for things Haiku or Flash can handle
2. **Bloated context** — loading too many files, skills, or history into every turn
3. **No caching strategy** — repeating the same context instead of using cache hits
4. **Chatty tool loops** — too many small tool calls instead of batched operations

---

## Model Routing Rules

| Task Type | Model | Why |
|-----------|-------|-----|
| Routing, triage, classification | Gemini Flash | <$0.001/call |
| Boilerplate code, simple edits | DeepSeek V3 | ~$0.27/1M input |
| Math, logic, reasoning | DeepSeek R1 | ~$0.55/1M input |
| Long doc ingestion (>50k tokens) | Kimi k1.5 | ~$0.15/1M input |
| Complex reasoning, architecture | Claude Sonnet | Current model |
| Final user-facing responses | Claude Sonnet | Keep quality |
| Hard reasoning, critical decisions | o3 | Sparingly only |

**Rule:** Only escalate to Sonnet when the task needs nuanced reasoning, complex instructions, or the output goes directly to the user.

---

## Context Management Rules

### Before Any Session
1. Load ONLY what's needed: `memory.md` (HOT tier) + one relevant domain file
2. Do NOT load: full skill libraries, entire codebases, long histories
3. Check session context: if >80% full → summarize and compact before continuing

### File Reading Strategy
- Read file summaries/headers first, then full content only if needed
- Batch related reads into one tool call
- Never read the same file twice in a session

### Tool Call Batching
- Combine independent operations in one `<function_calls>` block
- Avoid round-trips: gather all needed info before acting
- One exec with multiple commands > multiple exec calls

---

## Cost Checkpoints

Run a mental cost check before:

**Before any multi-step task:**
- Can I batch this into fewer turns?
- Is Sonnet needed or can a cheaper model handle it?
- Am I loading unnecessary context?

**Before reading files:**
- Do I actually need this file?
- Can I grep for the specific section instead of reading the whole file?

**Before spawning sub-agents:**
- Is this complex enough to warrant a sub-agent?
- Can I do it in-session with less overhead?

---

## Session Cost Targets

| Session Type | Target Cost | Strategy |
|---|---|---|
| Quick Q&A | <$0.05 | Minimal context, no file reads |
| Light task (1-3 tools) | <$0.20 | Cache hits, batch tools |
| Medium task (repo work) | <$0.50 | Load only relevant files |
| Heavy task (coding agent) | <$2.00 | Sub-agent with cheap model |
| Full build session | <$5.00 | Atomic tasks, commit checkpoints |

**Daily budget for setup/overhead:** <$2
**Daily budget for actual feature work:** <$8
**Target total daily:** <$10

---

## Compaction Strategy

When context >80% full:
1. Summarize current session findings into a brief (3-5 bullets)
2. Write summary to daily memory file
3. Let OpenClaw compact
4. Resume with clean context + summary

Never let context hit 95%+ — the tail of a bloated context costs as much as the beginning but with worse performance.

---

## Sky-Specific Rules

1. **Skill installation sessions** — high overhead, unavoidable once. Future sessions should be cheaper.
2. **PropSprint work** — load only the relevant files for the current task, not the whole repo
3. **Notion queries** — batch into one API call, don't paginate unless needed
4. **GitHub reads** — use `contents` API for targeted files, not recursive tree for whole repo
5. **Status reports** — run in parallel (Notion + GitHub simultaneously), not sequentially

---

## Quick Wins to Implement

- [ ] Switch heartbeat checks to use a cheaper model (Haiku/Flash) — they don't need Sonnet
- [ ] Set auto-updater cron to run at 4AM with isolated session (separate from main context)
- [ ] Use `summarize` skill for long docs instead of reading raw content
- [ ] Grep before read: use `rg` to find relevant sections before loading full files

---

## Red Flags (You're Wasting Money)

- Reading 10+ files in a single turn
- Running `exec` 5+ times in a row when batching was possible
- Loading the full repo tree when you only need 2 files
- Using Sonnet for a task that's just "list these items" or "run this command"
- Letting context hit >90% before compacting
- Re-reading files you already loaded earlier in the session
