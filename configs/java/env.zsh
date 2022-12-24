#!/usr/bin/env zsh

# In linux, jenv is installed by cloning repo to ~/.jenv
if [[ "$OSTYPE" != "gnu-linux" ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"
fi

jenv global 19.0

# case "$OSTYPE" in
#   darwin*)
#     export JAVA_HOME=$(/usr/libexec/java_home -Fv 19)
#     ;;
#   linux-gnu*)
#     export JAVA_HOME=$(update-alternatives --query java | grep 'Value: ' | sed -e 's/Value: //;s?/bin/java?/?;')
#     ;;
# esac
