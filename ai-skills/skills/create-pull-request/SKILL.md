---
name: create-pull-request
description: Create a Pull Request in a given GitHub repository. Use whenever the user asks for a pull request or a draft pull request or updating a current pull request
---

Creates/updates a Pull Request in the current working git repository following my standards.
If you don't have any required information, stop and ask for it before proceeding.

If the project has a PR template, ALWAYS USE IT and only addapt the content to fit the template. If the project doesn't have a PR template, follow the standards described in this document.

PRs descriptions, titles and comments should be self-contained: No reference to content not accessible through the repository or the PR.

When updating a PR, ALWAYS CHECK if the current description and title still make sense and are up-to-date with the PR content. Update or remove anything outdated.

# Pull request Standards

## PR title

- MUST start with the ticket codes between brackets, in the format `[ABC-#####]`.
    - Examples: PROJ-12345, ABC-98765
    - The ticket code is usually the branch name. Verify the branch name to check if it fits the expected format.
    - A single PR can address multiple tickets. If that's the case, add them all in the start of the PR title.
- after the ticket code, a small sentence explaining the overall goal of the PR, usually from a business perspective, but might be technical, but always focusing on the impact
    - Examples: "Ensure account billing dates are kept the same on delinquency", "Allows customer to extend invoice payment days", "Improve database query performances with indexes".

## PR description

- MUST have <=600 words. Sweet spot between 200 and 400 words.
- MUST start with a "Context" section explaining the business context behind the change. It should have a sub-section with the tickets addressed in this PR. Each list item bust be the ticket code with a hyperlink to it in Jira.
    - Example ticket code and link: "[PROJ-12345](https://your-org.atlassian.net/browse/PROJ-12345)".
    - Use Jira MCP to get the tickets and have more business context on what the changes are about.
- MUST then have a "Technical details" section explaining the code changes and how it addresses the business context.
    - The section must be concise, explaining the changes in a high level, without going into details. Mermaid diagrams are welcome, specially dependency and sequence diagrams.
- might have an "Extras" section listing other changes, like refactors or removed codes.
- Include diagrams for:
    - state machine diagram for state machine changes
    - sequence diagrams OR flow chart diagrams for workflow and new workflows changes

# Troubleshooting

- If GitHub MCP fails, ensure docker engine has started. Then try again.