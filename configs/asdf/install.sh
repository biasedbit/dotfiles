#!/usr/bin/env zsh
# set -e

rm -rf ~/.asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
. "$HOME/.asdf/asdf.sh"

asdf plugin add nodejs || true
asdf plugin add python || true
asdf plugin add ruby || true
asdf plugin add pnpm || true
asdf plugin add java || true
asdf install
