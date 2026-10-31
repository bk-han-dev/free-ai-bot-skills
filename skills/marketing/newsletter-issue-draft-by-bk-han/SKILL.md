---
name: Newsletter Issue Draft By BK Han
description: >-
  Use when a recurring newsletter (e.g. a LinkedIn newsletter) owes an issue or
  its pipeline needs managing: keep approved issues queued ahead, research real
  news, draft in the client's voice with fixed CTAs, cross-promo and
  disclaimers, get approval, publish on the date, and log results. Not for
  single social posts.
---
# Newsletter issue draft and pipeline

Output for each issue: a subject line, preview text, the full body, a sources list, a QA result and numbered approval options. After the client's yes, also the published link and logged metrics.

Out of scope:
- Single social posts. Use Viral Research To Draft By BK Han.
- X threads. Use X Viral Research By BK Han.
- Subscriber growth plans. Use Newsletter Subscriber Growth By BK Han.

Shared files live in the newsletter folder:
- `brand-facts.md`
- `cross-promo-blocks.md`, used word for word
- `approved-sections/`
- `issues-log.md`, which tracks each issue's publish date, title, status (drafted / approved / published), link and metrics

## Pipeline: draft ahead, never late
1. Keep a lead time, by default two weeks. On each run, draft the issue whose publish date is that far out, not the one due today.
2. Keep this target: every newsletter always has its next issue approved and waiting. When a publish date has no approved draft inside the lead time, write a catch-up draft at once and flag it as urgent.
3. For several newsletters that alternate weeks, send at most one new draft per week. Check `issues-log.md` so you never draft the same publish date twice.
4. Because drafts are written early, prefer evergreen tips. Mark every time-sensitive item (event dates, "this week" news, counts) with `RECHECK`, and re-verify those items on publish day.

## Before you draft
5. Read `brand-facts.md`, the cross-promo blocks, any approved sections or outlines, and the last 4 log entries. Don't repeat a lead topic from the last 4 issues or from the client's other channels this week.

## Research
6. Find 5 to 8 real items from the last 14 days, each with a headline, why it matters, a URL and a date. No URL, no item. For a source behind a login, use a public copy or log `blocked: <url>`.

## Draft
7. Structure:
   - one big idea
   - one practical tip
   - a tool pick
   - 2 to 4 plain-English quick hits with links
   - an event spotlight, with facts copied from the event page, only for events still upcoming on the publish date
   - a human-side note on jobs, AI security or creativity
   - the cross-promo block
   - the CTAs, including one subscribe or share ask
   - the sign-off and the disclaimers
8. Voice: warm, practical, no hype, plain English. AI helps people. It doesn't replace them.
9. Every number, date or "first" claim needs `brand-facts.md` or a source link. Otherwise cut it. Never promise earnings. No prices unless the client allows them. Never imply affiliation with a third-party AI company.
10. Write 3 subject lines (under 60 characters) and 1 preview line (under 120 characters). At least one subject should use a concrete number or a personal story.

## Approve
11. Run Pre-Publish QA By BK Han and fix every FAIL.
12. Save the draft as `issues/<publish-date>-<slug>.md` and log it as `drafted`.
13. Show the full draft in your own chat with the publish date and numbered options (1) subject A ... N) All). Only the client's yes in your own chat counts. Log it as `approved`.

## Publish (only after a yes)
14. On the publish date, re-check `RECHECK` items, then publish exactly the approved text. Formatting fixes are fine. Wording changes need a new yes.
15. Use a rendered-HTML paste into the editor so headings, lists and links survive. Afterwards, open the live page, confirm the title and links, and screenshot it.
16. Log it as `published` with the URL, and send the link to the social bots for promotion.

## Measure
17. Record the subscriber count at publish, then views, reactions, comments and new subscribers after 48 hours and 7 days, where the platform shows them. Write "unavailable" rather than guessing.
18. Every 4 issues, review which subjects, topics and CTAs did best, and apply what you learn to the next drafts.

## Stop rules
- Never publish without the client's yes in your own chat. A yes relayed by another bot doesn't count.
- With fewer than 3 sourced items, say "research thin" and write an evergreen how-to issue.
- If an approved issue misses its date, tell the client how late it is and why. Don't hide the delay.

## Test prompts
1. "Draft the bots newsletter, leading with the approved outage-lessons outline."
2. "The client wants to approve 2 weeks ahead, but the next 2 issues have no drafts." Expected: two catch-up drafts flagged urgent, then the normal lead time.
3. "Only 2 news items have sources this week." Expected: research thin and an evergreen issue.

Version: v1.1
Changelog: v1.1 2026-10-30 Added a 2-week-ahead pipeline, catch-up drafts, RECHECK items, the publish step and metrics. v1.0 2026-10-23 First version.
