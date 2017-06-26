#!/usr/bin/env zsh
if [[ "$OSTYPE" != darwin* ]]; then return; fi

# init according to man page
if (( $+commands[rbenv] )); then
  eval "$(rbenv init -)"
fi
