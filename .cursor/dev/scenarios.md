# Scenarios & acceptance criteria

Manual regression when changing skills or routing. Timezone: **Europe/London**. Wiring script: [test-regression.sh](./test-regression.sh).

## Evening prep (no user decision)

After **4pm London**, `/dawn` sets `planning_for` to the **next working day** and shapes **Tomorrow** in `## Today`. You do not choose a mode — same `/dawn` skill, different effective date.

| Step | What happens |
|---|---|
| Run `/dawn` at 4–5pm Thu | `planning_for` = Fri; you pick up to 3 items for **Friday** Today |
| Unchecked items still in Today from Thu morning | **Stale Today** → moved to **This week** (not lost) |
| `[x]` from Thu | Archived to `05-done.csv` + removed from list |
| Run `/dawn` Fri 9am | `planning_for` = Fri; stale rule no-op if already Friday |

**AC:** Evening `/dawn` never drops unchecked work; it rolls to This week and plans the next working day.

---

## 1. Same-day `/tisdone` → `/dawn`

**Given** item checked via `/tisdone` and logged  
**When** `/dawn` runs same calendar day  
**Then** no duplicate row in `05-done.csv`; item removed from Today/This week

## 2. Evening `/tisdone` then morning `/dawn`

**Given** `/tisdone` Thu 8pm  
**When** `/dawn` Fri 9am archives  
**Then** no duplicate row (dedupe by text or PBI `#id`)

## 3. Manual `[x]` without `/tisdone`

**Given** user checks `[x]` in IDE only  
**When** next `/dawn`  
**Then** CSV row appended (if missing) and removed from list

## 4. This week `[x]` end of day

**Given** `[x]` under **This week** **do**  
**When** `/dawn` archive  
**Then** logged (if needed) and removed

## 5. ADO Done, local `[ ]`

**Given** PBI `Done` in ADO, still `[ ]` locally  
**When** `/dawn` or `/synctodos` catch-up  
**Then** **Likely done (ADO)**; on confirm → logged + removed at archive

## 6. Forgot `/tisdone` (personal)

**Given** personal chore finished but never checked  
**When** `/dawn`  
**Then** no auto-guess

## 7. Stale Today (weekend)

**Given** unchecked Today, `planning_for` stale  
**When** Monday `/dawn`  
**Then** unchecked Today → This week; `[x]` archived

## 8. Capacity

**Given** >8 **do** lines in This week  
**When** `/dawn` trim  
**Then** excess **do** + steps → Future; steps don't count toward cap

## 9. Inbox — single owner

**Given** `02-inbox.md` lines  
**When** `/dawn` or standalone `/synctodos`  
**Then** inbox filed; `/mondayblues` does not triage

## 10. Monday — no double sprint sync

**Given** `/mondayblues` just synced ADO  
**When** auto `/dawn`  
**Then** `skip_pbi_sync: true` — inbox + mismatch only (inline sync in dawn §1)

## 11–23

See [test-regression.sh](./test-regression.sh) for automated wiring checks. Premium gate, ADO disabled, focus steps, no duplication, priority sort, doc-review detail in `03-projects/`.

## Quick smoke (live)

1. `/today` → **Today** only; stale nudge if needed  
2. `/focus` → first step or **do** in Today then This week  
3. ADO: WIQL excludes Feature/Epic/Initiative (`ado/sync.md`)
