#!/usr/bin/env zsh
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gs='git status -sb'

# gitgrep w/ breaks
alias gg="git grep --break --heading --line-number"

# copy current git branch name to clipboard
alias gbcp="git rev-parse --abbrev-ref HEAD | tr -d '\n' | cbcopy"
alias gpom="git pull origin main"
