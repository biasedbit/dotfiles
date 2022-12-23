#!/usr/bin/env zsh

# Reload shell
alias reload!='exec zsh'
# SafetyThird™
alias rm='rm -I'
# Disk usage of items in current dir
alias dud='du -d 1 -h'

case "$OSTYPE" in
  darwin*)
    alias ls="ls -Gh"
    alias update="brew update && brew upgrade"
    clipboard_cmd="pbcopy"
    ;;
  "linux-gnu")
    alias ls="ls -Gh --color --group-directories-first -X"
    alias update="sudo apt update && sudo apt upgrade"
    if [[ $(grep microsoft /proc/version) ]]; then
      # Full path since wsl.conf will normally have appendWindowsPath = false
      clipboard_cmd="/mnt/c/Windows/System32/clip.exe"
    else
      clipboard_cmd="xsel -ib"
    fi
    ;;
  *)
esac

alias cbcopy=$clipboard_cmd

# gitgrep w/ breaks
alias gg="git grep --break --heading --line-number"

# copy current git branch name to clipboard
alias gbcp="git rev-parse --abbrev-ref HEAD | tr -d '\n' | cbcopy"
alias gpom="git pull origin main"
