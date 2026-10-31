---
name: Brief To Video Creator By BK Han
description: >-
  Use when making a video (promo, story, explainer) from a rough idea: interview
  to a production brief, then storyboard, clip prompts, generation and final
  cut. Not for styling slides or frames (Styled Visual Video) or HeyGen avatar
  or Seedance renders (HeyGen skills).
---
# Brief To Video Creator

Video pipeline: Idea -> Brief -> Storyboard and references (one sheet per character) -> Prompts (timed shots) -> Clips (same cast throughout) -> Final cut with captions.

Method from "Build Your Own Creative Agent Skills" (AICON 2026 masterclass by Tianyu Xu, 8 Oct 2026, *SCAPE, Singapore).

## Scope
- This skill owns the story: the idea-to-brief interview, the brief, the storyboard, the script, the clip prompts, the edit order and the captions.
- Hand off the visual look (numbered code-drawn styles, HTML slides or frames, a design system) to **Styled Visual Video Creator By BK Han**.
- Hand off avatar or presenter renders, voice clones and Seedance cinematic clips to the HeyGen skills (**heygen-video**, **heygen-avatar**, **heygen-seedance-cinematic-long-video**).
- Come back here for the final cut and the QC.

## 1. Idea to brief (the hinge)
1. IN: a rough idea, brain dump, voice note or one line.
2. RUN: a short 5W1H interview. Ask only what's missing, 2 or 3 questions at a time.
3. OUT: a 500-1,000 word brief, using the template below.
4. CHECK: run the brief check below before you storyboard.

### Question bank (ask only the gaps)
- Who: who is the audience? Who is on screen (presenter, avatar, characters)? Whose voice is it?
- What: what is the one message? What's the offer or call to action, with its exact URL?
- Why: why should the viewer care? What should they feel or do afterwards?
- When: what is the deadline or event date? How long should it run, and which platform limits apply (for example, Facebook Reels max 90 s)?
- Where: which platforms? Which aspect ratio (9:16, 16:9, 1:1)? What setting is shown?
- How: which tone and style? Is there music? How should it be disclosed (AI voice or AI visuals labels)? Which facts and sources can be used?

### Brief template (fixed sections)
1. Goal and call to action
2. Audience
3. Platforms, length and aspect ratio
4. Key message and the facts behind it, each with a source
5. Story acts or beats, with timings
6. Cast and assets: presenter, voice, logos, images, rights and credits
7. Look: style, lighting, captions (handed off to Styled Visual if needed)
8. Disclosures and compliance: AI labels, credits, claims to avoid
9. Approvals: who approves, and what stays draft

### Brief check (pass before storyboarding)
- All 9 sections are filled, or marked n/a with a reason.
- Every number, date or claim has a source. Nothing is invented.
- The total of the beat timings is within the platform's length limit.
- The call to action URL is written exactly and is readable on screen.
- The AI disclosure and credits are present where needed.

## 2. Storyboard, script and prompts
- Write one line per beat: the timing, the voiceover line, what's on screen, and the caption.
- Turn each beat into a clip prompt that keeps the cast and style consistent.

## 3. Generate and cut
- Render clips via the hand-off skill, or a teammate video bot.
- Assemble, burn in the captions, and add any watermark or end card.
- Cut only at sentence boundaries.
- QC: transcribe the audio and check every sentence is whole, grab frames to confirm the required on-screen lines, and check the duration is within the platform limit.

## 4. Cost check
Estimate compute cost before producing (per second of video, per image, per LLM call). Human time is about 3-8 h per finished minute, plus software and licensing.

## Rules
- Draft only. Nothing is published, sent or changed without the owner's approval.
- Confirmation lists: number each item, and end with an "All" option.
- Use only real facts. Don't claim to have coined terms already in use (for example, "liveBook" is Manning's).

## Changelog
- 2026-10-23: Removed references to missing helper files (question-bank.md, brief-template.md, example-brief.md, brief_lint.py) and put the question bank, the brief template and the check inline instead. Added a Scope section that splits this skill from Styled Visual Video and the HeyGen skills. Added a platform-length check.
