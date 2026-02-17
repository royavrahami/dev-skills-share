#!/usr/bin/env bash
# install.sh — Install dev-skills-share to Cursor / Codex global skills directory
# Usage: ./install.sh [--target cursor|codex] [--only skill1,skill2,...]

set -euo pipefail

TARGET="cursor"
ONLY=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --target) TARGET="$2"; shift 2 ;;
        --only)   ONLY="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 [--target cursor|codex] [--only skill1,skill2,...]"
            echo ""
            echo "Options:"
            echo "  --target   Where to install: cursor (default) or codex"
            echo "  --only     Comma-separated list of specific skills to install"
            exit 0
            ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

# Determine destination
case "$TARGET" in
    cursor) DEST="$HOME/.cursor/skills" ;;
    codex)  DEST="$HOME/.codex/skills" ;;
    *) echo "ERROR: target must be 'cursor' or 'codex'"; exit 1 ;;
esac

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$SCRIPT_DIR/skills"

if [[ ! -d "$SRC" ]]; then
    echo "ERROR: skills/ directory not found. Run this script from the repo root."
    exit 1
fi

# Create destination
mkdir -p "$DEST"

# Determine which skills to install
INSTALLED=0
for skill_dir in "$SRC"/*/; do
    skill_name="$(basename "$skill_dir")"

    # Filter if --only was specified
    if [[ -n "$ONLY" ]]; then
        if ! echo ",$ONLY," | grep -q ",$skill_name,"; then
            continue
        fi
    fi

    cp -r "$skill_dir" "$DEST/"
    echo "  [OK] $skill_name"
    INSTALLED=$((INSTALLED + 1))
done

echo ""
echo "Installed $INSTALLED skills to: $DEST"
echo "Restart your IDE to pick up the new skills."
