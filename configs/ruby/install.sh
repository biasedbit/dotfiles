#!/usr/bin/env bash
VERSION="3.1.2"
set -e
case "$OSTYPE" in
  darwin*)
    ;;
  "linux-gnu")
    # ruby-build is outdated af; manually set up ruby-build as rbenv plugin
    # source: https://github.com/rbenv/ruby-build/issues/1749#issuecomment-832374640
    mkdir -p "$(rbenv root)"/plugins
    rm -rf "$(rbenv root)"/plugins/ruby-build
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
    ;;
  *)
    ;;
esac

#rbenv install $VERSION
rbenv global $VERSION
rbenv rehash

eval "$(rbenv init -)"
gem update --system
gem install bundler
