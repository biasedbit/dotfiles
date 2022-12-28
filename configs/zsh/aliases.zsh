#!/usr/bin/env zsh

# Reload shell
alias reload!='exec zsh'
# SafetyThird™ + exclude from globalias expansion
alias rm='rm -I'
GLOBALIAS_FILTER_VALUES+=(rm)
# Disk usage of items in current dir
alias dud='du -d 1 -h'

case "$OSTYPE" in
  darwin*)
    alias update="brew update && brew upgrade"
    ;;
  "linux-gnu")
    alias update="sudo apt update && sudo apt upgrade"
    if [[ $(grep microsoft /proc/version) ]]; then
      # Emulate macos's `open <path>`
      function open() { /mnt/c/Windows/explorer.exe `wslpath -w $1`; }
    fi
    ;;
  *)
esac

# omz creates an alias for grep that excludes vcs folders; don't expand.
# see oh-my-zsh/lib/grep.zsh
GLOBALIAS_FILTER_VALUES+=(grep)
