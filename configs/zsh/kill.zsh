#!/usr/bin/env zsh

# Kill all processes with a command matching the search term.
killmatch() {
  if [ $# -eq 0 ]; then
    echo "Usage: killmatch [-SIGNAL] <search_term>"
    return 1
  fi

  local signal="-TERM"
  local search_term

  if [[ "$1" =~ ^- ]]; then
    # if 1st arg is a signal, override SIGTERM
    signal="$1"
    search_term="$2"
  else
    search_term="$1"
  fi

  ps -eo pid,cmd | grep "$search_term" | awk '{print $1}' | xargs kill $signal > /dev/null 2>&1
}
