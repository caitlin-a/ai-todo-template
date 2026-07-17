# Paths & inbox

## Repo root (human)

| File | Use |
|---|---|
| `01-todos.md` | **Today** / **This week** / **Future** — canonical list |
| `02-inbox.md` | Quick capture via `/jot` |
| `03-projects/` | Optional detail for large personal blocks |
| `04-goals.md` | Monday goal + success criteria |
| `05-done.csv` | Rolling completion log (wins archive) — one row per win |
| `README.md` | Human onboarding |
| `.gitignore` | Repo ignore rules |

Agent/framework files live under **`.cursor/`** only (skills, routing, ADO, `sync-state.md`, `dev/setup.sh`).

## Agent state

| File | Use |
|---|---|
| `.cursor/sync-state.md` | `week_of`, `planning_for`, sprint — written by `/dawn` / `/mondayblues` |

## Inbox (`02-inbox.md`)

| Skill | Action |
|---|---|
| `/jot` | Append to **02-inbox.md** only |
| `/todo` | File now → `01-todos.md` and/or ADO |
| `/synctodos` | File inbox → `01-todos.md` and/or ADO; clear inbox |
| `/dawn` | Delegates inbox to `/synctodos` — does **not** triage inbox itself |
| `/mondayblues` | Does **not** triage inbox — auto-triggered `/dawn` → synctodos files it |

## Manual edits

You may edit `01-todos.md`, `02-inbox.md`, `04-goals.md`, and `05-done.csv` directly in the IDE. Skills are for **classified actions** (route to ADO, horizon, capacity, sync) — not every markdown tweak. Manual `[x]` is picked up by `/dawn` archive; manual edits bypass `/todo` routing and won’t create PBIs unless you ask. To **revert** a mistaken checkoff or done-log row, say so in chat — agent edits `01-todos.md` and `05-done.csv` directly (no `/undo` skill).
