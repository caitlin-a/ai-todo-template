# ADO PBI state workflow

Confirm via `wit_get_work_item_type` if a transition is rejected on non-PBI types.

The states below are an example workflow — adjust to match your own board's states.

| State | Meaning |
|---|---|
| `New` | Captured; not sprint-ready |
| `In Refinement` | Grooming |
| `Definition of Ready` | Sprint-ready |
| `In Development` | Active work |
| `Verification` | Validating AC |
| `Awaiting Deployment` | Waiting deploy |
| `Done` | Complete |
| `Removed` | Cancelled |

Forward path only — **never** move backwards.

`New` → `In Refinement` → `Definition of Ready` → `In Development` → `Verification` → `Awaiting Deployment` → `Done`

### Definition of Ready

Suggest only when assigned, iteration set, title + description, AC present, not blocked. **Requires explicit user approval** before `wit_update_work_item`.

### Transition suggestions (`/tisdone`, `/synctodos`)

| Trigger | Suggest |
|---|---|
| Item in **Today** / user starts work | `In Development` |
| User checks `[x]` on Sprint PBI | `Done` (offer `Verification` first if was `In Development`) |
| `[x]` locally but ADO open | `Done` |
| ADO `Done`/`Removed` but `[ ]` locally | check off + log (Likely done) |
| Cancel / won't do | `Removed` (ask) |

Use `wit_update_work_item` **only after user confirms**.
