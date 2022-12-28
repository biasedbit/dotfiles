#!/usr/bin/env bash
set -e

# On macOS, jenv is installed via homebrew; nothing to do here.
if [[ "$OSTYPE" != "linux-gnu" ]]; then exit; fi

if [ ! -d "$HOME/.jenv" ] ; then
  git clone --depth 1 https://github.com/jenv/jenv.git $HOME/.jenv
else
  cd $HOME/.jenv
  git pull origin master
fi

mkdir -p $HOME/.jenv/versions
# Add JDK installed in Aptfile (openjdk-19-jdk) to managed java versions
$HOME/.jenv/bin/jenv add /usr/lib/jvm/java-19-openjdk-amd64
