#!/usr/bin/env bash
set -e

source includes.sh

if [[ ! $(grep -s microsoft /proc/version) ]]; then
  success "Not running in WSL, skipped."
  exit
fi

conf="/etc/wsl.conf"
if [ -f "$conf" -o -L "$conf" ]; then
  user "/etc/wsl.conf exists; contents:"
  echo "$(cat /etc/wsl.conf)"
  user "overwrite? [y/N]: "
  read -n 1 input
  echo ""

  case "$input" in
    y | Y )
      echo -e "[interop]\nappendWindowsPath = false\n" | sudo tee /etc/wsl.conf > /dev/null
      ;;
    n | N)
      ;;
    *)
      echo "    Unrecognized input '$input'; skipping."
      ;;
  esac
fi
