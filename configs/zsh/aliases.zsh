#!/usr/bin/env zsh

# Reload shell
alias reload!='. ~/.zshrc'

# Print all ls * with human readable sizes and colors
alias ls="ls -Gh"

# Pipe public key to clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# gitgrep w/ breaks
alias gg="git grep --break --heading --line-number"

# copy current git branch name to clipboard
alias gbcp="git rev-parse --abbrev-ref HEAD | tr -d '\n' | pbcopy"
