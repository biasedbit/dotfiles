#!/usr/bin/env zsh
# .dotfiles/configs/*
CONFIG_DIR="$(cd "$(dirname "$0")/.." && pwd -P)/configs"

load_configs() {
  local modules= # list of modules to source *.zsh files from; order matters
  case "$OSTYPE" in
    darwin*)
      modules=('git' 'golang' 'homebrew' 'ios' 'java' 'ruby' 'zsh')
      ;;
    "linux-gnu")
      modules=('git' 'golang' 'java' 'ruby' 'zsh')
      ;;
    "cygwin")
      modules=('git' 'zsh')
      ;;
    *)
      echo "! Unsupported OS ($OSTYPE); skipping custom module load."
      ;;
  esac

  for module in ${modules}; do
    local files=($CONFIG_DIR/$module/*.zsh)
    for file in $files; do source $file; done
  done
}

load_configs

# Source .localrc if found. Sensitive or machine-specific stuff in there.
LOCALRC="$HOME/.localrc"
if [[ -a $LOCALRC ]]; then
  source $LOCALRC
fi
