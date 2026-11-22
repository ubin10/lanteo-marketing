# Lanteo — Social Campaign Plan (Q1: YouTube + Instagram)

**Written:** 2026-11-22 · **Covers:** 12 weeks, Sun 29 Nov 2026 → Sun 14 Feb 2027 · **Cadence:** 1 post per week

Facts in this plan were checked against the product repo on 2026-11-22 (landing page, `billing.js`, `extractors.js`, `brokerFiles.json`, STATE.md). Re-check prices and the founder cohort before each post that mentions them (see §7).

---

## 1. Strategy in one page

**Positioning:** Lanteo is the calm, precise one in a loud niche. Trading Instagram and YouTube are full of P&L screenshots, lambos and "100% win rate" setups. Lanteo shows no P&L flexing and makes no promises. It shows **behaviour made measurable**. Brand line: **"Make the habit measurable."**

**Audience:** US-futures day traders on **prop-firm evaluations/funded accounts AND personal brokerage accounts** (never "for prop traders" alone). Mostly NQ/ES and the micros (MNQ/MES), on Tradovate, Rithmic, TopstepX/ProjectX or TradingView (AMP). They already know they revenge-trade. What they lack is proof of *when* and *how much*.

**The one argument every post makes:** *Your fills already contain the habit. Lanteo reads the order log, rebuilds the real positions, and names the pattern, with the trades that prove it.*

**Channel roles:**

| Channel | Job | Why |
|---|---|---|
| **Instagram** (primary for reach and trust) | Carousels to save, Reels for discovery, Stories for the offer and conversation | Carousels get saved and shared. Saves are the strongest signal for a new account. |
| **YouTube** (primary for search and conversion) | Shorts (same file as the Reel) + one long-form **export tutorial** a month | YouTube is a search engine. "How to export Tradovate orders" is a real query with buyer intent, and those videos keep working for years. |

**The weekly unit (one post, free repurposing):** each week there is ONE hero piece. Every Reel is also uploaded as a YouTube Short (same 9:16 file). Every post is reshared to an IG Story with a poll or question sticker. This doesn't count as extra posts, and it costs about 5 minutes.

**When to post:** **Sunday, 13:00–15:00 ET.** Futures traders do their weekly review on Sunday, before the CME Globex open at 18:00 ET. The founder is in WIB (ET+12), where that window is about **01:00–03:00 Monday**, so **schedule every post in advance** (Meta Business Suite / YouTube Studio). Don't post by hand.

---

## 2. Content pillars

| # | Pillar | Share | What it is | Typical format |
|---|---|---|---|---|
| P1 | **Habit Lab** | ~40% | One trading behaviour per post, explained as something you can *measure*: revenge trading, size after losses, overtrading days, holding losers longer, the Nth-trade-of-the-day fade, the hour that costs you most. Value first; Lanteo appears only at the end. | Carousel, Reel |
| P2 | **Under the Hood** | ~25% | How Lanteo works, shown from real screens: order log in, fills FIFO-matched into positions, commissions, the AI Risk Officer, privacy. | Reel/Short, carousel |
| P3 | **Founder's Desk** | ~20% | Build in public: why it exists, what shipped, broker requests, **founder pricing**. A trader who builds the tool, not a faceless brand. | Reel (VO or face), carousel, Stories |
| P4 | **Export Guides** | ~15% | Step-by-step "export your order log from X and import it." Evergreen search content. | YouTube long-form + Short cut-down |

**Habit Lab topic bank.** Each topic maps to a behavioural signal Lanteo actually computes (`extractors.js`), so the closing CTA is always true:

| Topic | What Lanteo measures |
|---|---|
| Revenge trading | Gap between a loss and the next entry, and how those re-entries perform |
| Size after losses | Whether contracts go up during or after a losing streak |
| Overtrading days | Days with trade count above your own baseline, and how they end |
| Time-of-day fade | Average P&L per trade by hour |
| Trade #N fatigue | Performance by trade sequence within the day |
| Holding losers | Average/median hold time of losers vs winners |
| After a win streak | Win rate and P&L after streaks vs your baseline |
| Session performance | By trading session |
| Setup tags | Performance by your own tags |
| Size vs outcome | Whether bigger size performs worse |

