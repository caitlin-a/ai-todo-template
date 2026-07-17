---
name: today
description: >-
  Read-only summary of Today only — to do first, then done, with progress %.
  Use after /dawn or when user asks what's today. For the full week see
  01-todos.md ## This week or ask in chat.
---

# Today

**Read only** — no edits. Read `01-todos.md` **## Today** section only. Read `.cursor/sync-state.md`.

## Reference (inlined)

**Do:** `- [ ]` / `[x]` at line start · **Step:** `  - [ ]` / `  - [x]` (2 spaces under parent)

**Effective date** (Europe/London): before 4pm weekday = today; 4pm+ = next working day. Use `planning_for` from sync-state if set.

**Stale sync** — `last_sync` fresh if: before 4pm on planning date → same calendar day; 4pm+ → after 4pm yesterday or later. If stale or inbox non-empty → suggest `/dawn`.

## Output

1. **Date** · 2. **Progress** — `Do: n/m (P%) · Steps: s/t` (omit Steps if t=0) · 3. **To do** (unchecked, file order) · 4. **Done** (`[x]` still in Today)

**Do** with open steps → parent + **Steps** sub-list. Lead with to do.

Do **not** summarise This week / Future unless asked.

Optional footer: last sync · `/focus` · `/dopamine`
