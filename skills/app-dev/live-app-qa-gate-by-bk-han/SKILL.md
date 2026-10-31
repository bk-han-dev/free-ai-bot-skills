---
name: Live App QA Gate By BK Han
description: >-
  Use before any app, web app or website build is shared with users or students:
  run an acceptance checklist on the live or preview link and give a clear PASS
  or FAIL with evidence.
---
# Live App QA Gate By BK Han

Version: v1.0 (2026-10-28). Modelled on the common "QA bot" idea (QA on the live deploy, pass or fail before you ship) and a standard test-before-enabling checklist. Written in-house.

## When to use
Before any build (web app, PWA, mobile preview build, website change) goes to users, students or the public.

## Inputs needed
- The live or preview link (or the built file path)
- The acceptance criteria (from the spec or ticket); if there are none, write them first and get them confirmed
- Target devices and screen sizes

## Steps
1. List the acceptance criteria as numbered, testable lines ("Given / when / then").
2. Open the build fresh (cleared storage) on each target size: small phone, large phone, tablet portrait and landscape, laptop and desktop. Use Playwright with touch emulation where real devices aren't available.
3. Walk every criterion and record PASS or FAIL with a screenshot or log line as evidence.
4. Run the standard sweep:
   - first-run and onboarding, empty, loading, error and offline states
   - no console or page errors; no broken links
   - tap targets at least 44px, readable contrast, reduced-motion respected
   - no secrets, keys or personal data in the page source or network calls
   - file size and load time within budget
   - data survives a reload; nothing is lost on update
5. Re-test anything that changed since the last pass (regression).
6. Verdict: PASS only if every criterion passes and there are no blockers. Otherwise FAIL, listing each failure, its severity (blocker, major, minor), how to reproduce it and a screenshot.

## What to return
A short report with the verdict on the first line, a criteria table (criterion, result, evidence), the failures with repro steps, and what was not tested and why.

## Requires approval
- Never publish, deploy to production, submit to app stores or share links publicly; QA only says pass or fail.
- Report the verdict to whoever owns the release (the dev lead or the owner); the owner decides to ship.

Changelog: v1.0 2026-10-28 created.
