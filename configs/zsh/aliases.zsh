#!/usr/bin/env zsh

# Reload shell
alias reload!='. ~/.zshrc'

# Print all ls * with human readable sizes and colors
alias ls="ls -Gh"

# Pipe public key to clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias gg="git grep --break --heading --line-number"
