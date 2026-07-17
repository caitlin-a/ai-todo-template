# Capacity (`/dawn`)

Default unless user overrides (e.g. “light day”, “only 2 today”):

| Horizon | Soft cap (unchecked actionable items) |
|---|---|
| **Today** | 3 **do** lines (indented **steps** do not add slots) |
| **This week** | 8 top-level **do** lines under `## This week` |

**What counts toward This week cap:** each **do** line at column 0 under `## This week`.

**What does not count:** indented **step** lines (2-space prefix).

Over cap → move excess **do** lines (with their steps) to next horizon (Today → This week → Future). Blocked/waiting → **Future**.
