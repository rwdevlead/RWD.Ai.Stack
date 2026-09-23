#!/usr/bin/env bash
set -euo pipefail

# RWD.Ai.Stack Framework Asset & Dual-Layer Linter
# Validates dual-layer synchronization, SKILL.md frontmatter, and template placeholders.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FRAMEWORK_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "🔍 Validating RWD.Ai.Stack framework assets and dual-layer sync..."
ERRORS=0

cd "$FRAMEWORK_ROOT"

# Check 1: Dual-Layer Mirroring (.agents/ vs starter/.agents/)
echo "  [1/3] Checking Dual-Layer Mirroring..."

check_file_mirror() {
  local rel_path="$1"
  if [ ! -f "$FRAMEWORK_ROOT/.agents/$rel_path" ]; then
    echo "  ❌ Framework root missing: .agents/$rel_path"
    ERRORS=$((ERRORS + 1))
  fi
  if [ ! -f "$FRAMEWORK_ROOT/starter/.agents/$rel_path" ]; then
    echo "  ❌ Starter bundle missing: starter/.agents/$rel_path"
    ERRORS=$((ERRORS + 1))
  else
    echo "  ✓ Mirrored: $rel_path"
  fi
}

check_file_mirror "standards/code-documentation-standards.md"
check_file_mirror "standards/coding-standards.md"
check_file_mirror "standards/documentation-standards.md"
check_file_mirror "standards/git-and-pr-standards.md"
check_file_mirror "standards/memory-policy.md"
check_file_mirror "standards/workflow-standards.md"

check_file_mirror "templates/commit-template.md"
check_file_mirror "templates/context-template.md"
check_file_mirror "templates/handoff-template.md"
check_file_mirror "templates/plan-template.md"
check_file_mirror "templates/pull-request-template.md"

check_file_mirror "skills/commit-cleanup/SKILL.md"
check_file_mirror "skills/create-pr/SKILL.md"
check_file_mirror "skills/generate-docs/SKILL.md"
check_file_mirror "skills/handoff/SKILL.md"
check_file_mirror "skills/project-ai-refresh/SKILL.md"
check_file_mirror "skills/project-ai-setup/SKILL.md"
check_file_mirror "skills/refactor-code/SKILL.md"
check_file_mirror "skills/review/SKILL.md"

# Check 2: SKILL.md YAML Frontmatter Linter
echo "  [2/3] Validating SKILL.md YAML Frontmatter..."

find .agents starter/.agents -name "SKILL.md" | while read -r skill_file; do
  if ! grep -q "^name:" "$skill_file"; then
    echo "  ❌ Frontmatter error in $skill_file: missing 'name:' field"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -q "^description:" "$skill_file"; then
    echo "  ❌ Frontmatter error in $skill_file: missing 'description:' field"
    ERRORS=$((ERRORS + 1))
  fi
done

# Check 3: Mustache Placeholder Syntax
echo "  [3/3] Checking Starter Kit Template Placeholders..."

grep -rn "{{[A-Z_]*}}" starter/ | while read -r match; do
  file=$(echo "$match" | cut -d: -f1)
  line=$(echo "$match" | cut -d: -f2)
  echo "  ✓ Placeholder found in $file:$line"
done

echo ""
if [ "$ERRORS" -gt 0 ]; then
  echo "❌ Validation failed with $ERRORS error(s)."
  exit 1
else
  echo "✅ All framework assets and dual-layer sync validated successfully!"
fi
