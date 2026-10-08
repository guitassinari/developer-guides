---
name: ruby
description: Ruby coding conventions and style guide. Use when writing, reviewing, or refactoring Ruby code, or when working in a Ruby or Rails project.
---

## Layout & Formatting
- Use UTF-8 encoding.
- Indent with 2 spaces, never tabs.
- Limit lines to 80 chars (max 100–120 if unavoidable).
- End files with a newline; use Unix line endings.
- Do not add trailing whitespace.
- One expression per line.
- Do not use semicolons (`;`) to terminate lines.
- Keep method chain style consistent (leading or trailing dot).
- Align multi-line arguments consistently.

## Spacing & Syntax
- Add spaces around operators and after commas.
- Do not add spaces after `!` or inside range literals.
- No space between method name and opening `(`.
- Be consistent in hash and block brace spacing.
- In DSLs (e.g. Rails), omit parentheses/braces when possible.

## Naming & Files
- Methods, variables, symbols → `snake_case`.
- Classes, modules → `CapitalCase` (PascalCase).
- Constants → `SCREAMING_SNAKE_CASE`.
- File and directory names → `snake_case`.
- One class/module per file, file name must match class.
- Boolean-returning methods must end with `?`.
- Mutating/dangerous methods must end with `!`.
- Prefix unused variables/parameters with `_`.
- Methods preferably have a verb e.g. get_car(), purchase(), book()

## Control Flow & Logic
- Prefer iterators (`each`, `map`) over `for` loops.
- Do not use `then` in multi-line conditionals.
- Condition should be on the same line as `if` / `unless`.
- Prefer `if` over `unless` when possible.
- Use ternary `?:` for short conditionals; never nest ternaries.
- Use `case` instead of multiple `elsif` for the same variable.
- Assign results directly from `if` / `case` expressions.
- Use `!`, `&&`, `||` for boolean logic.
- Use `and` / `or` only for control flow (not boolean logic).
- Do not use double-bang (`!!`) for coercion.

## Exceptions
- Use `raise` (not `fail`).
- Always specify exception class and message.
- Do not suppress exceptions silently.
- Rescue order: most specific → most general.

## Collections & Hashes
- Prefer literals (`[]`, `{}`) over constructors.
- Do not mix hash syntaxes in the same literal.
- Do not use mutable default args (`def foo(arr = [])`).
- Do not mutate input args directly.
- Prefer functional methods (`map`, `select`, `reduce`) over loops.

## Metaprogramming
- Avoid unnecessary metaprogramming.
- Do not monkey-patch core classes unless essential.
- Prefer `public_send` to `send`.
- If defining `!` and non-`!` versions, implement safe method by duplicating + calling bang method.

## Testing / RSpec (BetterSpecs)
- File naming: `*_spec.rb` should match class/module tested.
- Structure: `describe` → `context` → `it`.
- Example names must read like sentences.
- Keep `it` blocks short and focused (1–2 expectations).
- Prefer clarity over DRY in specs.
- Use `let` and `subject` sparingly; avoid hidden complexity.
- Minimize `before` hooks; prefer explicit setup.
- Tests must be independent, order-agnostic.
- Use mocks/stubs/doubles carefully; do not stub object under test excessively.
- Test *behavior/output*, not implementation details.
- Keep specs fast; isolate from external services with fakes/mocks.
- Separate fast unit specs from slower integration specs.
