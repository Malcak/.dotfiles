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

If you want to use the `setup.sh` script:

- [`gum`](https://github.com/charmbracelet/gum)

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

## `setup` script ⚠️ Work in progress ⚠️

The `setup` script is the most friendly way to set up the dotfiles, see 
the usage example and options to use it.

Usage: `./setup.sh [OPTIONS...]`

Just pass options for the settings you want, e.g. if you want only the 
zsh configuration then `./setup.sh --zsh`.

<details> <summary> Options </summary>

```
  -i, --interactive, --interactive-mode
 Run this script in interactive mode.

  -d, --dry, --dry-mode
 No real action will be performed. Recommended with debug mode.

  -f, --hard, --hard-mode
 Removes previous configurations when setting up new ones, and does not make a backup. 

  -D --debug, --debug-mode
 Display debug messages.
 
  -g, --git, --git-config
 Set the git configurations.

  -z, --zsh
 Set the ZSH configurations.

  -b, --bash
 Set the Bash configurations.

  -o, --omz, --oh-my-zsh
 Set the oh-my-zsh prompt configurations.

  -s, --starship
 Set the starship prompt configurations.

  -r, --remove, -u, --uninstall
 Removes all selected and installed configurations. 
```

</details>
