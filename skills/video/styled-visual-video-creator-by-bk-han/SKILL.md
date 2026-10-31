---
name: Styled Visual Video Creator By BK Han
description: >-
  Use when a video needs a consistent visual style or on-screen slides/frames:
  code-drawn numbered styles, HTML frames from a design system, and motion
  handed to a video engine, all from one brief.
---
# Styled Visual Video Creator

Source: "Build Your Own Creative Agent Skills" (AICON 2026, 8 Oct 2026, *SCAPE, Singapore, Tianyu Xu; AIBLE framework by Danford Tan, Sange Nirahan, Tianyu Xu).
Principle: even the best AI team needs a director. Your idea, brief and direction decide the result.

## A. Frames and decks as a folder (A + B x C = D)
1. A. Content + context first: get the production brief (5W1H) before any layout.
2. B. Design system, decided once: a token file for colours and type plus a stylesheet with layouts (CSS).
3. C. AI engine: the agent writes slides/frames as raw HTML into that system.
4. D. Render/export (HTML, then PDF/PNG). Check every frame visually before handing over.
Folder: deck/tokens.(css|json), deck/styles.css, deck/content.html, deck/assets/.

## B. Programmable aesthetics (code-draw-styles)
1. Keep a numbered style library (e.g. watercolour, ukiyo-e, risograph, blueprint, pixel art, low poly, cyanotype, Bauhaus, synthwave/VHS).
2. Trigger when someone names a style number ("style 077") or asks to turn a photo or idea into a style.
3. Each style = constraint matrix (palette, primitives, grid) + parameters; draw with Python, no image model required.
4. For motion, hand frames or references to a video engine.
5. Prompt pattern: "/code-draw-styles CREATE <subject> in <style>".

## C. Headless pipelines (advanced)
Human references -> code generation (agent turns references into coordinates/scripts) -> headless execution (e.g. Blender with no GUI).

## Rules
- Draft only. Nothing is published, sent or changed without approval.
- Confirmation lists: number each item, end with an "All" option.
- Use only facts from the brief; no invented stats.
