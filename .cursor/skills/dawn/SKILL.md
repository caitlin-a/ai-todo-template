---
name: dawn
description: >-
  Start-of-day planning — archive wins, sync ADO sprint work, fix horizons, sort by
  `04-goals.md` § Priority, trim Today/This week to capacity. Use for dawn,
  seize the day, start my day, morning planning, plan tomorrow, evening prep,
  or daily reset.
---

# Dawn

Full planning ritual. **Edit `01-todos.md`, `05-done.csv`, `.cursor/sync-state.md`.**

Read `01-todos.md` **## Today** and **## This week** for edits (horizons, archive, capacity). Read the **full file** for past sweep (all horizons). Read `02-inbox.md` if non-empty, `.cursor/sync-state.md`, `04-goals.md` § Priority.

Read **only** `routing/tags.md`, `routing/sync.md`, `routing/done-log.md`, `routing/flow.md`, `ado/sync.md`, `ado/done-dates.md`, `ado/target.md` when ADO enabled (see `ado-config.md` index). **Horizons, capacity, sync, and priority below are inlined.**

**ADO check:** if `enabled` is `false`, skip sprint sync and past sweep.

User may pass capacity hints: “light day”, “only 2 today”, “heads-down on doc review”. Caller may pass **`skip_pbi_sync: true`** (from `/mondayblues`) — skips sprint WIQL only; **still run past sweep**.

## Reference (inlined)

### Effective date (Europe/London)

| When | Effective date |
|---|---|
| Before 4pm weekday | Calendar today |
| 4pm+ London | Next working day |
| tomorrow / weekend | Next working day |

Write `planning_for` to `.cursor/sync-state.md`. Summary opens with **Planning for** {date}.

### Horizons

Each `- [ ]` in **one** horizon only. **Stale Today** (unchecked, wrong date) → move to **This week** (parent + steps together). `[x]` → archive first.

### Capacity (defaults)

| Horizon | Cap |
|---|---|
| **Today** | 3 **do** lines (steps free) |
| **This week** | 8 **do** lines |

Over cap → move excess **do** + steps to next horizon (Today → This week → Future).

### List structure

- **Do:** `- [ ]` at line start
- **Step:** `  - [ ]` (2 spaces) under parent **do**

## 1. Sync (inline — no Task subagent)

**Past sweep** (ADO enabled — always, even when `skip_pbi_sync: true`): per `ado/sync.md` § Past sweep. Whole-list id scan → **Likely done (ADO)** → §2.

**Sprint work sync** (unless `skip_pbi_sync: true` or ADO disabled): per `ado/sync.md` § Sprint work sync (dedupe, Task → steps, reorder per §5).

**Inbox:** if `02-inbox.md` has lines → file like `/todo`, clear inbox.

## 2. Catch-up checkoffs (ask once)

After §1 past sweep, per `routing/sync.md` § Past sweep catch-up (skip when ADO disabled). On confirm → CSV via `ado/done-dates.md` + remove lines from list (any horizon).

## 3. Archive completed items

For each `- [x]` **do** under **Today** and **This week** (remove parent + indented **steps**):

1. If not in `05-done.csv` (dedupe) — append row: **PBI** → `ado/done-dates.md`; **personal** → `archive:YYYY-MM-DD`
2. Remove from list (always)

Past-sweep confirm (§2) removes directly — does not require `[x]` first.

## 4. Fix horizons

Move each **do** + **steps** as one unit per § Horizons and effective date.

**Normalize tags** per [routing/tags.md](../routing/tags.md): strip banned tags (`*(today)*`, `*(next week)*`, `*(priority)*`, …); on moved lines replace schedule tags per horizon defaults (`week_of` / `planning_for` from `.cursor/sync-state.md`).

## 5. Sort priority

**One list.** `04-goals.md` § **Priority** canonical — sprint + personal **do** lines interleaved, not grouped by source.

| Signal | Match |
|---|---|
| `PBI #id` in § Priority / success criteria | Same id |
| § Priority name / keywords | Title keywords |

**Order** = § Priority top → bottom. Unmatched tail: `BacklogPriority` ASC or stable order — one merged tail. Deferred → **Future**. Chat overrides win; if ambiguous → ask once.

Reorder **entire** **This week**; **steps** stay under parent.

## 6. Capacity trim + rebuild Today

1. Trim **This week** to 8 **do** if over → **Future**
2. **Rebuild Today** (replace; no duplicates):
   - Stale unchecked Today → This week
   - Fill from top of This week up to cap (default 3 **do**)
   - Single-day **do** → **move** from This week to Today
   - Multi-day **do** + **steps** → today’s steps only in Today copy
3. Never same checkbox in both horizons

## 7. Summary

**Planning for** · Sync · Past sweep · Catch-up · Archived · Horizons · Priority · Capacity · **Next** — `/focus` or `/today`

## 8. Commit + push

Per `routing/flow.md` § Auto-commit — after summary: `git add -A` → `git commit -m "chore: dawn — plan for {planning_for}"` → `git push origin HEAD` if `origin` exists. **Only `/dawn`** commits.
