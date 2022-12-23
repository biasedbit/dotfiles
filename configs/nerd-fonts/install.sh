#!/usr/bin/env bash
set -e

# In macOS fonts are managed via homebrew
if [[ "$OSTYPE" == darwin* ]]; then exit; fi

if [ ! -d "$HOME/.nerd-fonts" ] ; then
  git clone --filter=blob:none --sparse\
    git@github.com:ryanoasis/nerd-fonts $HOME/.nerd-fonts
fi

cd $HOME/.nerd-fonts
git sparse-checkout add patched-fonts/Meslo
git sparse-checkout add patched-fonts/SourceCodePro

./install.sh -l Meslo
./install.sh -l SourceCodePro

# In WSL we actually want the fonts installed in Windows, but automating
# that requires messing with the Registry (ew). Bootstrap is rare and manual
# install is trivial so just open Exporer on folder with all fonts.
if [[ $(grep -s microsoft /proc/version) ]]; then
  /mnt/c/Windows/explorer.exe `wslpath -w $HOME/.local/share/fonts/NerdFonts`
fi
