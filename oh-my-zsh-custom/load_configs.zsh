#!/usr/bin/env zsh
# .dotfiles/configs/*
CONFIG_DIR="$(cd "$(dirname "$0")/.." && pwd -P)/configs"

load_configs() {
  # list of configs/env setup to ignored, per OS
  local ignored=''
  case "$OSTYPE" in
    darwin*)
      ;;
    *)
      ignored=('ios' 'homebrew')
      ;;
  esac

  # Source all config/**/*.zsh files, respecting ignores defined above.
  local config_files=($CONFIG_DIR/**/*.zsh)
  for i in ${ignored}; do
    config_files=("${(@)config_files:#*$i*}")
  done

  for f in ${config_files}; do
    source $f
  done
}

load_configs

# Source .localrc if found. Keep private stuff in here.
LOCALRC="$HOME/.localrc"
if [[ -a $LOCALRC ]]; then
  source $LOCALRC
fi
