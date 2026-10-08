#!/usr/bin/env bash
# Install skills from this repo into an AI platform skills directory.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO_DIR/skills"

usage() {
  cat <<USAGE
Usage: ./install.sh [options] [skill ...]

Options:
  -t, --target NAME   claude | codex | agents  (repeatable, default: claude)
  -d, --dir PATH      Install into a custom skills directory (repeatable)
  -c, --copy          Copy files instead of symlinking
  -f, --force         Replace existing skills with the same name
  -l, --list          List available skills and exit
  -h, --help          Show this help

No skill names = install all skills.

Target directories:
  claude  ~/.claude/skills
  codex   ~/.codex/skills
  agents  ~/.agents/skills
USAGE
}

targets=()
dirs=()
mode="link"
force=0
skills=()

while [ $# -gt 0 ]; do
  case "$1" in
    -t|--target) targets+=("$2"); shift 2 ;;
    -d|--dir) dirs+=("$2"); shift 2 ;;
    -c|--copy) mode="copy"; shift ;;
    -f|--force) force=1; shift ;;
    -l|--list) ls "$SRC"; exit 0 ;;
    -h|--help) usage; exit 0 ;;
    -*) echo "Unknown option: $1" >&2; usage >&2; exit 1 ;;
    *) skills+=("$1"); shift ;;
  esac
done

[ ${#targets[@]} -eq 0 ] && [ ${#dirs[@]} -eq 0 ] && targets=(claude)

for t in ${targets[@]+"${targets[@]}"}; do
  case "$t" in
    claude) dirs+=("$HOME/.claude/skills") ;;
    codex)  dirs+=("$HOME/.codex/skills") ;;
    agents) dirs+=("$HOME/.agents/skills") ;;
    *) echo "Unknown target: $t" >&2; exit 1 ;;
  esac
done

if [ ${#skills[@]} -eq 0 ]; then
  for d in "$SRC"/*/; do skills+=("$(basename "$d")"); done
fi

for dest in "${dirs[@]}"; do
  mkdir -p "$dest"
  echo "Installing into $dest ($mode)"
  for s in "${skills[@]}"; do
    if [ ! -d "$SRC/$s" ]; then
      echo "  skip $s: not found" >&2
      continue
    fi
    target="$dest/$s"
    if [ -e "$target" ] || [ -L "$target" ]; then
      if [ "$force" -eq 1 ]; then
        rm -rf "$target"
      else
        echo "  skip $s: exists (use --force)"
        continue
      fi
    fi
    if [ "$mode" = "link" ]; then
      ln -s "$SRC/$s" "$target"
    else
      cp -R "$SRC/$s" "$target"
    fi
    echo "  ok   $s"
  done
done
