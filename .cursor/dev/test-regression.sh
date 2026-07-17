#!/usr/bin/env bash
# Regression checks for ai-todo-template — run from repo root:
#   bash .cursor/dev/test-regression.sh
set -euo pipefail
cd "$(dirname "$0")/../.."
pass=0; fail=0; warn=0
ok() { echo "✓ $1"; pass=$((pass+1)); }
bad() { echo "✗ $1"; fail=$((fail+1)); }
note() { echo "· $1"; warn=$((warn+1)); }

# --- CSV done log ---
[[ -f 05-done.csv ]] && ok "05-done.csv present" || bad "05-done.csv missing"
[[ ! -f 05-done.md ]] && ok "05-done.md removed (csv canonical)" || bad "05-done.md still exists"

head -1 05-done.csv | grep -q 'completed_date,title,pbi_id' && ok "CSV header correct" || bad "CSV header wrong"

grep -q 'done-log date resolution' .cursor/ado/done-dates.md && ok "ADO date resolution in ado/done-dates" || bad "missing ado/done-dates"

# --- ADO optional + split ---
if grep -q '## Enabled' .cursor/ado-config.md && \
   grep -q 'enabled.*false' .cursor/ado-config.example.md && \
   grep -q 'Skill → read map' .cursor/ado-config.md && \
   [[ -f .cursor/ado/sync.md ]] && \
   [[ -f .cursor/ado/create.md ]] && \
   grep -q 'ADO optional' .cursor/routing.md && \
   grep -q 'Do not read' .cursor/skills/todo/SKILL.md && \
   grep -q 'ADO check' .cursor/skills/synctodos/SKILL.md && \
   grep -q 'ADO check' .cursor/skills/dawn/SKILL.md && \
   grep -q 'ADO check' .cursor/skills/mondayblues/SKILL.md && \
   grep -q 'ADO check' .cursor/skills/todo/SKILL.md && \
   grep -q 'ADO check' .cursor/skills/tisdone/SKILL.md; then
  ok "ADO optional + split wired"
else
  bad "ADO optional / split wiring incomplete"
fi

[[ -f .cursor/ado-config.example.md ]] && ok "ado-config.example.md present" || bad "ado-config.example.md missing"
[[ -f .cursor/dev/bootstrap/01-todos.md ]] && ok "dev/bootstrap present" || bad "dev/bootstrap missing"
[[ ! -d templates ]] && ok "templates/ removed" || bad "templates/ still exists"
[[ ! -f scripts/publish-framework.sh ]] && ok "publish-framework.sh removed" || bad "publish-framework.sh still exists"
[[ -x .cursor/dev/setup.sh ]] && ok "setup.sh executable" || note "setup.sh not executable (chmod +x .cursor/dev/setup.sh)"

# --- mondayblues inbox ---
grep -q "triage like \`/todo\`" .cursor/skills/mondayblues/SKILL.md && bad "mondayblues inbox triage" || ok "mondayblues defers inbox"
grep -qi 'not.*triage inbox' .cursor/skills/mondayblues/SKILL.md && ok "mondayblues inbox deferral note" || bad "mondayblues missing inbox deferral"

# --- dawn inline sync (no Task subagent) ---
grep -q 'Spin Task' .cursor/skills/dawn/SKILL.md && bad "dawn still uses Task subagent" || ok "dawn inline sync (no Task)"
grep -q 'git push origin HEAD' .cursor/skills/dawn/SKILL.md && ok "dawn commits + pushes" || bad "dawn missing commit + push"

sync_line=$(grep -n "## 1. Sync" .cursor/skills/dawn/SKILL.md | cut -d: -f1)
archive_line=$(grep -n "## 3. Archive" .cursor/skills/dawn/SKILL.md | cut -d: -f1)
[[ "$sync_line" -lt "$archive_line" ]] && ok "dawn sync before archive" || bad "dawn archive before sync"

# --- skip_pbi_sync chain ---
grep -q "skip_pbi_sync" .cursor/skills/mondayblues/SKILL.md && \
grep -q "skip_pbi_sync" .cursor/skills/dawn/SKILL.md && \
grep -q "skip_pbi_sync" .cursor/skills/synctodos/SKILL.md && ok "skip_pbi_sync chain" || bad "skip_pbi_sync incomplete"

# --- tisdone triggers ---
desc=$(sed -n '/^description:/,/^---/p' .cursor/skills/tisdone/SKILL.md | head -5)
echo "$desc" | grep -qE 'says tisdone, done,' && bad "tisdone bare done trigger" || ok "tisdone narrowed triggers"

# --- archive scope ---
grep -q 'under \*\*Today\*\* and \*\*This week\*\*' .cursor/skills/dawn/SKILL.md && ok "dawn archives This week [x]" || bad "dawn missing This week archive"

# --- dev folder ---
[[ -f .cursor/dev/scenarios.md ]] && ok "scenarios in dev/" || bad "scenarios.md missing from dev/"
[[ ! -f .cursor/scenarios.md ]] && ok "scenarios moved from .cursor root" || bad "old scenarios.md still at .cursor root"
[[ ! -f .cursor/routing/routes.md ]] && ok "routes.md removed" || bad "routes.md still exists"

# --- list structure ---
grep -q '^####' 01-todos.md && bad "01-todos has #### headings" || ok "indented steps only"

# --- read-only skills inlined ---
grep -q 'inlined' .cursor/skills/today/SKILL.md && ok "today inlined" || bad "today not inlined"
grep -q 'inlined' .cursor/skills/focus/SKILL.md && ok "focus inlined" || bad "focus not inlined"

echo ""
echo "--- $pass passed, $fail failed, $warn notes ---"
exit $(( fail > 0 ? 1 : 0 ))
