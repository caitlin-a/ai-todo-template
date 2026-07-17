---
name: synctodos
description: >-
  Sync sprint work items from ADO and process inbox. Lighter than /dawn — no horizon
  sort or capacity trim. Reorder entire **This week** (sprint + personal) per
  `04-goals.md` § Priority. Use for synctodos, sync, refresh, or process inbox.
---

# Synctodos

Sync + inbox only. Full planning → `/dawn`.

Read `01-todos.md` **## This week** for sprint merge and sort. Read the **full file** for past sweep. Read `02-inbox.md` if non-empty, `.cursor/sync-state.md`, `04-goals.md` § Priority.

Read **only** `routing/paths.md`, `routing/tags.md`, `routing/sync.md`, `routing/flow.md`, `ado/sync.md`, `ado/done-dates.md`, `ado/target.md`, `ado/states.md` § transitions when ADO enabled. Priority sort → [dawn/SKILL.md](./dawn/SKILL.md) §5.

**ADO check:** if `enabled` is `false`, skip §1–2; note “ADO disabled” in summary.

Caller may pass **`skip_pbi_sync: true`** — skip sprint WIQL only; **still run past sweep** (§2).

## 1. Sprint work sync

Unless `skip_pbi_sync: true`: per `ado/sync.md` § Sprint work sync. Reorder **This week** per dawn §5. Update `.cursor/sync-state.md`.

## 2. Past sweep

When ADO enabled (always, even when `skip_pbi_sync: true`): per `ado/sync.md` § Past sweep. On **Likely done (ADO)** hits → per `routing/sync.md` § Past sweep catch-up (ask once; on confirm → CSV + remove from list).

**Reverse mismatch:** `[x]` locally but ADO open → per `ado/states.md` § Transition suggestions (report only; do not auto-transition).

## 3. Inbox

If `02-inbox.md` has lines: file like `/todo`, clear inbox.

## 4. Summary

Sync counts · Past sweep · Catch-up · dedupes · inbox filed · state mismatches.

Do not delete list content without asking (except past-sweep confirm).

## 5. Session end

No git commit (`routing/flow.md` § Auto-commit).
