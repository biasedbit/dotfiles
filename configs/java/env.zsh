#!/usr/bin/env zsh

# On macOS, jenv is installed via Homebrew, and its binary is available at
# /opt/homebrew/bin (added to path by brew omz plugin). In linux, this binary
# must be added to path manually, since jenv is installed via git clone.
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"
fi

jenv global 20.0
