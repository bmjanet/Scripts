#!/usr/bin/env bash
# Installs nmap-quick-tcp / nmap-quick-udp into /usr/local/bin so they run
# from any directory. Run from inside the nmap-quick folder:  sudo ./install.sh

set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${DEST:-/usr/local/bin}"

[[ $EUID -eq 0 ]] || { echo "run with sudo: sudo ./install.sh"; exit 1; }

for s in nmap-quick-tcp nmap-quick-udp; do
  [[ -f "$SRC/$s" ]] || { echo "missing $SRC/$s"; exit 1; }
  # strip CRLF in case the files came off a Windows filesystem
  sed 's/\r$//' "$SRC/$s" > "$DEST/$s"
  chmod 755 "$DEST/$s"
  echo "installed $DEST/$s"
done

echo
echo "Try:  nmap-quick-tcp -h"
