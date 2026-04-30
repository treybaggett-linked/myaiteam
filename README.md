# MyAITeam

**Give yourself a real AI team in Claude Code — coordinator, researcher, recruiter, archivist — in about 15 minutes.**

MyAITeam is a starter kit that drops a pre-wired multi-agent workspace into any folder on your machine. You get a named AI coordinator (Jack), a researcher (Randy), a recruiter (Toby), and an archivist (Lily) — all configured to collaborate inside Claude Code without any cloud setup, subscriptions, or code.

---

## Get the kit

**[Download MyAITeam.zip](https://github.com/treybaggett-linked/myaiteam/releases/latest/download/MyAITeam.zip)**

Or visit the setup guide: **https://treybaggett-linked.github.io/myaiteam/**

---

## What's in the kit

```
MyAITeam/
├── CLAUDE.md                    ← Jack's orchestrator instructions
├── README-WINDOWS.txt           ← Quick-start for Windows users
├── setup-guide.html             ← Full setup guide (open locally, no internet needed)
├── .claude/
│   ├── agents/                  ← Pre-built agent definitions
│   │   ├── coordinator.md       ← Jack
│   │   ├── researcher.md        ← Randy
│   │   ├── recruiter.md         ← Toby
│   │   └── archivist.md         ← Lily
│   ├── commands/
│   │   ├── onboard.md           ← /onboard slash command
│   │   └── remember.md          ← /remember slash command
│   └── settings.json
├── data/
│   └── schema.sql               ← SQLite schema for your team's memory
├── Team/
│   └── roster.md
├── Team Inbox/                  ← Drop files here for your team to process
├── Owner's Inbox/               ← Team puts finished work here for you
└── Archive/
```

---

## How to set it up

1. Download and unzip `MyAITeam.zip` — you get a folder called `MyAITeam/`.
2. Open that folder in Claude Code (File → Open Folder, or drag it in).
3. Type: `Establish my AI team`
4. Jack walks you through a short onboarding — your name, role, how you work.
5. Done. Ask Jack for anything.

The full step-by-step guide (including Node, npm, and Claude Code installation) is at the setup guide link above, or open `setup-guide.html` from inside the unzipped kit.

---

## Requirements

- [Claude Code](https://claude.ai/download) (free to install; requires a Claude account)
- Node.js 18+ (the setup guide covers installation)
- A Claude account (claude.ai — Pro plan works; Max is not required)

---

## How to cut a new release (maintainer notes)

```bash
# 1. Stage a clean copy
cp -r /tmp/myaiteam/kit /tmp/MyAITeam

# 2. Zip it
cd /tmp && zip -r MyAITeam.zip MyAITeam -x "*.DS_Store"

# 3. Publish
gh release create v0.X.0 /tmp/MyAITeam.zip \
  --title "MyAITeam v0.X.0" \
  --notes "Brief changelog here."
```

The stable download URL never changes: `https://github.com/treybaggett-linked/myaiteam/releases/latest/download/MyAITeam.zip`

---

Built by [Trey Baggett](https://github.com/treybaggett-linked).
