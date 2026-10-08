---
name: cherry-pick
description: Cherry pick a commit into a branch and create a PR. Use when executing cherry-picks.
---

This workflow cherry-picks a commit merged into a given branch into another one and creates a PR with those changes.
The commit SHA, origin branch and target branch should be given on workflow execution.

1. Create a branch from target branch named `cherry-pick-{{gitsha}}-into-{{target branch}}`
2. Cherry pick the commit into the new created branch
3. Push the change to remote
4. Create a PR with from the new branch targeting the target branch with:
  - Title: should be the same as the original PR that merged the commit into the origin branch, but prefixed with the cherries emoji