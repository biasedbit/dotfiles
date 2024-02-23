#!/usr/bin/env zsh
# set -e

asdf plugin add nodejs || true
asdf plugin add python || true
asdf plugin add ruby || true
asdf plugin add pnpm || true
asdf plugin add java || true
asdf install
