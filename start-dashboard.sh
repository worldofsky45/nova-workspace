#!/bin/bash
# Start Mission Control Dashboard Server
# Usage: ./start-dashboard.sh

cd /Users/sky/.openclaw/workspace

echo "🚀 Starting Mission Control Dashboard..."
echo "📍 Server will be available at: http://localhost:8765"
echo "📂 Serving from: $(pwd)"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Kill any existing server on port 8765
lsof -ti:8765 | xargs kill -9 2>/dev/null

# Start Python HTTP server
python3 -m http.server 8765 --bind 127.0.0.1
