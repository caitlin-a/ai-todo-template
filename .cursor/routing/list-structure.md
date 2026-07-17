# List structure (`01-todos.md`)

Two levels only — **do** and **step** — using markdown task-list indent (no `###` work packages, no `#### Steps`).

| Level | Syntax | Use |
|---|---|---|
| **Do** | `- [ ]` at line start under `## Today` / `## This week` / `## Future` | Counts toward capacity; logged to `05-done.csv` when checked off |
| **Step** | `  - [ ]` (exactly **2 spaces** before `-`) on the line immediately after its parent **do** | Ordered subtasks; **do not** count toward capacity; `/focus` picks here first |

**Max depth:** one indent level — no sub-sub-tasks.

## When to use which

| Situation | Pattern |
|---|---|
| Sprint PBI or simple chore | One **do** line |
| ADO Task under a parent ticket | Indented **step** under parent **do** (sync fills these) |
| One deliverable, ordered checklist | Parent **do** + indented **step** lines |
| Multi-phase project (e.g. doc review) | One parent **do** per phase + indented **steps** |
| Reference path | Append to parent line after `·` (e.g. `` · `myproject/docs/…` ``) |
| Optional group label | Plain text line (no checkbox), not a markdown heading |

## Completion

- **Step** `[x]` — progress only; no `05-done.csv` row unless user treats that step as the win
- All **steps** `[x]` → check off parent **do**, then `/tisdone` / `/dawn` archive as usual
- `/dawn` archive: removing a `[x]` parent **do** also removes its indented **step** lines

## Parsing (skills)

| Check | Rule |
|---|---|
| Is it a **do**? | Line matches `^- \[ \]` or `^- \[x\]` under a `##` horizon |
| Is it a **step**? | Line matches `^  - \[ \]` or `^  - \[x\]` (2-space indent only) |
| Parent of a step | Nearest preceding **do** at the same `##` section |
