#!/usr/bin/env bash
# Renders profile images to ../export/ with Edge headless.
set -euo pipefail
cd "$(dirname "$0")"
EDGE="/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"
OUT="$(pwd -W)/../export"; PROFILE="$(mktemp -d)"; mkdir -p ../export
"$EDGE" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
  --user-data-dir="$PROFILE" --window-size=1500,500 --virtual-time-budget=3000 \
  --screenshot="$OUT/x-banner.png" "file:///$(pwd -W)/x-banner.html" 2>/dev/null
echo "rendered x-banner.png"
rm -rf "$PROFILE"
