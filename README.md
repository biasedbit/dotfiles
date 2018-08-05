Dotfiles!
=========

Setup:

```sh
$ ./00-install
$ ./01-bootstrap
# Switch to zsh (cygwin instructions below)
chsh -s $(which zsh)
# If a "non-standard shell" error is displayed:
sudo sh -c "echo $(which zsh) >> /etc/shells"
```

For cygwin, add `/usr/bin/zsh -l` to shortcut:

```
C:\cygwin64\bin\mintty.exe -i /Cygwin-Terminal.ico /usr/bin/zsh -l -
```
