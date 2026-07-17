---
name: mondayblues
description: >-
  Monday weekly planning — sprint context, weekly goal, shape This week. No Today
  trim. Use for mondayblues, set the week, weekly planning, Monday planning, week
  goal, or planning with colleague.
---

# Monday blues

Monday ritual. **Edit `04-goals.md` and `01-todos.md`.**

Read `01-todos.md` **## This week** only. Read `.cursor/sync-state.md`, `04-goals.md`. § Priority shape → [routing/goals.md](../routing/goals.md).

Read **only** `routing/flow.md`, `ado/sync.md`, `ado/target.md` when ADO enabled. Horizons, capacity, priority → [dawn/SKILL.md](./dawn/SKILL.md) § Reference + §5.

**ADO check:** if `enabled` is `false`, skip §1 sprint sync.

## 0. Week of

`week_of` = Monday ISO date. Write to `.cursor/sync-state.md`. Same week + no replan request → ask refresh or skip goal rewrite.

## 1. Sprint context

Unless ADO disabled: per `ado/sync.md`. Reorder **This week** per dawn §5. Set `sprint`, `last_sync`.

## 2. Weekly goal (`04-goals.md`)

- Roll for new `week_of`
- **ADO goal** if MCP provides; else placeholder
- **Our goal** + 2–4 success criteria from user/colleague
- **§ Priority** — numbered list per [routing/goals.md](../routing/goals.md); **Deferred** at bottom
- Pointer in **This week**: `**Goal:** [04-goals.md](04-goals.md) — {summary}`

## 3. Shape This week

Sort every **do** per dawn §5. **This week** cap 8 **do** (dawn § Reference). **Do not** trim **Today**. **Do not** triage inbox — auto `/dawn` handles it.

## 4. Summary

Week of · sprint · goals · PBI count · moves

## 5. Auto-trigger `/dawn`

Continue in same flow with **`skip_pbi_sync: true`**. Dawn rebuilds **Today** without duplicating lines.

## 6. Session end

No git commit — `/dawn` commits at end.
