# AI_HANDOFF.md — Active Session Handoff

## Current Objective
Implement branch protection guards (prohibit direct commits to `main`), local vs remote push preferences, and PR/MR server-side completion protocols across commit and pull request skills/standards.

## Current Status
Created feature branch `feature/branch-guard-and-pr-workflows`. Updated `/commit-cleanup` to inspect branch safety, suggest new branch names if on `main`, and offer push vs. local-only commit choices. Updated `/create-pr` to support PRs and MRs, handle pure git push, generate direct server links, and require server-side completion. Updated `git-and-pr-standards.md` and `workflow-standards.md`. Dual-layer sync to `starter/.agents/` complete and validated.

## Active Tasks
| Task | Status | Notes |
| :--- | :--- | :--- |
| Branch Protection in `/commit-cleanup` | Complete | Blocks commits on `main`, suggests and checks out branch |
| Push vs. Local Choice in `/commit-cleanup` | Complete | Prompt user to choose remote push vs. local-only commit |
| Pure Git & PR/MR Server Completion in `/create-pr` | Complete | Pushes via git, provides direct URLs, strictly delegates merge to server |
| Update Git and Workflow Standards | Complete | Documented branch protection, push choice, and server completion |
| Dual-Layer Mirroring & Validation | Complete | Mirrored into `starter/` and passed `scripts/validate-templates.sh` |

## Recent Progress
- Switched to `feature/branch-guard-and-pr-workflows`.
- Updated `.agents/skills/commit-cleanup/SKILL.md` and `starter/.agents/skills/commit-cleanup/SKILL.md` with branch safety checks and push preference options.
- Updated `.agents/skills/create-pr/SKILL.md` and `starter/.agents/skills/create-pr/SKILL.md` to support PR/MR workflows with pure git commands and server completion gates.
- Updated `.agents/standards/git-and-pr-standards.md` and `workflow-standards.md` in both root and starter kit.
- Verified all templates with `scripts/validate-templates.sh` (0 errors).

## Immediate Next Action
Review changes with user and trigger `/commit-cleanup` when ready.
