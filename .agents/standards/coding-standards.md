# Coding Standards — RWD.Ai.Stack

This document defines the mandatory code and content standards for maintainers and AI agents working on the **RWD.Ai.Stack** framework repository.

---

## 1. Agent-Agnostic Asset Principles

- **Tool Portability:** All standards, skills, templates, and documentation must remain strictly agent-agnostic. Avoid vendor-specific syntax or features tied exclusively to a single AI tool.
- **GitHub Flavored Markdown (GFM):** Use standard Markdown syntax, clear heading hierarchies (`#`, `##`, `###`), and GitHub-style callouts (`> [!NOTE]`, `> [!TIP]`, `> [!IMPORTANT]`) where emphasis is needed.
- **Clickable File Links:** Always format internal repository file paths as markdown links using the `file://` URI scheme (e.g. [`AGENTS.md`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/AGENTS.md)).

---

## 2. Skill & Template Authoring Rules

- **Valid YAML Frontmatter:** Every `SKILL.md` MUST include valid YAML frontmatter at the top:
  ```yaml
  ---
  name: skill-name
  description: Clear, concise trigger description.
  argument-hint: "[optional arguments]"
  ---
  ```
- **Template Placeholder Conventions:** Standardize variable substitutions using Mustache syntax:
  - `{{PROJECT_NAME}}`: Name of target repository or project.
  - `{{PROJECT_DESCRIPTION}}`: Concise summary of target project purpose.
  - `{{TECH_STACK}}`: Core programming languages, frameworks, and tooling.
  - `{{DATE}}` & `{{AUTHOR}}`: Metadata placeholders for templates.

---

## 3. Token Efficiency & Instruction Density

- **Concise & Direct:** Keep instructions bulleted, scannable, and actionable.
- **High Signal-to-Noise Ratio:** Eliminate conversational filler, redundant introductions, and repetitive disclaimers.
- **Self-Contained Guidance:** Ensure standards and skills contain enough context for AI agents to execute tasks without multi-turn clarification.

---

## 4. Dual-Layer Synchronization Standard

- **Mandatory Mirroring:** Whenever a core standard, template fragment, or skill logic is modified in `.agents/`, update the corresponding asset in `starter/.agents/` in the same commit.
- **Placeholder Substitution:** Ensure framework-specific paths (e.g., [`/Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/`](file:///Users/ka8kgj/Documents/Source/RWD.Ai.Stack/.agents/)) are converted to project-relative paths (e.g., `.agents/`) in `starter/`.

---

## 5. Verification, Secret Isolation & Quality Assurance

- **Syntax Verification:** Validate frontmatter, link paths, and markdown rendering before finishing work.
- **Secret & Configuration Isolation:** Never embed plaintext secrets or tokens directly into general configuration or orchestration files (such as `docker-compose.yml`) where diff suppression (`diff: false`) would hide non-secret configuration diffs. Isolate secrets into dedicated, restricted `.env`/secret files (`0600`, `diff: false`) and reference `${SECRET_KEY}` in the main config file so diffs remain visible without exposing credentials.
- **Clean Repo Policy:** Never leave scratch scripts or un-tracked temporary files outside of scratch directories.
