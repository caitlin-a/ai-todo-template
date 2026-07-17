---
name: todo
description: >-
  Add and file a todo — auto-route to 01-todos.md and/or an ADO PBI. Use when
  the user says todo, add to my list, team board, today, this week, future,
  for later (as a filed item), or remind me with clear intent.
---

# Todo

File **new** work now. Classify, then **execute**. For typos, renames, or moving one line → edit `01-todos.md` directly.

**Do not read** other `.cursor/routing/` subfiles — rules below are inlined. Read **[routing/tags.md](../routing/tags.md)** when filing or moving horizons. Read **only** `ado/create.md` and `ado/target.md` when route is **PBI** or **both** (`ado-config.md` index). Check `enabled` in `ado-config.md` first.

**ADO check:** if `enabled` is `false`, routes **PBI** and **both** → **personal** only (state once: “ADO disabled — filed locally”). Skip dedupe/create/triage MCP calls.

## Reference (inlined)

### Horizons (default **This week**)

| User says | Horizon |
|---|---|
| today, tomorrow, EOD | **Today** |
| this week, this sprint, by Friday | **This week** |
| future, later, next sprint, someday, waiting on | **Future** |

“Today” follows **effective planning date** (Europe/London; after 4pm → tomorrow). Each `- [ ]` lives in **one** horizon only — **move** (cut), never copy, when changing horizon.

### Routes

| Route | When | Execute |
|---|---|---|
| **personal** | Chores, reviews, not team-committed | `- [ ] …` in `01-todos.md` |
| **PBI** | Board visibility only | ADO PBI |
| **both** | Sprint work tracked daily | PBI + `01-todos.md` |

Sprint/team work → **ADO**. Personal chores → **`01-todos.md`**. Never duplicate without linking.

**both** list line format: `- [ ] [PBI #id](edit-url): {title} — {state}`

### List structure

| Level | Syntax |
|---|---|
| **Do** | `- [ ]` at line start under `## Today` / `## This week` / `## Future` |
| **Step** | `  - [ ]` — exactly **2 spaces** before `-`, directly under parent **do**; one level only |

## 1. Parse

- **Text** — what needs doing
- **Horizon** — table above (default **This week**)
- **ADO timing** — this week → current sprint; future → next sprint
- **Override** — personal only, PBI only, both, team board

## 2. Classify route

**personal** | **PBI** | **both** — table above. State: `→ {horizon} · {route} — {why}`. Ask once if ambiguous.

## 2b. Dedupe local list (before creating)

Scan `01-todos.md` **Today + This week** (read Future only when filing there) for existing **do** or **step** with same intent.

| Match | Action |
|---|---|
| Same work, new detail is a **step** | Add indented `  - [ ]` under the existing parent **do** |
| Same work, different horizon | **Move** (cut), don’t copy |
| Same work, user wants different slot | Reorder or rephrase existing line |
| Clearly different | New **do** line |

If close but unsure → ask once with the closest match; default to linking under existing.

## 3. Execute

- **personal** → `- [ ] {text}` under the right `##` in `01-todos.md`
- **PBI** → dedupe per `ado/create.md`, create if needed, triage update if this week
- **both** → dedupe, create + triage update, `- [ ]` line in `01-todos.md` **This week** (resort on next `/dawn` or `/mondayblues`)
- **Steps** on an existing item → indented `  - [ ]` directly under the parent **do**
- **Placement** — insert at obvious `04-goals.md` § **Priority** slot when you have it; otherwise **append to This week tail** (`/dawn` / `/mondayblues` resort)
- **Horizon Today** — new **do** under `## Today`; steps indent under the correct parent **do**
- **Tags** — per [routing/tags.md](../routing/tags.md): on file or horizon **move**, set/replace schedule tag (`*(wb …)*`, `*(by …)*`, slot date). **Today** → no schedule tag. Do not write `*(today)*` / `*(next week)*`.

## 4. Confirm

Horizon, route, what was written (section or PBI id + link). If linked existing PBI, say so.

## 5. Session end

No git commit — only `/dawn` commits.
