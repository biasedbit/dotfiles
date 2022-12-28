#!/usr/bin/env zsh

# On macOS, jenv is installed via Homebrew, and its binary is available at
# /opt/homebrew/bin (added to path by brew omz plugin). In linux, this binary
# must be added to path manually, since jenv is installed via git clone.
if [[ "$OSTYPE" == "linux-gnu" ]]; then
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
