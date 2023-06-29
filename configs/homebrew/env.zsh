#!/usr/bin/env zsh
if [[ "$OSTYPE" != darwin* ]]; then return; fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

function nuke_homebrew() {
  # Switch back to bash to avoid new sessions breaking due to
  # missing zsh (deleted in the purge process below)
  chsh -s /bin/bash
  /opt/homebrew/bin/brew remove --cask --force $(/opt/homebrew/bin/brew list)
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
  rm -rf ~/Library/Caches/Homebrew
  sudo rm -rf /opt/homebrew/
}
