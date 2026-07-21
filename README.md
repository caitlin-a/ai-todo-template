# AI TODO System

Seeing as I'm doing all of my work in Cursor, I thought it'd make sense for my todo list to
live there too. And then I started making skills...

Copy, steal, adapt, use this AI todo system to attempt to wrangle your brain into some sense
of order (no promises).

*My favourite bits:*

- Skills for getting you started in the morning + keeping you focused during the day
- Manually edit (how retro) *or* use skills to add new things to the pile of stuff
- Set weekly goals to keep you on track (or that's the aim anyway)
- A log of everything you've ever done, so you can shine in those performance reviews
- *Optional* two-way sync with a work board (Azure DevOps out of the box) so this is truly
  The Source Of Truth

## What you'll need

- *[Cursor](https://cursor.com)* - the skills live in `.cursor/skills/`, so you'll need it.
  (Claude Code support is on my list, just not done yet.)
- Optionally, an *Azure DevOps* (ADO) *MCP*, if you want the sync bit. Off by default though -
  the list runs perfectly happily without it.

## Quick start

Hit *Use this template* at the top of the GitHub page to grab your own copy, then run
`bash .cursor/dev/setup.sh` (or just tell your agent to). That builds your local working files
from the stubs and `*.example` configs - safe to re-run, it won't clobber anything you've
already got. Open the folder in Cursor and you're off.

Your tasks, goals, and board details are all git-ignored, so nothing personal ever leaks out.

## The actual todo files
> `setup.sh` makes these locally, git-ignored

| File           | What it's for                                                |
| -------------- | ------------------------------------------------------------ |
| `01-todos.md`  | It's the todo list. Contains *Today*, *This week*, and *Future* |
| `02-inbox.md`  | Quick capture — `/synctodos` or `/dawn` files it into todos.md            |
| `03-projects/` | Checklist detail (keeps `01-todos.md` lean, tho I haven't used it much)                 |
| `04-goals.md`  | Weekly goal + priority ([shape](./.cursor/routing/goals.md)) |
| `05-done.csv`  | Wins archive                                                 |

Edit these directly whenever, or run a skill if you've already got an agent session open - both work.

I tend to keep todos.md (and sometimes inbox.md) open whilst I'm in other repos, and just tick stuff off manually.

You'll spot `*(...)*` tags on some items: `*(by Fri 18 Jul)*` for a deadline, `*(wb Mon 14 Jul)*`
for "this week, day TBC", `*(blocked)*` / `*(deferred)*` for state. The skills set and shuffle
these as things move between Today/This week/Future - full list in
[tags.md](./.cursor/routing/tags.md).

## Skills

| Group     | Skills                                    |
| --------- | ----------------------------------------- |
| Capture   | `/jot` · `/todo`                          |
| Planning  | `/mondayblues` · `/dawn` · `/synctodos`   |
| Finishing | `/tisdone`                                |
| Read-only | `/today` · `/focus` · `/dopamine`         |

A typical week: `/mondayblues` (once, on Monday) → `/dawn` (each morning) → `/focus` or
`/today` (during the day) → `/tisdone` (when you finish something).

I don't tend to use the capture skills or finishing skill so much any more, they're unfortunately not worth the tokens.

I try to run everything on the cheapest model possible (generally Auto in Cursor) so that I don't blow the token budget bank. Maintaining a todo list is very much *not* rocket science.

## The framework (`.cursor/`)

The actual guts. You probably don't need to poke around in here - but if you do: it's all
carved up so each skill only pulls the context it actually needs, rather than loading the whole
framework every time (yep, the token budget again).

| File                                                             | What it's for                           |
| ---------------------------------------------------------------- | --------------------------------------- |
| [.cursor/routing.md](./.cursor/routing.md)                       | Index - which subfiles each skill reads |
| [.cursor/ado-config.example.md](./.cursor/ado-config.example.md) | ADO index - slices in [.cursor/ado/](./.cursor/ado/) |
| [.cursor/AGENTS.md](./.cursor/AGENTS.md)                         | Short agent entry point                 |
| [.cursor/dev/](./.cursor/dev/)                                   | Bootstrap + regression (*humans only*)  |

*Regression tests:* `bash .cursor/dev/test-regression.sh` (run after `setup.sh`). Worth doing
if you adapt a skill or fiddle with the routing - they're quick wiring checks that flag when
you've accidentally broken how the skills hang together, before you find out the hard way.

## Syncing with a work board (optional)

ADO's off by default - the list works completely fine without it. To switch it on:

1. Connect an Azure DevOps MCP in Cursor.
2. Fill in your details in [`.cursor/ado/target.example.md`](./.cursor/ado/target.example.md) -
   `setup.sh` copies it to `.cursor/ado/target.md` (git-ignored) for you.
3. Set `enabled: true` in `.cursor/ado-config.md` (copied from
   [ado-config.example.md](./.cursor/ado-config.example.md)).

Not on ADO? (Jira, Trello, Linear, whatever) - the sync layer is just markdown instructions in
[`.cursor/ado/`](./.cursor/ado/) pointing at an MCP's tools. So in theory you can point those
files at your own tracker's MCP instead. But I will leave it to you to adapt.

## What's git-ignored

The live list, inbox, goals, wins log, sync state, and work board config are all ignored (see
`.gitignore`). So nothing you type into your tasks - or your board settings - ever
gets committed. Handy if you're working in public repos - in a private one, loosen the
[.gitignore](./.gitignore) if you'd rather keep everything in the repo.

## Things I'd like to add

- Claude + Cursor agnostic
- Making ADO a clean, fully removable add-on rather than something baked through
- A way to add to the inbox from email/WhatsApp/Teams (ambitious, given I *really* don't want
  to build an app)

## License

[MIT](./LICENSE) - copy, steal, adapt, use.
