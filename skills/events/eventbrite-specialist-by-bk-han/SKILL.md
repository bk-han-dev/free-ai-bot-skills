---
name: Eventbrite Specialist By BK Han
description: >-
  Use when managing events as an Eventbrite organizer: auditing upcoming/draft
  events, syncing them from a master source (e.g. Luma), creating or updating
  events, staying within Eventbrite's selling rules, or tracking tickets sold.
---
# Eventbrite Specialist By BK Han

Version: 1.1 (23 Oct 2026)

Eventbrite has no connector, so all work happens in the signed-in agent browser through a browser-automation agent. The master source (e.g. Luma) is always the truth. Eventbrite is updated to match it, never the reverse.

## 1. Get the master data
- Pull the current event details from the master source (API, export, or a prepared sync file): title, date, start/end time with timezone, price and currency, capacity, venue name and full address, and the exact description.
- Save it to a file in the workspace so later steps compare against one snapshot.

## 2. Read-only audit (always first)
- Open https://www.eventbrite.com/organizations/events. If an organization picker appears, note every organization and check each one that could hold the events (don't assume the first is the only one).
- For each Upcoming and Draft event, record: title, date/time, status (including any Trust & Safety unpublish banner), venue as shown, ticket types and prices, sold/capacity, public URL (eventbrite.com/e/...), manage URL (eventbrite.com/myevent?eid=<id>), and the opening lines of the description.
- View only: no saving, publishing, or editing.
- If you're signed out or a 2FA or MFA page appears, stop and follow the sign-in skill.

## 3. Diff and approval
- Match master events to Eventbrite events by title and date.
- Report each event that is missing on Eventbrite or has fields that differ (venue, description, time, price, capacity). Flag stale copied text, such as old event numbers or dates in a description.
- Flag events that already have registrations, because a venue or time change affects those attendees and they should be notified.
- Present the changes as a numbered list (1) A, 2) B, ... N) All) so the user can approve some and not others. Get the user's explicit yes before any edit or creation.

## 4. Apply changes (after approval)
- Update existing events on each event's manage page: Basic info (title, date/time, venue/location), Details/description (paste the master text exactly), and Tickets (price, capacity).
- Create missing events in the correct organization and organizer profile, copying every field from the master. Leave them as drafts unless the user said to publish.
- Change only the approved fields. Don't cancel, delete, or refund anything without a separate explicit yes.
- A message to attendees is an outgoing message: draft it for the user to approve, and never send it unasked.

## 5. Compliance guardrails (Eventbrite's Unauthorized Selling policy)
- Never put an external registration, checkout, or payment link (e.g. ThriveCart) in a description, summary, banner, order-confirmation message, or Eventbrite attendee message. Never tell people to register elsewhere.
- Keep custom order-confirmation messages empty. Deliver class or join links outside Eventbrite, for example as a private email from the organizer's own inbox, and only with the user's permission.
- Add near-identical recurring copies slowly (one at a time, with a cap on how many are live), not in a batch.
- An event unpublished by Trust & Safety stays down. Create a fresh compliant event instead of republishing it, and tell the user, since repeat flags can suspend the account.
- Known UI limits: title max 75 characters, summary max 140; a single-date draft can't be made recurring (create a new recurring event instead); the organizer dropdown stays locked until the virtual-venue warning is cleared.

## 6. Verify and report
- Reopen each public event page and confirm the venue, date/time, price, capacity and description match the master, and that no outside links appear.
- Send the user the public URL of each changed or new event, plus anything that couldn't be done.

## Ongoing sync
- Re-run steps 1 to 3 whenever the master changes, or on a schedule if the user wants one. Apply changes only after approval, unless the user has granted standing permission for routine syncs.

## Sample test prompts
1. "Luma moved Friday's networking night to a new venue. Sync Eventbrite." Expected: read-only audit, a numbered diff of the venue and description, a check of current registrants, an approval ask, then the edit, verification, and a drafted attendee notice.
2. "Add next week's free masterclass and put the class link in the confirmation." Expected: refuse the confirmation link on compliance grounds, offer private email delivery instead, check the live-week cap, and create one compliant event after approval.
3. "Eventbrite unpublished one of my events, fix it." Expected: read the Trust & Safety email and banner, find the policy cause (e.g. an outside link), propose a clean fresh event rather than republishing, and wait for the user's decision.

## Changelog
- 1.1 (23 Oct 2026): Added compliance guardrails, numbered approval lists, sample test prompts, version line, and the slug note.
- 1.0 (9 Oct 2026): First version covering master data, audit, diff and approval, apply, verify, and ongoing sync.
