# Week 1 Reel: "Make the habit measurable"

**Goes live:** Sun 29 Nov 2026, 13:00–15:00 ET (schedule it; that's ~01:00–03:00 Mon WIB)
**Pillar:** P3 Founder's Desk (brand intro) · **Format:** IG Reel + the same file as a YouTube Short · **Length:** ~30s · 1080×1920
**Goal:** introduce Lanteo and pin it as post #1.

## Frames (in `export/`, also in Canva: "Lanteo Week 1 Instagram Reel", https://canva.link/795obrv0h6r64ic)

| File | Type | Used at |
|---|---|---|
| `w01_cover.png` | Solid | Reel cover (grid crops to the centre 3:4; all text is inside it) |
| `w01_diary.png` | Solid | 0:00–0:06 if you don't film a real notebook (faceless fallback) |
| `w01_o-felt.png` | Transparent overlay | 0:00–0:04, over the notebook shot |
| `w01_o-did.png` | Transparent overlay | 0:06–0:09, over the dashboard |
| `w01_o-officer.png` | Transparent overlay | 0:15–0:22, over the AI Risk Officer recording |
| `w01_o-split.png` | Transparent mask | 0:22–0:26: notebook clip in the top window, screen clip in the bottom |
| `w01_end.png` | Solid | 0:26–0:30 end card |

Re-render after editing `src/frames.html`: `bash week01-reel/src/render.sh` (needs Edge).

## Timed script

| Time | Picture | On screen | Voiceover |
|---|---|---|---|
| 0:00–0:03 | Top-down phone shot: hand writing *"stopped out 9:47. straight back in."* (or `w01_diary.png` with a slow 105% zoom) | `w01_o-felt` | "Every trader's journal has the same line in it." |
| 0:03–0:06 | Pen strikes through *"told myself it was the same setup"*, then writes **stop revenge trading.** | (overlay off) | "*Stop revenge trading.* Mine did too." |
| 0:06–0:09 | **Hard cut** to the Lanteo dashboard (Sample account, dark mode) | `w01_o-did` | "But a journal records what you felt. Your fills record what you did." |
| 0:09–0:15 | Cursor clicks a red day on the P&L calendar → day panel opens | none (let the UI read) | "So I built Lanteo. You upload the order log your broker already exports…" |
| 0:15–0:22 | AI Risk Officer page: slow zoom onto one named behaviour and the trades it cites | `w01_o-officer` | "…it rebuilds every trade from your fills, and names the habit, with the trades that prove it." |
| 0:22–0:26 | Split: notebook clip (top window) + calendar/day panel clip (bottom window) | `w01_o-split` | (beat. Let the music breathe) |
| 0:26–0:30 | End card | `w01_end` | "Make the habit measurable." |

VO is ~60 words, so it fits 30s at a calm pace. Record in one take on your phone, then clean it in Audacity (noise reduction, normalise to about −16 LUFS).
No face needed. If you'd rather not voice it, burn in the VO lines as captions and use music only.

## What you need to capture (Sample account only)

1. **Notebook B-roll** (phone, top-down, daylight, 4K or 1080p, 9:16): write the diary lines above in a real notebook. Two takes.
2. **Screen recordings** (OBS, 1920×1080, 60fps, browser zoom 125%, bookmarks bar hidden, **top-bar email cropped/blurred**):
   - a) Dashboard → click a red day on the P&L calendar → day panel opens (8s)
   - b) AI Risk Officer page → scroll to one named behaviour with cited trades (10s)
   Crop each to vertical in the editor (keep the panel centred).
3. **Never** a live funded account. Every number on screen must come from the Sample account.

## Sound
YouTube Audio Library (for the Short) / Meta Sound Collection (for the Reel): a low, slow ambient or lo-fi bed at −20 dB under the VO. One subtle "whoosh" on the hard cut at 0:06.

## Captions
Burn in auto-captions (CapCut/Edits), white Inter Semibold, kept out of the bottom 420px.
Exception: at 0:06–0:09 and 0:15–0:22 the overlays *are* the caption, so hide auto-captions there to avoid doubled text.

## Post copy

**Instagram caption:**
> Every trading journal has the same line in it: *"stop revenge trading."*
>
> Writing it down doesn't make it stop. Measuring it might.
>
> Lanteo reads the order log your platform already exports (Tradovate, Rithmic, TopstepX, TradingView/AMP), rebuilds every position from your fills, and names the habits costing you money, with the trades that prove it.
>
> New post every Sunday: habits you can measure, export how-tos, and building this in public.
>
> 7-day trial, no card → link in bio
>
> *Lanteo analyses your past trades. It doesn't predict markets or place trades, and nothing here is financial advice.*
>
> #futurestrading #tradingjournal #daytrading #tradingpsychology #propfirm

**YouTube Short title:** Your journal says what you felt. Your fills say what you did. #futurestrading
**YouTube description:** first 3 paragraphs of the IG caption + `https://lanteo.app/?utm_source=youtube` + the disclaimer line.

**After posting:** pin the Reel to the IG profile; reshare it to Stories with a poll: "Ever re-entered within 2 minutes of a stop?" Yes / Never 😇.
