> [!IMPORTANT]  
> Do not stow this folder, it's just to store some older features visible for me

# Malcak Dotfiles

...

## Requirements

- [`gum`](https://github.com/charmbracelet/gum)

...

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
