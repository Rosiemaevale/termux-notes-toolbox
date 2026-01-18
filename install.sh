#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="$HOME/scripts"

echo "Installing Termux Notes Toolbox"
echo "Repo: $REPO_DIR"
echo "Target: $TARGET"
echo

mkdir -p "$TARGET"
cp -f "$REPO_DIR"/scripts/* "$TARGET"/
chmod +x "$TARGET"/*

SHELL_RC="$HOME/.bashrc"
if [ -n "${ZSH_VERSION-}" ]; then
  SHELL_RC="$HOME/.zshrc"
fi

if ! grep -q 'export PATH="$HOME/scripts:$PATH"' "$SHELL_RC" 2>/dev/null; then
  echo 'export PATH="$HOME/scripts:$PATH"' >> "$SHELL_RC"
  echo "Added PATH line to $SHELL_RC"
else
  echo "PATH line already present in $SHELL_RC"
fi

echo
echo "Done. Restart Termux, then try: checkin"
