<div align="center">

# agents-and-skills

A curated collection of custom Claude Code skills, installable globally in one command.

![Shell](https://img.shields.io/badge/Shell-4EAA25?style=flat&logo=gnubash&logoColor=white)
![Claude Code](https://img.shields.io/badge/Claude_Code-D97757?style=flat&logo=anthropic&logoColor=white)

</div>

---

## ✨ Features

- 🛠 **Slash-command skills** — invoke complex workflows with `/skill-name` in any project
- 🔗 **Symlink-based install** — changes in this repo are reflected everywhere instantly
- 🧠 **Project memory** — generate and sync `CLAUDE.md` so every agent has full project context
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

The script symlinks each skill into `~/.claude/skills/`. After installing, restart Claude Code or run `/reload-plugins`.

## 🎯 Skills

Skills are slash commands that expand into full prompts. Invoke them by typing `/skill-name` in Claude Code.

| Skill | Command | Description |
|---|---|---|
| Commit | `/commit` | Generates a commit message from staged changes and commits |
| Code Review | `/code-review` | Reviews staged changes for quality, security, and best practices |
| Refactor Review | `/refactor-review` | Applies fixes from `/code-review` output directly to staged files |
| Debug | `/debug` | Investigates errors and stack traces, locates root cause, tells exactly what to fix |
| Explain | `/explain` | Explains code, functions, or concepts in plain language |
| Frontend Design | `/frontend-design` | Creates polished, production-grade React interfaces |
| Create Memory | `/create-memory` | Scans the project and generates a `CLAUDE.md` with full context |
| Sync Memory | `/sync-memory` | Updates `CLAUDE.md` after structural changes to the project |
| Design System Map | `/design-system-map` | Generates a `DESIGN_SYSTEM.md` optimized for AI-assisted prototyping |
| Readme | `/readme` | Creates or updates this README |

## 📁 Project Structure

```
.claude/
└── skills/
    ├── commit/            # SKILL.md
    ├── code-review/       # SKILL.md
    ├── refactor-review/   # SKILL.md
    ├── debug/             # SKILL.md
    ├── explain/           # SKILL.md
    ├── frontend-design/   # SKILL.md
    ├── create-memory/     # SKILL.md
    ├── sync-memory/       # SKILL.md
    ├── design-system-map/ # SKILL.md
    └── readme/            # SKILL.md
install.sh                 # symlinks everything into ~/.claude/
```

## 📄 License

MIT
