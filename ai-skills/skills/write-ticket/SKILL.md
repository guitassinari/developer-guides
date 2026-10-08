---
name: write-ticket
description: Draft a Jira ticket (feature/story or bug) using fixed section templates. Use when the user says "write a ticket", "draft a story", "create a bug ticket", "/write-ticket", or wants a Jira-ready description with proper sections and BDD acceptance criteria.
---

# Write Ticket

Drafts a ticket description matching two fixed templates: **Feature/Story** and **Bug**. Never creates or edits Jira issues without explicit approval in the current prompt.

## Step 1 — Determine type

If not stated, ask: Feature/Story or Bug?

## Step 2 — Gather context (Socratic, ask only what's missing)

Don't invent facts. Pull what you can from conversation context, code, tickets already open, or memory — then ask only for gaps.

**Feature/Story** needs:
- Business context / why this matters, who asks for it
- User(s) affected → user story ("As a X, I want Y, so that Z")
- Functional requirements (what the system must do)
- Non-functional requirements (perf, security, scalability, observability — skip section if genuinely none)
- Enough behavioral detail to write BDD scenarios
- Optional: technical hints (only if user has implementation ideas to share)

**Bug** needs:
- Business/customer impact, how it was found (support ticket, monitoring, user report...)
- Root cause, if known (can be as technical as needed)
- Deterministic repro steps (UI or API), OR explicit statement that it's non-deterministic (race condition etc.) — never fake a deterministic repro
- Expected vs actual result

## Step 3 — Draft

### Feature/Story template

```markdown
## Description
<business context, motivation>

**User Story:** As a <role>, I want <capability>, so that <benefit>.

## Functional Requirements
- ...

## Non-Functional Requirements
- ...

## Acceptance Criteria

Rule: <business rule 1>

  Example: <scenario name>
    Given ...
    When ...
    Then ...

Rule: <business rule 2>
  ...

## Technical Details (optional)
<hints/ideas — only if provided>
```

BDD rules:
- One `Rule:` block per distinct business rule derived from the functional/non-functional requirements above — don't invent rules not traceable to a requirement.
- Each rule has 1+ `Example`/`Scenario`, each with Given/When/Then (And/But as needed).
- Keep Given/When/Then declarative (business language), not implementation steps.
- Cover non-functional requirements as scenarios where testable (e.g. a performance or authorization rule becomes its own Rule block), not just as prose.

### Bug template

```markdown
## Description
<business context, customer impact, how identified — non-technical>

## Root Cause
<known root cause, can be technical — omit section if unknown, state "Under investigation" instead of leaving blank>

## Steps to Reproduce
1. ...
2. ...

(If not deterministically reproducible: state explicitly, e.g. "Not deterministically reproducible — appears to be a race condition under concurrent X. Observed via <evidence>.")

**Expected Results:** ...
**Actual Results:** ...
```

## Step 4 — Review

Show the full draft. Ask for edits before finalizing.

## Step 5 — Output

Ask: output as text only, or create in Jira now?
- If Jira: this requires explicit approval in the current prompt — confirm project/issue type, then use the atlassian MCP tools (`createJiraIssue` etc.). If atlassian MCP isn't authenticated, tell the user to authorize it via `/mcp` in an interactive session.
- Otherwise: leave as markdown for the user to paste.
