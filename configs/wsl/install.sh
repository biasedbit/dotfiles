#!/usr/bin/env bash
set -e

if [[ ! $(grep microsoft /proc/version) ]]; then exit; fi

conf="/etc/wsl.conf"
if [ -f "$conf" -o -L "$conf" ]; then
  echo "/etc/wsl.conf exists; contents:"
  echo "---"
  echo "$(cat /etc/wsl.conf)"
  echo "---"
  printf "overwrite? [y/N]: "
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
