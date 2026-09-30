---
name: commit-cleanup
description: Enforce branch protection, perform code cleanup sweep, verify tests, stage changes, commit with Conventional Commits, and push or keep local after user confirmation. Trigger with "/commit-cleanup" or "/commit".
argument-hint: "[optional commit message or scope]"
---

# Purpose

The `/commit-cleanup` skill enforces branch protection (prohibiting direct commits to `main`), performs a pre-commit sweep, verifies tests and memory, and safely stages and commits changes, offering the user the choice to push to remote or keep local.

---

## Step 1 — Branch Guard (Never Commit Directly to Main)

1. **Check Current Branch:**
   ```bash
   git branch --show-current
   ```
2. **Evaluate Branch Safety:**
   - If the current branch is `main` or `master`:
     - **Halt direct commit:** Direct commits to `main`/`master` are strictly prohibited.
     - **Inspect Changes:** Run `git status -s` and inspect uncommitted changes.
     - **Suggest Branch Name:** Formulate a descriptive branch name based on the change scope (e.g. `feature/<topic>`, `fix/<topic>`, `refactor/<topic>`, `docs/<topic>`).
     - **Prompt User:** Present the suggested branch name to the user and request confirmation to switch or an alternate branch name:
       > *"Direct commits to `main` are prohibited. Proposing new branch: `<suggested-branch>`. Confirm to switch or specify a different branch name."*
     - **Create and Switch:** Once approved:
       ```bash
       git checkout -b <branch-name>
       ```
   - If already on a feature or topic branch, proceed to Step 2.

---

## Step 2 — Code Hygiene Sweep

Inspect modified files (`git status` / `git diff`) and perform cleanup:
- **Remove Debug Logging:** Delete temporary `console.log`, `print()`, debugger breakpoints, or test print statements.
- **Remove Dead Code:** Delete commented-out code blocks, unused imports, and unused local variables.
- **Format & Lint:** Fix formatting inconsistencies and compiler/linter warnings.

---

## Step 3 — Memory & Verification

- **Verify Implementation:** Run test suites or build scripts to confirm clean compilation and zero test failures.
- **Update Memory State:** Run the `/handoff` skill to update `.agents/memory/AI_HANDOFF.md`.
- **Log Architectural Decisions:** Record new canonical decisions in `.agents/memory/PROJECT_CONTEXT.md` if milestones were achieved.

---

## Step 4 — Summary & Confirmation Gate (with Push Choice)

Before staging or committing any files, present a complete pre-commit action plan to the user:

1. **Current Working Branch:** Display active branch name (confirming not `main`).
2. **Files to be staged:** List all modified and untracked files to be added via `git add .`.
3. **Proposed Conventional Commit Message:** Draft subject line and body following `.agents/standards/git-and-pr-standards.md` and `.agents/templates/commit-template.md`.
   - **Markdown Formatting Rule:** Always format multiline bodies using bullet points starting with `- ` and blank lines between sections. Never collapse bullet lists into a single continuous sentence.
4. **Push Destination Choice:**
   - **Option 1 (Push to Remote):** Commit and immediately push to `origin/<current-branch>`.
   - **Option 2 (Leave Local):** Commit locally only without pushing to remote.

> **MANDATORY GATE:** Stop and ask the user for confirmation and push preference. Do NOT execute `git add`, `git commit`, or `git push` until the user explicitly confirms (e.g. "push", "local only", or "proceed with push").

---

## Step 5 — Staging, Commit, and Push Execution

Only after explicit user confirmation:
1. **Stage Changes:**
   ```bash
   git add .
   ```
2. **Commit:** Ensure bullet points and paragraphs are preserved without shell line-collapsing (use separate `-m` flags or a temporary file):
   ```bash
   git commit -m "<type>(<scope>): <concise subject>" -m "<summary sentence>" -m "- Bullet 1
   - Bullet 2"
   ```
3. **Push to Remote (If User Selected Remote Push):**
   ```bash
   git push -u origin <current-branch>
   ```
4. **Final Confirmation:** Report the commit hash, current branch status, and whether changes were pushed or left local.
