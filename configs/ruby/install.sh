#!/usr/bin/env bash
set -e
case "$OSTYPE" in
  darwin*)
    version="2.6.5"
    ;;
  "linux-gnu")
    version="2.6.5-dev"
    ;;
  *)
    version="2.6.5"
    ;;
esac

rbenv install ${version}
rbenv global ${version}
rbenv rehash

gem update --system
gem install bundler

