# Decision Executor Skill

Watches the decisions queue and executes approved tasks by spawning the correct agent.

## Trigger
Called by Nova during heartbeat OR by cron. Checks decisions-queue.jsonl for unexecuted approvals.

## Queue file
`/Users/sky/.openclaw/workspace/agent-teams/shared/decisions-queue.jsonl`

Each entry:
```json
{
  "id": "dec-123",
  "timestamp": "2026-04-23T...",
  "taskId": "ps-20260423-006",
  "taskTitle": "FRED live mortgage rates integration",
  "taskAgent": "Forge",
  "action": "approved|deferred|rejected",
  "executed": false
}
```

## Nova's execution steps

1. Read decisions-queue.jsonl
2. Find entries where `executed === false` and `action === 'approved'`
3. For each:
   a. Look up the full task spec in sprint.json
   b. Spawn the correct Claude Code agent with a proper task brief
   c. Log TASK_START to activity-log.jsonl
   d. Mark the decision as `executed: true` in the queue file
   e. Message Sky on Telegram: "🚀 Started: [task title] — [agent] is on it"
4. For `deferred` or `rejected`: just mark as executed, no spawn needed

## Agent routing
- Tasks assigned to "Forge" → spawn Claude Code in PropSprint repo
- Tasks assigned to "Nova" → execute directly
- Tasks assigned to "Sentry" → spawn Claude Code security audit
- Tasks assigned to "Prism" → spawn Claude Code reviewer
- Tasks assigned to "Vaultara" → handle secrets task directly

## Marking executed
After spawning, rewrite the queue file with `executed: true` on the processed entry:
```bash
python3 -c "
import json
path = '/Users/sky/.openclaw/workspace/agent-teams/shared/decisions-queue.jsonl'
with open(path) as f:
    entries = [json.loads(l) for l in f if l.strip()]
for e in entries:
    if e['id'] == 'DECISION_ID':
        e['executed'] = True
with open(path, 'w') as f:
    for e in entries:
        f.write(json.dumps(e) + '\n')
"
```

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
