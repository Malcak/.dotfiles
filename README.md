# Malcak Dotfiles

In this repository you will find my configuration files, it's structure to work
with [GNU Stow](https://www.gnu.org/software/stow/), so each folder under the 
root structured is positioned as if the folder were the `$HOME` directory.

```
# $HOME
~
└── .config
    └── kitty
        ├── kitty.conf
        └── themes
            └── malcak.conf
```
```
# $HOME/.dotfiles/kitty
kitty
└── .config
    └── kitty
        ├── kitty.conf
        └── themes
            └── malcak.conf
```

## Requirements

- `git`
- [`stow`](https://www.gnu.org/software/stow/manual/stow.html)

## Installation

First, clone this repository in your home directory.

```sh
git clone git@github.com:Malcak/.dotfiles.git ~/.dotfiles
# cd ~/.dotfiles
```

Then use GNU stow to create symlinks by package.
```
stow [ options ] package ...
```

If you want to perform a dry-run.
```sh
stow --simulate package
```

If you want to include existing files into the dotfiles repo.
```sh
stow --adopt package #warning
```

> [!WARNING]
> `--adopt` This behaviour is specifically intended to alter the contents of 
your stow directory. If you do not want that, this option is not for you.

If you want to remove the symlinks.
```sh
stow -D package
```

If you want to recreate the symlinks.
```sh
stow -R package
```
