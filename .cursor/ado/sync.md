# ADO sync

Used by `/dawn` §1, `/synctodos`, `/mondayblues`. Per [ado-config.md](../ado-config.md) § Enabled.

Values in `<angle brackets>` come from [ado/target.md](./target.md).

Two distinct operations — do **not** conflate them:

| Operation | Purpose | Scope |
|---|---|---|
| **Sprint work sync** | Add/update *open* sprint items in **This week** | Current sprint WIQL |
| **Past sweep** | Close out items *already Done in ADO* but still `[ ]` locally | Entire `01-todos.md`, all horizons |

---

## Sprint work sync

### Sprint work item scope

| Included (top-level **do** in `## This week`) | Included (indented **step**) | Excluded |
|---|---|---|
| PBI, Planned Task, Unplanned Task, Spike, Bug, … | **Task** (child of another work item) | Feature, Epic, Initiative |

`System.WorkItemType NOT IN ('Feature', 'Epic', 'Initiative')` in WIQL — **Task** → indented step under parent; everything else → top-level **do** in **This week** (ordered per [dawn/SKILL.md](../skills/dawn/SKILL.md) §5).

### Steps

1. `work_list_team_iterations` — `<your-project>`, `<your-team>`, `timeframe: "current"` → `iterationPath`.
2. `wit_query_by_wiql`:

```sql
SELECT [System.Id], [System.Title], [System.State], [System.WorkItemType],
       [Microsoft.VSTS.Common.BacklogPriority]
FROM WorkItems
WHERE [System.TeamProject] = '<your-project>'
  AND [System.WorkItemType] NOT IN ('Feature', 'Epic', 'Initiative')
  AND [System.AssignedTo] = '<Your Name>'
  AND [System.AreaPath] UNDER '<your-project>\<your-area-path>'
  AND [System.IterationPath] UNDER '{iterationPath}'
  AND [System.State] NOT IN ('Done', 'Removed', 'Closed')
```

3. **Split Tasks** — for each Task: `wit_get_work_item(id, expand: relations)` → parent; find parent **do** in **This week** or create it; append `  - [ ] {title} — [Task #{id}](edit url) · {state}`; preserve `[x]` on matching ids.
4. Merge into **`## This week`** (add/update **do** lines and indented **steps**).
5. **Dedupe** personal lines — per [routing/sync.md](../routing/sync.md) § ADO dedupe.
6. Reorder **entire** `## This week` per dawn §5 Sort priority (`04-goals.md` § **Priority**). Keep **steps** under parent. Append `*(type)*` when not PBI.
7. Update `.cursor/sync-state.md` (`last_sync`, `sprint`).

### Task children

Tasks map to indented **steps** under the parent **do**. They do **not** count toward capacity. `/tisdone` on a Task step can check ADO Task state on confirm.

---

## Past sweep (closed in ADO, still open locally)

**Always run** when ADO is enabled — including when `skip_pbi_sync: true` (e.g. after `/mondayblues`). Sprint WIQL excludes Done items by design; past sweep is the only way to catch work closed in ADO but never `/tisdone`'d in the markdown.

### Steps

1. **Collect ids** — parse the **entire** `01-todos.md` (Today, This week, Future) for linked work item ids:
   - `PBI #123`, `Task #123`, `Planned Task #123`, `Unplanned Task #123`, `/_workitems/edit/123`
   - Include ids on both **do** lines and indented **step** lines.
2. **Dedupe** ids; drop any `pbi_id` already present in `05-done.csv`.
3. **Batch-fetch** — `wit_get_work_items_batch_by_ids` (batch ≤ 200).
4. **Match** — for each id where ADO `System.State` ∈ `Done`, `Removed`, `Closed`:
   - Find every matching `- [ ]` line in the list (any horizon).
   - If the id is on a **parent do** line → flag the whole parent (do + indented steps).
   - If the id is on a **step** only → flag that step (parent stays if still open).
5. **Report** — list hits as **Likely done (ADO)** with id, title, ADO state, horizon. Per [routing/sync.md](../routing/sync.md) § Past sweep catch-up.
6. **Reverse mismatch** (optional, same pass) — `[x]` locally but ADO still open → suggest ADO transition per [ado/states.md](./states.md) § Transition suggestions.

### Not in scope

- Personal lines with no work item id — past sweep ignores them.
- Open ADO items in Future — leave alone (deferred, not stale).
