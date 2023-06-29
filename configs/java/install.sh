#!/usr/bin/env bash
set -e

if [[ "$OSTYPE" != "linux-gnu" ]]; then
  # On macOS, jenv is installed via homebrew; only need to add JDK to jenv.
  jenv add /opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home
fi

if [ ! -d "$HOME/.jenv" ] ; then
  git clone --depth 1 https://github.com/jenv/jenv.git $HOME/.jenv
else
  cd $HOME/.jenv
  git pull origin master
fi

mkdir -p $HOME/.jenv/versions
# Add JDK installed in Aptfile (openjdk-20-jdk) to managed java versions
$HOME/.jenv/bin/jenv add /usr/lib/jvm/java-20-openjdk-amd64/Contents/Home
