#!/usr/bin/env bash
case "$OSTYPE" in
  "linux-gnu")
    cmd="pip install --user"
    ;;
  *)
    cmd="pip install"
    ;;
esac

${cmd} autoenv
${cmd} virtualenv virtualenvwrapper
${cmd} pip-autoremove
${cmd} thefuck
${cmd} ipython
