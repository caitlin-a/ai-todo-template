# ADO done-log date resolution (PBI)

When appending `05-done.csv` for a PBI: collect signals; `completed_date` = **minimum** (earliest). Record all in `signals` (pipe-separated).

## PR must be linked on the work item

`pr` only from PRs **linked to the PBI in ADO**. Unlinked merged PRs do **not** count.

## Signals

### `ado`

`wit_list_work_item_revisions` — first revision where `System.State` ∈ `Done`, `Removed` → date of `System.ChangedDate` (London). Else `Microsoft.VSTS.Common.ClosedDate` or `System.ChangedDate` when Done.

### `tisdone`

Calendar date (London) when `/tisdone` ran.

### `pr`

`wit_get_work_item(id, expand: relations)` — Pull Request relations only → `repo_get_pull_request_by_id` → `closedDate` (merged only). Multiple PRs → **latest** `closedDate`.

## Row build

| Field | Value |
|---|---|
| `title` | ADO `System.Title` |
| `pbi_id` | numeric id |
| `source` | `pbi` |
| `signals` | e.g. `ado:2026-06-17\|pr:2026-06-17\|tisdone:2026-06-18` |
| `completed_date` | min of signal dates |

Personal items: `source: personal`, empty `pbi_id`, `signals: tisdone:YYYY-MM-DD` or `archive:YYYY-MM-DD` only — see [routing/done-log.md](../routing/done-log.md).
