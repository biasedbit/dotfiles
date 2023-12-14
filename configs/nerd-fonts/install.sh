#!/usr/bin/env bash
set -e

# In macOS fonts are managed via homebrew
if [[ "$OSTYPE" == darwin* ]]; then exit; fi

if [ ! -d "$HOME/.nerd-fonts" ] ; then
  git clone --filter=blob:none --sparse\
    https://github.com/ryanoasis/nerd-fonts.git $HOME/.nerd-fonts
fi

cd $HOME/.nerd-fonts
git sparse-checkout add patched-fonts/Meslo
git sparse-checkout add patched-fonts/SourceCodePro

if [[ $(grep -s microsoft /proc/version) ]]; then
  # On WSL, copy the fonts to make it easier to manually install below, as
  # explorer.exe doesn't understand symlinks (considers font files invalid).
  opts="--copy"
else
  # On Ubuntu native, it's sufficient to symlink (and save some space)
  opts="--link"
fi

./install.sh $opts Meslo
./install.sh $opts SourceCodePro

# In WSL we actually want the fonts installed in Windows, but automating
# that requires messing with the Registry (ew). Bootstrap is rare and manual
# install is trivial so just open Explorer on folder with all fonts.
if [[ $(grep -s microsoft /proc/version) ]]; then
  /mnt/c/Windows/explorer.exe `wslpath -w $HOME/.local/share/fonts/NerdFonts`
fi
