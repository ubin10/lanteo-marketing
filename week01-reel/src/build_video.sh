#!/usr/bin/env bash
# Builds the Week 1 reel (1080x1920, 30s, 30fps) from the rendered frames in ../export
# and clips of the LS-review walkthrough recording.
#
#   bash build_video.sh "<path to EdgeKeeper walkthrough (edited).mp4>" "<output.mp4>"
#
# The recording predates the rebrand: its header shows the EdgeKeeper logo, the
# app.edgekeeper.io address bar and the "EdgeKeeper Sample" account name. Every crop
# below starts BELOW y=128 (the app header) and right of x=134 (the sidebar), so none
# of that is ever in frame. Keep it that way if you change a crop.
#
# Source timestamps (edited walkthrough, 197.6s):
#   31.0-34.0   dashboard (KPI cards + status line + equity curve), static
#   45.0-47.0   scroll from the equity curve down to the P&L calendar
#   51.5-53.5   P&L calendar + Day Focus, static (Sep 16 selected)
#   124.5       AI Risk Officer page, scrolled to Immediate actions + Compliance (still frame)
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

# 1. 0:00-0:06 diary page, slow push-in; "felt" plate for the first 3.5s (placed low, off the writing)
q -loop 1 -t 6 -i $EX/w01_diary.png -loop 1 -t 6 -i $EX/w01_o-felt.png -filter_complex \
 "[0]scale=2160:3840,zoompan=z='1+0.06*on/180':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1080x1920:fps=30[bg];
  [bg][1]overlay=0:800:enable='lt(t,3.5)'" -t 6 "${ENC[@]}" "$TMP/s1.mp4"

# 2. 0:06-0:09 dashboard + "did" plate
q -f lavfi -i color=c=$INK:s=1080x1920:r=30:d=3 -ss 31 -t 3 -i "$SRC" -loop 1 -t 3 -i $EX/w01_o-did.png -filter_complex \
 "[1]crop=566:432:148:145,scale=1080:-2:flags=lanczos[v];[0][v]overlay=0:700[a];[a][2]overlay=0:0" -t 3 "${ENC[@]}" "$TMP/s2.mp4"

# 3a. 0:09-0:11 scroll down to the calendar
q -f lavfi -i color=c=$INK:s=1080x1920:r=30:d=2 -ss 45 -t 2 -i "$SRC" -filter_complex \
 "[1]crop=1110:590:148:130,scale=1080:-2:flags=lanczos[v];[0][v]overlay=0:(H-h)/2" -t 2 "${ENC[@]}" "$TMP/s3a.mp4"
# 3b. 0:11-0:13 P&L calendar punch-in
q -f lavfi -i color=c=$INK:s=1080x1920:r=30:d=2 -ss 51.5 -t 2 -i "$SRC" -filter_complex \
 "[1]crop=658:456:150:182,scale=1080:-2:flags=lanczos[v];[0][v]overlay=0:(H-h)/2" -t 2 "${ENC[@]}" "$TMP/s3b.mp4"
# 3c. 0:13-0:15 Day Focus punch-in
q -f lavfi -i color=c=$INK:s=1080x1920:r=30:d=2 -ss 51.5 -t 2 -i "$SRC" -filter_complex \
 "[1]crop=438:323:820:182,scale=900:-2:flags=lanczos[v];[0][v]overlay=(W-w)/2:(H-h)/2" -t 2 "${ENC[@]}" "$TMP/s3c.mp4"

# 4. 0:15-0:22 AI Risk Officer: still frame, pans from Immediate actions to Compliance (which cites the trades)
q -ss 124.5 -i "$SRC" -frames:v 1 "$TMP/officer.png"
q -f lavfi -i color=c=$INK:s=1080x1920:r=30:d=7 -loop 1 -t 7 -i "$TMP/officer.png" -loop 1 -t 7 -i $EX/w01_o-officer.png -filter_complex \
 "[1]crop=w=560:h=228:x='150+548*min(max((t-1)/4.5\,0)\,1)':y=163,scale=1080:-2:flags=lanczos[v];[0][v]overlay=0:620[a];[a][2]overlay=0:0" -t 7 "${ENC[@]}" "$TMP/s4.mp4"

# 5. 0:22-0:26 split: journal page on top, the measured calendar below
q -ss 52.5 -i "$SRC" -frames:v 1 "$TMP/cal.png"
q -f lavfi -i color=c=$INK:s=1080x1920:r=30:d=4 -loop 1 -t 4 -i $EX/w01_diary.png -loop 1 -t 4 -i "$TMP/cal.png" -loop 1 -t 4 -i $EX/w01_o-split.png -filter_complex \
 "[1]crop=1080:870:0:460[top];[2]crop=658:428:150:210,scale=1080:-2:flags=lanczos[bot];
  [0][top]overlay=0:0[a];[a][bot]overlay=0:1170[b];[b][3]overlay=0:0" -t 4 "${ENC[@]}" "$TMP/s5.mp4"

# 6. 0:26-0:30 end card
q -loop 1 -t 4 -i $EX/w01_end.png -vf "fade=t=in:st=0:d=0.3:color=$INK" -t 4 "${ENC[@]}" "$TMP/s6.mp4"

# join + silent stereo track (platforms expect audio; add VO/music in the editor or app)
printf "file '%s'\n" s1.mp4 s2.mp4 s3a.mp4 s3b.mp4 s3c.mp4 s4.mp4 s5.mp4 s6.mp4 > "$TMP/list.txt"
q -f concat -safe 0 -i "$TMP/list.txt" -f lavfi -i anullsrc=r=48000:cl=stereo \
  -c:v copy -c:a aac -b:a 128k -shortest -movflags +faststart "$OUT"
rm -rf "$TMP"
echo "wrote $OUT"
