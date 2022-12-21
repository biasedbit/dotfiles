Dotfiles!
=========

Setup:

```sh
$ ./00-install
$ ./01-bootstrap
chsh -s $(which zsh)
# If a "non-standard shell" error is displayed:
sudo sh -c "echo $(which zsh) >> /etc/shells"
```
