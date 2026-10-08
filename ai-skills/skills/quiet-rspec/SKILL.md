---
name: quiet-rspec
description: >
  Run RSpec quietly — suppresses app logging noise and prints only a compact
  summary (counts + failures with one-line messages). Use this instead of
  `bundle exec rspec` or `rtk`/`rtk proxy rspec` in any Ruby project that uses
  RSpec, whenever running specs interactively or in a subagent.
---

# quiet-rspec

Runs RSpec with a dedicated JSON output file so the target app's own stdout/stderr
logging never interleaves with RSpec's structured report. Prints a single-line
summary plus compact failure details. Exits with RSpec's real exit code.

## When to use

Always use this skill for any RSpec invocation in any Ruby project, instead of:
- `bundle exec rspec ...`
- `rtk bundle exec rspec ...`
- `rtk proxy bundle exec rspec ...`

## Command

```bash
ruby <skill-dir>/run_rspec.rb [OPTIONS] [RSPEC_ARGS...]
```

### Options (consumed by the script, not passed to RSpec)

| Flag | Default | Purpose |
|------|---------|---------|
| `--working-dir PATH` | `$PWD` | Directory to `chdir` into before running RSpec |
| `--full` / `--verbose` | off | Show full backtrace for each failure |
| `--` | — | Separator: everything after is forwarded to RSpec verbatim |

### RSPEC_ARGS

Pass any RSpec arguments after the script's own flags:

```bash
# Single spec file
ruby <skill-dir>/run_rspec.rb spec/models/user_spec.rb

# Spec file with line number
ruby <skill-dir>/run_rspec.rb spec/models/user_spec.rb:42

# Tag filter
ruby <skill-dir>/run_rspec.rb --tag slow spec/

# Whole spec directory in a different repo
ruby <skill-dir>/run_rspec.rb \
  --working-dir /path/to/other-repo \
  spec/services/

# Full failure details
ruby <skill-dir>/run_rspec.rb --full spec/lib/foo_spec.rb
```

## Output format

**Passing run:**
```
42 examples, 0 failures, 2 pending — 3.14s
```

**Run with failures:**
```
10 examples, 2 failures, 0 pending — 1.82s

Failures:

  1) MyService#call returns an error when the account is suspended
     spec/services/my_service_spec.rb:55
     expected "active" to eq "suspended"

  2) MyService#call raises when given nil
     spec/services/my_service_spec.rb:71
     ArgumentError: account must not be nil
```

**LoadError / crash before examples run:**
```
0 examples, 0 failures, 0 pending, 1 error(s) outside examples — 0.0s

Errors outside examples:
  An error occurred while loading ./spec/broken_spec.rb.
  No examples found.
```

## Failure handling

If RSpec crashes before producing any JSON (missing gem, `LoadError`, syntax error
in a spec), the script prints the **last 50 lines** of captured output to stderr
and exits non-zero — enough to diagnose the setup failure without the full noise dump.

## Bundler detection

The script checks for `Gemfile` in the working directory (not the current shell
directory). If found, it runs `bundle exec rspec`; otherwise plain `rspec`.

## How it works

1. Appends `--format json --out <tmpfile>` to the RSpec invocation.
2. Captures the process's own stdout/stderr in a bounded in-memory buffer
   (kept only as a fallback for crash diagnosis).
3. Parses the dedicated JSON file after the run.
4. Cleans up both temp files on exit.
