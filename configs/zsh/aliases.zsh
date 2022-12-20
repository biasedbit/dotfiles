#!/usr/bin/env zsh

# Reload shell
alias reload!='. ~/.zshrc'

# Print all ls * with human readable sizes and colors
case "$OSTYPE" in
  darwin*)
    alias ls="ls -Gh"
    CLIPBOARD_CMD="pbcopy"
    ;;
  *)
    alias ls="ls -Gh --color --group-directories-first -X"
    CLIPBOARD_CMD="xsel -ib"
esac

# Pipe public key to clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | $CLIPBOARD_CMD | echo '=> Public key copied to pasteboard.'"

# gitgrep w/ breaks
alias gg="git grep --break --heading --line-number"

# copy current git branch name to clipboard
alias gbcp="git rev-parse --abbrev-ref HEAD | tr -d '\n' | $CLIPBOARD_CMD"

