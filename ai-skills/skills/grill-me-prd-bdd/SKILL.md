---
name: grill-me-prd-bdd
description: Interview the user about a feature using the Socratic method to reach a precise shared understanding, then produce a self-contained product requirements document document with comprehensive BDD scenarios in Given/When/Then format. Use this skill whenever the user wants to spec out a feature, define a domain model, nail down behavioral requirements, or turn a rough design idea into unambiguous specifications.
---

Interview the user about their feature using the Socratic method - one question at a time. Walk down each branch of the design tree, resolving dependencies before moving to dependent decisions. For every question, provide your recommended answer so the user can confirm or redirect. This session MUST NOT be technical apart from non-functional requirements or if the user asks for investigations in the codebase (and even then, after answer found, go back to domain only discussion).

Keep going until you've covered the design tree sufficiently, or the user signals they're ready for the document.

## Questioning order

Later decisions depend on earlier ones, so work through these in sequence:

1. **Problem and actors** - What problem is being solved? Who triggers or is affected by this behavior?
2. **Domain entities** - What are the key concepts and objects? What states can they be in?
3. **Invariants and rules** - What constraints must always hold? What validations apply?
4. **Flows and transitions** - What are the main operations? How do entities change state?
5. **Authorization** - Who can perform each action, and under what conditions?
6. **Edge cases and failures** - What happens at boundaries, under errors, or in unexpected sequences?
6. **Non functional requirements** - What performance, security, reliability, availablility and scalability requirements are expected?

## Output document

When understanding is complete, produce this document:

```markdown
# Product Requirements Document: [Feature/System Name]

## Glossary

| Term | Definition |
|------|------------|
| [Term] | [Precise definition in domain language. Distinguish from similar terms.] |

## Problem statement

Pain points and impacts to users/business.

## Objectives and metrics

How the feature success is going to be measured. Quantifiable goals.

## Requirements

### Functional

### Non-functional

### Invariants

## Behavioral Specifications

### [Category]


```gherkin
Feature: [Feature title]
Rule: [business logic or constraints that affect the feature.]

Scenario: [one specific behavior or path]

Given [precondition: system state and actor context]
When [actor performs a specific action]
Then [observable, testable outcome]
And [additional outcomes if needed]
```
```

## Glossary guidance

The glossary is the shared vocabulary — every term used in the BDD scenarios must appear here. Precision matters:
- Define concepts a domain expert would recognise, not implementation details
- Explicitly distinguish between similar terms the team might use interchangeably (e.g., *Account* vs *Subscription*)
- If a term has a specific meaning in this context that differs from common usage, call that out

## BDD scenario guidance

Write scenarios that cover the **full behavioral surface** — err on the side of more:

- **Happy paths** — the expected flows that succeed
- **Validation and rejections** — invalid inputs, violated rules, precondition failures
- **State transitions** — each valid (and invalid) state change
- **Authorization** — who can and cannot perform each action
- **Boundary conditions** — limits, thresholds, empty collections, first/last occurrences
- **Failures** — system errors, partial failures, race conditions if relevant

Each scenario should:
- Use glossary terms, not implementation or framework details
- Have a single behavioral focus
- Be specific enough to be unambiguous but not so narrow it breaks with valid refactors
- Be written at domain level, not UI or API level
- Use concrete values and data
