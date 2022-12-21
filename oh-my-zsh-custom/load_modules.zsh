#!/usr/bin/env zsh
# .dotfiles/configs/*
CONFIG_DIR="$(cd "$(dirname "$0")/.." && pwd -P)/configs"

load_configs() {
  # Source all config/*/*.zsh files; these are expected to no-op when not\
  # running in their expected env (if any).
  local files=($CONFIG_DIR/*/*.zsh)
  for file in $files; do
    source $file
  done
}

load_configs

# Source .localrc if found. Sensitive or machine-specific stuff in there.
LOCALRC="$HOME/.localrc"
if [[ -a $LOCALRC ]]; then
  source $LOCALRC
fi
