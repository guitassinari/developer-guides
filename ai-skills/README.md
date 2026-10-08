# skills

Personal collection of AI agent skills. Each skill is a folder in `skills/` with a `SKILL.md`.

## Install

```bash
git clone https://github.com/guitassinari/developer-guides.git
cd developer-guides/ai-skills
./install.sh                    # all skills, into ~/.claude/skills (symlinks)
```

Options:

```bash
./install.sh --target codex                # ~/.codex/skills
./install.sh --target claude --target agents
./install.sh --dir ~/some/other/skills     # custom directory
./install.sh --copy --force tdd commit     # copy only these, replace existing
./install.sh --list                        # show skills
```

Symlinks (default) mean `git pull` updates your skills. Use `--copy` if you want standalone files.

## Skills

| Skill | What it does |
|-------|--------------|
| c4-architecture | C4 model diagrams in Mermaid |
| cherry-pick | Cherry-pick a commit into a branch and open a PR |
| code-comments | When and how to write code comments |
| code-smell-and-heuristics | Clean Code smells and heuristics |
| commit | Conventional commit rules |
| create-adr | Architecture Decision Records |
| create-pull-request | Create or update GitHub PRs |
| create-rfc | RFC documents |
| create-technical-design-doc | Technical design documents |
| gh-stack | Stacked branches and PRs with gh-stack |
| grill-me-prd-bdd | Interview, then PRD with BDD scenarios |
| mutation-testing | Mutation testing guidance |
| quiet-rspec | RSpec with compact output |
| refactoring | Safe, incremental refactoring |
| ruby | Ruby conventions |
| tdd | Test-driven development |
| write-ticket | Draft Jira tickets with BDD criteria |

## Add a skill

1. Create `ai-skills/skills/<name>/SKILL.md` with `name` and `description` frontmatter.
2. Do not include company names, internal URLs, ticket IDs or secrets (repo is public).
3. Run `./install.sh --force <name>`.
