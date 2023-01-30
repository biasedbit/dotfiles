#!/usr/bin/env zsh

# list w/ colorls instead of system ls
unalias ls # in case some plugin creates a conflicting alias
ls() {
  # Replace '-la' arg with -lA (default for 'la' alias; hides ./ and ../)
  command colorls --sd --time-style='+ %Y-%m-%d %H:%M:%S' ${@//-la/-lA}
}

# Should the real ls becomes necessary...
ogls() {
  local opts=$@
  case "$OSTYPE" in
  darwin*)
    opts=(-Gh);;
  "linux-gnu")
    opts=(-Gh --color --group-directories-first -X);;
  esac
  command ls ${=opts} $@
}
