---
name: tisdone
description: >-
  Check off completed todos and sync ADO PBI state. Use when user says tisdone,
  check off, mark done, shipped, finished a task, or closes a PBI/item. Not for
  bare "done" in passing or adding new work.
---

# Tisdone

Mark complete in `01-todos.md`; **suggest** ADO updates.

Read `01-todos.md` **## Today** and **## This week** only (the item being checked off). Read `routing/done-log.md`, `routing/flow.md`. When ADO enabled: `ado/states.md`, `ado/done-dates.md`.

**ADO check:** if `enabled` is `false`, local checkoff + CSV only; `tisdone` signal for date.

## Reference (inlined)

- **Do:** `- [ ]` at line start · **Step:** `  - [ ]` (2 spaces) under parent
- **Step** `[x]` — no CSV row unless user says that step is the win
- All **steps** `[x]` → prompt to check parent **do**

## 1. Parse

Which item (PBI id, text, context) · scope (personal / PBI / both) · optional `impact`

## 2. Execute

`- [x]` on target line; Today-only lines stay in Today only.

## 3. Log (`05-done.csv`)

Per `routing/done-log.md` — dedupe first.

**Personal:** `completed_date` = today; `source: personal`; `signals: tisdone:YYYY-MM-DD`

**PBI:** collect signals per `ado/done-dates.md`; `completed_date` = earliest

Stays in list until `/dawn` archives.

## 4. Suggest ADO state

Skip when ADO disabled. Per `ado/states.md` § Transition suggestions — confirm before `wit_update_work_item`.

## 5. Confirm

What checked; CSV row; ADO suggestions. No git commit.
