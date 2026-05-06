#!/bin/bash
# Mission Control Dashboard - Data Update Helper
# Usage: ./update-mission-control.sh [command] [args...]

set -e

WORKSPACE="/Users/sky/.openclaw/workspace"
POLYMARKET_FILE="$WORKSPACE/polymarket-signals.jsonl"
ROI_FILE="$WORKSPACE/roi-tracker.jsonl"

# Get current timestamp in ISO format
timestamp() {
    date -u +"%Y-%m-%dT%H:%M:%S%z"
}

# Command: add-polymarket-signal
add_polymarket_signal() {
    local market="$1"
    local prediction="$2"
    local confidence="$3"
    local entry_odds="$4"
    local position_size="$5"
    
    if [[ -z "$market" || -z "$prediction" || -z "$confidence" || -z "$entry_odds" || -z "$position_size" ]]; then
        echo "❌ Usage: $0 add-polymarket-signal <market> <YES|NO> <confidence> <entry_odds> <position_size>"
        echo "Example: $0 add-polymarket-signal 'Trump wins 2024' YES 75 0.65 100"
        exit 1
    fi
    
    echo "{\"timestamp\":\"$(timestamp)\",\"market\":\"$market\",\"prediction\":\"$prediction\",\"confidence\":$confidence,\"entry_odds\":\"$entry_odds\",\"position_size\":$position_size,\"status\":\"active\"}" >> "$POLYMARKET_FILE"
    echo "✅ Added Polymarket signal: $market"
}

# Command: resolve-polymarket-signal
resolve_polymarket_signal() {
    local market="$1"
    local correct="$2"
    local pnl="$3"
    local current_odds="${4:-N/A}"
    
    if [[ -z "$market" || -z "$correct" || -z "$pnl" ]]; then
        echo "❌ Usage: $0 resolve-polymarket-signal <market> <true|false> <pnl> [current_odds]"
        echo "Example: $0 resolve-polymarket-signal 'Trump wins 2024' true 35.50 0.75"
        exit 1
    fi
    
    # This is simplified - in reality you'd want to update the existing line
    # For now, we'll append a resolved version
    echo "⚠️  Manual step required: Edit $POLYMARKET_FILE"
    echo "   Find the signal for '$market' and update its status to 'resolved'"
    echo "   Add: \"correct\":$correct,\"pnl\":$pnl,\"current_odds\":\"$current_odds\""
}

# Command: add-roi-project
add_roi_project() {
    local name="$1"
    local invested="$2"
    local description="$3"
    
    if [[ -z "$name" || -z "$invested" ]]; then
        echo "❌ Usage: $0 add-roi-project <name> <invested> [description]"
        echo "Example: $0 add-roi-project 'Luxury Arbitrage' 5000 'Buy/sell luxury goods'"
        exit 1
    fi
    
    description="${description:-No description}"
    
    echo "{\"timestamp\":\"$(timestamp)\",\"name\":\"$name\",\"invested\":$invested,\"roi\":0,\"description\":\"$description\",\"status\":\"active\"}" >> "$ROI_FILE"
    echo "✅ Added ROI project: $name"
}

# Command: update-roi
update_roi() {
    local name="$1"
    local roi="$2"
    
    if [[ -z "$name" || -z "$roi" ]]; then
        echo "❌ Usage: $0 update-roi <name> <roi_value>"
        echo "Example: $0 update-roi 'Luxury Arbitrage' 350.50"
        exit 1
    fi
    
    echo "⚠️  Manual step required: Edit $ROI_FILE"
    echo "   Find the project '$name' and update its 'roi' value to $roi"
}

# Command: open-dashboard
open_dashboard() {
    open "$WORKSPACE/mission-control.html"
    echo "✅ Opened Mission Control Dashboard"
}

# Command: serve-dashboard
serve_dashboard() {
    local port="${1:-8080}"
    echo "🚀 Serving Mission Control Dashboard at http://localhost:$port/mission-control.html"
    cd "$WORKSPACE" && python3 -m http.server "$port"
}

# Command: help
show_help() {
    cat <<EOF
📊 Mission Control Dashboard - Data Update Helper

COMMANDS:
  add-polymarket-signal <market> <YES|NO> <confidence> <entry_odds> <position_size>
      Add a new Polymarket prediction signal
      
  resolve-polymarket-signal <market> <true|false> <pnl> [current_odds]
      Mark a Polymarket signal as resolved (manual edit required)
      
  add-roi-project <name> <invested> [description]
      Add a new ROI tracking project
      
  update-roi <name> <roi_value>
      Update ROI for a project (manual edit required)
      
  open-dashboard
      Open the dashboard in your default browser
      
  serve-dashboard [port]
      Start a local web server (default port: 8080)
      
  help
      Show this help message

EXAMPLES:
  # Add a Polymarket signal
  $0 add-polymarket-signal "Bitcoin hits 100k by EOY" YES 80 0.65 200
  
  # Add an ROI project
  $0 add-roi-project "Domain Flipping" 1000 "Buy and sell premium domains"
  
  # Open the dashboard
  $0 open-dashboard
  
  # Serve locally
  $0 serve-dashboard 9000

DATA FILES:
  Polymarket: $POLYMARKET_FILE
  ROI:        $ROI_FILE
  Dashboard:  $WORKSPACE/mission-control.html
  
  Full documentation: $WORKSPACE/MISSION_CONTROL_README.md
EOF
}

# Main command router
case "${1:-help}" in
    add-polymarket-signal)
        add_polymarket_signal "$2" "$3" "$4" "$5" "$6"
        ;;
    resolve-polymarket-signal)
        resolve_polymarket_signal "$2" "$3" "$4" "$5"
        ;;
    add-roi-project)
        add_roi_project "$2" "$3" "$4"
        ;;
    update-roi)
        update_roi "$2" "$3"
        ;;
    open-dashboard|open)
        open_dashboard
        ;;
    serve-dashboard|serve)
        serve_dashboard "$2"
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        echo "❌ Unknown command: $1"
        echo "Run '$0 help' for usage information"
        exit 1
        ;;
esac
