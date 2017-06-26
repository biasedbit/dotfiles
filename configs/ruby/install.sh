#!/usr/bin/env bash
set -e
case "$OSTYPE" in
  darwin*)
    version="2.3.0"
    ;;
  "linux-gnu")
    version="2.3.0-dev"
    ;;
  *)
    version="2.2.3"
    ;;
esac

rbenv install ${version}
rbenv global ${version}
rbenv rehash

gem update --system
gem install bundler

