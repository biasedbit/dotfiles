#!/usr/bin/env zsh
if [[ "$OSTYPE" != darwin* ]]; then return; fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
