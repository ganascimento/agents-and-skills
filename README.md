<div align="center">

# agents-and-skills

A curated collection of custom Claude Code agents and skills, installable globally in one command.

![Shell](https://img.shields.io/badge/Shell-4EAA25?style=flat&logo=gnubash&logoColor=white)
![Claude Code](https://img.shields.io/badge/Claude_Code-D97757?style=flat&logo=anthropic&logoColor=white)

</div>

---

## ✨ Features

- 🤖 **Reusable agents** — specialized subagents with focused roles (code reviewer, refactor specialist)
- 🛠 **Slash-command skills** — invoke complex workflows with `/skill-name` in any project
- 🔗 **Symlink-based install** — changes in this repo are reflected everywhere instantly
- 📦 **Zero dependencies** — pure shell, works anywhere Claude Code runs

## 🚀 Getting Started

### Prerequisites

- [Claude Code](https://claude.ai/code) installed
- Bash

### Installation

```bash
git clone <repo-url>
cd agents-and-skills
./install.sh
```

The script symlinks each agent and skill into `~/.claude/agents/` and `~/.claude/skills/`. After installing, restart Claude Code or run `/reload-plugins`.

## 🤖 Agents

Agents are specialized subprocesses Claude can spin up mid-conversation. Invoke them via the `Agent` tool or by name.

| Agent | Description |
|---|---|
| `code-reviewer` | Reviews code for bugs, security, performance, and quality — outputs a structured checklist |
| `refactor` | Refactors code for clarity and maintainability without changing behavior |
| `pr-improver` | Orchestrates a full review-and-fix cycle: reviews the branch, applies all safe fixes, runs tests, and reports |

## 🎯 Skills

Skills are slash commands that expand into full prompts. Invoke them by typing `/skill-name` in Claude Code.

| Skill | Command | Description |
|---|---|---|
| Commit | `/commit` | Generates a commit message from staged changes and commits |
| Review PR | `/review-pr` | Full code review of the current branch diff vs base |
| Review File | `/review-file` | In-depth review of a specific file |
| Review Security | `/review-security` | Security audit focused on OWASP Top 10 |
| Refactor PR | `/refactor-pr` | Refactors only the files changed in the current branch |
| Frontend Design | `/frontend-design` | Creates polished React interfaces with high design quality |
| Map Project | `/map-project` | Scans the project and generates a `CLAUDE.md` with full context |
| Sync Memory | `/sync-memory` | Updates `CLAUDE.md` after structural changes to the project |
| Fix PR | `/fix-pr` | Reviews the PR and applies all safe fixes directly to the files |
| Readme | `/readme` | Creates or updates this README |

## 📁 Project Structure

```
.claude/
├── agents/
│   ├── code-reviewer/    # AGENT.md — code review specialist
│   ├── refactor/         # AGENT.md — refactoring specialist
│   └── pr-improver/      # AGENT.md — review + fix orchestrator
└── skills/
    ├── commit/            # SKILL.md
    ├── review-pr/         # SKILL.md
    ├── review-file/       # SKILL.md
    ├── review-security/   # SKILL.md
    ├── refactor-pr/       # SKILL.md
    ├── frontend-design/   # SKILL.md
    ├── map-project/       # SKILL.md
    ├── sync-memory/       # SKILL.md
    ├── fix-pr/            # SKILL.md
    └── readme/            # SKILL.md
install.sh                 # symlinks everything into ~/.claude/
```

## 📄 License

MIT
