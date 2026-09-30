# AI_HANDOFF.md — Active Session Handoff

## Current Objective
Implement branch protection guards, commit push choice, GFM markdown list formatting in commits, PR/MR platform templates (`.github/pull_request_template.md`), pre-filled comparison URLs, and standard output placement rules for links.

## Current Status
Enforced output placement standard: direct clickable links to commits and PRs must always be the very last lines of the output. Mirrored across framework root and starter kit. Validated all template assets (0 errors).

## Active Tasks
| Task | Status | Notes |
| :--- | :--- | :--- |
| Branch Protection in `/commit-cleanup` | Complete | Blocks commits on `main`, suggests and checks out branch |
| Push vs. Local Choice in `/commit-cleanup` | Complete | Prompt user to choose remote push vs. local-only commit |
| Markdown List Formatting in `/commit-cleanup` | Complete | Preserves blank lines and `- ` bullets in commit bodies |
| Native `.github/pull_request_template.md` | Complete | Added to root and `starter/`, verified in linter |
| URL-Encoded Pre-Filled Links in `/create-pr` | Complete | Generates `?expand=1&title=...&body=...` comparison links |
| Output Link Placement Standard | Complete | Commit and PR links must appear as very last lines of output |
| Dual-Layer Mirroring & Validation | Complete | Mirrored into `starter/` and passed `scripts/validate-templates.sh` |

## Recent Progress
- Updated `/commit-cleanup`, `/create-pr`, and `git-and-pr-standards.md` in `.agents/` and `starter/.agents/` to place commit and PR links at the very last lines of agent responses.
- Verified dual-layer sync with `scripts/validate-templates.sh` (0 errors).

## Immediate Next Action
Stage and push changes using `/commit-cleanup` and output the commit and PR links as the last lines.
