#!/usr/bin/env bash
set -e

# TODO: rustup installation in Ubuntu
if [[ "$OSTYPE" != darwin* ]]; then exit; fi

rustup-init -y\
	--no-modify-path \
	--default-toolchain stable \
	--profile default \
