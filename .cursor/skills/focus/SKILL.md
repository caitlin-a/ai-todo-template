---
name: focus
description: >-
  Tell me the single next thing to do. Use when the user says focus, what's next,
  what should I do now, one thing, or pick for me.
---

# Focus

One item. **Read only.** Read `01-todos.md` **## Today** then **## This week** only (skip **## Future**). Read `.cursor/sync-state.md`, `02-inbox.md` (existence only).

## Reference (inlined)

**Do:** `- [ ]` at line start · **Step:** `  - [ ]` (2 spaces) under parent — pick **first unchecked step** before parent **do**

**Stale:** same as [today/SKILL.md](./today/SKILL.md) § Stale sync — one-line nudge if stale or inbox non-empty.

## Pick next

Walk file order (sorted by last `/dawn`) **Today** → **This week**:

| Situation | Pick |
|---|---|
| **Do** has unchecked **steps** below | First unchecked **step** |
| No open steps | The **do** |

```text
**Next:** {line}

{parent context if step · section}
```

If **Today** empty → pull from **This week**. If on a collapsed parent (detail link in line) → open `03-projects/` only when user is working that item.

If nothing: suggest `/dawn`, `/synctodos`, `/todo`, or `/jot`.
