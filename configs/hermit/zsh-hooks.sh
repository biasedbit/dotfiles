#!/usr/bin/env zsh

# Hermit zsh hooks: https://cashapp.github.io/hermit/usage/shell/
# Auto-detects hermit-configured folders and enables/disables hermit env when
# entering/leaving directories.
eval "$(test -x $HOME/bin/hermit && $HOME/bin/hermit shell-hooks --print --zsh)"
