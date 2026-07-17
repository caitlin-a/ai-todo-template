# ADO dedupe (sync)

Used by `/synctodos` and `/dawn`. **Priority sort** → dawn / mondayblues / synctodos skills (not this file).

## On sprint sync (`/dawn`, `/synctodos`)

After fetching sprint work items, scan **unchecked** personal lines in **This week**:

| Match | Action |
|---|---|
| Line already contains `PBI #` or `/_workitems/edit/` | Leave; ensure id is in the priority list |
| Title clearly same as a sprint work item (keywords / same intent) | Remove duplicate personal line; note in summary |
| Personal line matches open ADO item not in sprint | Link line or move to **both** in **This week** |

Report dedupes under **Sync** in the summary.

## Past sweep catch-up (`/dawn`, `/synctodos`)

Per [ado/sync.md](../ado/sync.md) § Past sweep — **not** tied to sprint WIQL. Scans the **whole** list (all horizons) for work item ids that are closed in ADO but still `- [ ]` locally.

Typical cause: marked **Done** in ADO without `/tisdone`; item may live in **Future** or any horizon.

When past sweep finds matches:

1. List in summary as **Likely done (ADO)** — id, title, ADO state, horizon.
2. Ask once: “Mark these done and log to `05-done.csv`?”
3. On confirm:
   - Resolve dates per [ado/done-dates.md](../ado/done-dates.md)
   - Append `05-done.csv` row (dedupe by `pbi_id`)
   - **Remove** from `01-todos.md` — parent **do** + all indented **steps** (any horizon). No need to `[x]` first.
4. On decline → leave list unchanged; note in summary.

If none found → “Past sweep: clean” (one line, no ask).

## On create (`/todo` → PBI or **both**)

Per [ado/create.md](../ado/create.md) § Dedupe before create — link existing, don’t create twice.
