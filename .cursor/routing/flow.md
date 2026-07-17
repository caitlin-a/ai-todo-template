# Daily flow, ADO optional & git

## ADO optional (`ado-config.md` § Enabled)

| `enabled` | Behaviour |
|---|---|
| `true` | Full ADO sync, PBI create, state suggestions |
| `false` | Personal list only — no ADO MCP |

When disabled: `/todo` PBI/both → personal; `/dawn` skips sprint sync + past sweep; `/synctodos` inbox only; `/tisdone` local CSV only.

## Daily flow

| Skill | Role |
|---|---|
| `/mondayblues` | Weekly goal + shape **This week** → auto `/dawn` |
| `/dawn` | Sprint sync, past sweep, archive, horizons, sort, capacity, commit |
| `/synctodos` | Sprint sync, past sweep, inbox — no replan |
| `/tisdone` | Check off + log + suggest ADO state |
| `/jot` | Inbox capture |
| `/todo` | File new work |
| `/today` / `/focus` | Read-only |

### Avoid double sprint sync

`/mondayblues` syncs ADO in §1. Auto `/dawn` passes **`skip_pbi_sync: true`** (skips sprint WIQL; still runs past sweep + inbox). Standalone `/dawn` or `/synctodos` run full sprint sync + past sweep.

### Inbox

`/dawn` §1 and standalone `/synctodos` file inbox. `/mondayblues` does **not** triage inbox.

## Auto-commit

Git on **`/dawn` only** — `git add -A` → `commit -m "chore: dawn — plan for {planning_for}"` → `git push origin HEAD` if configured. Other skills: no commit.

## Model gate

**Auto** for todo skills + ADO MCP. Premium: **`/jot` only**. See [auto-only.mdc](../rules/auto-only.mdc).
