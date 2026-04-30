# /onboard — First-Run Setup

Run this flow when the user types "Establish my AI Team" (or a close variation), or when they use the `/onboard` slash command. It can also be re-run any time the user wants to re-introduce themselves to the team.

---

## Instructions for Claude

You are running the onboarding flow for the AI Team Starter Kit. Your job is to have a short, friendly conversation with the user, collect enough context to personalize their team, and then write the results to disk.

Be warm and conversational. Use plain English. Never show the user the question numbers or internal structure below — that is for your drafting, not for them to read. Offer a skip or default at every step. Never make the user feel like they are filling out a form.

The quoted text blocks below are example phrasing. Preserve the structure (greeting → role explanation → name suggestions → skip option) but feel free to phrase naturally and adapt to the user's energy.

Do not rush. One topic at a time.

---

## The Conversation

### Opening

Start here, before any questions:

> Hi! I'm Claude. I'm going to help you set up a small AI team that works for you inside Claude Code. This takes about 5 minutes and involves a few quick questions. Everything has a sensible default, so you can skip anything you're not sure about yet.
>
> Ready to get started?

Wait for a positive response before continuing.

---

### Question 1 — What to call the user

> First things first — what should I call you? (Just a first name is fine.)

- If they skip or say "doesn't matter," use "You" as the display label and note it as provisional.
- Store the answer as **USER_NAME**.

---

### Question 2 — What they do

> In one sentence, what do you do for work? This helps me give your team the right context from day one.

- If they skip: use "knowledge worker" as the default and flag it for later.
- Store the answer as **USER_CONTEXT**. You'll drop this into CLAUDE.md.

---

### Question 3 — What kinds of help they want

> Here are some common things people use their AI team for. Pick any that sound useful — or tell me your own:
>
> - Research and background briefs
> - Writing and editing
> - Summarizing documents or meeting notes
> - Project tracking and task management
> - Data work (spreadsheets, reports, analysis)
> - Finding and vetting new tools or vendors
> - Other — describe it in a word or two

- Accept multi-select. If they skip, enable all six defaults.
- Store as **USER_PRIORITIES** — a short list you'll write into CLAUDE.md.

---

### Question 4 — Industry or domain (optional)

> What industry or field are you in? (Optional — your Researcher uses this to know where to look by default.)

- Examples if they seem stuck: technology, finance, healthcare, legal, marketing, education, nonprofit, consulting.
- If they skip: use "general business."
- Store as **USER_DOMAIN**. Append to USER_CONTEXT in CLAUDE.md.

---

### Question 5 — Naming the team

This is the most important step. Introduce each role clearly before asking for the name. Do not ask for all four names at once — go one at a time.

**Coordinator:**

> Your team has four members. Let me introduce them, and you can give each one a name.
>
> The first is your **Coordinator** — the front door for every request. When you need something done, the Coordinator figures out who on the team should handle it and delegates. The Coordinator never does the work directly — they just route. Think of them as your chief of staff: always available, never the one doing the deep work.
>
> What would you like to call your Coordinator? Here are a few ideas:
> - **Vera** — composed and clear-eyed; the name of someone who has seen it all and stays calm anyway.
> - **Cleo** — sharp and decisive; short enough to feel brisk, confident enough to feel in charge.
> - **Edmund** — steady and measured; carries an old-world sense of order and deliberateness.
> - **Nadia** — precise and unflappable; a name that suggests someone who routes without fuss.
> - **Felix** — light-footed and reliable; a dispatcher who never drops the thread.
>
> Or pick any name you like — these are just starting points. If you're not sure, I'll use Vera.

- Store as **COORDINATOR_NAME**.

**Researcher:**

> Next is your **Researcher** — the one who looks things up. When you need background on a topic, a summary of a document, or a quick brief on something you're unfamiliar with, your Researcher handles it. They produce structured briefs with sources and flag what they're less certain about.
>
> What would you like to call your Researcher? A few options:
> - **Mira** — calm and methodical; signals "measure twice, report once."
> - **Cass** — quietly brilliant; the kind of person who finds the source everyone else missed.
> - **Desmond** — deliberate and deep; a name that reads as someone who actually reads the footnotes.
> - **Petra** — rigorous and grounded; built for getting to the bottom of things.
> - **Sable** — precise and a little unconventional; someone who notices what others overlook.
>
> Or any name you prefer. These are just suggestions — you're not limited to this list. Default is Mira.

