# Free AI Agent Skills by BK Han

**19 free, copy-paste AI agent skills (SKILL.md files) that let one person run marketing, events, video and business workflows with AI bots.**

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE) ![Skills](https://img.shields.io/badge/skills-19-blue) ![Format](https://img.shields.io/badge/format-SKILL.md-orange) ![Made in Singapore](https://img.shields.io/badge/made%20in-Singapore-red)

Free AI Agent Skills by BK Han is an open collection of 19 ready-to-use SKILL.md templates for AI agents such as Claude Code, Codex, Cursor and Grok Bot. Each skill is a written workflow that turns a general AI agent into a specialist for solopreneurs: lead forms, Luma events, newsletters, LinkedIn, video and QA.

## Install

```bash
npx skills add bk-han-dev/free-ai-bot-skills
```

Install just one skill:

```bash
npx skills add bk-han-dev/free-ai-bot-skills --skill "Pre-Publish QA By BK Han"
```

Claude Code plugin marketplace:

```
/plugin marketplace add bk-han-dev/free-ai-bot-skills
/plugin install bk-han-marketing-skills@bk-han-free-skills
```

No CLI? Download a single skill as a ZIP from [Releases](https://github.com/bk-han-dev/free-ai-bot-skills/releases), unzip it into your agent's skills folder (for example `~/.claude/skills/`), and you're done.

## Skills

| Skill | Category | What it does |
|---|---|---|
| [Pre-Publish QA By BK Han](skills/marketing/pre-publish-qa-by-bk-han/SKILL.md) | Marketing and growth | Before any post, caption, poster, newsletter, web change or calendar goes to the client for approval, run this checklist and attach the PASS/FAIL… |
| [Viral Research To Draft By BK Han](skills/marketing/viral-research-to-draft-by-bk-han/SKILL.md) | Marketing and growth | When a platform specialist owes this cycle's post, research what is working on that one platform right now and turn it into 3 hooks plus 1 full post… |
| [X Viral Research By BK Han](skills/marketing/x-viral-research-by-bk-han/SKILL.md) | Marketing and growth | Use this when you need to research what is going viral on X (Twitter) this week, check the account's own results, and turn that into one draft-only… |
| [Cross-Platform Campaign Split By BK Han](skills/marketing/cross-platform-campaign-split-by-bk-han/SKILL.md) | Marketing and growth | When the social lead plans a week (or several bots will promote the same event or offer), set one theme and CTA, then give each platform its own… |
| [Newsletter Issue Draft By BK Han](skills/marketing/newsletter-issue-draft-by-bk-han/SKILL.md) | Marketing and growth | Use when a recurring newsletter (e.g. a LinkedIn newsletter) owes an issue or its pipeline needs managing: keep approved issues queued ahead,… |
| [Newsletter Subscriber Growth By BK Han](skills/marketing/newsletter-subscriber-growth-by-bk-han/SKILL.md) | Marketing and growth | Use when a LinkedIn newsletter (or several) needs more subscribers: audit how it is found, plan weekly growth actions, draft promo posts, profile and… |
| [LinkedIn Growth And Community By BK Han](skills/marketing/linkedin-growth-and-community-by-bk-han/SKILL.md) | Marketing and growth | Use when growing a LinkedIn group or audience, writing group posts or newsletter issues that give real value, planning community rituals and invites,… |
| [Skool Community Growth By BK Han](skills/marketing/skool-community-growth-by-bk-han/SKILL.md) | Marketing and growth | Use when managing, reviving, or growing a Skool community: auditing its public page, planning weekly engagement posts, fixing… |
| [Lead And Feedback Form Builder By BK Han](skills/marketing/lead-and-feedback-form-builder-by-bk-han/SKILL.md) | Marketing and growth | Use when building a registration, feedback, lead, intake or application form (Google Forms or Jotform), or when summarising its responses into… |
| [Event Promo From Luma By BK Han](skills/events/event-promo-from-luma-by-bk-han/SKILL.md) | Events | When any promo, poster brief, newsletter block or web "upcoming events" section mentions a Luma event, pull its facts from the public Luma API first… |
| [Luma Event Organiser Specialist By BK Han](skills/events/luma-event-organiser-specialist-by-bk-han/SKILL.md) | Events | Use when hosting or editing a Luma event you run: checking live sign-ups, creating or cloning an event, or changing its title, description, venue,… |
| [Eventbrite Specialist By BK Han](skills/events/eventbrite-specialist-by-bk-han/SKILL.md) | Events | Use when managing events as an Eventbrite organizer: auditing upcoming/draft events, syncing them from a master source (e.g. Luma), creating or… |
| [Online Session Prep And Follow Up By BK Han](skills/events/online-session-prep-and-follow-up-by-bk-han/SKILL.md) | Events | Use when an online live session (Zoom or similar) needs prep (agenda, run-of-show, slides checklist, host notes) or, afterwards, a transcript… |
| [Brief To Video Creator By BK Han](skills/video/brief-to-video-creator-by-bk-han/SKILL.md) | Video | Use when making a video (promo, story, explainer) from a rough idea: interview to a production brief, then storyboard, clip prompts, generation and… |
| [Styled Visual Video Creator By BK Han](skills/video/styled-visual-video-creator-by-bk-han/SKILL.md) | Video | Use when a video needs a consistent visual style or on-screen slides/frames: code-drawn numbered styles, HTML frames from a design system, and motion… |
| [Grok Imagine B-Roll Clip By BK Han](skills/video/grok-imagine-b-roll-clip-by-bk-han/SKILL.md) | Video | Use when someone needs a short AI-generated video clip (B-roll, hook shot, promo scene, property mood shot) made with xAI's Grok Imagine video API… |
| [Loom Video Repurpose By BK Han](skills/video/loom-video-repurpose-by-bk-han/SKILL.md) | Video | Use when a Loom recording (or its transcript) needs a title, description and chapters, folder placement, and repurposing into a LinkedIn post,… |
| [Live App QA Gate By BK Han](skills/app-dev/live-app-qa-gate-by-bk-han/SKILL.md) | App development | Use before any app, web app or website build is shared with users or students: run an acceptance checklist on the live or preview link and give a… |
| [Always-On Personal Agent Workflows By BK Han](skills/business/always-on-personal-agent-workflows-by-bk-han/SKILL.md) | Business and leads | Use when setting up or running a bot as an always-on personal agent: voice delegation, spinning off build sessions, dropping links into chat,… |

## How to use a skill

1. Install it (above). Your agent reads the `description` in each SKILL.md and loads the skill when your request matches.
2. Ask in plain words, for example: *"Check these 3 posts for wrong weekdays and broken links before I send them."* (loads Pre-Publish QA)
3. Every skill ends with **Test prompts** so you can check that it fires, and **Safety rules** so nothing gets posted, sent or bought without your OK.

## What is an AI agent skill?

An AI agent skill is a folder with a `SKILL.md` file: a short YAML header (`name`, `description`) plus plain-language instructions. The agent reads only the header until a task matches, then loads the full steps. Skills work like reusable job descriptions, so the same agent can act as a QA checker, an event promoter or a video producer.

## FAQ

**What are AI agent skills?**
Reusable instruction files (SKILL.md) that teach an AI agent one job well. The agent picks the right skill from its description, follows the steps and respects the safety rules inside.

**How do I write a SKILL.md?**
Start with YAML frontmatter: a `name` and a one-sentence `description` that says *when* to use the skill. Then add numbered steps, safety rules and 3 test prompts. Any skill in this repo works as a template; see [CONTRIBUTING.md](CONTRIBUTING.md).

**Are there free AI automation templates for solopreneurs?**
Yes. All 19 skills here are free under the MIT licence: marketing QA, viral research, newsletters, LinkedIn and Skool growth, Luma and Eventbrite events, lead forms, video creation and an always-on personal agent setup.

**How can one person run a business with AI agents?**
Give each repeat job its own skill, let the agent draft and check the work, and keep a human approval step before anything is posted, sent or paid. These skills follow that pattern: the agent does the work, you approve it in one message.

**Which AI agents can use these skills?**
Any agent that reads the SKILL.md format, including Claude Code, Codex, Cursor and Grok Bot. Some skills mention specific tools (Luma, Loom, HeyGen, Grok Imagine); swap in your own if needed.

**Who is BK Han?**
BK Han is an AI Innovation Coach in Singapore, founder of AI Hustle Generation and coach of the I AM AI Bootcamp. He teaches solopreneurs to build AI bots that run real work. Motto: *Drink Coffee. Eat Pancake. Automate.*

## Want more skills?

These 19 are the free part of a larger library. Paid skill packs (real estate, app development, lead hunting, AI phone calls and the One-Person AI Business Builder) are coming soon. Get notified at [aihustlegeneration.com](https://aihustlegeneration.com/?utm_source=github&utm_medium=readme&utm_campaign=free-ai-bot-skills).

## About the author

**BK Han, AI Innovation Coach, Singapore** ([Wikidata Q141739019](https://www.wikidata.org/wiki/Q141739019))
Founder of [AI Hustle Generation](https://aihustlegeneration.com/?utm_source=github&utm_medium=readme&utm_campaign=free-ai-bot-skills) and the **I AM AI Bootcamp**. *Drink Coffee. Eat Pancake. Automate.*

## Contributing and security

Ideas and fixes are welcome; see [CONTRIBUTING.md](CONTRIBUTING.md). Found a security or privacy problem? See [SECURITY.md](SECURITY.md).

## Licence

[MIT](LICENSE) © 2026 BK Han

---

Independent, not affiliated with or endorsed by SpaceX or xAI.
