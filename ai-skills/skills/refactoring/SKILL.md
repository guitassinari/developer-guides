---
name: refactoring
description: >
  Provides procedural guidance for identifying code smells, planning refactors,
  and executing safe, incremental structural improvements while preserving behavior.
---

# Refactoring

This Skill helps AI agents guide refactoring work with best practices, smell detection,
and step-by-step micro-refactoring plans. Use this skill when asked to analyze or
improve code quality, reduce duplication, or suggest safe refactoring steps.

## When to use

Trigger this skill when the user wants help with:

- Identifying refactoring opportunities
- Explaining a refactoring strategy
- Planning safe, incremental improvements
- Minimizing risk while cleaning up code
- Interpreting common code smells
- Suggesting refactoring steps for a specific code snippet

---

## Refactoring Overview

**Refactoring** is the structured process of improving internal code quality while
preserving externally observable behavior. Refactoring should be:

1. Behavior-preserving
2. Incremental
3. Small and testable
4. Risk-controlled

Refactoring helps reduce technical debt, increase readability, and make future
changes safer.

---

## Workflow

### 1) Scope & Context
Before refactoring, ask for:
- Target code fragment (file/module/function/class)
- Desired outcome (e.g., reduce duplication, simplify logic)
- Behavior that must not change
- Test suite coverage and execution path

### 2) Safety Net
- Identify existing tests covering the target region
- If tests are missing/weak, propose minimal characterization tests
- Define what constitutes a safe micro-step (e.g., run subset of tests)

### 3) Detect Smells
Scan code and list code smells (see `references/refactoring-smells.md`)
with:
- Name
- Evidence
- Impact
- Recommended first move

### 4) Prioritize One Target
Choose the highest-value, lowest-risk smell to address first. Define:
- Contract (external behavior invariant)
- Risk checks (test passes, static analysis, type checks)

### 5) Micro-Refactoring Loop
For each micro-step:
1. State small edit
2. Provide diff or structured instruction
3. List tests to run
4. Await verification before next

---

## Suggested First Moves

- **Long Method** → Extract Method
- **Duplicate Code** → Extract Method / Pull Up / Consolidate
- **Complex Conditionals** → Decompose / Guard Clauses / Polymorphism
- **Feature Envy** → Move Method or Extract+Move
- **Shotgun Surgery** → Concentrate Responsibility (Move Field/Method)
- **Excessive Comments** → Extract Named Methods or Variables

Refer to `assets/smell-cheatsheet.md` for a quick reference.

---

## Response Structure Template

When providing an answer using this Skill, follow:
