# Engine Ideation Dashboard Integration

**Target:** Replace Overview page in Mission Control with Engine Ideation Hub

## New Dashboard Layout

### Page: `/` (Home/Overview → Engine Ideation Hub)

```
┌─────────────────────────────────────────────────────────────────┐
│  🚀 ENGINE IDEATION HUB                          [Settings ⚙️]  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  💡 NEW IDEAS THIS WEEK                                         │
│  ┌───────────────────────────────────────────────────────────┐ │
│  │  Newsletter Subscriber Predictor          ⭐⭐⭐⭐⭐        │ │
│  │  "Predict which LinkedIn posts drive newsletter signups"  │ │
│  │                                                            │ │
│  │  📊 Feedback: 48 hours  💰 ROI: $5K MRR  🔧 Easy (2 wks) │ │
│  │  💵 Capital: $0         📈 Win Rate: 30%+ needed         │ │
│  │                                                            │ │
│  │  [📖 View Details]  [✅ Approve & Build]  [❌ Reject]    │ │
│  └───────────────────────────────────────────────────────────┘ │
│                                                                 │
│  ┌───────────────────────────────────────────────────────────┐ │
│  │  Airbnb Price Optimizer                  ⭐⭐⭐⭐⭐        │ │
│  │  "Dynamic pricing to maximize revenue by 15-30%"          │ │
│  │                                                            │ │
│  │  📊 Feedback: Daily     💰 ROI: +$500/mo  🔧 Med (3 wks) │ │
│  │  💵 Capital: $20/mo     📈 Win Rate: N/A (optimization)  │ │
│  │                                                            │ │
│  │  [📖 View Details]  [✅ Approve & Build]  [❌ Reject]    │ │
│  └───────────────────────────────────────────────────────────┘ │
│                                                                 │
│  ┌───────────────────────────────────────────────────────────┐ │
│  │  Upwork Gig Arbitrage                    ⭐⭐⭐⭐          │ │
│  │  "Outsource gigs to VAs at 70%+ profit margins"           │ │
│  │                                                            │ │
│  │  📊 Feedback: 5-10 days 💰 ROI: $4K/mo   🔧 Med (4 wks)  │ │
│  │  💵 Capital: $500       📈 Win Rate: 80%+ completion     │ │
│  │                                                            │ │
│  │  [📖 View Details]  [✅ Approve & Build]  [❌ Reject]    │ │
│  └───────────────────────────────────────────────────────────┘ │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│  📋 ACTIVE ENGINES (In Progress)                                │
│  ┌───────────────────────────────────────────────────────────┐ │
│  │  🔵 Crypto Intel                          [View Dashboard] │ │
│  │  Status: Week 1 validation                                │ │
│  │  Paper Trading: $1,003.33 (+0.33%)                        │ │
│  │  Win Rate: 1/1 (100%) - Early                            │ │
│  │  Next Milestone: May 18 (13 days)                         │ │
│  └───────────────────────────────────────────────────────────┘ │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│  ✅ APPROVED & QUEUED                                           │
│  │ - Newsletter Predictor (approved 2026-05-05)               │
│  │   → Build starts after crypto Week 1 validation            │
│  │                                                             │
│  ❌ REJECTED IDEAS                                             │
│  │ - Stock Earnings Predictor (too risky, slow feedback)      │
│  └─────────────────────────────────────────────────────────────┘
└─────────────────────────────────────────────────────────────────┘
```

## Modal: View Details

When clicking **[📖 View Details]**:

