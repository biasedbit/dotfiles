#!/usr/bin/env zsh
case "$OSTYPE" in
  darwin*)
    export JAVA_HOME=$(/usr/libexec/java_home -Fv 18)
    ;;
  linux-gnu*)
    export JAVA_HOME=$(update-alternatives --query java | grep 'Value: ' | sed -e 's/Value: //;s?/bin/java?/?;')
    ;;
esac
