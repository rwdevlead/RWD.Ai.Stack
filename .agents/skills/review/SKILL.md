---
name: review
description: Run a multi-perspective technical audit and review (Skeptic, Architect, Pragmatist, Security, Maintainer, User) on code, architecture, plans, or PRs. Trigger with "/review".
argument-hint: "[code, design, plan, PR, or architecture target]"
---

# Purpose

Standard AI responses tend to be overly agreeable. The `/review` skill intentionally challenges proposals, code changes, and architectural designs through a multi-perspective technical review panel before significant development time or effort is invested.

The goal is to surface hidden risks, weak assumptions, security flaws, maintainability bottlenecks, and architectural debt early.

---

## Step 1 — Context & Target Gathering

1. **Inspect Repository Context**:
   - Read [`.agents/memory/PROJECT_CONTEXT.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/memory/PROJECT_CONTEXT.md) for architecture, tech stack, and canonical decisions.
   - Review relevant project standards in [`.agents/standards/`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/standards/).

2. **Identify Review Target**:
   - If an argument is provided (e.g. `/review path/to/file` or `/review plan-template.md`), inspect the target file or directory directly.
   - If un-argumented, review recent git status / diff or ask the user to specify what to review.

3. **Build the Brief**:
   - Summarize the target, intent, and primary constraints into a single concise Review Brief.

---

## Step 2 — Convene the Review Panel

Evaluate the Review Brief from six completely independent viewpoints. Each reviewer must evaluate the proposal against project standards and return an independent assessment.

### Panel Viewpoints

#### 1. The Skeptic
*Assumption: This project or design will fail in production.*
- Challenge core assumptions, unhandled edge cases, and hidden complexity.
- Identify potential failure modes, implicit technical debt, and weak assumptions.

#### 2. The Architect
*Focus: Long-term structure, elegance, and standards compliance.*
- Evaluate modularity, separation of concerns, scalability, and adherence to project standards in `.agents/standards/`.
- Recommend structural improvements, decoupling strategies, or pattern alignments.

#### 3. The Pragmatist
*Focus: Execution velocity and return on investment.*
- Evaluate implementation effort, complexity vs. reward, and potential over-engineering.
- Identify opportunities to simplify, scope-cut, or reach MVP faster.

#### 4. The Security & Reliability Specialist
*Focus: Operational safety and resilience.*
- Evaluate input validation, state bounds, error handling, failure isolation, and security risks.
- Verify that secrets and tokens are isolated in restricted `.env`/secret files (`0600`, diff-suppressed) rather than interpolated inline into main configuration or Compose files where diff suppression would hide non-secret changes.
- Identify highest-impact operational and security vulnerabilities.

#### 5. The Maintainer
*Focus: Long-term maintainability and developer experience.*
- Evaluate readability, naming, documentation sync, testability, and onboarding friction.
- Recommend changes to reduce cognitive load and future maintenance cost.

#### 6. The User / API Consumer
*Focus: Interface ergonomics and end-user outcomes.*
- Evaluate API design clarity, developer experience (DX), intuitive workflows, and usability.
- Identify frustrating, redundant, or awkward interface choices.

---

## Step 3 — Deliver Synthesized Verdict

Synthesize all six panel perspectives into a unified recommendation. Do not simply average opinions—resolve contradictions by prioritizing long-term project quality and stability.

Format output as follows:

```markdown
# Technical Review Verdict

## Recommendation: [ APPROVE | REVISE | REDESIGN ]
**Overall Confidence:** [ Low | Medium | High ]  
**Overall Risk Score:** [ 1-10 ]

---

### Executive Summary
Concise synthesis of the review outcome and core rationale.

---

### Panel Scores & Findings Matrix
| Role | Risk (1-10) | Key Focus |
| :--- | :---: | :--- |
| Skeptic | X/10 | Core concern or observation |
| Architect | X/10 | Core concern or observation |
| Pragmatist | X/10 | Core concern or observation |
| Security | X/10 | Core concern or observation |
| Maintainer | X/10 | Core concern or observation |
| User / DX | X/10 | Core concern or observation |

---

### Key Strengths
- 

### Key Weaknesses & Architectural Risks
- 

### Highest Risk Item
- Single issue most likely to cause failure or severe tech debt.

### Highest Leverage Improvement
- The single change that delivers the greatest quality bump for the effort.

---

### Actionable Next Steps
1. [ ] 
2. [ ] 
3. [ ] 
```
