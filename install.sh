#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

SKILLS_SRC="$REPO_DIR/.claude/skills"
SKILLS_DST="$CLAUDE_DIR/skills"

link_items() {
  local src="$1"
  local dst="$2"
  local type="$3"

  if [ ! -d "$src" ]; then
    echo "  no $type found, skipping"
    return
  fi

  mkdir -p "$dst"

  for item in "$src"/*/; do
    [ -d "$item" ] || continue
    name="$(basename "$item")"
    target="$dst/$name"

    if [ -L "$target" ]; then
      echo "  [$type] $name — already linked, skipping"
    elif [ -e "$target" ]; then
      echo "  [$type] $name — WARNING: $target exists and is not a symlink, skipping"
    else
      ln -s "$item" "$target"
      echo "  [$type] $name — linked"
    fi
  done
}

echo "Installing skills from $REPO_DIR"
echo ""
link_items "$SKILLS_SRC" "$SKILLS_DST" "skill"
echo ""
echo "Done. Restart Claude Code or run /reload-plugins to apply."
