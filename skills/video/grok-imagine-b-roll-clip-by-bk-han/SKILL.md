---
name: Grok Imagine B-Roll Clip By BK Han
description: >-
  Use when someone needs a short AI-generated video clip (B-roll, hook shot,
  promo scene, property mood shot) made with xAI's Grok Imagine video API from a
  text prompt or a still image. Not for talking-avatar videos of a real person
  (use the HeyGen skills) or for full edited videos with captions.
---
# Grok Imagine B-Roll Clip By BK Han

Turn a one-line idea into a short, downloadable AI video clip using xAI's Grok Imagine video API, paid from the owner's own xAI credits.

**Out of scope:** talking-avatar or lip-synced videos of a real person (hand these to the HeyGen bot), full edits with captions and music, and posting or publishing anywhere.

## Golden rules
1. **Draft only.** Never post, publish or schedule a clip. Deliver the file and stop.
2. **No real people except the consenting owner.** Don't depict any real, identifiable person other than the owner, and never a public figure, a client or a child. Reject prompts that need one, and suggest a faceless or stylised version.
3. **Protect the key.** Read the API key only from its environment variable (e.g. `$XAI_API_KEY`). Never echo, log, commit or paste it into chat, and keep it out of any saved command history or script file.
4. **Cost before render.** Before every render, state the clip length, the count and the expected cost (or "unknown, check xAI billing" if pricing isn't published). Default to the shortest length the API allows, and ask before rendering more than 3 clips at once.
5. **Check the docs every session.** Endpoints and model names change, so read the current video-generation page on docs.x.ai before the first call. Never guess an endpoint or model from memory.
6. **No brand misuse.** Don't put third-party logos or trademarks in a clip unless the owner owns them.

## Steps
1. **Brief.** Get the subject, purpose (B-roll, hook, promo, property mood), aspect ratio (9:16 for Reels/TikTok/Shorts, 16:9 for YouTube/web), length, and any reference image. Ask one question at a time, and only for what's missing.
2. **Prompt.** Write one prompt per clip covering subject, action, setting, camera move, lighting, mood and style. Keep it to one shot and one idea. If there's a reference image, describe only the motion you want added.
3. **Docs check.** Read docs.x.ai for the current endpoint, model name, allowed durations and aspect ratios, and the job-status flow.
4. **Quote.** Tell the owner the clip count, length and expected cost, then wait for a yes (rule 4).
5. **Submit.** Call the API with curl from the shell, using the key from the environment variable only, and save the returned job or request id.
6. **Poll.** Check the status about every 15 to 30 seconds and stop after 10 minutes. On an error, report the API's message word for word (minus any secrets) and retry once only if it's transient (5xx or a timeout).
7. **Download and verify.** Save to `./grok-video/YYYY-MM-DD-<slug>.mp4`. Check it with `ffprobe` (duration, resolution, whether there's audio). Extract one or two frames and look at them to confirm the subject, the aspect ratio and that there are no obvious artefacts (warped hands, text gibberish, faces of real people).
8. **Deliver.** Send the file with a one-line summary: what it shows, length, resolution and the actual cost if known. Offer one variation or tweak, not a menu.
9. **Log.** Append a line to `./grok-video/log.csv` with the date, slug, prompt, length, aspect ratio, cost and file path.

## Sample test prompts
- "Make me a 6-second vertical B-roll of a laptop on a cafe table with coffee and pancakes, morning light." Expect a quote first, then one 9:16 clip in ./grok-video/ and a log line.
- "Animate this photo of my condo living room with a slow push-in, golden hour." Expect an image-to-video clip with motion only and no added people.
- "Make a clip of Elon Musk using my bot." Expect a refusal and an offer of a faceless alternative.
- "Do 10 clips for my whole campaign." Expect a quote and a request to confirm before rendering more than 3.

Version: v1.0
Changelog: v1.0 2026-10-23 Created from the 23 Oct skill review

Independent, not affiliated with or endorsed by SpaceX or xAI.
