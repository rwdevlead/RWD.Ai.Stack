# AI_HANDOFF.md — Active Session Handoff

## Current Objective
1. Synchronize and generalize the Ansible & Terraform IaC standards (`ansible-standards.md`, `terraform-standards.md`, `shared-config-standards.md`), templates (`ansible-role-readme-template.md`, `ansible-role-skeleton.md`, `terraform-module-readme-template.md`), and skills (`/new-ansible-role`, `/new-terraform-module`, `/add-infra-host`, `/secrets-audit`) across both layers of `RWD.Ai.Stack` (`.agents/` and `starter/.agents/`).
2. Codify the **Secret & Configuration Isolation Standard** (`0600` `diff: false` `.env` files + `${SECRET_KEY}` variable substitution in `docker-compose.yml`) across `RWD.Ai.Stack`.
3. Update `/project-ai-setup`, `/project-ai-refresh`, and root `README.md` to support conditional IaC discovery in the unified starter kit.
4. Allow and prefer the GitHub CLI (`gh`) where appropriate in `git-and-pr-standards.md`, `workflow-standards.md`, and `/create-pr` alongside standard `git` commands.

## Current Status
All implementation tasks and validation checks (`./scripts/validate-templates.sh`) are complete with 0 errors. Branch `feature/iac-assets-and-gh-cli` has been committed, pushed to `origin`, and the Pull Request package has been prepared for human review and merge on GitHub.

## Active Tasks
| Task | Status | Notes |
| :--- | :--- | :--- |
| Copy & Mirror Ansible/Terraform Standards, Templates, and Skills into `RWD.Ai.Stack` | Complete | Added 3 standards, 3 templates, and 4 skills to `.agents/` and `starter/.agents/`; updated `templates/README.md`, `skills/README.md`, and `scripts/validate-templates.sh` |
| Codify Secret & Configuration Isolation Standard (`.env` `0600` + `diff: false` vs `docker-compose.yml` `${SECRET_KEY}`) | Complete | Updated `ansible-standards.md`, `coding-standards.md`, `ansible-role-skeleton.md`, `new-ansible-role/SKILL.md`, `secrets-audit/SKILL.md`, and `review/SKILL.md` in both `.agents/` and `starter/.agents/` |
| Integrate GitHub CLI (`gh`) into Git & PR Standards and `/create-pr` | Complete | Updated `git-and-pr-standards.md`, `workflow-standards.md`, and `create-pr/SKILL.md` in both `.agents/` and `starter/.agents/` to prefer `gh pr create` / `gh pr edit` when `gh` is installed and authenticated, with comparison-URL fallback and mandatory human server-side merge |
| Generalize Hardcoded `RWD.Infrastructure` Details in Standards & Skills | Complete | Replaced hardcoded org/node/VM/app names (`realworlddevelopers`, `pve-d01`, `pve-p01`, `pihole_instances`, etc.) with generic placeholders and `(e.g., ...)` examples across `.agents/` and `starter/.agents/` |
| Add Smart IaC Discovery to `/project-ai-setup` and `/project-ai-refresh` | Complete | Updated `SKILL.md` and `checklist.md` for both skills (and `starter/` mirrors) to conditionally wire IaC standards and skills only when `iac/`, Terraform, or Ansible files are present |
| Update Root `README.md` | Complete | Synchronized directory tree and asset inventory with all 9 standards, 8 templates, and 12 skills |
| Validate, Branch, Commit & Open PR in `RWD.Ai.Stack` | Complete | Branch `feature/iac-assets-and-gh-cli` pushed to `origin` and PR package generated for server-side merge |

## Recent Progress
- Integrated `gh` CLI support into `git-and-pr-standards.md`, `workflow-standards.md`, and `create-pr/SKILL.md` across both `.agents/` and `starter/.agents/`.
- Generalized `ansible-standards.md`, `terraform-standards.md`, `shared-config-standards.md`, `new-ansible-role/SKILL.md`, `new-terraform-module/SKILL.md`, and `add-infra-host/SKILL.md` across both layers.
- Updated `project-ai-setup` and `project-ai-refresh` (`SKILL.md` and `checklist.md` in both layers) for conditional IaC discovery.
- Updated root `README.md` and verified 0 errors with `./scripts/validate-templates.sh`.

## Immediate Next Action
Run `/commit-cleanup` (create a feature branch off `main`, stage, commit, and push) and `/create-pr` to open the Pull Request.
