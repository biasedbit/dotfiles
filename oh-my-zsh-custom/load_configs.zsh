# .dotfiles/configs/*
CONFIGS="$(cd "$(dirname "$0")/.." && pwd -P)/configs"

# Source .localrc if found. Keep private stuff in here.
LOCALRC="$HOME/.localrc"
if [[ -a $LOCALRC ]]; then
  source $LOCALRC
fi

# Source all config/**/*.zsh files
typeset -U config_files
config_files=($CONFIGS/**/*.zsh)

for file in ${(M)config_files}; do
  source $file
done

unset config_files

