#!/usr/bin/env zsh
case "$OSTYPE" in
  darwin*)
    export JAVA8_HOME=$(/usr/libexec/java_home -Fv 1.8)
    export JAVA_HOME=${JAVA8_HOME}
    ;;
esac
