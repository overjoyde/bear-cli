#!/usr/bin/env bash
# Installer helper: copy chosen bear script to /usr/local/bin as 'bear' and make it executable.
# Usage: sudo ./scripts/install_bear.sh bears/cli-bear/bear.sh [--name bear]

set -euo pipefail
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <path-to-bear-script> [--name <install-name>]" >&2
  exit 2
fi
SRC="$1"; shift
NAME="bear"
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --name)
      NAME="$2"; shift 2 ;;
    *)
      echo "Unknown option: $1" >&2; exit 2 ;;
  esac
done

if [ ! -f "$SRC" ]; then
  echo "Source file not found: $SRC" >&2; exit 1
fi

DEST="/usr/local/bin/${NAME}"

echo "Installing ${SRC} -> ${DEST} (requires sudo if you are not root)"

# Use install to copy and set permissions
sudo install -m 0755 "$SRC" "$DEST"

echo "Installed. You can now run: ${NAME}"
