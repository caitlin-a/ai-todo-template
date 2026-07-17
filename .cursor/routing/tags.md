# Schedule tags (`01-todos.md`)

Optional `*(…)*` suffix on **do** lines (not **steps**). **Horizon heading = coarse when** — tags add deadlines or slots within that horizon.

Anchors: `.cursor/sync-state.md` → `planning_for`, `week_of` (Europe/London; dawn effective date).

## Schedule tags (dates only)

Always include **day of week**. Format: `{Day} {D} {Mon}` (e.g. `Tue 14 Jul`).

| Tag | Meaning | Example |
|---|---|---|
| `*(by {date})*` | Hard deadline | `*(by Tue 14 Jul)*` |
| `*({date})*` | Planned slot | `*(Thu 16 Jul)*` |
| `*({date} – {date})*` | Slot range | `*(Thu 16 Jul – Fri 17 Jul)*` |
| `*(wb {date})*` | This week, no day yet — week begins Monday | `*(wb Mon 13 Jul)*` |

Resolve user hints (`Tuesday`, `by Friday`, `next week`) to concrete dates using `planning_for` / `week_of`.

## State tags (not dates)

| Tag | Use |
|---|---|
| `*(blocked)*` | Waiting on someone/something |
| `*(deferred)*` | Parked intentionally |

## Do not use

| Avoid | Why |
|---|---|
| `*(today)*`, `*(this week)*`, `*(next week)*` | Stale when horizons move |
| `*(priority)*`, `*(first thing)*` | Use list order in **Today** |
| `*(EOD …)*` | Use `*(by {date})*` instead |

ADO workflow (`— Definition of Ready`), sprint id (`*(Sprint 224)*`), effort (`*(~1.5d)*`) are **not** schedule tags — leave as-is.

## When to apply / refresh

| Skill | When |
|---|---|
| `/todo` | On **file** or **horizon move** — set schedule tag per table below |
| `/dawn` | §4 Fix horizons — strip banned tags; refresh schedule tags on moved lines |
| `/synctodos` | Inbox filing — same as `/todo` |

Do **not** guess a specific day for new **This week** items — default `*(wb {week_of})*`.

## Defaults on horizon move

| Lands in | Schedule tag |
|---|---|
| **Today** | **None** — `planning_for` is the date |
| **This week**, no day given | `*(wb {week_of})*` |
| **This week**, user named day | `*({resolved date})*` or `*(by {resolved date})*` if deadline |
| **Future** | `*(wb {next Monday after week_of})*` or omit until pulled forward |

On move: **replace** old schedule tags; keep state tags and ADO suffixes.

## Parsing (skills)

Strip and replace trailing `*(…)*` schedule tags with regex on the **do** line only. Multiple schedule tags → merge to one. State tags `*(blocked)*` / `*(deferred)*` may coexist with one schedule tag.
