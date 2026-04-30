# /remember — Log Something to Memory

Use this when you want to make sure the team remembers something explicitly.

Usage: `/remember <thing you want remembered>`

---

## Instructions for Claude

The user wants to log something for the team to remember. Follow this routing logic:

1. **If it is a stable project fact** (who the user is, a standing rule, a preference that applies to the whole team): append it to `CLAUDE.md` under a section titled "## Notes" (create it if it doesn't exist).

2. **If it is a preference specific to one team member** (how the Researcher should format briefs, how the Recruiter should handle a certain type of role): append it to `Team/<Name>-reference.md` for the relevant team member. Create the file if it does not exist, with a simple header: `# [Name] — Reference Notes`.

3. **If it is a personal preference** (the user's timezone, communication style, how they like to be addressed): let Claude Code's auto-memory handle it. Say: "Got it — I've noted that. The team will remember it automatically going forward."

4. **If it is ambiguous**, make your best judgment and tell the user where you logged it:
   > "I've added that to [CLAUDE.md / Team/[Name]-reference.md]. You can find it there if you want to edit or remove it."

Always confirm what you did in plain English. Never just silently write the file.
