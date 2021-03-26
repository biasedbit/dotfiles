#!/usr/bin/env bash
VERSION="2.6.6"
set -e
case "$OSTYPE" in
  darwin*)
    version="$VERSION"
    ;;
  "linux-gnu")
    version="$VERSION-dev"
    ;;
  *)
    version="$VERSION"
    ;;
esac

rbenv install ${version}
rbenv global ${version}
rbenv rehash

gem update --system
gem install bundler

