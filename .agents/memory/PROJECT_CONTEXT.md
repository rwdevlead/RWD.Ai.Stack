# PROJECT_CONTEXT.md — Long-Term Project Context

## 1. Project Overview
- **Project Name:** RWD.Ai.Stack
- **Purpose:** Agent-agnostic starter kit repository containing reusable AI assets (standards, templates, skills, memory patterns, examples) for software projects.
- **Primary Goals:** High signal-to-noise ratio, agent portability (Antigravity, Claude, Cursor, Copilot), zero duplication, and token efficiency.

## 2. Technical Stack & Dependencies
- **Core Specification:** Markdown (Github Flavored Markdown)
- **Scripting / Automation:** Bash (`scripts/init-project.sh` & `scripts/validate-templates.sh`)
- **VCS & Governance:** Git, CODEOWNERS

## 3. Architecture & Core Patterns
- **Architecture Pattern:** Dual-Layer Repository Pattern (Framework Root vs Starter Kit Bundle)
- **Directory Layout:**
  - `AGENTS.md`, `README.md`, `.agents/`, `scripts/` (Framework Maintainer files for THIS repo)
  - `starter/` (Clean bundle copied to target software projects: `starter/AGENTS.md`, `starter/README.md`, `starter/.agents/`)
  - `legacy-repo/` (Read-only directory containing legacy session reference material)
- **Canonical Design Decisions:**
  - 5-folder structure inside `.agents/` (`memory/`, `standards/`, `templates/`, `skills/`, `examples/`).
  - Strict separation between `standards/` (rules/guidelines) and `templates/` (fragment boilerplate).
  - Streamlined 5-section `AI_HANDOFF.md` and 6-section `PROJECT_CONTEXT.md`.
  - Complete 12-skill suite (`/handoff`, `/project-ai-setup`, `/project-ai-refresh`, `/review`, `/refactor-code`, `/generate-docs`, `/commit-cleanup`, `/create-pr`, `/new-ansible-role`, `/new-terraform-module`, `/add-infra-host`, `/secrets-audit`).
  - Conditional IaC Discovery: All 9 standards, 8 templates, and 12 skills ship in the unified `starter/.agents/` bundle, and `/project-ai-setup` and `/project-ai-refresh` conditionally wire the 3 IaC standards and 4 IaC skills only when `iac/`, Terraform, or Ansible files exist in the target repository.
  - Secret & Configuration Isolation Standard: Secrets in orchestration/Compose roles must be rendered into dedicated `0600` `.env` files with `diff: false` and referenced via `${SECRET_KEY}` in `docker-compose.yml` (`0644`, `diff` enabled) so `--check --diff` previews show full configuration diffs without leaking secrets.
  - Git, API, & GitHub CLI (`gh`) Integration: Use standard `git` commands and API calls for core version control, while preferring `gh` (`gh pr create`, `gh pr edit`, `gh pr view`) when installed and authenticated for GitHub Pull Request operations (with comparison-URL fallback when `gh` is unavailable). Always verify CLI authentication status first (e.g., `gh auth status`, `terraform login` credentials) before invoking authenticated CLI methods, stopping to let the user log in if unauthenticated. Agents never auto-merge (`gh pr merge` is prohibited); human server-side review and completion remain mandatory.

## 4. Domain & Data Concepts
- **Framework Assets:** Standards, Policies, Templates, Skills, Memory Files, Examples.
- **Agent Portability:** All assets must avoid vendor-locking to a single AI tool.

## 5. Constraints & Non-Goals
- **Hard Constraints:** Do not modify `legacy-repo/` unless explicitly instructed.
- **Explicit Non-Goals:** Avoid building heavy complex CLI tools when simple markdown templates and shell scripts achieve the same result.

## 6. Architecture & Milestone Log
- `2026-07-27`: Reset repository structure. Created root `AGENTS.md`, `README.md`, `.agents/`, and `starter/` bundle. Established the 5-folder `.agents/` architecture (`memory/`, `standards/`, `templates/`, `skills/`, `examples/`). Built `/handoff` skill, `memory-policy.md`, and refactored `context-template.md`.
- `2026-08-09`: Built comprehensive `workflow-standards.md`, `coding-standards.md`, `plan-template.md`, multi-perspective `/review` skill, 7-skill suite (`/refactor-code`, `/generate-docs`, `/commit-cleanup`), framework helper scripts (`scripts/init-project.sh` & `scripts/validate-templates.sh`), and reference examples across framework root and `starter/`.
- `2026-08-11`: Incorporated 4 core working principles (Plain-Language Comments, Questions vs. Directives, Verification Exemption for Comment Edits, Strict Scope Control) across `AGENTS.md`, `code-documentation-standards.md`, and `workflow-standards.md` in both framework root and `starter/`. Executed `scripts/validate-templates.sh` with 0 errors.
- `2026-11-17`: Added IaC standards (`ansible-standards.md`, `terraform-standards.md`, `shared-config-standards.md`), templates (`ansible-role-readme-template.md`, `ansible-role-skeleton.md`, `terraform-module-readme-template.md`), and skills (`/new-ansible-role`, `/new-terraform-module`, `/add-infra-host`, `/secrets-audit`) to both `.agents/` and `starter/.agents/` (and registered them in `scripts/validate-templates.sh`), and codified the **Secret & Configuration Isolation** standard across `ansible-standards.md`, `coding-standards.md`, `ansible-role-skeleton.md`, `new-ansible-role`, `secrets-audit`, and `review`. Rationale: embedding plaintext secrets directly into main configuration or orchestration files (such as `docker-compose.yml`) forces a trade-off between leaking credentials in dry-run diffs (`--check --diff`) or hiding the entire configuration file's diff (`diff: false`). Isolating secrets into restricted `.env`/secret files (`0600`, `diff: false`) and referencing `${SECRET_KEY}` in the main config preserves full line-by-line diff visibility for non-secret configuration changes while keeping credentials hidden in logs and restricted on disk.
- `2026-11-18`: Generalized IaC standards and skills to remove hardcoded homelab host/org/app names while preserving RWD stack conventions; added smart conditional IaC discovery to `/project-ai-setup` and `/project-ai-refresh`; updated `git-and-pr-standards.md`, `workflow-standards.md`, and `/create-pr` to support `gh` CLI for GitHub PR operations alongside standard `git` commands and fallback comparison URLs; and synchronized root `README.md`.

