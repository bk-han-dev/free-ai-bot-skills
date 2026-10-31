#!/usr/bin/env python3
"""Read-only pre-publish scan. Usage: python3 qa-scan.py FILE [FILE...] [--year 2026] [--no-links]
Flags placeholders, weekday/date mismatches (checked with `date -d`), relative dates,
claim-like lines, internal notes left in copy, and link status. Never edits files."""
import re, subprocess, sys, datetime

args = sys.argv[1:]
year = str(datetime.date.today().year)
links = True
if "--year" in args:
    i = args.index("--year"); year = args[i + 1]; del args[i:i + 2]
if "--no-links" in args:
    args.remove("--no-links"); links = False
if not args:
    sys.exit(__doc__)

WD = r"(Mon|Tue|Wed|Thu|Fri|Sat|Sun)[a-z]*\.?"
MO = r"(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)[a-z]*\.?"
pats = [  # (regex, group order: weekday, day, month, year)
    (re.compile(rf"\b{WD},?\s+(\d{{1,2}})\s+{MO}(?:,?\s+(\d{{4}}))?"), (1, 2, 3, 4)),
    (re.compile(rf"\b{WD},?\s+{MO}\s+(\d{{1,2}})(?:,?\s+(\d{{4}}))?"), (1, 3, 2, 4)),
    (re.compile(rf"\b(\d{{1,2}})\s+{MO}(?:\s+(\d{{4}}))?\s*[|(·,]+\s*{WD}\b"), (4, 1, 2, 3)),
]
PH = re.compile(r"\[[^\]\n]{1,40}\]|\{\{[^}]+\}\}|<insert[^>]*>|\b(TBD|TBC|TODO|XXX+|lorem ipsum)\b", re.I)
MDLINK = re.compile(r"\[[^\]]+\]\(https?://")
REL = re.compile(r"\b(today|tonight|tomorrow|yesterday|this (week|weekend|mon|tue|wed|thu|fri|sat|sun)[a-z]*|next (week|mon|tue|wed|thu|fri|sat|sun)[a-z]*|last (week|mon|tue|wed|thu|fri|sat|sun)[a-z]*|in \d+ days)\b", re.I)
CLAIM = re.compile(r"\b((the|our|world\'?s|\w+\'s) first|first-ever|only|#1|no\.? ?1|top \d*%?|best|leading|biggest|largest|guarantee\w*|proven|award\w*|thousands|hundreds|millions|\d[\d,.]*\s*(\+(?![\d:])|%|k\b|x\b)|(two|three|four|five|ten|twenty|\d+)\s+years|\d{2,}[\d,]*\s+(people|students|members|clients|customers|subscribers|attendees|guests|seats|years))", re.I)
NOTE = re.compile(r"(notes? for|note to|first comment:|reviewer|internal|do not post|draft only|/workspace/|/home/)", re.I)
DATE = re.compile(rf"\b(\d{{1,2}})\s+{MO}\s+(\d{{4}})")
TODAY = datetime.date.today()
URL = re.compile(r"https?://[^\s)>\]\"'`|]+")

def wd_of(d, m, y):
    out = subprocess.run(["date", "-d", f"{d} {m} {y}", "+%a"], capture_output=True, text=True)
    return out.stdout.strip() or "invalid-date"

bad = 0
for path in args:
    raw = open(path, encoding="utf-8", errors="replace").read()
    # blank out CSS so style rules don't read as claims; keep line numbers
    raw = re.sub(r"<style.*?</style>", lambda m: "\n" * m.group(0).count("\n"), raw, flags=re.S | re.I)
    text = raw.splitlines()
    print(f"\n=== {path}")
    seen_urls = {}
    for n, line in enumerate(text, 1):
        for rx, (gw, gd, gm, gy) in pats:
            for m in rx.finditer(line):
                w, d, mo, y = m.group(gw), m.group(gd), m.group(gm), m.group(gy) or year
                real = wd_of(d, mo[:3], y)
                if real[:3].lower() != w[:3].lower():
                    bad += 1; print(f"  WEEKDAY  L{n}: '{m.group(0)}' -> {d} {mo[:3]} {y} is {real}")
        for m in PH.finditer(line):
            if MDLINK.match(line[m.start():]): continue
            bad += 1; print(f"  PLACEHOLDER L{n}: {m.group(0)}")
        for m in DATE.finditer(line):
            try:
                dt = datetime.datetime.strptime(f"{m.group(1)} {m.group(2)[:3]} {m.group(3)}", "%d %b %Y").date()
                if dt < TODAY: print(f"  PAST-DATE L{n}: '{m.group(0)}' is before today; stale event or listing?")
            except ValueError:
                bad += 1; print(f"  BAD-DATE L{n}: '{m.group(0)}'")
        if REL.search(line): print(f"  RELATIVE-DATE L{n}: {line.strip()[:110]}")
        if CLAIM.search(line): print(f"  CLAIM?   L{n}: {line.strip()[:110]}")
        if NOTE.search(line): print(f"  NOTE?    L{n}: {line.strip()[:110]}")
        for u in URL.findall(line):
            seen_urls.setdefault(u.rstrip(".,;:*"), n)
    if links:
        for u, n in seen_urls.items():
            r = subprocess.run(["curl", "-s", "-o", "/dev/null", "-L", "-m", "15", "-A", "Mozilla/5.0",
                                "-w", "%{http_code}", u], capture_output=True, text=True)
            code = r.stdout.strip() or "000"
            if code.startswith(("2", "3")): status = "ok"
            elif code in ("999", "400", "401", "403", "429") and re.search(r"linkedin|facebook|instagram|x\.com|twitter|tiktok", u):
                status = "LOGIN-WALL: verify by hand"
            else:
                status = "BROKEN"; bad += 1
            print(f"  LINK {code} {status}  L{n}: {u}")
print(f"\nHard failures (weekday, placeholder, broken link): {bad}. CLAIM?/NOTE?/RELATIVE-DATE/PAST-DATE lines need a human look.")
sys.exit(1 if bad else 0)
