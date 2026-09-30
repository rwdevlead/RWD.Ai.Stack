---
name: create-pr
description: Prepare and validate a Pull Request (PR) or Merge Request (MR) using git commands, pushing the branch and providing server completion links. Trigger with "/create-pr" or "/pr".
argument-hint: "[optional base branch, defaults to main]"
---

# Purpose

The `/create-pr` skill prepares a Pull Request (GitHub) or Merge Request (GitLab / Bitbucket / Azure DevOps) using standard git commands. It inspects git state, checks diffs against the base branch, validates pre-PR hygiene and tests, pushes the feature branch to remote after confirmation, and packages a structured PR/MR description with a direct server link.

The skill strictly delegates completion and merging to the human developer on the remote server UI.

---

## Step 1 — Inspect Git State & Diff

1. **Verify Branch:**
   - Confirm current working branch is not the base branch (`main` or specified argument). If on `main`, stop: PRs/MRs must originate from a dedicated feature or topic branch.
   - Check `git status` for uncommitted changes. If unstaged changes exist, advise running `/commit-cleanup` before proceeding.
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
- **Branch Up to Date:** Check if branch is rebased or updated against latest base branch.

---

## Step 3 — Draft Pull / Merge Request Content

Using [`.agents/templates/pull-request-template.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/templates/pull-request-template.md):
- **PR / MR Title:** Formulate a Conventional Commit title matching the primary change (e.g., `feat(skills): add create-pr skill`).
- **Summary:** Write 1-3 direct sentences summarizing what this change introduces and why.
- **Related Issues:** Note issue numbers if applicable.
- **Changes Made:** List concise bullet points of primary changes.
- **Verification & Testing:** Include test commands executed and verification results.
- **Checklist:** Check off completed items.

---

## Step 4 — Summary & Push Confirmation Gate

Before running any push commands, present the full plan to the user:

1. **Source & Target Branches:** e.g., `feature/<name>` -> `main`.
2. **Remote Push Status:** Check `git branch -vv` to verify if `git push -u origin <current-branch>` will be run.
3. **Proposed Title:** Display the formatted Conventional Commit title.
4. **Proposed Description:** Display the complete drafted Markdown body.
5. **Direct Server Link:** Construct direct comparison link derived from `git config --get remote.origin.url`:
   - GitHub: Pre-populate title and body via URL query parameters so GitHub loads the formatted Markdown directly:
     `https://github.com/<owner>/<repo>/compare/<base>...<branch>?expand=1&title=<url_encoded_title>&body=<url_encoded_body>`
     *(Note: Repositories with `.github/pull_request_template.md` also auto-render the template when opened without query parameters).*
   - GitLab: `https://gitlab.com/<owner>/<repo>/-/merge_requests/new?merge_request%5Bsource_branch%5D=<branch>`

> **MANDATORY GATE:** Stop and ask the user for confirmation. Do NOT execute `git push` until the user explicitly confirms (e.g. "yes" or "proceed").

---

## Step 5 — Git Push & Server Completion Package

Only after user confirmation:
1. **Push Branch via Git:** If upstream is unlinked or branch has unpushed commits:
   ```bash
   git push -u origin <current-branch>
   ```
2. **Present Final Package & Server Link:**
   - Display the pre-filled direct web link with encoded title and markdown body.
   - Display the finalized PR/MR title and markdown description block for easy reference or copying into the server UI.
3. **Require Server-Side Completion:**
   - Explicitly instruct the user to complete the review and merge on the server:
     > *"Branch pushed and PR/MR package ready. Please open the link above to review diffs and complete the merge on the server."*
   - The AI agent must **never** auto-merge the branch locally or attempt automated server-side merging.
4. **Memory Update:** Update `AI_HANDOFF.md` recording that the PR/MR was prepared and branch pushed.
5. **Output Placement Rule:** Always output the direct link to the commit and PR/MR as the very last lines of the output response so they are immediately visible without scrolling.

