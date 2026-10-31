# Security policy

## Reporting a problem

If you find a leaked secret, personal data, or an instruction in a skill that could make an agent act unsafely (post, send, pay or delete without approval), please **do not open a public issue**. Email **bk@aihustlegeneration.com** with the file and line. You'll get a reply within 7 days.

## What we check

Every change must pass `scripts/check.sh --public` before it is pushed. It scans for API keys and tokens (regex and [gitleaks](https://github.com/gitleaks/gitleaks)), email addresses, Singapore phone numbers and NRIC/FIN numbers, and checks each SKILL.md's frontmatter.

## Using these skills safely

- Skills are plain instructions. Read a skill before you install it.
- Keep your own API keys in environment variables or a secret manager, never inside a SKILL.md.
- The skills are written so that the agent asks for your approval before anything is posted, sent, bought or deleted. Keep that step.
