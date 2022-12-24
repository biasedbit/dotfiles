#!/usr/bin/env zsh

# Reload shell
alias reload!='exec zsh'
# SafetyThird™
alias rm='rm -I'
# Disk usage of items in current dir
alias dud='du -d 1 -h'

case "$OSTYPE" in
  darwin*)
    alias update="brew update && brew upgrade"
    clipboard_cmd="pbcopy"
    ;;
  "linux-gnu")
    alias update="sudo apt update && sudo apt upgrade"
    if [[ $(grep microsoft /proc/version) ]]; then
      # Full path since wsl.conf will normally have appendWindowsPath = false
      clipboard_cmd="/mnt/c/Windows/System32/clip.exe"
      # Emulate macos's `open <path>`
      function open() { /mnt/c/Windows/explorer.exe `wslpath -w $1`; }
    else
      clipboard_cmd="xsel -ib"
    fi
    ;;
  *)
esac

alias cbcopy=$clipboard_cmd
