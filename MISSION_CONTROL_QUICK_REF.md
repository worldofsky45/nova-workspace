# Mission Control Dashboard - Quick Reference

## 🚀 Open Dashboard
```bash
open ~/.openclaw/workspace/mission-control.html
```

## 📊 Quick Commands

### Helper Script
```bash
cd ~/.openclaw/workspace
./update-mission-control.sh [command]
```

### Add Polymarket Signal
```bash
./update-mission-control.sh add-polymarket-signal \
  "Market name" YES 80 0.65 100
```

### Add ROI Project  
```bash
./update-mission-control.sh add-roi-project \
  "Project Name" 1000 "Description"
```

### Open Dashboard
```bash
./update-mission-control.sh open-dashboard
```

### Serve Locally
```bash
./update-mission-control.sh serve-dashboard 8080
```

## 📂 Data Files

| File | Purpose |
|------|---------|
| `mission-control.html` | Main dashboard |
| `polymarket-signals.jsonl` | Polymarket predictions |
| `roi-tracker.jsonl` | ROI tracking |
| `crypto-intel/paper-trading/trades.jsonl` | Paper trading |

## 🔄 Manual Updates

### Update Polymarket Signal
Edit `polymarket-signals.jsonl` and update the line:
```json
{"timestamp":"...","market":"...","status":"resolved","correct":true,"pnl":35.50}
```

### Update ROI
Edit `roi-tracker.jsonl` and change the `roi` value:
```json
{"timestamp":"...","name":"Project","invested":1000,"roi":350,"status":"active"}
```

## 🎯 What's Tracked

- ✅ Paper Trading P&L (auto-synced)
- ✅ Polymarket Signals & Accuracy
- ✅ ROI Tracker (all projects)
- ✅ System Health
- ✅ Live crypto prices

## 📱 Auto-Refresh
Dashboard refreshes every 60 seconds automatically.

---
**Full docs**: `MISSION_CONTROL_README.md`