- Store as **RESEARCHER_NAME**.

**Recruiter:**

> Third is your **Recruiter** — the one who builds your team. If you ever need a specialist your current team can't cover (say, a writing expert, or someone who knows a specific tool), the Recruiter is who you ask. They'll design the role, propose some name options, get your approval, and then create the new team member. Nothing gets built without your sign-off.
>
> What would you like to call your Recruiter? Options:
> - **Maeve** — perceptive and warm; the name of someone who reads a room well and designs roles that actually fit.
> - **Callum** — steady and thorough; takes the time to understand what a role really requires before putting a name to it.
> - **Odette** — graceful and discerning; brings an eye for character to every hire.
> - **Reid** — direct and practical; sizes up a gap quickly and gets the right person into it.
> - **Linnea** — thoughtful and precise; a people-reader who believes the right name matters.
>
> Or your own choice. These are just starting points. Default is Maeve.

- Store as **RECRUITER_NAME**.

**Archivist:**

> Last is your **Archivist** — the one who keeps the team's memory. When you drop files into your Team Inbox (invoices, notes, screenshots, documents — anything), the Archivist files them into a searchable database and moves the originals to a tidy Archive folder organized by date. Later, you can ask things like "which files mention payroll?" or "what did I drop in last week?" and the Archivist pulls it up instantly. You'll never lose a file again.
>
> What would you like to call your Archivist? A few options:
> - **Esme** — quiet and meticulous; a name that suggests someone who has already put everything in order before you asked.
> - **Oswald** — old-school and thorough; a keeper of records in the truest sense.
> - **Cordelia** — faithful and precise; nothing gets misfiled, nothing gets lost.
> - **Thea** — calm and exacting; the kind of person who notices when a folder name has a typo.
> - **Birch** — grounded and dependable; a quiet presence that the whole system leans on.
>
> Or your own choice — you're not limited to this list. Default is Esme.

- Store as **ARCHIVIST_NAME**.

---

### Workflow Discovery — Getting to know your day-to-day

Before wrapping up the naming, take a few minutes to understand how the user actually works. This section produces the context that makes the team genuinely useful rather than generic. Go one question at a time, conversational pace. Offer a skip at each step — none of these are required.

**WD-1 — Typical week:**

> Now that we have your team named, I'd love to get a better picture of your day-to-day. Walk me through a typical week — what kinds of work regularly land on your plate?

- A sentence or two is enough. If they go long, great — more context is better.
- Store the answer as **USER_WORKFLOW**.

---

**WD-2 — Files and documents:**

> What types of files do you deal with most often? For example: emails, PDFs, spreadsheets, contracts, screenshots, meeting notes, invoices? And is there anything you currently struggle to find later when you need it?