---

## 3. Visual identity for social

Use the product's own system, so social, landing page and app look like one brand.

| Token | Hex | Use on social |
|---|---|---|
| Ink (ground) | `#080E18` | Background of every frame |
| Raised | `#0F1A28` | Cards/panels on top of the ground |
| Line | `#1A2D44` | Dividers, chart gridlines |
| Jade | `#0EA47D` | "Above the line": wins, improving, OK |
| **Gold** | `#CBA54C` | **The one thing per frame:** CTA, the offer, the key number. Never more than one gold element per slide. |
| Breach red | `#FF3D5A` | Losses, the habit, the problem |
| Text / secondary | `#DDEEFF` / `#8BA3BF` | Body / captions |

**Type:** Space Grotesk (headlines) · Inter (body). Both are free on Google Fonts. **Caveat** (handwriting) is for "journal entry" moments only, never for body text. If Space Grotesk isn't in Canva's free library, use Inter Bold for headlines. Canva Free can't upload custom fonts.

**Logo:** Momentum Coin mark + wordmark "Lante" with a gold lowercase "o". Use the mark alone as the profile picture, on Ink.

**Signature motif: "diary vs data."** On the left, a handwritten journal line ("stopped out 9:47. straight back in."). On the right, the measured screen from the same day. It's the landing-page hero, so a visitor who clicks through recognises it.

