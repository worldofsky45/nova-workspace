# Sky's Mission Control Dashboard

## 📍 Location
**Dashboard**: `/Users/sky/.openclaw/workspace/mission-control.html`

Open directly in your browser or serve locally.

## 🎯 What It Tracks

### 1. Paper Trading Status & P&L
- **Data Source**: `./crypto-intel/paper-trading/trades.jsonl`
- **Hero Stats**: Total P&L, Win Rate, Risk/Reward Ratio
- **Active Trades**: Shows up to 5 current positions with real-time P&L
- **Auto-fetches**: Live crypto prices from CoinGecko API

### 2. Polymarket Signals & Performance
- **Data Source**: `./polymarket-signals.jsonl`
- **Tracks**: Prediction accuracy, active signals, P&L
- **Signal Format**:
```json
{
  "timestamp": "2026-05-06T09:58:00-05:00",
  "market": "Market name",
  "prediction": "YES or NO",
  "confidence": 75,
  "entry_odds": "0.65",
  "current_odds": "0.70",
  "position_size": 100,
  "status": "active|resolved",
  "correct": true,
  "pnl": 25.50
}
```

### 3. ROI Tracker
- **Data Source**: `./roi-tracker.jsonl`
- **Tracks**: All monetizable projects and their returns
- **Project Format**:
```json
{
  "timestamp": "2026-05-06T09:58:00-05:00",
  "name": "Project Name",
  "invested": 500,
  "roi": 150,
  "description": "Brief description",
  "status": "active|completed|paused"
}
```

### 4. System Health
- **Real-time Status**: Data sync, API connectivity
- **Health Indicator**: Green (healthy), Yellow (warning), Red (critical)
- **Auto-detects**: Missing data files, API failures

## 📝 How to Update Data

### Add a Polymarket Signal
```bash
echo '{"timestamp":"'$(date -u +"%Y-%m-%dT%H:%M:%S%z")'","market":"Your Market","prediction":"YES","confidence":80,"entry_odds":"0.60","position_size":100,"status":"active"}' >> polymarket-signals.jsonl
```

### Resolve a Polymarket Signal
1. Find the signal in `polymarket-signals.jsonl`
2. Update the line:
```json
{"timestamp":"...","market":"Your Market","prediction":"YES","confidence":80,"entry_odds":"0.60","current_odds":"0.75","position_size":100,"status":"resolved","correct":true,"pnl":25.00}
```

### Add an ROI Project
```bash
echo '{"timestamp":"'$(date -u +"%Y-%m-%dT%H:%M:%S%z")'","name":"New Project","invested":1000,"roi":0,"description":"Project description","status":"active"}' >> roi-tracker.jsonl
```

### Update ROI
1. Find the project in `roi-tracker.jsonl`
2. Update the `roi` value (can be negative)
```json
{"timestamp":"2026-05-06T10:00:00-05:00","name":"Project Name","invested":1000,"roi":350,"description":"Description","status":"active"}
```

## 🔄 Auto-Refresh
- Dashboard auto-refreshes every 60 seconds
- Fetches live crypto prices for active trades
- No manual refresh needed

## 🎨 Features
- **Responsive Design**: Works on desktop and mobile
- **Real-time Updates**: Live crypto prices via CoinGecko
- **Visual Indicators**: Color-coded P&L (green = profit, red = loss)
- **System Health Bar**: Shows overall status at a glance
- **Empty States**: Graceful handling when no data exists

## 🚀 Quick Start
```bash
# Open dashboard
open /Users/sky/.openclaw/workspace/mission-control.html

# Or serve locally
cd /Users/sky/.openclaw/workspace
python3 -m http.server 8080
# Then visit: http://localhost:8080/mission-control.html
```

## 📊 Data Flow
```
Paper Trading → trades.jsonl → Dashboard
                 ↓
            (Auto-synced)

Polymarket → polymarket-signals.jsonl → Dashboard
             ↓
        (Manual updates for now)

ROI Projects → roi-tracker.jsonl → Dashboard
               ↓
          (Manual updates)
```

## 🔮 Future Enhancements
- [ ] Automated Polymarket signal updates
- [ ] Historical P&L charts
- [ ] Push notifications for major events
- [ ] ROI trend graphs
- [ ] Multi-timeframe views (daily/weekly/monthly)

## 🐛 Troubleshooting

### Dashboard shows "No data"
- Check if data files exist: `ls -la *.jsonl`
- Verify JSONL format (one JSON object per line, no commas between)

### Prices not updating
- Check browser console for API errors
- CoinGecko has rate limits (50 calls/min free tier)

### Health indicator shows error
- Check browser console for specific errors
- Verify all data file paths are correct
