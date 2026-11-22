#!/usr/bin/env bash
# Builds the Week 1 reel (1080x1920, 30s, 30fps) from the rendered frames in ../export
# and clips of a Lanteo Sample-account screen recording.
#
#   bash build_video.sh "<recording.mp4>" "<output.mp4>"
#
# SOURCE: D:\Videos\2026-11-23 00-44-03.mp4 (1920x1080, Chrome full screen, 110s).
# Its app header shows the operator's user name and an ADMIN badge, so every crop
# starts BELOW y=90 (the header) and right of x=250 (the sidebar). Keep it that way.
# (v1 of this reel used the pre-rebrand LS-review walkthrough; see git history.)
#
# Source timestamps:
#   0.5-3.0    dashboard top (KPI cards, status line, equity curve), still
#   3.2-6.2    scroll down to the P&L calendar (played 1.5x)
#   9.3-11.8   calendar: hover on Aug 18, click at ~11.3
#   12.0-15.0  Day Focus showing Tue Aug 18: -$218.20, 10 trades, 30% win rate
#   16.5       calendar with Aug 18 selected, pointer outside the panel (still)
#   48.6-53.0  AI Risk Officer: Immediate actions + Compliance (cites trade ids), held
set -euo pipefail
SRC="$1"; OUT="$2"
cd "$(dirname "$0")"
FFDIR="/c/Users/Lenovo/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-9.0.1-full_build/bin"
FF="$FFDIR/ffmpeg"; [ -x "$FF" ] || FF=ffmpeg
EX=../export
TMP="$(mktemp -d)"
INK=0x080E18
ENC=(-c:v libx264 -preset medium -crf 17 -pix_fmt yuv420p -r 30 -an)
q(){ "$FF" -v error -y "$@"; }
bg(){ echo "color=c=$INK:s=1080x1920:r=30:d=$1"; }

# 1. 0:00-0:05.5 diary page (dated Aug 18 = the red day shown later), slow push-in;
#    "felt" plate for the first 3.5s, placed low so it does not cover the writing
q -loop 1 -t 5.5 -i $EX/w01_diary.png -loop 1 -t 5.5 -i $EX/w01_o-felt.png -filter_complex \
 "[0]scale=2160:3840,zoompan=z='1+0.05*on/165':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1080x1920:fps=30[bg];
  [bg][1]overlay=0:800:enable='lt(t,3.5)'" -t 5.5 "${ENC[@]}" "$TMP/s1.mp4"

# 2. 0:05.5-0:08 dashboard + "did" plate
q -f lavfi -i "$(bg 2.5)" -ss 0.5 -t 2.5 -i "$SRC" -loop 1 -t 2.5 -i $EX/w01_o-did.png -filter_complex \
 "[1]crop=948:796:280:112,scale=1080:-2:flags=lanczos[v];[0][v]overlay=0:690[a];[a][2]overlay=0:0" -t 2.5 "${ENC[@]}" "$TMP/s2.mp4"

# 3a. 0:08-0:10 scroll to the calendar (1.5x)
q -f lavfi -i "$(bg 2)" -ss 3.2 -t 3 -i "$SRC" -filter_complex \
 "[1]setpts=PTS/1.5,crop=1600:990:280:90,scale=1080:-2:flags=lanczos[v];[0][v]overlay=0:(H-h)/2" -t 2 "${ENC[@]}" "$TMP/s3a.mp4"
# 3b. 0:10-0:12.5 calendar: hover, then click the red Aug 18
q -f lavfi -i "$(bg 2.5)" -ss 9.3 -t 2.5 -i "$SRC" -filter_complex \
 "[1]crop=944:980:282:96,scale=1080:-2:flags=lanczos[v];[0][v]overlay=0:(H-h)/2" -t 2.5 "${ENC[@]}" "$TMP/s3b.mp4"
# 3c. 0:12.5-0:15.5 Day Focus: -$218.20
q -f lavfi -i "$(bg 3)" -ss 12.0 -t 3 -i "$SRC" -filter_complex \
 "[1]crop=632:600:1248:96,scale=1000:-2:flags=lanczos[v];[0][v]overlay=(W-w)/2:(H-h)/2" -t 3 "${ENC[@]}" "$TMP/s3c.mp4"

# 4. 0:15.5-0:22 AI Risk Officer: pans from Immediate actions to Compliance; last frame held
q -f lavfi -i "$(bg 6.5)" -ss 48.6 -t 4.4 -i "$SRC" -loop 1 -t 6.5 -i $EX/w01_o-officer.png -filter_complex \
 "[1]tpad=stop_mode=clone:stop_duration=2.1,crop=w=790:h=502:x='280+810*min(max((t-1.5)/3.5\,0)\,1)':y=318,scale=1080:-2:flags=lanczos[v];
  [0][v]overlay=0:420[a];[a][2]overlay=0:0" -t 6.5 "${ENC[@]}" "$TMP/s4.mp4"

# 5. 0:22-0:26 split: the journal page on top, the same day measured below
q -ss 16.5 -i "$SRC" -frames:v 1 "$TMP/cal.png"
q -f lavfi -i "$(bg 4)" -loop 1 -t 4 -i $EX/w01_diary.png -loop 1 -t 4 -i "$TMP/cal.png" -loop 1 -t 4 -i $EX/w01_o-split.png -filter_complex \
 "[1]crop=1080:870:0:460[top];[2]crop=944:500:282:564,scale=1080:-2:flags=lanczos[bot];
  [0][top]overlay=0:0[a];[a][bot]overlay=0:1170[b];[b][3]overlay=0:0" -t 4 "${ENC[@]}" "$TMP/s5.mp4"

# 6. 0:26-0:30 end card
q -loop 1 -t 4 -i $EX/w01_end.png -vf "fade=t=in:st=0:d=0.3:color=$INK" -t 4 "${ENC[@]}" "$TMP/s6.mp4"

# join + silent stereo track (platforms expect audio; add VO/music in the editor or app)
printf "file '%s'\n" s1.mp4 s2.mp4 s3a.mp4 s3b.mp4 s3c.mp4 s4.mp4 s5.mp4 s6.mp4 > "$TMP/list.txt"
q -f concat -safe 0 -i "$TMP/list.txt" -f lavfi -i anullsrc=r=48000:cl=stereo \
  -c:v copy -c:a aac -b:a 128k -shortest -movflags +faststart "$OUT"
rm -rf "$TMP"
echo "wrote $OUT"
