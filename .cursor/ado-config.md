# ADO — index

ADO is **off** by default (`enabled: false` below) — the todo list runs fine without it.
To turn it on: set `enabled: true`, copy [ado/target.example.md](./ado/target.example.md) to
`ado/target.md` and fill it in, and connect your Azure DevOps MCP. (See the README's
"Syncing with a work board" section for the walkthrough.)

**Do not read every file below.** Each skill lists exactly which `ado/` subfiles to load.

## Enabled

| Setting | Value |
|---|---|
| enabled | `false` |

When `false`, skills skip all ADO MCP. Personal list still runs.

## Skill → read map

| Skill | Read these only |
|---|---|
| `/todo` **PBI/both** | [ado/create.md](./ado/create.md), [ado/target.md](./ado/target.md) |
| `/synctodos` | [ado/sync.md](./ado/sync.md), [ado/done-dates.md](./ado/done-dates.md), [ado/target.md](./ado/target.md), [ado/states.md](./ado/states.md) § transitions (mismatch) |
| `/dawn` | [ado/sync.md](./ado/sync.md), [ado/done-dates.md](./ado/done-dates.md), [ado/target.md](./ado/target.md) |
| `/mondayblues` | [ado/sync.md](./ado/sync.md), [ado/target.md](./ado/target.md) |
| `/tisdone` | [ado/states.md](./ado/states.md), [ado/done-dates.md](./ado/done-dates.md) |

## Topic files (`.cursor/ado/`)

| File | Contents |
|---|---|
| [target.md](./ado/target.md) | Org, team, area, assignee, sprint timing |
| [sync.md](./ado/sync.md) | Sprint WIQL, Task nesting, past sweep |
| [create.md](./ado/create.md) | Dedupe, create PBI, triage |
| [states.md](./ado/states.md) | Workflow, transition suggestions |
| [done-dates.md](./ado/done-dates.md) | PBI `05-done.csv` signal resolution |

Sort order after fetch: [dawn/SKILL.md](./skills/dawn/SKILL.md) §5 Sort priority.
