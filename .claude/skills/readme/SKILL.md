---
name: readme
description: Creates or updates a README.md for the project. Generates a clean, visually appealing README with icons, essential sections, and good structure — not exhaustive docs, just what matters.
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
---

Create or update the project's `README.md`. The goal is a README that looks great, communicates clearly, and covers exactly what someone needs — nothing more.

## Steps

### 1. Gather project context

Read `CLAUDE.md` if it exists (already contains stack and structure). Otherwise scan:
```bash
# detect stack
cat package.json 2>/dev/null || cat go.mod 2>/dev/null || cat requirements.txt 2>/dev/null || cat Cargo.toml 2>/dev/null

# list top-level structure
ls -1
```

Also check:
- Existing `README.md` — if it exists, update it rather than overwrite blindly
- `src/` or main source folder to understand what the project actually does
- `.env.example` or config files to document environment variables

### 2. Identify the essentials

Extract:
- **What it is**: one sentence description of the project
- **Main features**: 4-6 bullet points of what it does
- **Tech stack**: framework, language, key libraries
- **How to run**: install, configure env, run dev server
- **How to test and build**: test and build commands
- **Environment variables**: from `.env.example` if present

### 3. Write the README

Follow this structure exactly. Use shields.io badges and emojis for visual clarity — but keep it tasteful, not cluttered.

---

```markdown
<div align="center">

# Project Name

Short one-line description of what this project does.

![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=flat&logo=typescript&logoColor=white)
![React](https://img.shields.io/badge/React-61DAFB?style=flat&logo=react&logoColor=black)
<!-- add relevant stack badges only -->

</div>

---

## ✨ Features

- 🔐 **Feature name** — brief description
- ⚡ **Feature name** — brief description
- 🎨 **Feature name** — brief description
<!-- 4 to 6 features max -->

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Framework | React 18 + TypeScript |
| Styling | Tailwind CSS |
| ... | ... |

## 🚀 Getting Started

### Prerequisites

- Node.js 18+
- (other requirements)

### Installation

\`\`\`bash
# Clone the repository
git clone <repo-url>
cd <project-name>

# Install dependencies
npm install

# Configure environment
cp .env.example .env
\`\`\`

### Environment Variables

| Variable | Description | Required |
|---|---|---|
| `VAR_NAME` | What it does | ✅ |
| `VAR_NAME` | What it does | ⚪ optional |

<!-- omit this section if no env vars -->

### Running

\`\`\`bash
npm run dev
\`\`\`

## 🧪 Testing

\`\`\`bash
npm test
\`\`\`

## 📦 Build

\`\`\`bash
npm run build
\`\`\`

## 📁 Project Structure

\`\`\`
src/
├── components/    # Reusable UI components
├── pages/         # Route-level components
├── hooks/         # Custom hooks
└── ...
\`\`\`

<!-- only include if the structure is non-obvious -->

## 📄 License

MIT
```

---

## Rules

- **One sentence per feature** — if you need more, the feature description is too complex
- **Only real commands** — test every command against what exists in `package.json` or equivalent before writing it
- **No filler sections** — omit Contributing, Roadmap, Acknowledgements unless they already exist and the user wants them kept
- **Badges**: only for the actual stack — don't add badges for things not used
- **Env vars table**: only if `.env.example` exists or env vars are clearly used in the code
- **Project structure**: only if non-trivial (more than 3 levels or unconventional layout)

After writing, confirm what was created/updated and which sections were included.
