#!/usr/bin/env zsh

SCRIPT_DIR="${0:a:h}"

mkdir -p ~/.config/mise
cp "$SCRIPT_DIR/config.toml" ~/.config/mise/
