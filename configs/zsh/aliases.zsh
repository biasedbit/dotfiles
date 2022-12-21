#!/usr/bin/env zsh

# Reload shell
alias reload!='. ~/.zshrc'

# Print all ls * with human readable sizes and colors
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
      # Full path since wsl.conf will normally has appendWindowsPath = false
      clipboard_cmd="/mnt/c/Windows/System32/clip.exe"
    else
      clipboard_cmd="xsel -ib"
    fi
    ;;
  *)
esac

alias cbcopy=$clipboard_cmd

# Pipe public key to clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | cbcopy | echo '=> Public key copied to pasteboard.'"

# gitgrep w/ breaks
alias gg="git grep --break --heading --line-number"

# copy current git branch name to clipboard
alias gbcp="git rev-parse --abbrev-ref HEAD | tr -d '\n' | cbcopy"
