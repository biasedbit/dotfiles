# .dotfiles/configs/*
CONFIGS="$(cd "$(dirname "$0")/.." && pwd -P)/configs"

# Source .localrc if found. Keep private stuff in here.
LOCALRC="$HOME/.localrc"
if [[ -a $LOCALRC ]]
then
  source $LOCALRC
fi

# all of our zsh files
typeset -U config_files
config_files=($CONFIGS/**/*.zsh)

# load the path files
for file in ${(M)config_files}
do
  source $file
done

unset config_files
