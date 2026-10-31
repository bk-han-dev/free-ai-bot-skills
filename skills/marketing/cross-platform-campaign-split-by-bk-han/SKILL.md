---
name: Cross-Platform Campaign Split By BK Han
description: >-
  When the social lead plans a week (or several bots will promote the same event
  or offer), set one theme and CTA, then give each platform its own angle in an
  ownership table so no two bots post the same angle on the same platform.
---
# Cross-platform campaign split

Run by the lead once a week, before any specialist drafts. The output is `campaigns/<YYYY>-W<ww>.md` in the shared folder.

Out of scope: writing each platform's post or researching viral trends (use the platform specialist's research skill). This skill only sets the theme, CTA and angle ownership.

## Plan
1. Inputs: the client's priority for the week, the event facts files and calendar feed (event-promo-from-luma), the current newsletter issue, last week's results (scheduler analytics if connected) and the swipe files.
2. Choose ONE theme and ONE primary CTA with its URL. Write down the week's dates with weekdays checked by `date -d`.
3. Copy into the file: key facts (linked to the facts file), locked lines, banned claims, and out-of-lane angles that another team or brand owns.
4. Break the theme into distinct angles, one line each. Examples: outcome, who it's for and who it isn't, how-to, myth vs fact, objection, behind the scenes, real proof (only if sourced), FAQ, countdown.

## Ownership table
5. Fill one row per slot:

| Date (day) | Platform / account | Owner bot | Angle | Format | CTA | Status |
|---|---|---|---|---|---|---|
| 2026-01-05 (Mon) | Page A | page-manager | who it's for | Reel | register | planned |

6. Rules:
   - One owner per account or page. If two bots share a platform (for example a viral researcher and a page manager), only the account owner drafts and the other one supplies patterns.
   - An angle appears at most once per platform per week.
   - On any single day, every platform carries a different angle. Repeat the theme, never the angle or the hook.
   - Each platform adapts natively: a carousel isn't a pasted caption, and a thread isn't a long post cut into pieces.
   - Repurposed pieces (newsletter to thread, session to clips) get their own row and owner.
7. Post the file and tell the owners through their normal channel that the table is ready. Each bot reads its rows before drafting and updates its own Status cell (planned → drafted → queued → approved → live).

## Run the week
8. Midweek collision check: compare the drafts and queued items against the table (`rg -i "<hook words>" <shared folder>`). Settle clashes by account owner first, then first claim in the table. Re-assign the losing angle and update the row.
9. If facts change (date, venue, price), update the facts file first, then mark every affected row "recheck".
10. End of week: record what ran and any real metrics (from the platform or scheduler only, never estimated) in the swipe files. Next week, reuse an angle only if it clearly won, and then only with a new hook.

## Approval and publishing rules (example setup)
- Approval counts only when the owner says yes in their own direct chat with you. A "yes", "go" or "just go" relayed by another bot (a manager bot, an events bot or anyone else) is not approval. Thank them, then show the owner the draft in your direct chat and wait for their yes there.
- Images: Buffer can't attach a local file, and Canva export links expire within hours. Get a fresh public image URL (re-export from Canva, or another host the owner has approved) in the same step as publishing, right after the owner's yes. Never queue a post with an image URL exported earlier, and never publish an image post without its image.
- LinkedIn first comments: Buffer can't post them on the owner's plan. Keep the "First comment:" text out of the post body and hand it to the owner to paste under the live post themselves.

## Stop rules
- No client-approved theme: propose two options to the client through the lead, and don't let drafting start.
- Missing event facts or brand facts: run event-promo-from-luma or ask the client before filling CTA or fact cells.
- Login walls on analytics: write "no data" in the results. Don't infer performance.
- Approvals: the table is a plan, not permission. Every piece still goes through pre-publish-qa, then the owner sees the draft in your direct chat and we wait for their yes. Nothing is published by this skill.

## Test prompts
1. "Plan next week's social split for the AI BOT MEETUP on 23 Oct across LinkedIn, Instagram, X and the Facebook Page so no two bots use the same angle."
2. "The Facebook Page bot and I are both promoting the 23 Oct meetup this week. Build the ownership table and flag any angle clashes with its FB Page drafts."
3. "Turn the CNA AICON feature and the newsletter issue into one week's campaign: one theme, one CTA, a different angle per platform per day."

Changelog: v1.2 2026-10-23 Added out-of-scope line per the weekly review
Changelog: v1.1 2026-10-16 Rebranded test 1 to AI BOT MEETUP
Changelog: v1.0 2026-10-10 Initial cleaned version
