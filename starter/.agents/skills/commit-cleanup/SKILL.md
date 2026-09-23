---
name: commit-cleanup
description: Perform code cleanup sweep, verify tests, stage changes, commit with Conventional Commits, and push to remote after user confirmation. Trigger with "/commit-cleanup" or "/commit".
argument-hint: "[optional commit message or scope]"
---

# Purpose

The `/commit-cleanup` skill performs a pre-commit sweep, verifies tests and memory, and safely stages, commits, and pushes changes to git after explicit user confirmation.

---

## Step 1 — Code Hygiene Sweep

Inspect modified files (`git status` / `git diff`) and perform cleanup:
- **Remove Debug Logging:** Delete temporary `console.log`, `print()`, debugger breakpoints, or test print statements.
- **Remove Dead Code:** Delete commented-out code blocks, unused imports, and unused local variables.
- **Format & Lint:** Fix formatting inconsistencies and compiler/linter warnings.

---

## Step 2 — Memory & Verification

- **Verify Implementation:** Run test suites or build scripts to confirm clean compilation and zero test failures.
- **Update Memory State:** Run the `/handoff` skill to update `.agents/memory/AI_HANDOFF.md`.
- **Log Architectural Decisions:** Record new canonical decisions in `.agents/memory/PROJECT_CONTEXT.md` if milestones were achieved.

---

## Step 3 — Summary & User Confirmation Gate

Before staging or committing any files, present a complete pre-commit action plan to the user:

1. **Files to be staged:** List all modified and untracked files to be added via `git add .`.
2. **Proposed Conventional Commit Message:** Draft subject line and body following `.agents/standards/git-and-pr-standards.md` and `.agents/templates/commit-template.md`.
3. **Remote Push Target:** Identify the target remote branch for `git push`.

> **MANDATORY GATE:** Stop and ask the user for confirmation. Do NOT execute `git add`, `git commit`, or `git push` until the user explicitly confirms (e.g. "yes" or "proceed").

---

## Step 4 — Staging, Commit, and Push Execution

Only after explicit user confirmation:
1. **Stage Changes:**
   ```bash
   git add .
   ```
2. **Commit:**
   ```bash
   git commit -m "<type>(<scope>): <concise subject>" -m "<optional body>"
   ```
3. **Push to Remote:**
   ```bash
   git push -u origin <current-branch>
   ```
4. **Final Confirmation:** Report the commit hash, remote branch status, and clean working tree.
