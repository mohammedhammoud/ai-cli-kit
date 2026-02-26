#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR"
DEST="${HOME}/.codex/skills"

mkdir -p "$DEST"

for d in "$SRC"/*; do
  [ -d "$d" ] || continue
  name="$(basename "$d")"
  [ "$name" = ".git" ] && continue
  [ "$name" = ".github" ] && continue
  ln -sfn "$d" "$DEST/$name"
  echo "linked: $name"
done
