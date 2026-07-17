# ADO create PBI (`/todo` PBI or both)

Target defaults: [target.md](./target.md). Values in `<angle brackets>` come from there.

## Dedupe before create

Before `wit_create_work_item`:

1. `search_workitem` — key nouns from title; `project: ['<your-project>']`; `areaPath: ['<your-project>\\<your-area-path>']`. **Do not** filter `assignedTo`. Drop Feature/Epic/Initiative. Exclude Done/Removed/Closed.
2. Clear match → **do not create**; link existing in `01-todos.md` (**both**) or report id only (**PBI**).
3. Ambiguous → ask once; default to linking existing.

## Create (`wit_create_work_item`)

| Field | Value |
|---|---|
| `System.Title` | Short, board-ready |
| `System.AreaPath` | `<your-project>\<your-area-path>` |
| `System.IterationPath` | `<your-project>` on create |
| `System.State` | `New` |
| `Microsoft.VSTS.Common.ValueArea` | `Business` |
| `Microsoft.VSTS.CMMI.Blocked` | `No` |
| `Microsoft.VSTS.Common.Priority` | `2` |

Add any org-specific custom fields your board requires (e.g. `Custom.<your-field>`).

Use `format: Markdown` for Description and AcceptanceCriteria.

### Triage after create (this week / current sprint)

When `/todo` routes to **this week** or **both**, immediately `wit_update_work_item`:

| Field | Value |
|---|---|
| `System.IterationPath` | Current sprint path |
| `System.AssignedTo` | `<Your Name> <you@example.com>` |
| `System.State` | `In Refinement` |

**For later** / next sprint: next sprint path; `New` or `In Refinement` per intent.
