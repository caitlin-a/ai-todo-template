# Completed items (`05-done.csv`)

Canonical **CSV** — one row per win. Timezone: **Europe/London** (`YYYY-MM-DD`).

## Columns

| Column | Required | Meaning |
|---|---|---|
| `completed_date` | yes | Earliest signal date |
| `title` | yes | Short label (no markdown links) |
| `pbi_id` | if PBI | Numeric id only |
| `impact` | no | One-liner; quote if commas |
| `source` | yes | `personal` or `pbi` |
| `signals` | yes | Pipe-separated `key:YYYY-MM-DD` |

**Dedupe:** skip if same `pbi_id` or normalized `title` already exists.

## Personal

`signals: tisdone:YYYY-MM-DD` or `archive:YYYY-MM-DD` when `/dawn` logs without prior `/tisdone`.

## PBI date resolution

→ [ado/done-dates.md](../ado/done-dates.md) (canonical — do not duplicate here).

## Behaviour

| When | Behaviour |
|---|---|
| `/tisdone` | `[x]` in list; append CSV row |
| `/dawn` archive | Row for `[x]` not yet logged; remove from list |
| **Past sweep catch-up** | ADO `Done`/`Removed`/`Closed` but local `[ ]` — ask once; on confirm append CSV + remove from list (any horizon). Triggered by [ado/sync.md](../ado/sync.md) § Past sweep via `/dawn` and `/synctodos`. |
