# Workflow Standards — RWD.Ai.Stack

This document establishes the mandatory workflow standards for AI agents and maintainers working directly on the **RWD.Ai.Stack** framework repository.

---

## 1. Dual-Layer Synchronization Rule

RWD.Ai.Stack maintains a **Dual-Layer Architecture**:
- **Framework Root (`.agents/`)**: Standards, templates, skills, and memory used to maintain this framework.
- **Starter Kit Bundle (`starter/.agents/`)**: Clean, template-driven assets copied into user target projects.

> **Mandatory Rule:** Any change made to a generic standard, template, or skill in `.agents/` MUST be mirrored into `starter/.agents/` with appropriate project placeholders (e.g., `{{PROJECT_NAME}}`).

---

## 2. Framework Session Lifecycle

Every AI session operating on this repository MUST follow this 5-step lifecycle:

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  1. Orient  │ ──> │  2. Plan    │ ──> │ 3. Execute  │ ──> │ 4. Verify   │ ──> │ 5. Hand Off │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
```

### Step 1: Orient
- Read root [`AGENTS.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/AGENTS.md).
- Read [`.agents/memory/PROJECT_CONTEXT.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/memory/PROJECT_CONTEXT.md) for long-term project architecture and design decisions.
- Read [`.agents/memory/AI_HANDOFF.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/memory/AI_HANDOFF.md) to understand recent work and active tasks.

### Step 2: Plan
- For non-trivial structural changes, outline the proposed files, schema, or workflow before writing code.
- Use [`.agents/templates/plan-template.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/templates/plan-template.md) when presenting multi-step proposals to the user.
- If requirements are underspecified, clarify intent before making broad edits.
- **Questions vs. Directives:** Answer questions directly and propose action plans. Do not execute file edits on questions alone.

### Step 3: Execute
- Make direct, token-efficient, atomic edits.
- Maintain agent-agnostic formatting (standard GitHub Flavored Markdown, valid YAML frontmatter for skills).
- Never modify `legacy-repo/` unless explicitly instructed.
- **Strict Scope Control:** Do not refactor code outside the defined scope of the instruction without explicit permission.

### Step 4: Verify
- Validate markdown syntax, skill YAML frontmatter headers, and path references.
- Verify template variables (e.g. `{{PROJECT_NAME}}`, `{{TECH_STACK}}`) are intact in `starter/`.
- Ensure dual-layer sync is complete between framework root and `starter/`.
- **Comment-Only Verification Exemption:** Running builds and unit tests is unnecessary if changes are strictly limited to writing code comments or documentation.

### Step 5: Hand Off
- Execute the `/handoff` skill to update [`.agents/memory/AI_HANDOFF.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/memory/AI_HANDOFF.md).
- Record key architectural decisions or milestones in [`.agents/memory/PROJECT_CONTEXT.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/memory/PROJECT_CONTEXT.md).

---

## 3. Git & Pull Request / Merge Request Lifecycle

Before committing work or opening a PR/MR:
- **Branch Protection:** Never commit directly to `main` or `master`. Always perform work on a dedicated topic branch (`feature/`, `fix/`, etc.). If on `main`, create a branch first.
- **Git & PR/MR Standards:** Follow [`.agents/standards/git-and-pr-standards.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/standards/git-and-pr-standards.md) for branch naming, commit format, and quality gates.
- **Pre-Commit Sweep:** Run `/commit-cleanup` to inspect branch guards, code hygiene, verify tests, formulate Conventional Commits, and select push preference (push immediately vs. leave local).
- **Create Pull/Merge Requests:** Run `/create-pr` to review branch diffs, validate quality gates, push the branch, and package a structured PR/MR description and direct comparison link. The agent halts execution for the developer to review and complete the merge on the server.

---

## 4. Workspace & File Hygiene

- **No Stray Files:** Place scratch scripts or temporary files in the designated scratch directory.
- **Clean Workspace:** Keep root directory clutter-free. Only canonical top-level files (`AGENTS.md`, `README.md`) belong in the root.
- **Legacy Isolation:** `legacy-repo/` is strictly read-only reference material. Never edit, move, or delete files inside `legacy-repo/`.
