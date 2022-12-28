#!/usr/bin/env bash
set -e

RUBY_CONFIGURE_OPTS="--disable-install-doc --disable-shared"
case "$OSTYPE" in
  darwin*)
    # Use brew's openssl rather than downloading and building it.
    # This is a temporary workaround for failing builds on m1; see:
    # https://github.com/rbenv/ruby-build/discussions/1961#discussioncomment-4031745
    RUBY_CONFIGURE_OPTS+="$RUBY_CONFIGURE_OPTS --with-openssl-dir=$(brew --prefix openssl@3)"
    ;;
  "linux-gnu")
    # apt's ruby-build is outdated af; manually set up ruby-build as rbenv plugin
    # source: https://github.com/rbenv/ruby-build/issues/1749#issuecomment-832374640
    mkdir -p "$(rbenv root)"/plugins
    rm -rf "$(rbenv root)"/plugins/ruby-build
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
    ;;
  *)
    ;;
esac

VERSION="3.1.3"
RUBY_CONFIGURE_OPTS=$RUBY_CONFIGURE_OPTS rbenv install $VERSION
rbenv global $VERSION
rbenv rehash

eval "$(rbenv init -)"
gem update --system
gem install bundler
# Fancy ls; see ../zsh/ls.zsh
gem install colorls
