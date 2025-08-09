# CRITICAL REQUIREMENTS - VIOLATION IS UNACCEPTABLE

## Git Commits & Pull Requests
- **ABSOLUTE RULE**: Write commit messages in one line only - NO EXCEPTIONS
- **ABSOLUTE RULE**: NEVER include Claude credits, AI attribution, or "Generated with Claude" text in commits OR PRs - THIS IS FORBIDDEN
- **ABSOLUTE RULE**: Use conventional commit format: `type: description` - REQUIRED FORMAT
- **ABSOLUTE RULE**: Always check and follow project-specific CLAUDE.md instructions - MANDATORY
- **ABSOLUTE RULE**: PR descriptions should be clean and professional without AI attribution - MANDATORY

## Package Management
- **MANDATORY**: Use `ni` (@antfu/ni) for automatic package manager detection
- **ni commands**: `ni` (install), `nr dev` (run scripts), `nu` (update), `nx <cmd>` (execute)
- Auto-detects based on lock files: package-lock.json (npm), yarn.lock (yarn), pnpm-lock.yaml (pnpm), bun.lockb (bun)
- Fallback: Check for lock files manually when ni isn't available

## File Paths
- Config files are stored in ~/.dotfiles/.config/ (user's custom dotfiles directory)

## Permissions
- **AUTO-ALLOW**: Read-only commands (ls, find, cat, grep, head, tail, pwd, which, type, etc.)
- **AUTO-ALLOW**: File system exploration that doesn't modify anything
- **REQUIRE PERMISSION**: Any write/modify operations (git, npm, file edits, installs)

## Code Quality
- **MANDATORY**: Always read and follow project-specific CLAUDE.md instructions
- **MANDATORY**: Use MultiEdit tool for bulk changes when appropriate
- **MANDATORY**: Respect existing code patterns and conventions