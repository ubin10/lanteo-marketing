#!/usr/bin/env bash
# Renders the text frames to ../export/*.png (1080x1920) with Edge headless.
set -euo pipefail
cd "$(dirname "$0")"
EDGE="/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"
SRC="file:///$(pwd -W)/frames.html"; OUT="$(pwd -W)/../export"; PROFILE="$(mktemp -d)"
for f in o-t1 o-t2 risk; do
  "$EDGE" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
    --user-data-dir="$PROFILE" --default-background-color=00000000 \
    --window-size=1080,1920 --virtual-time-budget=3000 \
    --screenshot="$OUT/rr_$f.png" "$SRC?f=$f" 2>/dev/null
  echo "rendered rr_$f.png"
done
rm -rf "$PROFILE"