```
┌─────────────────────────────────────────────────────────────────┐
│  Newsletter Subscriber Predictor                          [✕]   │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ⭐⭐⭐⭐⭐ Tier 1: High Conviction                               │
│                                                                 │
│  📝 ONE-LINE PITCH                                              │
│  Predicts which LinkedIn posts will drive newsletter signups,  │
│  optimizes content strategy for conversion vs. vanity metrics. │
│                                                                 │
│  🎯 CORE PREDICTION                                             │
│  Will this post drive 5+ newsletter subs within 48 hours?      │
│  ✓ Feedback: 48 hours                                          │
│  ✓ Timeline: Daily predictions                                 │
│                                                                 │
│  📊 DATA SOURCES (All Free)                                     │
│  • LinkedIn Analytics API                                       │
│  • Substack/beehiiv API (subscriber tracking)                  │
│  • Historical post performance                                  │
│  • Trending topics                                              │
│                                                                 │
│  🔄 SELF-IMPROVEMENT                                            │
│  Weekly:                                                        │
│  • Which topics drive subs vs. just likes?                     │
│  • Optimal post length for conversion                           │
│  • Best posting times                                           │
│  • Hook styles that convert                                     │
│                                                                 │
│  Monthly:                                                       │
│  • Content pillars that build audience                          │
│  • A/B test different CTAs                                      │
│  • Identify unique voice patterns                               │
│                                                                 │
│  💰 ROI MODEL                                                   │
│  Starting Capital: $0 (just time)                               │
│  Per-iteration: 30 min/post                                     │
│  Success Rate: 30% of posts drive 5+ subs                       │
│                                                                 │
│  Upside:                                                        │
│  Month 1: 90 posts → 27 convert → 135 subs                     │
│  Month 3: 90 posts → 60 convert → 300 subs (optimized)         │
│  At $10/mo avg: 500 subs = $5K MRR                             │
│                                                                 │
│  ⚠️ RISK ASSESSMENT                                             │
│  Low Risk: No money at stake, just time                         │
│  Failure Mode: Engagement but no subs → need better CTAs       │
│  Time to Validation: 30 days (90 posts)                         │
│                                                                 │
│  🔧 COMPLEXITY: Easy (1-2 weeks to build)                       │
│                                                                 │
│  🎯 FIRST MILESTONE                                             │
│  30-day MVP:                                                    │
│  • Post 3x/day for 30 days (90 posts)                          │
│  • Track which posts drive signups                              │
│  • Identify top 10 patterns                                     │
│  • Build model: "Posts about X with hook Y drive Z subs"       │
│                                                                 │
│  📅 NEXT STEPS IF APPROVED                                      │
│  Week 1: Build tracking (LinkedIn + Newsletter APIs)           │
│  Week 2-5: Post 3x/day, track conversions                      │
│  Week 5: First calibration                                      │
│  Week 6-9: Apply learnings, improve                             │
│  Week 9: Evaluate & decide                                      │
│                                                                 │
│  [✅ Approve & Build]  [⏸️ Queue for Later]  [❌ Reject]       │
└─────────────────────────────────────────────────────────────────┘
```

## API Endpoints

### GET /api/engine-ideas/pending
Returns new ideas awaiting review:

```json
{
  "ideas": [
    {
      "id": "newsletter-predictor-001",
      "name": "Newsletter Subscriber Predictor",
      "status": "pending",
      "tier": 1,
      "stars": 5,
      "one_liner": "Predict which LinkedIn posts drive newsletter signups",
      "feedback_loop": "48 hours",
      "roi_potential": "$5K MRR",
      "complexity": "Easy (1-2 weeks)",
      "capital_required": "$0",
      "success_rate_needed": "30%+",
      "generated_date": "2026-05-05",
      "details_file": "~/.openclaw/workspace/skills/engine-ideation/ENGINE-IDEAS-BATCH-001.md"
    }
  ]
}
```

### POST /api/engine-ideas/:id/approve
Approves an idea, moves to "queued" status:

```json
{
  "id": "newsletter-predictor-001",
  "action": "approve",
  "notes": "Start after crypto Week 1 validation"
}
```

Response:
```json
{
  "success": true,
  "message": "Newsletter Predictor approved",
  "status": "queued",
  "build_starts": "2026-05-13"
}
```

### POST /api/engine-ideas/:id/reject
Rejects an idea with reason:

```json
{
  "id": "earnings-predictor-005",
  "action": "reject",
  "reason": "Too risky, quarterly feedback too slow"
}
```

### GET /api/engine-ideas/active
Returns engines currently being built or validated:

```json
{
  "active": [
    {
      "id": "crypto-intel",
      "name": "Crypto Intel",
      "status": "validation",
      "week": 1,
      "paper_trading_balance": 1003.33,
      "win_rate": 100,
      "next_milestone": "2026-05-18",
      "days_until_milestone": 13
    }
  ]
}
```

### GET /api/engine-ideas/approved
Returns approved ideas in queue:

