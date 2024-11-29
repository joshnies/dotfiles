# Josh Nies' dotfiles

My personal configuration files for macOS and Linux.

## Requirements

| Name | Description |
| ---- | ----------- |
| [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads) |  |

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
## Table of Contents

| Filename/Directory | Description |
| -------- | ----------- |
| `d` | "\[D\]ev"; Bash script for creating or resuming the tmux session I use for development on Vela. Use this as a reference for your own environment. |
| `.config/alacritty` | Alacritty config |
| `.config/nvim` | Neovim config |
| `.tmux.conf` | Tmux config |
| `.zprofile`, `.zshrc` | ZSH config |

