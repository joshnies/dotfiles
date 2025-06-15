# Dotfiles

My personal configuration files for Linux (NixOS) and macOS.

## Usage

These are intended as a reference or starting point for your own dotfiles.

I don't recommend using most of my configs as-is, since they're highly
personal and configured to my exact hardware and project specifications.

However, if you'd like to try them out, you can use
[GNU Stow](https://www.gnu.org/software/stow) to incrementally install each
configuration module.

```sh
stow <path>

# For example:
stow nixos
stow hypr
```

> [!WARNING]
> Do NOT stow the root directory, which would result in an incorrect file
> structure.

To unlink a module, just use `unlink`:

```sh
unlink nixos
```
