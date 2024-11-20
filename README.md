# Josh Nies' dotfiles

My personal configuration files for macOS and Linux.

## Install

I recommend using GNU Stow for managing symlinks between this repository and
your home directory:

```sh
cd dotfiles             # if you haven't already

brew install stow       # macOS
sudo apt install stow   # debian
pacman -S stow          # arch

stow .
```

