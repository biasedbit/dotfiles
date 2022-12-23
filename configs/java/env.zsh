#!/usr/bin/env zsh

# In linux, jenv is installed by cloning repo to ~/.jenv
if [[ "$OSTYPE" != "gnu-linux" ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"
fi

# `jenv init -`, minus completions
export PATH="$HOME/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
unset JDK_HOME
# source '(...)/completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  type typeset &> /dev/null && typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

# case "$OSTYPE" in
#   darwin*)
#     export JAVA_HOME=$(/usr/libexec/java_home -Fv 19)
#     ;;
#   linux-gnu*)
#     export JAVA_HOME=$(update-alternatives --query java | grep 'Value: ' | sed -e 's/Value: //;s?/bin/java?/?;')
#     ;;
# esac
