# ADO target (example — copy to `target.md`)

`bash .cursor/dev/setup.sh` copies this to `ado/target.md` (git-ignored). Fill in your
Azure DevOps details there — placeholders in `<angle brackets>`.

| Setting | Value |
|---|---|
| Organisation | `<your-org>` |
| Project | `<your-project>` |
| Team | `<your-team>` |
| Area path | `<your-project>\<your-area-path>` |
| Work item type | `Product Backlog Item` |
| Assignee | `<Your Name> <you@example.com>` |

Board: `https://dev.azure.com/<your-org>/<your-project>/_backlogs/backlog/<your-team>/Backlog%20items`

Edit URL: `https://dev.azure.com/<your-org>/<your-project>/_workitems/edit/{id}`

## Sprint timing

Resolve at runtime via the Azure DevOps MCP.

| User says | Iteration |
|---|---|
| **this week**, this sprint | Current — `work_list_team_iterations`, `timeframe: "current"` |
| **for later**, next sprint | Next — `work_list_iterations` (`depth: 3`); drop `\Iteration` from path |
| **backlog** (no sprint yet) | `<your-project>` (project root) |
