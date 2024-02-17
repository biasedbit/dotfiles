#!/usr/bin/env bash
set -e

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
	--no-modify-path \
	--default-toolchain stable \
	--profile default
