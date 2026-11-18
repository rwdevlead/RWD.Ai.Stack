# .agents/skills/

This directory contains executable agent skills and slash commands used by AI assistants operating on this repository.

## Available Skills

- [`/handoff`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/handoff/SKILL.md): Synthesizes progress and updates `.agents/memory/AI_HANDOFF.md` at session end.
- [`/project-ai-setup`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/project-ai-setup/SKILL.md): Initializes target repositories with project-owned AI instructions, context, and memory.
- [`/project-ai-refresh`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/project-ai-refresh/SKILL.md): Refreshes target repositories after shared standards or templates change.
- [`/review`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/review/SKILL.md): Runs a 6-viewpoint technical audit panel on code, architecture, or plans.
- [`/refactor-code`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/refactor-code/SKILL.md): Performs controlled code refactoring without altering public behavior or contracts.
- [`/generate-docs`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/generate-docs/SKILL.md): Synchronizes READMEs, docstrings, and API documentation with code implementation.
- [`/commit-cleanup`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/commit-cleanup/SKILL.md): Performs pre-commit hygiene sweep and generates a commit readiness report.
- [`/create-pr`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/create-pr/SKILL.md): Prepares, validates, and creates a GitHub pull request with a compliant description.
- [`/new-ansible-role`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/new-ansible-role/SKILL.md): Scaffolds a new Ansible role, playbook, `Makefile` target pair, and README.
- [`/new-terraform-module`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/new-terraform-module/SKILL.md): Scaffolds a new reusable Terraform module under `iac/terraform/modules/`.
- [`/add-infra-host`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/add-infra-host/SKILL.md): Adds a new VM/host consistently across `iac/shared/infrastructure.yml`, Terraform, and Ansible.
- [`/secrets-audit`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/skills/secrets-audit/SKILL.md): Scans the repository for hardcoded secrets, PII, unsafe logging, or unisolated Compose secrets.
