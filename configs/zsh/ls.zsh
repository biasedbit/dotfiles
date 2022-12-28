#!/usr/bin/env zsh

# list w/ colorls instead of system ls
unalias ls # in case some plugin creates a conflicting alias
ls() {
  local opts=(--sd)
  if [[ $@ == *a* ]]; then opts+=(-A) fi
  if [[ $@ == *l* ]]; then opts+=(-l) fi

  command colorls ${=opts} --time-style='+ %Y-%m-%d %H:%M:%S'
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