```json
{
  "queued": [
    {
      "id": "newsletter-predictor-001",
      "name": "Newsletter Predictor",
      "approved_date": "2026-05-05",
      "build_starts": "after crypto Week 1",
      "estimated_start": "2026-05-13"
    }
  ]
}
```

### GET /api/engine-ideas/rejected
Returns rejected ideas with reasons:

```json
{
  "rejected": [
    {
      "id": "earnings-predictor-005",
      "name": "Stock Earnings Predictor",
      "rejected_date": "2026-05-05",
      "reason": "Too risky, slow feedback loop"
    }
  ]
}
```

## Data Files

### Source: Engine Idea Markdown Files
Location: `~/.openclaw/workspace/skills/engine-ideation/`

Files:
- `ENGINE-IDEAS-BATCH-001.md` (generated today)
- `~/engine-ideas/weekly-2026-05-11.md` (weekly auto-generation)

### State: Ideas Status Tracker
Location: `~/.openclaw/workspace/skills/engine-ideation/ideas-state.json`

```json
{
  "pending": [
    {
      "id": "newsletter-predictor-001",
      "name": "Newsletter Subscriber Predictor",
      "tier": 1,
      "stars": 5,
      "generated": "2026-05-05",
      "source_file": "ENGINE-IDEAS-BATCH-001.md#idea-1"
    },
    {
      "id": "airbnb-optimizer-002",
      "name": "Airbnb Price Optimizer",
      "tier": 1,
      "stars": 5,
      "generated": "2026-05-05",
      "source_file": "ENGINE-IDEAS-BATCH-001.md#idea-4"
    }
  ],
  "approved": [
    {
      "id": "crypto-intel",
      "name": "Crypto Intel",
      "approved": "2026-05-04",
      "status": "active",
      "week": 1
    }
  ],
  "queued": [],
  "rejected": [
    {
      "id": "earnings-predictor-005",
      "name": "Stock Earnings Predictor",
      "rejected": "2026-05-05",
      "reason": "Too risky, slow feedback"
    }
  ]
}
```

## Frontend Implementation (Pseudocode)

### React Component: EngineIdeationHub

```jsx
import { useState, useEffect } from 'react';

function EngineIdeationHub() {
  const [pendingIdeas, setPendingIdeas] = useState([]);
  const [activeEngines, setActiveEngines] = useState([]);
  const [queuedIdeas, setQueuedIdeas] = useState([]);
  const [rejectedIdeas, setRejectedIdeas] = useState([]);
  const [selectedIdea, setSelectedIdea] = useState(null);
  
  useEffect(() => {
    // Load pending ideas
    fetch('/api/engine-ideas/pending')
      .then(res => res.json())
      .then(data => setPendingIdeas(data.ideas));
    
    // Load active engines
    fetch('/api/engine-ideas/active')
      .then(res => res.json())
      .then(data => setActiveEngines(data.active));
    
    // Load queued
    fetch('/api/engine-ideas/approved')
      .then(res => res.json())
      .then(data => setQueuedIdeas(data.queued));
    
    // Load rejected
    fetch('/api/engine-ideas/rejected')
      .then(res => res.json())
      .then(data => setRejectedIdeas(data.rejected));
  }, []);
  
  const handleApprove = async (ideaId, notes = '') => {
    const res = await fetch(`/api/engine-ideas/${ideaId}/approve`, {
      method: 'POST',
      body: JSON.stringify({ action: 'approve', notes })
    });
    
    if (res.ok) {
      // Move from pending to queued
      const idea = pendingIdeas.find(i => i.id === ideaId);
      setPendingIdeas(pendingIdeas.filter(i => i.id !== ideaId));
      setQueuedIdeas([...queuedIdeas, { ...idea, approved_date: new Date() }]);
    }
  };
  
  const handleReject = async (ideaId, reason) => {
    const res = await fetch(`/api/engine-ideas/${ideaId}/reject`, {
      method: 'POST',
      body: JSON.stringify({ action: 'reject', reason })
    });
    
    if (res.ok) {
      // Move from pending to rejected
      const idea = pendingIdeas.find(i => i.id === ideaId);
      setPendingIdeas(pendingIdeas.filter(i => i.id !== ideaId));
      setRejectedIdeas([...rejectedIdeas, { ...idea, rejected_date: new Date(), reason }]);
    }
  };
  
  return (
    <div className="engine-ideation-hub">
      <header>
        <h1>🚀 ENGINE IDEATION HUB</h1>
      </header>
      
      {/* New Ideas Section */}
      <section>
        <h2>💡 NEW IDEAS THIS WEEK</h2>
        {pendingIdeas.map(idea => (
          <IdeaCard 
            key={idea.id}
            idea={idea}
            onApprove={handleApprove}
            onReject={handleReject}
            onViewDetails={() => setSelectedIdea(idea)}
          />
        ))}
      </section>
      
      {/* Active Engines Section */}
      <section>
        <h2>📋 ACTIVE ENGINES (In Progress)</h2>
        {activeEngines.map(engine => (
          <ActiveEngineCard key={engine.id} engine={engine} />
        ))}
      </section>
      
      {/* Approved & Queued */}
      <section>
        <h3>✅ APPROVED & QUEUED</h3>
        {queuedIdeas.map(idea => (
          <QueuedIdeaItem key={idea.id} idea={idea} />
        ))}
      </section>
      
      {/* Rejected */}
      <section>
        <h3>❌ REJECTED IDEAS</h3>
        {rejectedIdeas.map(idea => (
          <RejectedIdeaItem key={idea.id} idea={idea} />
        ))}
      </section>
      
      {/* Details Modal */}
      {selectedIdea && (
        <IdeaDetailsModal 
          idea={selectedIdea}
          onClose={() => setSelectedIdea(null)}
          onApprove={handleApprove}
          onReject={handleReject}
        />
      )}
    </div>
  );
}
```

