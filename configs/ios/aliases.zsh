#!/usr/bin/env zsh
if [[ "$OSTYPE" != darwin* ]]; then return; fi

alias simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias nuke_derived_data="rm -rf ~/Library/Developer/Xcode/DerivedData/*"
alias codesign_ids="security find-identity -v -p codesigning"
