# Dev — agents do not read routinely

Human regression and bootstrap only.

| File | Use |
|---|---|
| [scenarios.md](./scenarios.md) | Acceptance criteria when changing skills or routing |
| [test-regression.sh](./test-regression.sh) | Quick wiring checks — run from repo root: `bash .cursor/dev/test-regression.sh` |
| [bootstrap/](./bootstrap/) | Empty list stubs for `bash .cursor/dev/setup.sh` on a fresh clone |
| [setup.sh](./setup.sh) | Idempotent bootstrap — run from repo root |
