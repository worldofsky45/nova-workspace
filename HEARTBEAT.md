# HEARTBEAT.md Template

```markdown
## Decision Queue Check (EVERY heartbeat)
Read /Users/sky/.openclaw/workspace/agent-teams/shared/decisions-queue.jsonl
Find entries where executed=false.
For each approved task: spawn the correct agent, log TASK_START to activity-log.jsonl, mark executed=true, message Sky on Telegram confirming agent started.
For deferred/rejected: mark executed=true, no spawn.
If queue is empty or all executed: skip silently.

# Keep this file empty (below) for non-heartbeat notes
# --- (or with only comments) to skip heartbeat API calls.

# Add tasks below when you want the agent to check something periodically.

## Proactivity Check

- Read ~/proactivity/heartbeat.md
- Re-check active blockers, promised follow-ups, stale work, and missing decisions
- Message the user only when something changed or needs a decision
- Update ~/proactivity/session-state.md after meaningful follow-through

## Self-Improving Check

- Read `./skills/self-improving/heartbeat-rules.md`
- Use `~/self-improving/heartbeat-state.md` for last-run markers and action notes
- If no file inside `~/self-improving/` changed since the last reviewed change, return `HEARTBEAT_OK`
```
