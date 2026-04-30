AI Team Starter Kit — Setup (Windows)

For a step-by-step visual walkthrough, double-click setup-guide.html and
pull it up on a second screen while you set up your team in Claude Code.

You will need:
  * Git for Windows  ->  https://git-scm.com/downloads/win
  * Claude Code Desktop  ->  https://claude.com/download
  * A Claude Pro or Max subscription

Setup steps:
  1. Install Git for Windows. If Claude Code Desktop is already
     open, fully close it and reopen it after Git finishes installing.

  2. Install Claude Code Desktop and sign in.

  3. Move this folder to your Desktop (or anywhere with no spaces
     in the path -- avoid OneDrive, Documents, and Downloads if
     possible. C:\AI-Team is a safe spot).

  4. Open Claude Code Desktop. Click the Code tab -> Local ->
     Select Folder -> choose this folder.

  5. When prompted to trust the folder, click Yes.

  Note: This kit pre-approves common Claude Code tools (file editing,
  running setup commands) so installation runs smoothly without dozens
  of permission prompts. You can review or change this in
  .claude/settings.json later if you want stricter control.

  6. Type this exact phrase and press Enter (no slash needed — just
     type the words and press Enter):

         Establish my AI Team

  7. Claude will introduce itself and walk you through setting
     up your team. Answer the questions. Takes about 5 minutes.

Then what?

  Once your team is set up, drop files into the Team Inbox folder
  anytime -- invoices, screenshots, notes, anything. When you want
  them filed and searchable, just type (no slash needed -- just
  type the words and press Enter):

         process my inbox

  Your Archivist will handle it. Files get organized into the
  Archive folder by date, and your team builds a searchable memory
  over time. To find something later, just ask -- "which files
  mention payroll?" or "show me what I dropped in last week" --
  and your Archivist pulls it up.

  Your originals are never deleted -- they live in the Archive
  folder, organized by date, browseable in File Explorer anytime.

That's it. If you hit a snag, see Troubleshooting below.

---

TROUBLESHOOTING

Problem: The Code tab is missing or grayed out.
Fix: Git for Windows is not installed, or was installed after Claude
Code was already open. Install Git, then fully close and reopen
Claude Code Desktop.

---

Problem: Claude keeps asking me to trust the folder every time I open it.
Fix: This is a known Windows bug. Click Yes each time -- it is safe.
Your settings and team memory are not affected. Anthropic is aware
of this issue and it may be fixed in a future update.

---

Problem: I see an error about OneDrive or syncing.
Fix: Your folder is in an OneDrive-synced location. Move your
AI-Team folder to C:\AI-Team (not Documents or Desktop) and
re-open the project from the new location.

---

Problem: Nothing happens when I type. Claude seems stuck.
Fix: Close Claude Code and reopen it. Navigate back to C:\AI-Team.
If the problem persists, check that CLAUDE.md is present in the
C:\AI-Team folder (not inside a subfolder).

---

Problem: My Documents folder causes a crash on launch.
Fix: This can happen if OneDrive was uninstalled and the Documents
path no longer exists. Use C:\AI-Team as your project location
and do not open Claude Code from the Documents folder.

---

QUESTIONS?

Ask your team. Once onboarding is complete, just type your question
and your Coordinator will route it.
