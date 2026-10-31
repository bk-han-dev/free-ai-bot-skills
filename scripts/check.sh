#!/usr/bin/env bash
# Safety check for BK Han skill repos. Must PASS before any push.
# Usage: scripts/check.sh [--public]
#   --public  also blocks internal team/bot names (for the free public repo)
# Checks: SKILL.md frontmatter, name rule, folder slug, xAI disclaimer,
#         secret patterns (regex + gitleaks if installed), PDPA patterns
#         (emails, SG phone numbers, NRIC/FIN), and a hashed deny-list of
#         private names (hashed so the list itself never leaks).
set -uo pipefail
cd "$(dirname "$0")/.."
MODE="${1:-}"
python3 - "$MODE" <<'PY'
import os, re, sys, hashlib
try:
    import yaml
except ImportError:
    sys.exit("FAIL: python3 yaml module missing (pip install pyyaml)")
public = sys.argv[1] == "--public"
fails = []
def fail(f, msg): fails.append(f"{f}: {msg}")

PRIVATE_DENY = {'189eed021ba69161','28a5854124e264e9','35d0a1b4fcc65795','453b678136193fb4','4d1608c849f1a496','650d1c7fe8f5c4a2','7c8b924afbd09ea1','d979885447a413ab','e5a4c95a3e311210','f46a3eafcea705db','fe8d69782c11692d'}
TEAM_DENY = {'58b403f46e5dc2ee','1981e82487ac14e9','30d4be13d8ada770','340a23f7b687227f','38e082897c1cac1e','39c2155fb454537f','4dc8d553c7b80069','5a851b8d40c1a763','687fb7c51c6709f6','6b693b23f086090d','77e50d7d5e9447c0','7ada01d7f02d153d','c63386a3080ab2a3','c89a029bf3a5c767','c97810a5e7586d27','cb639311de9013ba','ce85a884928d31f8','cf4dd222c5792174','df64c48d349fa572','e70975a491a0180a','05cd46ba7cf2b416'}
h = lambda s: hashlib.sha256(s.encode()).hexdigest()[:16]
EMAIL_OK = re.compile(r"^(bk@aihustlegeneration\.com|[^@]+@example\.(com|org|net))$", re.I)
PHONE_OK = {"61234567", "91234567", "81234567", "98765432", "87654321", "12345678"}
SECRETS = [
 ("aws key", r"AKIA[0-9A-Z]{16}"), ("github token", r"gh[pousr]_[A-Za-z0-9]{30,}"),
 ("github pat", r"github_pat_[A-Za-z0-9_]{30,}"), ("openai-style key", r"\bsk-[A-Za-z0-9_-]{20,}"),
 ("xai key", r"\bxai-[A-Za-z0-9]{20,}"), ("google key", r"AIza[0-9A-Za-z_-]{35}"),
 ("slack token", r"xox[abprs]-[A-Za-z0-9-]{10,}"), ("private key", r"-----BEGIN [A-Z ]*PRIVATE KEY-----"),
 ("stripe key", r"\b[rs]k_live_[A-Za-z0-9]{16,}"), ("jwt", r"eyJ[A-Za-z0-9_-]{10,}\.eyJ[A-Za-z0-9_-]{10,}\."),
 ("password assignment", r"(?i)\b(password|passwd|pwd|secret|token|api[_-]?key)\s*[:=]\s*[\"']?(?![<$\{])[A-Za-z0-9!@#%^&*_+=/.-]{8,}"),
]
EMAIL = re.compile(r"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}")
PHONE = re.compile(r"(?<![\d.,/:-])(?:\+?65[\s-]?)?([3689]\d{3})[\s-]?(\d{4})(?![\d.,/:-])")
NRIC = re.compile(r"\b[STFGM]\d{7}[A-Z]\b")
TOK = re.compile(r"[a-z0-9]+(?:-[a-z0-9]+)*")

def slugify(n): return re.sub(r"[^a-z0-9]+", "-", n.lower()).strip("-")

files = []
for root, dirs, fs in os.walk("."):
    dirs[:] = [d for d in dirs if d not in (".git", "node_modules", "dist")]
    for f in fs:
        if f.endswith((".zip", ".png", ".jpg", ".gif", ".mp4")): continue
        files.append(os.path.join(root, f)[2:])

skills = 0
for f in sorted(files):
    try: t = open(f, encoding="utf-8").read()
    except Exception: continue
    is_check = f == "scripts/check.sh"
    if f.endswith("SKILL.md"):
        skills += 1
        fm = None
        m = re.match(r"---\n(.*?)\n---\n", t, re.S)
        if not m: fail(f, "missing YAML frontmatter")
        else:
            try: fm = yaml.safe_load(m.group(1))
            except Exception as e: fail(f, f"frontmatter is not valid YAML ({str(e).splitlines()[0]})")
        if m and fm is not None and (not isinstance(fm, dict) or not fm.get("name") or not fm.get("description")):
            fail(f, "frontmatter needs name and description"); fm = None
        if fm:
            name = str(fm["name"])
            if not name.endswith(" By BK Han"): fail(f, f"name '{name}' must end with 'By BK Han'")
            bad = [w for w in name.split() if not (w[0].isupper() or w[0].isdigit())]
            if bad: fail(f, f"name '{name}' not Title Case: {bad}")
            if os.path.basename(os.path.dirname(f)) != slugify(name): fail(f, f"folder should be '{slugify(name)}'")
        if re.search(r"grok|\bxAI\b", t, re.I) and "Independent, not affiliated with or endorsed by SpaceX or xAI." not in t:
            fail(f, "mentions Grok/xAI but lacks the not-affiliated line")
    if is_check: continue
    for lab, pat in SECRETS:
        for mm in re.finditer(pat, t): fail(f, f"possible {lab}: {mm.group(0)[:12]}...")
    for mm in EMAIL.finditer(t):
        if not EMAIL_OK.match(mm.group(0)): fail(f, f"email address (PDPA): {mm.group(0)}")
    for mm in PHONE.finditer(t):
        if mm.group(1) + mm.group(2) not in PHONE_OK: fail(f, f"possible SG phone number (PDPA): {mm.group(0).strip()}")
    for mm in NRIC.finditer(t): fail(f, f"possible NRIC/FIN (PDPA): {mm.group(0)}")
    toks = TOK.findall(t.lower())
    grams = set(toks) | {" ".join(toks[i:i+2]) for i in range(len(toks)-1)} | {" ".join(toks[i:i+3]) for i in range(len(toks)-2)}
    hg = {h(g): g for g in grams}
    for k, g in hg.items():
        if k in PRIVATE_DENY: fail(f, f"private name/link on deny-list: '{g}'")
        if public and k in TEAM_DENY: fail(f, f"internal team/bot name: '{g}'")

print(f"Scanned {len(files)} files, {skills} skills ({'public' if public else 'private'} mode)")
if fails:
    print("\n".join("FAIL " + x for x in fails)); print(f"RESULT: FAIL ({len(fails)} issues)"); sys.exit(1)
print("Python checks: PASS")
PY
rc=$?
[ $rc -ne 0 ] && exit $rc
GL="$(command -v gitleaks || ls ~/.local/bin/gitleaks 2>/dev/null)"
if [ -n "$GL" ]; then
  if "$GL" dir . --no-banner --redact -v >/tmp/gitleaks.out 2>&1; then echo "gitleaks: PASS"
  else cat /tmp/gitleaks.out; echo "RESULT: FAIL (gitleaks)"; exit 1; fi
else
  echo "gitleaks: not installed, regex secret scan only"
fi
echo "RESULT: PASS"
