# Time horizons & planning date

**Timezone: Europe/London.**

## Effective planning date

Drives what **Today** means in `01-todos.md` and in summaries.

| When | Effective date |
|---|---|
| Before 4pm London, weekday | Calendar today |
| **4pm or later** London | Next working day (evening prep for tomorrow) |
| User says tomorrow / plan tomorrow | Next working day |
| Weekend | Next working day (Monday) |

Store as `planning_for: YYYY-MM-DD` in `.cursor/sync-state.md` when `/dawn` runs.

### Evening prep (4pm+ London)

Same `/dawn` skill — no separate mode. After 4pm, effective date is the **next working day**, so you are shaping **tomorrow’s** `## Today`. Unchecked items left in Today from earlier the same calendar day are **stale** → moved to **This week** (not deleted). Completed `[x]` items are archived to `05-done.csv` and removed.

## Sections (`01-todos.md`)

| Section | When |
|---|---|
| **Today** | Effective planning date only — small, finishable set; rebuilt each `/dawn` |
| **This week** | Canonical sprint-week backlog |
| **Future** | Next sprint+, backlog, blocked, not this week |

### Today vs This week (no duplication)

Each `- [ ]` line lives in **exactly one** horizon — never copy the same work into both.

| Item type | Rule |
|---|---|
| Single-day **do** | `/dawn` **moves** (cut) from This week → Today up to Today cap |
| Multi-day **do** with **steps** | Parent stays in **This week**; only today’s indented steps move under the parent copy in **Today** |
| Stale Today | Unchecked Today lines **move back** into This week (parent + indented children together), then Today is cleared and rebuilt |
| `/today` skill | Summarises **`## Today` only** — not This week or Future |

**This week** is source of truth for the week; **Today** is the daily extract.

### Stale Today (fix horizons)

When `/dawn` runs, if `planning_for` in sync-state is **not** the current effective date (missed a day, weekend, checked items off without `/dawn`):

- **Unchecked** lines under `## Today` → move to **This week** (each **do** line with its indented **step** children)
- **`[x]` lines** → handled by archive step first, then removed

### Horizon keywords (`/todo` parse)

Default horizon: **This week**. “Today” follows **effective planning date** (evening → tomorrow).

| User says | Horizon |
|---|---|
| today, tomorrow, EOD | **Today** |
| this week, this sprint, by Friday | **This week** |
| future, later, next sprint, someday, waiting on | **Future** |
