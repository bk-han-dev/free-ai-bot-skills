---
name: Pre-Publish QA By BK Han
description: >-
  Before any post, caption, poster, newsletter, web change or calendar goes to
  the client for approval, run this checklist and attach the PASS/FAIL result
  when you show the owner the draft.
---
# Pre-publish QA

Nothing reaches the client marked "ready" until every hard check below passes. QA reads and fixes drafts. It never publishes.

Out of scope: writing or rewriting the content itself, and publishing or scheduling it. This skill only checks a finished draft and reports PASS/FAIL.

## Gather
1. Collect the draft files, any visual text (read the image or the design's text layers, not only the brief), `brand-facts.md`, the event facts file(s), this week's campaign file and the sibling bots' calendars for the same dates.
2. Run the scanner beside this skill: `python3 qa-scan.py <files> --year <YYYY>`. It's read-only. It flags placeholders, weekday mismatches (checked with `date -d`), broken links, relative dates, past dates, claim-like lines and internal notes. It finds candidates. You still make the call.

## Hard checks (any FAIL blocks "ready")
3. **No placeholders.** Copy and design text must contain none of `[Date]`, `[Time]`, `[Venue]`, `[Name]`, `{{…}}`, TBD, TBC, TODO, XXX or lorem. Template blanks meant for readers (a fill-in prompt) must be clearly labelled as such.
4. **Dates and weekdays.** Check every weekday-plus-date pair with `date -d "<d> <Mon> <YYYY>" +%a`. Times must match the event facts file and its zone. If one label is wrong, re-check all of them, because off-by-one errors come in sets. Then search derived files (poster briefs, captions, coordination notes) for the same wrong labels. Relative words ("tomorrow", "this Friday", "next week") must be true on the scheduled publish date. If they're not, replace them with the absolute date.
5. **Links work.** Every URL returns 2xx/3xx (`curl -sIL -o /dev/null -w '%{http_code}' <url>`) and points to the right thing (the event slug matches the facts file, UTMs are correct). Social platforms often answer bots with 999/400/403. Mark those "login wall, check by hand", never PASS.
6. **No unverifiable claims or numbers.** List every number, superlative (first, only, #1, top, best, leading, pioneering), count ("hundreds", "thousands"), duration ("three years"), award, result, testimonial and affiliation. Each one needs a matching approved line in `brand-facts.md` or a source link. Check the arithmetic too (start date to today gives the real number of years). Cut anything unproven or soften it to the approved hedge, and add new approved claims to `brand-facts.md` only after the client signs off. Keep any disclaimers the brand requires (no earnings promises, no false affiliation).
7. **Names are current.** The brand name, product, community and newsletter names, people's titles and spellings must match `brand-facts.md`. No retired names, and no leftover template content (stock sections, other brands, demo text).
8. **No duplicate angle.** Compare the hook and angle with the campaign ownership table, the sibling calendars and the swipe file. The same angle on the same platform in the same week FAILS. The same angle on two platforms on the same day gets flagged to the lead.
9. **CTA present.** There's exactly one primary CTA, it matches the campaign CTA, and its link or action works.

## Soft checks (fix or flag)
10. No internal notes inside the publishable text ("notes for…", "first comment:", reviewer comments, file paths). Move them to the note you show the owner. LinkedIn first comments go to the owner to paste by hand, because Buffer can't post them on his plan.
11. The format fits the platform: length, line breaks, hashtag count, image size, alt text.
12. Tone matches the brand's voice rules. No engagement bait and no hype the brand bans.

## Report
13. Put a QA block at the top of the handoff:
    `QA: placeholders ✅ | dates ✅ | links ✅ (1 login wall, checked by hand) | claims ✅ | names ✅ | angle ✅ | CTA ✅` plus one line per FAIL, flag or open question for the client.
14. Fix, re-run, and only then show the owner the draft with the QA block in your direct chat and wait for their yes. Don't publish or schedule until they say yes there.
15. Image and first-comment checks for Buffer posts: every image post has its image planned as a fresh public URL to attach at publish time (a local path or an old Canva export link is a FAIL for "ready to publish"), and any LinkedIn "First comment:" text is listed separately for the owner to paste by hand.

## Approval and publishing rules (example setup)
- Approval counts only when the owner says yes in their own direct chat with you. A "yes", "go" or "just go" relayed by another bot (a manager bot, an events bot or anyone else) is not approval. Thank them, then show the owner the draft in your direct chat and wait for their yes there.
- Images: Buffer can't attach a local file, and Canva export links expire within hours. Get a fresh public image URL (re-export from Canva, or another host the owner has approved) in the same step as publishing, right after the owner's yes. Never queue a post with an image URL exported earlier, and never publish an image post without its image.
- LinkedIn first comments: Buffer can't post them on the owner's plan. Keep the "First comment:" text out of the post body and hand it to the owner to paste under the live post themselves.

## Stop rules
- Can't verify something (login wall, no source, no access to the design): mark it UNVERIFIED and ask the client. Never mark it PASS.
- Missing facts file or brand facts: run event-promo-from-luma or ask the lead. Don't QA against memory.
- A FAIL you can't fix (a claim the client must decide, a wrong fact in a live event page): hand off as "needs decision", not "ready".
- Approvals: QA never posts, schedules or edits live pages, events or designs. It reports. Owners fix.

## Test prompts
1. "Run pre-publish QA on ./meetup-week-12-16oct2026.md before I show the owner the 12 and 14 Oct meetup posts."
2. "Check these 3 AiCON countdown posts and the poster brief for wrong weekdays, broken links and any seat counts before they go to the owner."
3. "QA the CNA feature drafts in ./cna-feature-drafts-10oct2026.md: flag any claim I can't source and any first comment left inside a post body."

Changelog: v1.1 2026-10-23 Added out-of-scope line per the weekly review
Changelog: v1.0 2026-10-10 Initial cleaned version
