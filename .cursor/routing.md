# Todo routing — index

**Do not read every file below.** Skills list exactly which subfiles to load.

## Skill → read map

| Skill | Read |
|---|---|
| `/todo` | [tags](./routing/tags.md) when filing/moving; [ado/create](./ado/create.md) + [ado/target](./ado/target.md) when PBI/both |
| `/jot` | _(self-contained)_ |
| `/synctodos` | [paths](./routing/paths.md), [tags](./routing/tags.md), [sync](./routing/sync.md), [flow](./routing/flow.md), [ado/sync](./ado/sync.md), [ado/target](./ado/target.md), dawn §5 |
| `/dawn` | [tags](./routing/tags.md), [sync](./routing/sync.md), [done-log](./routing/done-log.md), [flow](./routing/flow.md), [ado/sync](./ado/sync.md), [ado/done-dates](./ado/done-dates.md), [ado/target](./ado/target.md) + **inlined § Reference–§6 in skill** |
| `/mondayblues` | [goals](./routing/goals.md), [flow](./routing/flow.md), [ado/sync](./ado/sync.md), [ado/target](./ado/target.md), dawn §5 + § Reference |
| `/tisdone` | [done-log](./routing/done-log.md), [flow](./routing/flow.md), [ado/states](./ado/states.md), [ado/done-dates](./ado/done-dates.md) + inlined list rules |
| `/today` | _(inlined in skill)_ — `01-todos.md` **## Today** only |
| `/focus` | _(inlined in skill)_ — `01-todos.md` **Today + This week** only |

**List reads:** skills that touch `01-todos.md` should load **Today + This week** only unless filing to **Future** or moving deferred work.

## Topic files (`.cursor/routing/`)

| File | Contents |
|---|---|
| [paths.md](./routing/paths.md) | Files, inbox, manual edits |
| [horizons.md](./routing/horizons.md) | Planning date, horizons _(inlined in dawn/todo)_ |
| [list-structure.md](./routing/list-structure.md) | Do/step indent _(inlined in most skills)_ |
| [tags.md](./routing/tags.md) | Schedule + state tags on **do** lines |
| [goals.md](./routing/goals.md) | `04-goals.md` shape + § Priority rules |
| [done-log.md](./routing/done-log.md) | Personal CSV + pointer to ado/done-dates |
| [sync.md](./routing/sync.md) | ADO dedupe only |
| [capacity.md](./routing/capacity.md) | Caps _(inlined in dawn)_ |
| [flow.md](./routing/flow.md) | ADO optional, daily flow, git, model gate |

ADO: [ado-config.md](./ado-config.md) index · [ado/](./ado/)

## ADO optional

`ado-config.md` § `enabled: false` → personal list only. Details: [flow.md](./routing/flow.md) § ADO optional.
