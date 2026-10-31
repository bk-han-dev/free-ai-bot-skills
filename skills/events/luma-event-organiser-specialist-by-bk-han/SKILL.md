---
name: Luma Event Organiser Specialist By BK Han
description: >-
  Use when hosting or editing a Luma event you run: checking live sign-ups,
  creating or cloning an event, or changing its title, description, venue, price
  or capacity. Not for writing promo posts.
---
# Luma Event Organiser Specialist By BK Han

This is a recipe for hosting and editing your own Luma events. Promo posts are not covered here; they belong to the social team's event-promo skill.

## 1. Read the live state first (no login needed)
Use curl, not Python urllib, which gets a 403 from the API.
- Host's upcoming events: `https://api.luma.com/user/profile/events?username=<USERNAME>` (events_hosting). This lists only a few.
- One event: `https://api.luma.com/url?url=<slug>`. It returns name, start_at/end_at (in UTC, so convert to local time), guest_count, ticket_info (is_free, price.cents, spots_remaining), geo_address_info and description_mirror (rich-text JSON).
- Whole calendar: `https://api.luma.com/calendar/get-items?calendar_api_id=<cal-id>&period=future&pagination_limit=50`.
- If an address is set to 'registered guests only', the public API leaves it blank. Fill it from your own records.

## 2. Edit or create (host tools, signed-in browser)
- Edits happen on `https://luma.com/event/manage/<evt-id>`, driven through the browser. There is no public write API.
- **New event in the same series:** use **Clone Event** (manage page, More tab). This carries over the cover, description, venue and tickets. Then change the title, date and time, price, and any dated lines in the description. Check that the original event is unchanged.
- **Targeted description edits:** quote the exact old paragraph and the exact new one, and say "change nothing else" (title, date, location, tickets, capacity and cover stay as they are).
- **Titles:** after saving, re-check the spacing on the reloaded public page. Typing can drop spaces.
- **Guest emails:** 'Update Event' may email existing guests, and this can't be turned off. Warn the host before editing an event that already has guests.
- **Verify every change:** reload the public page and confirm that removed words are gone, new text is there, and price and capacity are right.

## 3. Description style (SEO + AEO)
- Open with a keyword-rich headline line: what the event is, where it is, and what attendees get out of it.
- Include an Event details list (date, time with timezone, venue, ticket, format), then sections for what you'll learn, who should attend, before you come, the host bio and a sponsor thank-you.
- End with a 2–4 item FAQ written as direct question-and-answer pairs.
- State logistics honestly, for example "no food or drinks will be served" or "free entry, limited to 30 people".
- Never state a seat count or say "first come first served". Use "Seats are limited. Waitlist opens when full."

## 4. Report and hand off
- Give the host the public link, the local date and time, price, capacity, waitlist state and a screenshot of the public page.
- Tell the promo bots about any rename, new event, or price or venue change, with exact titles and links. They need the host's approval before posting.
- To sync another platform (for example Eventbrite), export each event's exact description, venue and full address, date, time, price and capacity to a markdown file and share its path.

## BK Han house defaults (adjust for other hosts)
- Timezone is SGT (GMT+8). The host is Coach BK Han; motto: "Drink Coffee. Eat Pancake. Automate."
- Series names:
  - "AI Bot Meetup" by AI Bot Builders Singapore (2–4 PM; say "meetup", not "workshop")
  - "TGIF Networking #NN" (Fridays 7–9 PM, free, 30 people, no food or drinks)
- Naming rule (since 15 Oct 2026): never put "Grok" in titles, covers or calendar names. Grok may appear only in descriptions or topic tags, and those descriptions must include "Independent community, not affiliated with or endorsed by SpaceX or xAI."
- Venue: SG Innovation - powered by DTMatrix and Keppel, Blk 71 Ayer Rajah Cres., #04-01, Singapore 139951. The venue is sponsored, so thank the sponsor.

## Test prompts
1. "How many people have signed up for my 23 Oct meetup, and how many seats are left?"
2. "Clone my AI Bot Meetup for 18 Dec, 2–4pm, free entry, and send me the link."
3. "Remove every mention of food from the TGIF #45–#47 descriptions and keep everything else the same."

Changelog: v1.0 2026-10-09 created. v1.1 2026-10-10: renamed to Title Case, trigger narrowed to hosting and editing (promo and fill plans moved out), test prompts added. v1.2 2026-10-16: series renamed AI Bot Meetup / AI Bot Builders Singapore, Grok naming rule added, test prompt 2 updated.

Independent, not affiliated with or endorsed by SpaceX or xAI.
