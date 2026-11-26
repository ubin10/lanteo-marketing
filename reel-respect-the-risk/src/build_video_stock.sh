#!/usr/bin/env bash
# "Respect the risk" reel, v2: REAL footage. ~10.5s, 1080x1920, 30fps, with sound.
#
#   bash build_video_stock.sh "<pexels 38771111 1080p.mp4>" "<AI ride clip.mp4>" "<output.mp4>"
#
# PICTURE: Pexels video 38771111 "Scenic motorcycle ride on curved mountain road"
#   by Kibo (Pexels licence: free to use, no attribution required), 1920x1080 29.97fps,
#   54.9s, NO audio track. Cropped to the centre 608x1080 and enlarged to 1080x1920
#   with a light sharpen. The speedometer (about 70-85 km/h) stays visible on purpose:
#   a normal road speed, not a reckless one.
# SOUND: the engine is borrowed from the Canva AI clip (the operator's own asset),
#   time-stretched to fit; the impact is synthesised. No third-party audio.
#
#   A1 src 0.0-3.0   x1.15  a bend                         "Two good corners."
#   A2 src 6.5-7.3 + 7.3-8.5 x1.15  hard lean into a left (two shots) "Two good corners."
#   C  src 26.5-29.6 x1.30  sharp left, arriving fast       "Then the one you didn't slow down for."
#   D  src 29.6-30.5 x1.20  runs wide at the grass verge + roll/shake/zoom/smear (same)
#   E  1.6s black: impact, then silence; "Respect the risk." fades in
#   F  1.4s Lanteo end card (Week 1's)
set -euo pipefail
SRC="$1"; AI="$2"; OUT="$3"
cd "$(dirname "$0")"
FFDIR="/c/Users/Lenovo/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-9.0.1-full_build/bin"
FF="$FFDIR/ffmpeg"; [ -x "$FF" ] || FF=ffmpeg
EX=../export; END=../../week01-reel/export/w01_end.png
SR=32000   # AI clip audio sample rate
FIT="crop=608:1080:(iw-608)/2:0,scale=1080:1920:flags=lanczos,unsharp=5:5:0.6,fps=30,setsar=1,format=yuv420p"
calc(){ awk "BEGIN{print $1}"; }
TA=$(calc "3.0/1.15+2.0/1.15")            # length of A1+A2 = end of "Two good corners."
TC=$(calc "3.1/1.3+0.9/1.2")              # length of C+D
# engine bed: AI 0.3-(0.3+TA*1.2) at x1.2 under A; AI 11.0-14.9 stretched to TC under C+D
AE=$(calc "0.3+$TA*1.2"); KC=$(calc "3.9/$TC")

# v <label> <start> <end> <speed> <crop x>: the crop x is chosen per shot so the road
# stays in frame and the rear-view mirror sits at the edge (a centre crop put the
# mirror across a third of the screen).
v(){ echo "[v$1]trim=start=$2:end=$3,setpts=(PTS-STARTPTS)/$4,crop=608:1080:$5:0,${FIT#*:0,}"; }

"$FF" -v error -y \
  -i "$SRC" -i "$AI" \
  -loop 1 -t 12 -i $EX/rr_o-t1.png -loop 1 -t 12 -i $EX/rr_o-t2.png \
  -loop 1 -t 1.6 -i $EX/rr_risk.png -loop 1 -t 1.4 -i "$END" \
  -f lavfi -t 1.6 -i "sine=frequency=52:sample_rate=48000" \
  -f lavfi -t 1.6 -i "anoisesrc=color=pink:sample_rate=48000:amplitude=0.9" \
  -f lavfi -t 1.4 -i "anullsrc=r=48000:cl=stereo" \
  -filter_complex "
  [0:v]split=5[v1][v2][v6][v3][v4];
  $(v 1 0.0 3.0 1.15 300)[A1];
  $(v 2 6.5 7.3 1.15 960)[A2a];
  $(v 6 7.3 8.5 1.15 150)[A2b];
  $(v 3 26.5 29.6 1.3 820)[C];
  $(v 4 29.6 30.5 1.2 820),rotate='0.8*min(t/0.75\,1)':c=black,
    zoompan=z='1.32+0.03*on':x='iw/2-(iw/zoom/2)+30*sin(on*2.1)':y='ih/2-(ih/zoom/2)+24*cos(on*2.7)':d=1:s=1080x1920:fps=30,
    tmix=frames=3,setsar=1,format=yuv420p[D];
  [A1][A2a][A2b][C][D]concat=n=5:v=1:a=0[fv];
  [fv][2]overlay=0:0:shortest=1:enable='lt(t,$TA)'[fv1];
  [fv1][3]overlay=0:0:shortest=1:enable='gte(t,$TA)'[foot];
  [1:a]asplit=2[e1][e2];
  [e1]atrim=start=0.3:end=$AE,asetpts=PTS-STARTPTS,asetrate=$SR*1.2,aresample=48000[eA];
  [e2]atrim=start=11.0:end=14.9,asetpts=PTS-STARTPTS,asetrate=$SR*$KC,aresample=48000[eC];
  [eA][eC]concat=n=2:v=0:a=1,volume=0.85,aformat=sample_rates=48000:channel_layouts=stereo[footA];
  [4]fps=30,setsar=1,format=yuv420p,fade=t=in:st=0.35:d=0.35[E];
  [6]volume=eval=frame:volume='3.2*exp(-t*8)'[th];
  [7]lowpass=f=1600,volume=eval=frame:volume='2.2*exp(-t*7)'[nz];
  [th][nz]amix=inputs=2:normalize=0,alimiter=limit=0.95,pan=stereo|c0=c0|c1=c0,aformat=sample_rates=48000:channel_layouts=stereo[aE];
  [5]fps=30,setsar=1,format=yuv420p,fade=t=in:st=0:d=0.25:color=0x080E18[F];
  [8]aformat=sample_rates=48000:channel_layouts=stereo[aF];
  [foot][footA][E][aE][F][aF]concat=n=3:v=1:a=1[vo][ao]" \
  -map "[vo]" -map "[ao]" -c:v libx264 -preset medium -crf 17 -pix_fmt yuv420p -r 30 \
  -c:a aac -b:a 160k -ar 48000 -ac 2 -movflags +faststart "$OUT"
echo "wrote $OUT"
