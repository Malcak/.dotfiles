# Malcak Dotfiles

In this repository you will find my configuration files, in the home folder you will find the config files that generally should be in the user's home directory, in the shell folder you will find the configuration files for each shell that I use separately and in the config folder you will find the config files that generally should be in `$HOME/.config` directory.

## How to use them

First, clone the repo.

```sh
git clone https://github.com/Malcak/dotfiles.git
```

Then, create a symbolic link to the directory where the file should be located. e.g. 
```sh
ln -s ~/.dotfiles/foo/bar ~/.config/foo/bar
```
You can find more examples in [EXAMPLES.md](./EXAMPLES.md)

## `setup` script ⚠️ Work in progress ⚠️

The `setup` script is the easiest way to set up the configurations, see the example of use and the configurations to use it.

Usage: `./setup.sh [OPTIONS...]`

Just pass the options for the settings you want, for example if you want only the zsh configuration then `./setup.sh --zsh`. and in the same way to remove the settings

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

  -o, --omz, --oh-my-zsh
 Set the oh-my-zsh prompt configurations.

  -s, --starship
 Set the starship prompt configurations.

  -r, --remove, -u, --uninstall 
 Removes all selected and installed configurations. 
```

</details>