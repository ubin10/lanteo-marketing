#!/usr/bin/env bash
# "Respect the risk" reel, v3: AI footage made by the operator on a free platform
# from the alpine prompt. ~10s, 1080x1920, 30fps, with the clip's OWN engine sound.
#
#   bash build_video_v3.sh "<Motorcycle_riding_up_alpine_pass_1a280003.mp4>" "<output.mp4>"
#
# SOURCE: 720x1280 (already 9:16), 24fps, 10.03s, AAC 48 kHz stereo. The model rendered
# the hairpin and the bike running wide onto the grass by the stone wall; from ~8.0s it
# shows the bike down and the rider on the ground, which we cut BEFORE (no injury shown).
#
#   A  src 0.1-5.4  x1.10  left bend, straight, right bend      "Two good corners."
#   C  src 5.4-7.0  x1.00  hairpin arrives, braking late         "Then the one you didn't slow down for."
#   D  src 7.0-7.85 x1.00  runs wide onto the grass + light roll/growing shake (no smear: the clip's own run-wide is the shot) (same)
#   E  1.6s black: impact, then silence; "Respect the risk." fades in
#   F  1.4s Lanteo end card (Week 1's)
set -euo pipefail
SRC="$1"; OUT="$2"
cd "$(dirname "$0")"
FFDIR="/c/Users/Lenovo/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-9.0.1-full_build/bin"
FF="$FFDIR/ffmpeg"; [ -x "$FF" ] || FF=ffmpeg
EX=../export; END=../../week01-reel/export/w01_end.png
SR=48000
FIT="scale=1080:1920:flags=lanczos,unsharp=5:5:0.5,fps=30,setsar=1,format=yuv420p"
T1=$(awk 'BEGIN{print 5.3/1.1}')          # end of "Two good corners."

v(){ echo "[v$1]trim=start=$2:end=$3,setpts=(PTS-STARTPTS)/$4,$FIT"; }
a(){ echo "[a$1]atrim=start=$2:end=$3,asetpts=PTS-STARTPTS,asetrate=$SR*$4,aresample=48000"; }

"$FF" -v error -y \
  -i "$SRC" \
  -loop 1 -t 12 -i $EX/rr_o-t1.png -loop 1 -t 12 -i $EX/rr_o-t2.png \
  -loop 1 -t 1.6 -i $EX/rr_risk.png -loop 1 -t 1.4 -i "$END" \
  -f lavfi -t 1.6 -i "sine=frequency=52:sample_rate=48000" \
  -f lavfi -t 1.6 -i "anoisesrc=color=pink:sample_rate=48000:amplitude=0.9" \
  -f lavfi -t 1.4 -i "anullsrc=r=48000:cl=stereo" \
  -filter_complex "
  [0:v]split=3[v1][v2][v3];
  [0:a]asplit=3[a1][a2][a3];
  $(v 1 0.1 5.4 1.1)[A];  $(a 1 0.1 5.4 1.1)[aA];
  $(v 2 5.4 7.0 1.0)[C];  $(a 2 5.4 7.0 1.0)[aC];
  $(v 3 7.0 7.85 1.0),rotate='0.22*min(t/0.85\,1)':c=black,
    zoompan=z='1.14+0.012*on':x='iw/2-(iw/zoom/2)+(8+0.9*on)*sin(on*2.1)':y='ih/2-(ih/zoom/2)+(6+0.8*on)*cos(on*2.7)':d=1:s=1080x1920:fps=30,
    setsar=1,format=yuv420p[D];
  $(a 3 7.0 7.85 1.0)[aD];
  [A][aA][C][aC][D][aD]concat=n=3:v=1:a=1[fv][fa0];
  [fv][1]overlay=0:0:shortest=1:enable='lt(t,$T1)'[fv1];
  [fv1][2]overlay=0:0:shortest=1:enable='gte(t,$T1)'[foot];
  [fa0]volume=1.1,aformat=sample_rates=48000:channel_layouts=stereo[footA];
  [3]fps=30,setsar=1,format=yuv420p,fade=t=in:st=0.35:d=0.35[E];
  [5]volume=eval=frame:volume='3.2*exp(-t*8)'[th];
  [6]lowpass=f=1600,volume=eval=frame:volume='2.2*exp(-t*7)'[nz];
  [th][nz]amix=inputs=2:normalize=0,alimiter=limit=0.95,pan=stereo|c0=c0|c1=c0,aformat=sample_rates=48000:channel_layouts=stereo[aE];
  [4]fps=30,setsar=1,format=yuv420p,fade=t=in:st=0:d=0.25:color=0x080E18[F];
  [7]aformat=sample_rates=48000:channel_layouts=stereo[aF];
  [foot][footA][E][aE][F][aF]concat=n=3:v=1:a=1[vo][ao]" \
  -map "[vo]" -map "[ao]" -c:v libx264 -preset medium -crf 17 -pix_fmt yuv420p -r 30 \
  -c:a aac -b:a 160k -ar 48000 -ac 2 -movflags +faststart "$OUT"
echo "wrote $OUT"
