---
name: create-pr
description: Prepare and validate a GitHub Pull Request description using git commands. Trigger with "/create-pr".
argument-hint: "[optional base branch, defaults to main]"
---

# Purpose

The `/create-pr` skill prepares a pull request using standard git commands. It inspects git state, checks diffs against the base branch, validates pre-PR hygiene and tests, pushes the feature branch to remote if needed, and packages a structured PR description ready for the GitHub web UI after user confirmation.

---

## Step 1 — Inspect Git State & Diff

1. **Verify Branch:**
   - Confirm current working branch is not the base branch (`main` or specified argument).
   - Check `git status` for uncommitted changes. If unstaged changes exist, advise the user or run `/commit-cleanup` before proceeding.
2. **Inspect Commit History & Diff:**
   - Identify base branch (defaults to `main` or `origin/main`).
   - Run `git log <base>..HEAD --oneline` to review all branch commits.
   - Run `git diff --stat <base>..HEAD` to review modified files and impact scope.

---

## Step 2 — Pre-PR Quality Gates

Check compliance with [`.agents/standards/git-and-pr-standards.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/standards/git-and-pr-standards.md):
- **Tests & Linter:** Verify tests pass and code lints with zero errors.
- **Hygiene:** Confirm temporary debug code and commented-out code were removed.
- **Memory & Docs:** Ensure [`.agents/memory/AI_HANDOFF.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/memory/AI_HANDOFF.md) is updated and documentation reflects code changes.
- **Branch Up to Date:** Check if branch is rebased on latest base branch.

---

## Step 3 — Draft Pull Request Content

Using [`.agents/templates/pull-request-template.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/templates/pull-request-template.md):
- **PR Title:** Formulate a Conventional Commit title matching the primary change (e.g., `feat(skills): add create-pr skill`).
- **Summary:** Write 1-3 direct sentences summarizing what this PR changes and why.
- **Related Issues:** Note issue numbers if applicable.
- **Changes Made:** List concise bullet points of primary changes.
- **Verification & Testing:** Include test commands executed and verification results.
- **Checklist:** Check off completed items.

---

## Step 4 — Summary & User Confirmation Gate

Before running any push commands or finalizing the PR, present the full plan to the user:

1. **Source & Target Branches:** e.g., `feature/<name>` -> `main`.
2. **Remote Push Status:** Check `git branch -vv` to verify if `git push -u origin <current-branch>` will be run.
3. **Proposed PR Title:** Display the formatted Conventional Commit title.
4. **Proposed PR Description:** Display the complete drafted Markdown body.
5. **Direct GitHub Comparison Link:** Display comparison link derived from `git config --get remote.origin.url`.

> **MANDATORY GATE:** Stop and ask the user for confirmation. Do NOT execute `git push` until the user explicitly confirms (e.g. "yes" or "proceed").

---

## Step 5 — Git Push & PR Presentation

Only after user confirmation:
1. **Push Branch via Git:** If upstream is unlinked or branch has unpushed commits:
   ```bash
   git push -u origin <current-branch>
   ```
2. **Present Final Package:**
   - Display the direct comparison link to open the pre-filled PR on GitHub.
   - Display the finalized PR title and description ready to paste into GitHub.
3. **Memory Update:** Update `AI_HANDOFF.md` recording that the PR was prepared and branch pushed.
