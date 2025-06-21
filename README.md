# Dotfiles!

```sh
# Download and install chezmoi
sh -c "$(curl -fsSL https://chezmoi.io/get)" -- -b ~/.local/bin

# Initialize dotfiles
chezmoi init --apply biasedbit/dotfiles

# Bootstrap the environment
sh .bootstrap.sh
```
