# Contributing

Thanks for helping improve these skills.

## Ways to help

- **Report a problem**: open an issue saying which skill, what you asked, what the agent did and what you expected.
- **Suggest a skill**: open an issue with the job it does and 3 example prompts.
- **Send a fix**: open a pull request. Small, focused changes are easiest to review.

## Skill format

```
skills/<category>/<skill-slug>/SKILL.md
```

- YAML frontmatter with `name` and `description`. The description says *when* to use the skill, in one or two sentences.
- `name` is Title Case and ends with "By BK Han"; the folder is the name in kebab-case.
- Sections: steps, safety rules (no posting, sending or paying without the owner's OK) and 3 test prompts.
- If the skill names Grok or xAI, keep the line: "Independent, not affiliated with or endorsed by SpaceX or xAI."

## Before you open a pull request

Run the safety check and make sure it ends with `RESULT: PASS`:

```bash
scripts/check.sh --public
```

It checks the frontmatter and name rule and blocks secrets (API keys, tokens, passwords) and personal data (emails, phone numbers, NRIC numbers). Never include real people's contact details or client data.

By contributing you agree your work is released under the [MIT licence](LICENSE).
