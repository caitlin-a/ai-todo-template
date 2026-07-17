---
name: dopamine
description: >-
  Read-only celebration of recent wins from 05-done.csv and 04-goals.md success criteria.
  Warm, encouraging tone. Use for dopamine, wins, what did I ship, celebrate,
  or morale boost.
---

# Dopamine

**Read only** — no edits. Summarise recent progress; make you feel the momentum.

## Sources

1. **`05-done.csv`** — rows where `completed_date` is within last 7 calendar days (London) or today
2. **`04-goals.md`** — **Success criteria** checkoffs (`[x]`) for current `week_of`
3. Optional peek at **Today** `[x]` still visible (not yet archived by `/dawn`)

## Output

- Open with a short warm, encouraging line (genuine and specific — not over the top)
- **This week’s wins** — from CSV (`title`, optional `impact`; group by `completed_date`; mention `pbi_id` as link if present)
- **Weekly criteria crushed** — any checked success criteria with a one-liner on why it matters
- **Streak / count** — e.g. “N items logged in 7 days” if N > 0
- If sparse → honest but kind (“quiet week so far — Today has …”); point to `/tisdone` or `/today`

No ADO sync, no replanning. For the task list → `/today`. To log a win → `/tisdone`.
