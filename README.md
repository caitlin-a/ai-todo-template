# AI TODO System

Seeing as I'm doing all of my work in Cursor, I thought it'd make sense for my todo list to
live there too. And then I started making skills...

Copy, steal, adapt, use this AI todo system to attempt to wrangle your brain into some sense
of order (no promises).

**My favourite bits:**

- Skills for getting you started in the morning + keeping you focused during the day
- Manually edit (how retro) *or* use skills to add new things to the pile of stuff
- Set weekly goals to keep you on track (or that's the aim anyway)
- A log of everything you've ever done, so you can shine in those performance reviews
- *Optional* two-way sync with a work board (Azure DevOps out of the box) so this is truly
  The Source Of Truth

## The skills (the actual point)

Strip out the skills and this is just a folder of markdown files. The skills are the bit that
makes it a *system* - you call them by name in Cursor (`/dawn`, `/focus`, etc.) and they do the
planning, sorting and archiving for you.

**A typical week:** `/mondayblues` on Monday → `/dawn` each morning → `/focus` or `/today`
through the day → manually check-off when you've done something

**Planning**

- **`/dawn`** - the daily driver. Archives yesterday's wins, (optionally) syncs your ADO sprint,
  fixes horizons, sorts by priority, and trims Today down to something actually achievable -
  then commits. Run it each morning (or at 1pm if you forget). You can also run it at 5pm to set-up for the next day.
- **`/mondayblues`** - Monday reset: set the week's goal and shape what *This week* holds.
- **`/synctodos`** - a lighter `/dawn`: pull in ADO sprint items and clear the inbox, without
  the full replan.

**The ADHD helpers**

- **`/today`** - what's on for today, with a done/to-do split and a progress %.
- **`/focus`** - the single next thing to do. For when you just need your brain to shut up and do one thing. (This one is my fave).
- **`/dopamine`** - the only time I let AI be sycophantic. Sometimes you just need a pat on the head.

**Capture**

- **`/jot`** - brain-dump a note to the inbox and decide where it lives later.
- **`/todo`** - add a proper todo and file it to the right spot (and/or an ADO item).

**Finishing**

- **`/tisdone`** - tick something off, log it to your wins archive, and nudge the matching ADO
  item to Done.

I don't tend to use the capture skills or finishing skill so much any more, I just check/add stuff manually. I try to run everything on the cheapest model possible (generally Auto in Cursor) so that I don't blow the token budget bank. Maintaining a todo list
is very much *not* rocket science.

## What you'll need

- *[Cursor](https://cursor.com)* - the skills live in `.cursor/skills/`, so you'll need it.
  (Claude Code support is on my list, just not done yet.)
- Optionally, an *Azure DevOps* (ADO) *MCP*, if you want the sync bit. Off by default though -
  the list runs perfectly happily without it.

## Quick start

Hit *Use this template* at the top of the GitHub page to grab your own copy, open it in Cursor,
and you're off - no setup step, the todo files ship ready to go. (Except if you want to link up
to ADO - see [Syncing with a work board](#syncing-with-a-work-board-optional).)

Those files are tracked, not git-ignored - so if you'd rather your list wasn't public, make your
copy of the repo private. That's what I do (more in [Privacy](#privacy)).

## The actual todo files
> ship empty in the repo; they fill in as you use it

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

## The framework (`.cursor/`)

The actual guts. You probably don't need to poke around in here - but if you do: it's all
carved up so each skill only pulls the context it actually needs, rather than loading the whole
framework every time (yep, the token budget again).

| File                                                             | What it's for                           |
| ---------------------------------------------------------------- | --------------------------------------- |
| [.cursor/routing.md](./.cursor/routing.md)                       | Index - which subfiles each skill reads |
| [.cursor/ado-config.md](./.cursor/ado-config.md)                | ADO on/off + index - slices in [.cursor/ado/](./.cursor/ado/) |
| [.cursor/AGENTS.md](./.cursor/AGENTS.md)                         | Short agent entry point                 |
| [.cursor/dev/](./.cursor/dev/)                                   | Regression + dev notes (*humans only*)  |

*Regression tests:* `bash .cursor/dev/test-regression.sh` (run from the repo root). Worth doing
if you adapt a skill or fiddle with the routing - they're quick wiring checks that flag when
you've accidentally broken how the skills hang together, before you find out the hard way.

## Syncing with a work board (optional)

ADO's off by default - the list works completely fine without it. To switch it on:

1. Connect an Azure DevOps MCP in Cursor.
2. Copy [`.cursor/ado/target.example.md`](./.cursor/ado/target.example.md) to
   `.cursor/ado/target.md` and fill in your org, team, area and assignee. (`target.md` is the
   one git-ignored file - it's got your details in it, so it never gets committed.)
3. Set `enabled: true` in [`.cursor/ado-config.md`](./.cursor/ado-config.md).

That's it - the skills pick ADO up from your next `/dawn`, `/synctodos` and so on.

Not on ADO? (Jira, Trello, Linear, whatever) - the sync layer is just markdown instructions in
[`.cursor/ado/`](./.cursor/ado/) pointing at an MCP's tools. So in theory you can point those
files at your own tracker's MCP instead. But I will leave it to you to adapt.

## Privacy

The todo files live in the repo and are tracked - *not* git-ignored. So if you don't want your
list out in the open, make your copy of the repo private (that's what I do).

The one thing that stays out of git is `.cursor/ado/target.md` - the ADO file with your org and
assignee details in it. You only create it (from the tracked `target.example.md`) if you turn
ADO on, per [Syncing with a work board](#syncing-with-a-work-board-optional).

## Things I'd like to add

- Claude + Cursor agnostic
- A way to add to the inbox from email/WhatsApp/Teams (ambitious, given I *really* don't want
  to build an app)
