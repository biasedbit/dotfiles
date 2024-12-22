#!/usr/bin/env zsh

. ~/.asdf/plugins/java/set-java-home.zsh

export GOPATH="$(go env GOPATH)"
export PATH="$GOPATH/bin:$PATH"