**Hard rules for every visual:**
1. **Only the "Lanteo Sample" account on screen.** Never a live funded account (Apex, Bulenox, etc.) or real personal P&L.
2. **Blur or crop** the top bar email/user menu in every screen recording.
3. **Every number on screen comes from a real Sample-account screen captured that day.** No invented stats. The landing page's "2.4×" panel is illustrative, so don't reuse it as a statistic.
4. **Broker names as text only. No broker logos** (trademark: ProjectX's terms forbid logo use, and a logo row reads as endorsement).
5. **Dark mode** captures (they match the brand ground).

**Formats and safe zones:**

| Format | Size | Notes |
|---|---|---|
| IG Reel / YT Short | 1080×1920 (9:16) | Keep text out of the top ~250px, bottom ~420px and right ~120px (UI buttons). 15–45s for the first quarter. Burned-in captions always (most people watch muted). |
| Reel cover | 1080×1920 | The profile grid crops it to the centre 3:4, so put the title in the middle. |
| IG carousel | 1080×1350 (4:5) | 5–8 slides (max 20). Keep ~60px side margins: the profile grid crops to 3:4. Slide 1 = hook, last slide = save/CTA. |
| IG Story | 1080×1920 | Keep the top 250px / bottom 340px clear. |
| YouTube long-form | 1920×1080 | 5–8 min tutorials. Chapters in the description. |
| YT thumbnail | 1280×720 | 3–5 words max, Space Grotesk, one gold element. |
| YT banner | 2560×1440 | Safe area 1546×423 in the centre. |
| Profile image | 800×800 (YT) / 320×320 (IG) | Momentum Coin mark on Ink. |

---

## 4. Tools (all free)

| Job | Tool | Notes |
|---|---|---|
| Carousels, story frames, thumbnails, banner, quote cards | **Canva (Free)** | Brand Kit is Pro-only. Instead, build ONE master template (colours + type set) and duplicate it each week. |
| Screen recording of the Sample account | **OBS Studio** | Record 1920×1080 at 60fps; crop to vertical in the editor. Hide bookmarks bar; zoom browser to 125% so UI text survives a phone screen. |
| Vertical editing + auto captions | **CapCut Desktop (free tier)** or **Edits** (Instagram's free mobile editor) | Check exports are watermark-free; CapCut has been moving features to Pro. Edits exports clean and posts straight to IG. |
| Long-form YouTube edits | **DaVinci Resolve (free)** | For the monthly export tutorials. |
| Voiceover recording/cleanup | Phone voice memo or USB mic + **Audacity** | Noise reduction + normalize to about −16 LUFS. |
| Music | **YouTube Audio Library** (YouTube) · **Meta Sound Collection** (IG) | With an IG Business account, only use licensed sounds. Voiceover + quiet bed is the default. |
| Scheduling | **Meta Business Suite** (IG posts, Reels, Stories) · **YouTube Studio** (videos, Shorts) | Essential given the WIB/ET time difference. |
| Content calendar + metrics log | **Google Sheets** | One row per week: date, pillar, format, link, metrics (see §8). |
| Traffic from social | **Cloudflare Web Analytics** (already on lanteo.app) | Shows referrers (instagram.com / youtube.com). Add `?utm_source=instagram` / `?utm_source=youtube` to bio links. Check whether CF shows the UTM split; the referrer still separates the two. |
| B-roll (hands, notebook, desk) | Phone camera, top-down, daylight | Gives the "diary" half of the motif. |

---

## 5. Week 0 — channel setup (before 29 Nov)

- [ ] **Same handle on both:** first choice `@lanteo.app`, fallback `@lanteoapp` / `@lanteo.journal`. Check availability on both before claiming either.
- [ ] **Instagram:** switch to a Professional → **Business** account (category: Software / App). Link to a Facebook Page only if Meta Business Suite requires it for scheduling.
- [ ] **IG bio** (≤150 chars):
  > Futures trading journal + risk analytics. Upload your order log → see the habits costing you. 7-day trial, no card. Not financial advice.
  Link: `https://lanteo.app/?utm_source=instagram`
- [ ] **YouTube:** channel name "Lanteo", handle as above. Banner = Ink ground, centred "Make the habit measurable." + wordmark. Links: lanteo.app (UTM youtube).
- [ ] **YouTube description:**
  > Lanteo is a trading journal and risk-analytics tool for futures traders, on prop-firm and personal accounts. Upload the order log your platform already exports (Tradovate, Rithmic, TopstepX/ProjectX, TradingView/AMP). Lanteo rebuilds every position from your fills and names the habits costing you money, with the trades that prove it.
  > New videos every Sunday: trading habits you can measure, export tutorials, and building Lanteo in public.
  > Lanteo is not financial advice and does not predict markets.
- [ ] Build the Canva master template: carousel slide (4:5), story frame, thumbnail, end card.
- [ ] Capture a **screen library** from the Sample account (dark mode, email cropped): dashboard, P&L calendar → day panel, trade detail with executions, Analytics › Performance (expectancy/drawdown), Analytics › Behavior, AI Risk Officer page, journal, upload modal.
- [ ] Record one 3-second **end card** animation (mark → wordmark → "lanteo.app") and reuse it on every video.
- [ ] Create the Google Sheet calendar (§8).

---

## 6. The 12 weekly posts

Each brief gives: pillar · format (and repurposes) · goal · visual brief · on-screen text · caption draft · CTA. Hashtags: use 3–5 per post from the set at the end of this section.

**Standard caption footer** (every post):
> *Lanteo analyses your past trades. It doesn't predict markets or place trades, and nothing here is financial advice.*

---

### Week 1 · Sun 29 Nov — "Make the habit measurable" (brand intro)
**Pillar:** P3 Founder's Desk · **Format:** Reel → also YT Short · 25–35s · **Goal:** introduce the brand; becomes pinned post #1.

**Visual brief:**
1. (0–4s) Top-down phone shot: a hand writing in a paper notebook, in Caveat-like handwriting: *"stopped out 9:47. straight back in."* Then a strike-through line: *"told myself it was the same setup."*
2. (4–8s) Hard cut to the dark Lanteo dashboard. The cursor clicks a red day on the P&L calendar and the day panel opens.
3. (8–18s) Scroll to the AI Risk Officer page. Zoom on a named pattern and the trades it cites.
4. (18–25s) Split screen: notebook left, screen right. Text: *"Same day. Measured."*
5. (25–30s) End card: logo + "Make the habit measurable." + lanteo.app.

**VO script (founder, or text-only if no VO):**
> "Every trader's journal says the same thing: stop revenge trading. Mine did too. The problem is, a journal records what you *felt*. Your fills record what you *did*. So I built Lanteo. You upload the order log your broker already gives you, and it shows you the habit, with the trades that prove it. Make the habit measurable."

**On-screen text:** "Your journal says what you felt." → "Your fills say what you did." → "Make the habit measurable."

**Caption:**
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
> *[standard footer]*

---

### Week 2 · Sun 6 Dec — Habit Lab #1: Revenge trading is a timestamp
**Pillar:** P1 Habit Lab · **Format:** IG Carousel, 7 slides · Story reshare with poll · **Goal:** saves; establish the "measurable" angle.

**Slides (on-screen text, in brief):**
1. **Hook:** "Revenge trading isn't a feeling. It's a timestamp." (red underline on *timestamp*)
2. "It looks like this:" a mock fill timeline: `09:47 stopped out −$212` → `09:49 long again, 2× size`. (Illustrative mock, labelled "example".)
3. **Three things you can check tonight:** ① minutes between a loss and your next entry ② size on that next entry vs your normal ③ how those quick re-entries actually finish.
4. **Do it by hand:** "Export your order log. Sort by time. Mark every entry that came within 5 minutes of a losing exit. Compare their results to the rest." (Pure value, no product.)
5. **What you'll probably find:** "The fast re-entries are rarely your best trades. But *your* numbers are what count, not ours."
6. **Lanteo does step 4 for you:** small Sample-account screenshot. "It measures the gap after every loss across 90 days and shows how those re-entries perform."
7. **CTA (gold):** "Save this for Sunday review." + "Try it on the sample account: link in bio."

**Visual brief:** Ink ground, one Raised panel per slide, red for the loss, jade only on slide 6. The slide 2 timeline uses monospace-style numbers (Inter tabular).

**Caption:**
> Revenge trading has a signature in your data: a loss, then an entry a couple of minutes later, often bigger.
>
> You don't need any tool to check it. Export your order log, sort by time, and mark every entry that came within 5 minutes of a losing exit. Then compare those trades to the rest.
>
> If you want it done for you across 90 days, that's what Lanteo's AI Risk Officer does, citing the exact trades.
>
> Save this for your Sunday review. 📌
>
> *[footer]*

**Story:** reshare + poll "Have you ever re-entered within 2 minutes of a stop? Yes / Never 😇".

---

### Week 3 · Sun 13 Dec — ⭐ Founder pricing: 25 seats, for life
**Pillar:** P3 Founder's Desk · **Format:** IG Carousel, 6 slides (pin it) + 3-frame Story + YT Short (20–30s founder VO over the slides) · **Goal:** conversion; fill founder seats.

**Facts (verified 2026-11-22; re-verify before posting, §7):**
- List price **$20/month**. Founder price **$17/month (15% off), for as long as you stay subscribed**, limited to the **first 25 subscribers**.
- Also on 6-month (**$91.80**) and yearly (**$170**, about $14.17/month).
- **Applied automatically at checkout, no code to type.**
- 7-day trial, no card. Tax calculated at checkout. Cancel any time.
- Everything included: unlimited accounts, unlimited imports, full analytics, AI Risk Officer.

**Slides:**
1. Gold accent, big: **"25 founder seats."** Sub: "For the traders who show up first."
2. Price card: ~~$20~~ **$17/month** (gold). "Locked for life while you stay subscribed."
3. **What's included:** unlimited accounts · unlimited imports · full analytics · AI Risk Officer. One plan, no tiers.
4. **How it works:** ① Start the 7-day trial, no card. ② Upload an order log (or explore the 100-trade sample account). ③ Subscribe. The founder price is applied automatically.
5. **Why founders:** "You're early. Adapters are written against real export files, so the brokers and contracts founders trade are the ones that get built next." (True: e.g. E-nano futures were added on request.)
6. **CTA:** "Start the trial: link in bio." Small print: "Tax calculated at checkout · cancel any time · not financial advice."

**Visual brief:** This is the ONE post where gold dominates. Slide 1–2 background stays Ink, but the price/number is large gold. Momentum Coin mark large and faint behind slide 1. No countdown timers, no fake urgency.

**Caption:**
> Lanteo is new, and the first 25 subscribers get founder pricing: **$17/month instead of $20, for as long as you stay subscribed.**
>
> No code to type. The founder price is applied automatically at checkout. It also applies to the 6-month and yearly plans.
>
> Start with the 7-day trial (no card), upload an order log from Tradovate, Rithmic, TopstepX or TradingView/AMP, or explore the sample account with 100 trades and a real assessment. Decide after.
>
> Founders also get the loudest voice in what gets built next. Trade a contract or platform we don't support yet? Send the export to support@lanteo.app.
>
> Link in bio. Tax calculated at checkout · cancel any time.
>
> *[footer]*

**Stories (3 frames):** ① "25 founder seats" ② price card ③ link sticker → lanteo.app + "Questions? Ask here" question sticker. Save as a **"Founder" Highlight**.

**YT Short VO (founder):**
> "Quick one. Lanteo's first 25 subscribers get founder pricing: seventeen a month instead of twenty, for as long as they stay. It's applied automatically, no code. Try it free for seven days first, no card. Link's in the description."

---

### Week 4 · Sun 20 Dec — Export Guide #1: Tradovate
**Pillar:** P4 Export Guides · **Format:** **YouTube long-form 5–7 min** + 45s Reel/Short cut-down · **Goal:** search traffic, trial signups.

**Title (YT):** "How to Export Your Tradovate Order Log (and Find Your Revenge Trades)"
**Thumbnail:** Ink ground, "Tradovate → Lanteo" in Space Grotesk, the word "EXPORT" in gold, a small Sample screen. No Tradovate logo.

**Chapters / shot list:**
- 0:00 Why the order log, not the trade summary (fills = the real positions).
- 0:40 In Tradovate: **Account Reports → Orders**, set the date range, **Go**, **Download to CSV**. Record the founder's own Tradovate screen with **account numbers and balances blurred**, or explain over static annotated screenshots.
- 2:00 In Lanteo: upload modal, choose Tradovate, drop the file.
- 2:45 **Set a commission rate.** The Tradovate export has no commissions, so set the rate per account to make P&L net of fees.
- 3:30 What comes out: scaled-in trades shown as one position, P&L calendar, trade detail with each fill.
- 5:00 The AI Risk Officer runs once you have 10+ trades (Sample account shown).
- 6:00 Recap + trial link.

**Caption / description:** step list + chapters + "7-day trial, no card: lanteo.app/?utm_source=youtube" + footer.
**Short/Reel cut (45s):** steps 0:40–2:45 sped up, text "3 clicks to export. 1 to upload."

---

### Week 5 · Sun 27 Dec — Habit Lab: 6 questions your 2026 fills can answer
**Pillar:** P1 · **Format:** IG Carousel, 8 slides · Story: founder-price reminder · **Goal:** year-end saves and shares (peak "review" mood).

**Slides:**
1. "Before you set 2027 goals, ask your 2026 fills 6 questions."
2. **Which hour costs you the most?** (average P&L per trade by hour)
3. **What do you do after two losses in a row?** (size and results on the next trade)
4. **Do you hold losers longer than winners?** (hold-time comparison)
5. **What happens after your 5th trade of the day?** (results by trade number)
6. **How do your busiest days end?** (trade count above your normal vs result)
7. **Do you get careless after a win streak?** (win rate after streaks vs baseline)
8. CTA: "Lanteo's AI Risk Officer answers all six from your last 90 days. Save this · link in bio."

**Visual brief:** one question per slide, large; a tiny line icon per slide (clock, two red dots, hourglass, "#5", stacked bars, flame). Slide 8 shows the Sample Behavior screen.

**Caption:**
> Goals are easy. Knowing what to fix is the hard part.
>
> Six questions your fills can answer before 2027: which hour costs you most, what you do after two losses, whether you hold losers longer than winners, what happens after trade #5, how your busiest days end, and whether a win streak makes you careless.
>
> You can answer them with a spreadsheet. Lanteo answers them from your order log in a few minutes.
>
> Save for your year-end review. 📌
>
> *[footer]*

**Story:** "Starting 2027 with a plan? Founder pricing: $17/mo for life, first 25 subscribers" → link sticker. (Only if seats remain, §7.)

---

### Week 6 · Sun 3 Jan — Under the Hood: Four fills. One trade.
**Pillar:** P2 · **Format:** Reel → YT Short · 20–30s · **Goal:** show the technical edge (fills → positions).

**Visual brief:**
1. Four fill rows animate in (Canva animation or After-Effects-free keyframes in CapCut): `BUY 2 MNQ 21,410.25` · `BUY 1 MNQ 21,404.00` · `SELL 2 MNQ 21,431.50` · `SELL 1 MNQ 21,438.75` (illustrative, labelled).
2. The rows slide together into ONE trade card: "Long 3 MNQ · avg entry · net P&L after commission."
3. Cut to the real Sample trade detail screen showing its executions.
4. End card.

**On-screen text:** "Your broker sees 4 rows." → "You took 1 trade." → "Lanteo rebuilds it from the fills, commission included."

**Caption:**
> Scale in, take a partial, close the rest. That's one trade, but most exports show it as four rows you have to reconcile yourself.
>
> Lanteo FIFO-matches every fill into real round-turn positions, with commission applied, and keeps every execution so you can open the trade and see how it was built.
>
> Everything downstream (win rate, expectancy, the AI Risk Officer) is computed from those positions, not from a summary.
>
> *[footer]*

---

### Week 7 · Sun 10 Jan — Habit Lab: The trade after two losses
**Pillar:** P1 · **Format:** Reel → YT Short · 25–35s · **Goal:** reach (relatable hook).

**Visual brief:** Text-led Reel on Ink. Two red dots appear ("loss, loss"), then a third dot grows larger ("size up?"). Cut to the Sample account's AI Risk Officer finding on post-loss sizing *if the Sample shows one*. Otherwise use the Behavior page. End card.

**Hook (first 2s, on screen + VO):** "Check one trade tonight: the one right after your second loss in a row."

**VO:**
> "Look at your size on that trade. Then look at how it finished. For a lot of traders, that's where the account leaks. Not the setup, the size. Lanteo checks every losing streak in your last 90 days and shows you whether you size up, and what it costs."

**Caption:**
> One trade to check tonight: the one right after your second loss in a row.
>
> Was it bigger than normal? How did it finish?
>
> Lanteo looks at every losing streak in your last 90 days and shows whether your size goes up during or after it, citing the trades.
>
> *[footer]*

**Story:** question sticker "What's your rule after 2 losses?" Reshare the best answers (with permission).

---

### Week 8 · Sun 17 Jan — Under the Hood: What the AI sees (and never sees)
**Pillar:** P2 · **Format:** IG Carousel, 6 slides · **Goal:** trust; answer the "AI + my data" objection.

**Slides (every claim is from the landing FAQ):**
1. "What Lanteo's AI actually sees."
2. ✅ **Your fills:** symbol, side, size, price, time. That's what it analyses.
3. ❌ **Your name and email.** Never attached to what the model reads.
4. ❌ **Your journal notes and screenshots.** Never sent for AI analysis.
5. ❌ **Broker credentials.** Lanteo has no API keys or broker link, so it *can't* place a trade. ❌ **Your password and card number** never reach Lanteo (sign-in and payment are handled by dedicated providers).
6. CTA: "A mirror for your discipline, not a forecast. Link in bio."

**Visual brief:** jade checks and red crosses, one per slide, large. Slide 2 shows a blurred fill table.

**Caption:**
> "Do I want an AI reading my trading?" Fair question. Here's exactly what it gets:
>
> ✅ your fills (symbol, side, size, price, time)
> ❌ your name or email
> ❌ your journal notes or screenshots
> ❌ any broker login. Lanteo can't place a trade, ever.
>
> You upload the export file your platform already produces. That's the whole connection.
>
> *[footer]*

---

### Week 9 · Sun 24 Jan — Export Guide #2: Rithmic (R|Trader Pro)
**Pillar:** P4 · **Format:** YouTube long-form 5–7 min + 45s Reel/Short · **Goal:** search traffic (Rithmic is used by many prop firms).

**Title:** "Export Your Rithmic Order History from R|Trader Pro (Commissions Included)"

**Shot list:**
- In R|Trader Pro: open **Order History**, choose the account and date range.
- **Add the "Commission Fill Rate" column.** It isn't shown by default. With it, commissions import from the file; without it, Lanteo uses the account's commission rate. Call this out with an on-screen gold arrow; it's the tip people will save.
- Export to CSV → upload to Lanteo → the same "what comes out" tour as Week 4.
- Blur account IDs/balances.

**Thumbnail:** "Rithmic → Lanteo" + gold "+ commissions".

---

### Week 10 · Sun 31 Jan — Habit Lab: The 1923 line about overtrading
**Pillar:** P1 · **Format:** IG Carousel, 6 slides (+ quote card as a Story) · **Goal:** shares (quote content travels).

**Slides:**
1. Quote card: *"The desire for constant action irrespective of underlying conditions is responsible for many losses."* (*Reminiscences of a Stock Operator*, 1923; attribute to the book, which is public domain in the US.)
2. "103 years later, it's still the most common leak."
3. **What overtrading looks like in data:** more trades than *your own* normal day, and how those days end.
4. **Check it:** "List your 5 worst days. Count the trades on each. Compare with your average day."
5. **What Lanteo does:** flags days above your own baseline and shows how they ended (Sample screen).
6. CTA: save/share.

**Visual brief:** slide 1 is the quote in large Space Grotesk on Ink with oversized gold quote marks. Don't switch to a "classic" serif or handwriting; keep it on brand. Slides 2–6 use the standard template.

**Caption:**
> Written in 1923. Still true every session.
>
> Overtrading isn't "a lot of trades". It's more trades than *your* normal, on days the market didn't offer them. The test: list your 5 worst days and count the trades on each.
>
> Lanteo flags every day above your own baseline and shows how those days ended.
>
> *[footer]*

---

### Week 11 · Sun 7 Feb — Founder's Desk: What shipped since launch
**Pillar:** P3 · **Format:** Reel (founder VO or face, 30–45s) → YT Short · **Goal:** momentum, broker/contract requests.

**Content (list only things that are live on the day; re-check before recording):**
- CME **E-nano** equity index futures supported: NES, NNQ, N2K, NDOW (added after a user request).
- Every "day" in the app is now the **CME trading day**: the evening session after 18:00 ET counts toward the next date, like your broker statement.
- Plus whatever ships between now and Feb. Pull it from STATE.md on the day.

**Visual brief:** quick changelog cards ("NEW ·", gold tag) intercut with the real screens. End with: "Trade something we don't support? Send the export to support@lanteo.app."

**Caption:**
> Building Lanteo in public. What shipped recently:
> → E-nano futures (NES, NNQ, N2K, NDOW), added because a trader asked
> → every day in the app now follows the CME trading day (18:00 ET roll)
>
> Adapters get written against real export files, so if your platform or contract isn't supported yet, send a sample to support@lanteo.app. That's what moves it up the list.
>
> *[footer]*

---

### Week 12 · Sun 14 Feb — Under the Hood: 60-second tour of the sample account
**Pillar:** P2 · **Format:** Reel → YT Short · 45–60s · Story: founder reminder · **Goal:** conversion. Shows the product without an upload; becomes pinned post #2.

**Shot list (screen recording, Sample account, cropped vertical):**
1. Sign-up → sample loads ("100 trades, ready in seconds").
2. Dashboard KPI bar → equity curve.
3. P&L calendar → click a day → day panel.
4. Trade detail → executions.
5. Analytics › Performance: expectancy, drawdown.
6. AI Risk Officer: status + one named behaviour with cited trades.
7. End card + "7-day trial, no card."

**Caption:**
> No export needed to see it. Every new account opens with a sample: 100 trades, full analytics and a real AI Risk Officer assessment.
>
> Click around for a few minutes, then upload your own order log when you're ready.
>
> 7-day trial, no card → link in bio
>
> *[footer]*

**Story:** founder seats reminder (only if seats remain, §7).

---

**Hashtag set (pick 3–5 per post, rotate):**
`#futurestrading` `#daytrading` `#tradingjournal` `#tradingpsychology` `#propfirm` `#fundedtrader` `#nasdaqfutures` `#MNQ` `#ES` `#riskmanagement` `#tradingdiscipline` `#orderflow`
YouTube: put 2–3 in the description (e.g. `#futurestrading #tradingjournal #tradovate`).

---

## 7. Founder-pricing guardrails (read before every post that mentions it)

1. **Check the cohort isn't full.** The only reliable count is redemptions on the `FOUNDER` discount in the payment provider's dashboard. A full cohort also shows up in `ek_api` logs as *"rejected the founder code — cohort likely full; retrying at list price."*
2. **Never state "X seats left"** unless you read the number from the dashboard that day.
3. **When the 25 are used:** in the same hour, edit the pinned Week 3 post (caption: "Founder pricing is now closed. Thank you, founders."), delete the "Founder" Story Highlight, and stop the reminders. The landing page's $17 and founder line must change at the same time.
4. **If billing moves to a new merchant of record** (the Paddle migration under analysis), re-verify that the founder price still applies automatically before mentioning it again. Social copy deliberately doesn't name the payment provider.
5. Wording: "for as long as you stay subscribed" or "for life", **never** "forever, guaranteed". No countdown timers or invented deadlines.

---

## 8. Copy guardrails (all posts)

- **Never promise outcomes:** no "stop blowing accounts", "protect your account", "pass your eval", "predicts", "prevents losses". Lanteo is *a mirror for your discipline, not a forecast*.
- **Not financial advice:** the footer goes on every caption. Habit Lab "rules" are examples traders use, never instructions.
- **Audience:** prop-firm **and** personal accounts.
- **Claims match shipped features.** If unsure, check the landing page; it is kept true to the product.
- **"AI Risk Officer"** in full on first mention per post.
- **No competitor bashing** this quarter. Comparisons (TradeZella, Tradervue, etc.) need dated, sourced claims; save them for a later quarter.

---

## 9. Measurement and review

**Track weekly in the Google Sheet:** reach/views · saves · shares · profile visits · link clicks (IG) · Shorts views + avg % viewed · long-form views + search traffic % (YT) · new trials that week (from the app's user table) · founder seats filled.

**What "good" looks like for a brand-new account (set baselines, don't chase vanity numbers):**
- **12/12 posts published on time.** Consistency is the only metric that matters in month 1.
- Carousels: **saves > likes** is the healthy sign.
- Shorts: avg % viewed **≥ 60%**. If lower, the first 2 seconds need work.
- YouTube tutorials: still getting search views after 30 days.
- Any trial whose referrer is instagram.com/youtube.com.

**Review points:** after **Week 6** (keep/kill formats: which pillar earned saves, which Shorts held attention) and after **Week 12** (plan Q2: maybe 2 posts/week, add TopstepX and TradingView/AMP export guides, comparison content).

**15 minutes a day, outside the weekly post:** reply to every comment within 24h. Answer one genuine question in a futures-trading community (no drive-by links). Save good questions as future Habit Lab topics.

---

## 10. Production rhythm (per week)

| When | Task | Time |
|---|---|---|
| Mon–Tue | Script/outline next Sunday's post; capture Sample-account screens | 45 min |
| Wed–Thu | Design carousel / edit video + captions | 1–2 h (3–4 h on tutorial weeks) |
| Fri | Check facts (prices, cohort, shipped features), write caption, schedule IG + YT | 30 min |
| Sun 13:00–15:00 ET | Goes live (scheduled). Reshare to Story with sticker | 5 min |
| Daily | Comments + community | 15 min |

Batch tip: record the Week 4 and Week 9 tutorials in the same sitting to save setup time.
