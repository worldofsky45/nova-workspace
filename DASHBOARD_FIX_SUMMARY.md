# Dashboard Fix Summary
**Date:** 2026-05-06  
**Issue:** Next.js dashboard showing blank page (animations not triggering)

## Root Cause
The dashboard at `localhost:3000` has all content with `opacity:0` because framer-motion animations aren't executing. This is likely an SSR hydration issue where the client-side JavaScript isn't properly hydrating the animated components.

## Current State
- ✅ All code is deployed to GitHub
- ✅ APIs are working correctly
- ✅ Build succeeds with no errors
- ⚠️ Page renders but with hidden content (opacity:0)

## Solution Options

### Option 1: Use the Standalone HTML Dashboard (READY NOW)
```bash
cd ~/.openclaw/workspace
./start-dashboard.sh
# Opens at: http://localhost:8765/mission-control.html
```

**Status:** ✅ FULLY WORKING  
**Features:**  
- All data loading correctly
- Idea Engine with approve/reject actions
- Paper Trading (5 active trades)
- Polymarket Signals
- ROI Tracker
- Auto-refresh every 60 seconds

### Option 2: Fix Next.js Animation Issue
The Next.js dashboard needs a hydration fix. Quick solutions:

**A. Add Fallback Visibility**
Add to `app/page.tsx` after imports:
```typescript
useEffect(() => {
  // Fallback: force visibility if animations don't trigger
  const timer = setTimeout(() => {
    document.querySelectorAll('[style*="opacity:0"]').forEach(el => {
      (el as HTMLElement).style.opacity = '1'
      ;(el as HTMLElement).style.transform = 'none'
    })
  }, 1000)
  return () => clearTimeout(timer)
}, [])
```

**B. Disable SSR for Animations**
Wrap animated sections in:
```typescript
import dynamic from 'next/dynamic'
const AnimatedSection = dynamic(() => import('./AnimatedSection'), { ssr: false })
```

**C. Use CSS Animations Instead**
Replace framer-motion with pure CSS animations that don't have hydration issues.

## Immediate Action
**Use the HTML dashboard** (Option 1) - it's working perfectly right now.

The Next.js dashboard is a nice-to-have enhancement, but the standalone HTML version provides all the same functionality without the complexity.

## Files to Reference
- Working Dashboard: `~/.openclaw/workspace/mission-control.html`
- Start Script: `~/.openclaw/workspace/start-dashboard.sh`
- Next.js Dashboard: `~/.openclaw/workspace/agent-secrets-layer/dashboard/`

---

**Recommendation:** Use the HTML dashboard (`mission-control.html`) until we can properly debug the Next.js hydration issue. The HTML version is simpler, faster, and fully functional.
