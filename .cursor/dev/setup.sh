#!/usr/bin/env bash
# Idempotent bootstrap for a fresh clone (home machine). Safe to re-run.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
BOOT="${ROOT}/.cursor/dev/bootstrap"

copy_if_missing() {
  local dest="$1" src="$2"
  if [[ ! -f "$dest" ]]; then
    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"
    echo "Created $dest"
  fi
}

copy_if_missing ".cursor/ado-config.md" ".cursor/ado-config.example.md"
copy_if_missing ".cursor/ado/target.md" ".cursor/ado/target.example.md"
copy_if_missing ".cursor/sync-state.md" "${BOOT}/sync-state.md"
copy_if_missing "01-todos.md" "${BOOT}/01-todos.md"
copy_if_missing "02-inbox.md" "${BOOT}/02-inbox.md"
copy_if_missing "04-goals.md" "${BOOT}/04-goals.md"
copy_if_missing "05-done.csv" "${BOOT}/05-done.csv"

echo "Setup complete. Open in Cursor — ADO is off until you fill in .cursor/ado/target.md and set enabled: true in .cursor/ado-config.md."
