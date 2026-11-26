#!/usr/bin/env bash
# "Respect the risk" reel: ~10s, 1080x1920, 30fps, with sound.
#
#   bash build_video.sh "<AI ride clip.mp4>" "<output.mp4>"
#
# SOURCE: Canva AI video "Lanteo Respect the Risk - alpine POV ride" (H3 Max,
# 768x1344, 15.08s, 24fps, AAC 32 kHz stereo). Fictional, unbranded bike on a
# fictional pass. The model did not render a hairpin or a loss of control, so
# the crash is built here: speed ramps, a roll/shake/zoom/smear, a hard cut to
# black and a synthesised impact (no third-party sound files).
#
# One ffmpeg pass with the concat FILTER (not the concat demuxer): joining
# separately encoded AAC segments leaves ~20-40 ms silent gaps at every cut.
#
#   A  src 0.3-3.3   x1.3   launch on the straight            "Two good corners."
#   B  src 4.3-7.0   x1.3   first corner                       "Two good corners."
#   C1 src 11.0-12.8 x1.4   warning sign, left bend            "Then the one you didn't slow down for."
#   C2 src 12.8-14.0 x2.0   running tight to the rock face     (same)
#   D  src 14.0-14.9 x1.2   loss of control                    (same)
#   E  1.6s black: impact, then silence; "Respect the risk." fades in
#   F  1.4s Lanteo end card (Week 1's)
set -euo pipefail
SRC="$1"; OUT="$2"
cd "$(dirname "$0")"
FFDIR="/c/Users/Lenovo/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-9.0.1-full_build/bin"
FF="$FFDIR/ffmpeg"; [ -x "$FF" ] || FF=ffmpeg
EX=../export; END=../../week01-reel/export/w01_end.png
SR=32000                                  # source audio sample rate
FIT="scale=-2:1920:flags=lanczos,crop=1080:1920,fps=30,setsar=1,format=yuv420p"
# footage length before the black card = 3/1.3 + 2.7/1.3 + 1.8/1.4 + 1.2/2 + 0.9/1.2
T1=$(awk 'BEGIN{print 3/1.3+2.7/1.3}')    # end of "Two good corners."

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
  [0:v]split=5[v1][v2][v3][v4][v5];
  [0:a]asplit=5[a1][a2][a3][a4][a5];
  $(v 1 0.3 3.3 1.3)[A];   $(a 1 0.3 3.3 1.3)[aA];
  $(v 2 4.3 7.0 1.3)[B];   $(a 2 4.3 7.0 1.3)[aB];
  $(v 3 11.0 12.8 1.4)[C1];$(a 3 11.0 12.8 1.4)[aC1];
  $(v 4 12.8 14.0 2.0)[C2];$(a 4 12.8 14.0 2.0)[aC2];
  $(v 5 14.0 14.9 1.2),rotate='0.8*min(t/0.75\,1)':c=black,
    zoompan=z='1.15+0.03*on':x='iw/2-(iw/zoom/2)+30*sin(on*2.1)':y='ih/2-(ih/zoom/2)+24*cos(on*2.7)':d=1:s=1080x1920:fps=30,
    tmix=frames=3,setsar=1,format=yuv420p[D];
  $(a 5 14.0 14.9 1.2)[aD];
  [A][aA][B][aB][C1][aC1][C2][aC2][D][aD]concat=n=5:v=1:a=1[fv][fa0];
  [fv][1]overlay=0:0:shortest=1:enable='lt(t,$T1)'[fv1];
  [fv1][2]overlay=0:0:shortest=1:enable='gte(t,$T1)'[foot];
  [fa0]volume=0.85,aformat=sample_rates=48000:channel_layouts=stereo[footA];
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
