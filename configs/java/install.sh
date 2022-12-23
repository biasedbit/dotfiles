#!/usr/bin/env bash
set -e

# Managed with homebrew in macos
if [[ "$OSTYPE" != "linux-gnu" ]]; then exit; fi

if [ ! -d "$HOME/.jenv" ] ; then
  git clone --depth 1 https://github.com/jenv/jenv.git $HOME/.jenv
fi

mkdir -p $HOME/.jenv/versions
$HOME/.jenv/bin/jenv add /usr/lib/jvm/java-19-openjdk-amd64
