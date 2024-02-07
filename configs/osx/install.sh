#!/usr/bin/env bash
if [[ "$OSTYPE" != darwin* ]]; then exit; fi

# Reduce spacing/padding size between menubar icons
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 12
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 8