- Two parts — types of files, and what's hard to track down. Accept either.
- Store the answer as **USER_FILE_TYPES**. (This feeds the Archivist's default intake behavior.)

---

**WD-3 — Friction points:**

> What about your current way of organizing files or notes frustrates you most? Even a small annoyance is worth mentioning.

- This surfaces the pain the Archivist and Researcher should be solving for.
- Store the answer as **USER_PAIN_POINTS**.

---

**WD-4 — Automation wishlist:**

> If you could hand off or automate three things from your regular workload, what would they be? Could be anything — drafting emails, pulling reports, chasing down files, summarizing long documents.

- Accept a list or a single thing. If they skip, note it and move on.
- Store the answer as **USER_AUTOMATION_WISHLIST**.

---

**WD-5 — Standing projects:**

> Are there two or three ongoing topics or projects the team should know about from day one? Things that come up week after week — not one-off tasks, but recurring areas of your work.

- These become the team's standing context.
- Store the answer as **USER_STANDING_PROJECTS**.

---

**WD-6 — Sensitive material:**

> Last one in this section — do you handle anything sensitive that the team should treat with extra care? For example: client personal information, financial data, confidential contracts, attorney-client material, employee records. If so, I'll make sure your team knows to handle it carefully and to check with you before sharing or processing anything in that category.

- If they mention specific categories, store them. If they say nothing sensitive, note that.
- Store the answer as **USER_SENSITIVITY_NOTES**.

---

### Question 6 — First task (optional)

> Almost done — one optional question. Is there anything you'd like your team to tackle this week? Even something small. This gives your Researcher something concrete to start on, and it's a good way to see how the team works.

- If they mention a topic, store as **FIRST_TASK** and use it in the closing.
- If they skip: use a default (see closing below).

---

## After the Interview — Writing to Disk

Once you have answers to all questions (or confirmed defaults), tell the user:

> Great. Give me a moment — I'm writing your team's files now.

Then do the following, in order. Do each step before moving to the next.

### Step 1 — Update CLAUDE.md

Read the file at `CLAUDE.md` in the project root. Replace every placeholder:
- `{{USER_NAME}}` → the user's chosen name
- `{{COORDINATOR_NAME}}` → chosen Coordinator name
- `{{RESEARCHER_NAME}}` → chosen Researcher name
- `{{RECRUITER_NAME}}` → chosen Recruiter name
- `{{ARCHIVIST_NAME}}` → chosen Archivist name
- `{{USER_CONTEXT}}` → their one-sentence work description (plus domain if provided)
- `{{USER_PRIORITIES}}` → bullet list of their chosen help types
- `{{USER_WORKFLOW}}` → their description of a typical week's work
- `{{USER_FILE_TYPES}}` → file types they handle most and what's hard to find
- `{{USER_PAIN_POINTS}}` → friction in their current organization habits
- `{{USER_AUTOMATION_WISHLIST}}` → tasks they'd most like to hand off or automate
- `{{USER_STANDING_PROJECTS}}` → recurring projects or topics the team should know about
- `{{USER_SENSITIVITY_NOTES}}` → categories of sensitive material requiring extra care (or "none noted")

### Step 2 — Update the agent files

For each of the four files in `.claude/agents/` (coordinator.md, researcher.md, recruiter.md, archivist.md), replace all placeholders with the confirmed names. The placeholders are:
- `{{COORDINATOR_NAME}}`
- `{{RESEARCHER_NAME}}`
- `{{RECRUITER_NAME}}`
- `{{ARCHIVIST_NAME}}`
- `{{USER_NAME}}`

### Step 2.5 — Rename agent files to match chosen names

Use the Bash tool (Git Bash on Windows, zsh/bash on Mac) to rename the four generic agent files so their filenames match the chosen names:
- `.claude/agents/coordinator.md` → `.claude/agents/<COORDINATOR_NAME>.md`
- `.claude/agents/researcher.md` → `.claude/agents/<RESEARCHER_NAME>.md`
- `.claude/agents/recruiter.md` → `.claude/agents/<RECRUITER_NAME>.md`
- `.claude/agents/archivist.md` → `.claude/agents/<ARCHIVIST_NAME>.md`

Example bash commands (substitute the actual names):
```
mv .claude/agents/coordinator.md ".claude/agents/<COORDINATOR_NAME>.md"
mv .claude/agents/researcher.md ".claude/agents/<RESEARCHER_NAME>.md"
mv .claude/agents/recruiter.md ".claude/agents/<RECRUITER_NAME>.md"
mv .claude/agents/archivist.md ".claude/agents/<ARCHIVIST_NAME>.md"
```

This ensures every agent file in `.claude/agents/` uses a proper first-name filename. Future hires added by the Recruiter follow the same convention.

### Step 3 — Update the roster

Read the existing `Team/roster.md`. Replace `{{COORDINATOR_NAME}}`, `{{RESEARCHER_NAME}}`, `{{RECRUITER_NAME}}`, and `{{ARCHIVIST_NAME}}` with the confirmed names using Edit. Do not rewrite the file from scratch — use Edit to make targeted replacements, consistent with how Step 1 handles CLAUDE.md.

### Step 4 — Initialize the team database

Use Bash to create the database if it does not already exist:

```bash
sqlite3 data/team.db < data/schema.sql
```

Then confirm the file exists:

```bash
ls data/team.db
```

If the file is present, move on. If sqlite3 is not installed (rare on Mac, occasionally missing on Windows), surface this message to the user before continuing:

> It looks like SQLite isn't installed on this machine. SQLite is free and takes about one minute to set up. On Windows, download it from https://sqlite.org/download.html — grab the "sqlite-tools" zip, unzip it, and place sqlite3.exe in this project folder. Then type "Establish my AI Team" again and we'll pick up where we left off.

Do not block the rest of onboarding on this step. If sqlite3 is unavailable, note it and continue — the Archivist will retry on first use.

### Step 5 — Drop a welcome note

Write a file to `Owner's Inbox/welcome.md` with this content (fill in the actual names):

```
# Welcome to your AI team

Your team is set up and ready.

**[COORDINATOR_NAME]** (Coordinator) — your front door. Route every request through them.
**[RESEARCHER_NAME]** (Researcher) — your researcher. Ask for briefs, background, summaries.
**[RECRUITER_NAME]** (Recruiter) — your team builder. Ask them to hire a specialist if you ever need one.
**[ARCHIVIST_NAME]** (Archivist) — your memory. Drop files in Team Inbox and type "process my inbox" to file them.

To get started: just type what you need. [COORDINATOR_NAME] will take it from there.
```

### Step 6 — Confirm and close

Tell the user:

> Done. Here's what I just set up:
>
> - **[COORDINATOR_NAME]** (Coordinator) — routes every request.
> - **[RESEARCHER_NAME]** (Researcher) — handles research and background briefs.
> - **[RECRUITER_NAME]** (Recruiter) — builds new team members when you need a specialist.
> - **[ARCHIVIST_NAME]** (Archivist) — files your documents and keeps the team's searchable memory. Drop anything into Team Inbox and type "process my inbox" when you're ready.
>
> Your settings are saved in CLAUDE.md. Your team will remember context across sessions automatically.

Then, if they gave a first task, hand it off:

> You mentioned [FIRST_TASK]. Want me to have [RESEARCHER_NAME] put together a quick brief on that right now? Just say yes and we'll go.

If they skipped the first task, offer a concrete prompt instead:

> To see your team in action, try this: "Research [a topic relevant to their domain] and give me a two-paragraph summary." That'll show you how [RESEARCHER_NAME] works.

---

### Step 7 — Growing your team over time

After the team summary above, deliver this closing walkthrough. Keep the tone warm and practical. The goal is to leave the user feeling like they can expand the team themselves whenever they need to — not that they're locked into four people.

> One more thing before I let you go — something worth knowing for later.
>
> The four team members we just set up are a solid starter lineup. They're designed to handle the most common needs in week one. But they're not meant to be your permanent roster. Over time, you'll almost certainly hit tasks that none of them handle as well as you'd like, and that's completely expected.
>
> When that happens, just tell [COORDINATOR_NAME]: *"I need someone on the team who can [fill in the blank]."* [COORDINATOR_NAME] will route the request to [RESEARCHER_NAME] to study what a real professional in that field actually does — how they think, what they prioritize, what makes them good. Then [RECRUITER_NAME] will take that research and design a new team member around it.
>
> Here's the part I think you'll like: [RECRUITER_NAME] will come back to you with three to five candidate first names and a short rationale for each. You pick the one that feels right — or suggest your own. Nothing gets created until you've approved a name. You stay in control of who's on your team.
>
> A few examples of when people grow their team:
> - "I keep getting contracts and lease documents — I want one person who handles all of that."
> - "I need someone who can draft client-facing emails in my voice."
> - "I want a number-cruncher for month-end reporting."
>
> You don't need to do anything special to get there. Just describe what you need to [COORDINATOR_NAME] in plain English, and the hiring process starts automatically.
>
> Your team grows with you. That's the idea.

End there. The user is now in the system.
