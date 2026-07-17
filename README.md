# AI Todo Template

A personal task list driven by [Cursor](https://cursor.com) skills: daily planning, quick
capture, a wins log, and optional two-way sync with an Azure DevOps (ADO) board.

Clone it, run the setup script, and start using it. Your actual tasks and ADO details stay
local (git-ignored) — the repo only holds the framework and empty stubs.

## Quick start

```bash
git clone git@github.com:<your-username>/ai-todo-template.git
cd ai-todo-template
bash .cursor/dev/setup.sh
```

`setup.sh` creates your local working files from the stubs and `*.example` configs (it never
overwrites existing files, so it's safe to re-run). Then open the folder in Cursor.

ADO is **off** by default — the list works fully on its own. To turn it on, fill in
[`.cursor/ado/target.md`](./.cursor/ado/target.md) and set `enabled: true` in
`.cursor/ado-config.md` once your Azure DevOps MCP is connected.

## Your files (repo root, git-ignored)

| File | Use |
|---|---|
| **`01-todos.md`** | **Today** · **This week** · **Future** |
| **`02-inbox.md`** | Quick capture — `/synctodos` or `/dawn` files it |
| **`03-projects/`** | Checklist detail (keeps `01-todos.md` lean) |
| **`04-goals.md`** | Weekly goal + priority ([shape](./.cursor/routing/goals.md)) |
| **`05-done.csv`** | Wins archive |

Edit these directly for typos and reorders — skills handle routing and sync.

## Skills

| Capture | `/jot` · `/todo` |
| Planning | `/mondayblues` · `/dawn` · `/synctodos` |
| Finishing | `/tisdone` |
| Read-only | `/today` · `/focus` · `/dopamine` |

Typical flow: **`/mondayblues`** (weekly) → **`/dawn`** (daily) → **`/focus`** or **`/today`** → **`/tisdone`**.

## Framework (`.cursor/`)

| File | Use |
|---|---|
| [`.cursor/routing.md`](./.cursor/routing.md) | Index — which subfiles each skill reads |
| [`.cursor/ado-config.md`](./.cursor/ado-config.md) | ADO index — slices in [`.cursor/ado/`](./.cursor/ado/) |
| [`.cursor/AGENTS.md`](./.cursor/AGENTS.md) | Short agent entry point |
| [`.cursor/dev/`](./.cursor/dev/) | Bootstrap + regression (**humans only**) |

Skills run on Cursor's Auto model; only `/jot` needs a premium model. See
[`.cursor/rules/auto-only.mdc`](./.cursor/rules/auto-only.mdc).

**Regression check:** `bash .cursor/dev/test-regression.sh` (run after `setup.sh`).

## What's git-ignored

Your live list, inbox, goals, wins log, sync state, and ADO config/target are all ignored —
see [`.gitignore`](./.gitignore). Nothing you type into your tasks or your ADO settings gets
committed. Fork it, use it, push your framework tweaks; your data stays on your machine.
