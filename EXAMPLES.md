# Installation examples for each config

### Bash

```sh
# deleting old files is optional
rm ~/.bashrc ~/.bash_profile ~/.profile ~/.bash_aliases ~/.bash_logout
```

```sh
ln -s ~/.dotfiles/shell/bash/.bashrc ~/.bashrc
ln -s ~/.dotfiles/shell/bash/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/shell/bash/.bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/shell/bash/.bash_logout ~/.bash_logout
```

### Zsh

```sh
# deleting old files is optional
rm ~/.zshenv ~/.config/zsh/.zshrc ~/.config/zsh/.zaliases ~/.config/zsh/.zlogout
```

```sh
ln -s ~/.dotfiles/shell/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/shell/zsh/.zshrc ~/.config/zsh/.zshrc
ln -s ~/.dotfiles/shell/zsh/.zaliases ~/.config/zsh/.zaliases
ln -s ~/.dotfiles/shell/zsh/.zlogout ~/.config/zsh/.zlogout
```

### oh-my-zsh Theme

```sh
ln -s ~/.dotfiles/home/oh-my-zsh/themes/malcak.zsh-theme ~/.oh-my-zsh/themes/malcak.zsh-theme
```

### Git

```sh
# deleting old files is optional
rm ~/.gitconfig
```

```sh
ln -s ~/.dotfiles/home/.gitconfig ~/.gitconfig
```

### Tmux

```sh
# deleting old files is optional
rm ~/.tmux.conf
```

```sh
ln -s ~/.dotfiles/home/.tmux.conf ~/.tmux.conf
```

### Alacritty

```sh
# deleting old files is optional
rm ~/.config/alacritty/alacritty.yml
```

```sh
ln -s ~/.dotfiles/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
```

### Btop

```sh
# deleting old files is optional
rm ~/.config/btop/btop.conf
```

```sh
ln -s ~/.dotfiles/config/btop/btop.conf ~/.config/btop/btop.conf
```

### Gedit

```sh
# deleting old files is optional
rm ~/.config/gedit/styles/darcula.xml
```

```sh
ln -s ~/.dotfiles/config/gedit/styles/darcula.xml ~/.config/gedit/styles/darcula.xml
```

### VSCode

```sh
ln -s ~/.dotfiles/config/code/user/settings.json ~/.config/Code/User/settings.json
```

### Gtk-3.0

```sh
# deleting old files is optional
rm ~/.config/gtk-3.0/gtk.css
```

```sh
ln -s ~/.dotfiles/config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css
```

### Qtile

```sh
# deleting old files is optional
rm ~/.config/qtile/config.py
rm ~/.config/qtile/autostart.sh
```

```sh
ln -s ~/.dotfiles/config/qtile/config.py ~/.config/qtile/config.py
ln -s ~/.dotfiles/config/qtile/autostart.sh ~/.config/qtile/autostart.sh
```

### Picom

```sh
# deleting old files is optional
rm ~/.config/picom/picom.conf
```

```sh
ln -s ~/.dotfiles/config/picom/picom.conf ~/.config/picom/picom.conf
```

### Htop

```sh
# deleting old files is optional
rm ~/.config/htop/htoprc
```

```sh
ln -s ~/.dotfiles/config/htop/htoprc ~/.config/htop/htoprc
```

### LSD

```sh
# deleting old files is optional
rm ~/.config/lsd/config.yaml
```

```sh
ln -s ~/.dotfiles/config/lsd/config.yaml ~/.config/lsd/config.yaml
```

### Neofetch

```sh
# deleting old files is optional
rm ~/.config/neofetch/config.conf
```

```sh
ln -s ~/.dotfiles/config/neofetch/config.conf ~/.config/neofetch/config.conf
```

### Rofi

```sh
# deleting old files is optional
rm ~/.config/rofi/config.rasi
# rm ~/.config/rofi/themes/rounded-blue-dark.rasi
```

```sh
ln -s ~/.dotfiles/config/rofi/config.rasi ~/.config/rofi/config.rasi
# ln -s ~/.dotfiles/config/rofi/themes/rounded-blue-dark.rasi ~/.config/rofi/themes/rounded-blue-dark.rasi
```

### Tilix

```sh
# deleting old files is optional
rm ~/.config/tilix/schemes/gruvbox.json
```

```sh
ln -s ~/.dotfiles/config/tilix/schemes/gruvbox.json ~/.config/tilix/schemes/gruvbox.json
```

### Nvim

A better option might be [NvChad](https://nvchad.github.io/)

```sh
# deleting old files is optional
rm ~/.config/nvim
```

```sh
ln -s ~/.dotfiles/config/nvim ~/.config/nvim
```