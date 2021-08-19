#!/usr/bin/env zsh
case "$OSTYPE" in
  darwin*)
    export JAVA_HOME=$(/usr/libexec/java_home -Fv 16)
    ;;
esac
