# RWD.Ai.Stack

**RWD.Ai.Stack** is an agent-agnostic starter kit repository. It provides reusable AI assets—standards, prompt templates, agent skills, memory patterns, and reference examples—that developers copy into software repositories so AI assistants (Google Antigravity, Claude, Cursor, Copilot, Gemini) deliver high-quality, maintainable code.

---

## Architecture Overview

RWD.Ai.Stack uses a **Dual-Layer Repository Structure**:

```text
RWD.Ai.Stack/
├── README.md                          # Framework documentation for THIS repository
├── AGENTS.md                          # Working rules for AI agents maintaining THIS repo
├── scripts/                           # Helper & validation scripts (init-project.sh, validate-templates.sh)
├── .agents/                           # Agent tools & memory for THIS framework repo
│   ├── memory/                        # Framework context & active session handoff
│   ├── standards/                     # 9 standards (6 core software + 3 IaC: Ansible, Terraform, Shared Config)
│   ├── templates/                     # 8 reusable prompt, commit, PR, and IaC templates
│   ├── skills/                        # 12 agent skills (8 core + 4 IaC)
│   └── examples/                      # Reference examples for few-shot learning
│
└── starter/                           # Starter Kit Bundle to COPY into new projects
    ├── README.md                      # Starter README template for NEW target projects
    ├── AGENTS.md                      # Starter AGENTS.md template for NEW target projects
    └── .agents/                       # Starter .agents/ folder for NEW target projects
        ├── memory/                    # Starter project context & handoff templates
        ├── standards/                 # Starter standards (core software + conditional IaC)
        ├── templates/                 # Starter template fragments
        ├── skills/                    # Starter skills (core software + conditional IaC)
        └── examples/                  # Starter code examples
```

---

## The 5-Folder `.agents/` System

Both this repository and projects bootstrapped with `starter/` use a standardized 5-folder `.agents/` structure:

1. **`memory/`**: Dual-file state system (`PROJECT_CONTEXT.md` for long-term facts, `AI_HANDOFF.md` for active session state).
2. **`standards/`**:
   - **Core Software Standards (6):** `memory-policy.md`, `coding-standards.md`, `documentation-standards.md`, `code-documentation-standards.md`, `workflow-standards.md`, `git-and-pr-standards.md`.
   - **Infrastructure-as-Code Standards (3, wired conditionally when IaC files exist):** `ansible-standards.md`, `terraform-standards.md`, `shared-config-standards.md`.
3. **`templates/`**: 8 reusable markdown fragments (`context-template.md`, `handoff-template.md`, `plan-template.md`, `commit-template.md`, `pull-request-template.md`, `ansible-role-readme-template.md`, `ansible-role-skeleton.md`, `terraform-module-readme-template.md`).
4. **`skills/`**: 12 executable agent skills triggerable via slash commands:
   - **Core Skills (8):** `/handoff`, `/project-ai-setup`, `/project-ai-refresh`, `/review`, `/refactor-code`, `/generate-docs`, `/commit-cleanup`, `/create-pr`.
   - **IaC Skills (4):** `/new-ansible-role`, `/new-terraform-module`, `/add-infra-host`, `/secrets-audit`.
5. **`examples/`**: Reference code patterns and implementations for agent few-shot learning.

---

## Quick Start: Using the Starter Kit in a New Project

1. **Initialize or Copy the `starter/` directory** into your target software project:
   ```bash
   ./scripts/init-project.sh /path/to/your-new-project "YourProjectName"
   ```
   *(Or manually copy `cp -r /path/to/RWD.Ai.Stack/starter/. /path/to/your-new-project/`)*
2. **Run `/project-ai-setup` in your AI Assistant:** The setup skill inspects your repository, configures `AGENTS.md` and `.agents/memory/PROJECT_CONTEXT.md`, and automatically wires the IaC standards and skills only when `iac/`, Terraform, or Ansible files are detected.
3. **Refresh Existing Projects with `/project-ai-refresh`:** When `RWD.Ai.Stack` standards or skills evolve, copy the updated `starter/.agents/` assets and run `/project-ai-refresh` in your target project.

---

## Framework Maintenance Policy

The root `README.md` and `AGENTS.md` are living documents. Whenever framework features, directory layouts, skills, or standards are updated in this repository, `README.md` and `AGENTS.md` must be updated in the same change set.
