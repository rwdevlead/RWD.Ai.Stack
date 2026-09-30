# AI_HANDOFF.md — Active Session Handoff

## Current Objective
Implement branch protection guards, commit push choice, GFM markdown list formatting in commits, PR/MR platform templates, human-readable action cards, and strictly scoped link placement rules.

## Current Status
Refined `/commit-cleanup` and `/create-pr` to use human-readable summary cards (with file status indicators, clean commit previews, and compact action prompts). Updated `git-and-pr-standards.md` to strictly scope the final link output rule exclusively to commit/PR execution events. Mirrored all changes into `starter/.agents/` and verified with `scripts/validate-templates.sh` (0 errors).

## Active Tasks
| Task | Status | Notes |
| :--- | :--- | :--- |
| Branch Protection in `/commit-cleanup` | Complete | Blocks commits on `main`, suggests and checks out branch |
| Push vs. Local Choice in `/commit-cleanup` | Complete | Prompt user to choose remote push vs. local-only commit |
| Markdown List Formatting in `/commit-cleanup` | Complete | Preserves blank lines and `- ` bullets in commit bodies |
| Native `.github/pull_request_template.md` | Complete | Added to root and `starter/`, verified in linter |
| Human-Readable Action Cards in Skills | Complete | Clean layout for pre-commit and PR review summaries |
| Strictly Scoped Link Placement Rule | Complete | Output links ONLY at the end of commit/PR executions |
| Dual-Layer Mirroring & Validation | Complete | Mirrored into `starter/` and passed `scripts/validate-templates.sh` |

## Recent Progress
- Refined `/commit-cleanup` and `/create-pr` in root and starter kit to use human-readable summary layouts and clean markdown anchor links.
- Updated `git-and-pr-standards.md` to clarify that links must only be output upon execution completion, never during planning or conversation.
- Validated all templates and dual-layer mirrors (0 errors).

## Immediate Next Action
Run `/commit-cleanup` to stage, commit, and push changes on `feature/branch-guard-and-pr-workflows`.