## Actions After Approval

When Sky clicks **[✅ Approve & Build]**:

1. **Update ideas-state.json:**
   ```json
   {
     "queued": [
       {
         "id": "newsletter-predictor-001",
         "approved_date": "2026-05-05T23:04:00Z",
         "approved_by": "Sky",
         "build_after": "crypto-week-1-validation",
         "estimated_start": "2026-05-13"
       }
     ]
   }
   ```

2. **Notify Nova via HEARTBEAT:**
   - Check `ideas-state.json` for approved items
   - If conditions met (e.g., "crypto week 1 complete"), start building

3. **Create build directory:**
   ```bash
   mkdir -p ~/.openclaw/workspace/skills/newsletter-predictor
   cp templates/ENGINE-TEMPLATE.md skills/newsletter-predictor/SKILL.md
   ```

4. **Kick off MVP:**
   - Week 1: Build tracking integrations
   - Weeks 2-5: Run validation
   - Week 5: Calibration
   - Week 9: Decision

## Integration with Existing Dashboard

### Remove:
- Current "Overview" page (PropSprint moved to Notion)

### Add:
- `/` (home) → Engine Ideation Hub
- `/crypto` → Crypto Intel (existing paper trading screen)
- `/costs` → Cost tracking (existing)
- `/settings` → Settings

### Navigation:
```
┌─────────────────────────────────────┐
│ Sky's Mission Control      [@Nova] │
├─────────────────────────────────────┤
│ 🚀 Engines         (NEW - default)  │
│ 💰 Crypto Intel                     │
│ 💵 Costs                            │
│ ⚙️  Settings                        │
└─────────────────────────────────────┘
```

## Summary

**Changes:**
1. **Replace Overview page** → Engine Ideation Hub
2. **PropSprint** → Managed separately in Notion (no longer in dashboard)
3. **New default landing** → Engine ideas for review
4. **Approve/Reject** → One-click from dashboard

**Data Flow:**
```
Nova generates ideas (weekly)
  ↓
Write to markdown files
  ↓
Dashboard reads + displays
  ↓
Sky approves/rejects via UI
  ↓
State saved to ideas-state.json
  ↓
Nova checks state, builds approved ideas
```

**Next Steps:**
1. Create `ideas-state.json` (state tracker)
2. Build API endpoints in Mission Control
3. Replace Overview page with Engine Ideation Hub
4. Test approve/reject workflow

---

**Status:** Design complete, ready to implement  
**Files:** `skills/engine-ideation/DASHBOARD-INTEGRATION.md` (this file)
