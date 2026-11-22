#!/usr/bin/env bash
# Renders every Week 1 frame to week01-reel/export/*.png at 1080x1920 with Edge headless.
# Overlay frames (o-*) come out with a transparent background.
set -euo pipefail
cd "$(dirname "$0")"
EDGE="/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"
SRC="file:///$(pwd -W)/frames.html"
OUT="$(pwd -W)/../export"
PROFILE="$(mktemp -d)"
for f in cover diary o-felt o-did o-officer o-split end; do
  "$EDGE" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
    --user-data-dir="$PROFILE" --default-background-color=00000000 \
    --window-size=1080,1920 --virtual-time-budget=3000 \
    --screenshot="$OUT/w01_$f.png" "$SRC?f=$f" 2>/dev/null
  echo "rendered w01_$f.png"
done
rm -rf "$PROFILE"
