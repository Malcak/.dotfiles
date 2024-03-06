# Neovim Configs

![Neovim](https://i.imgur.com/2FLRe5J.png)

## Dependencies

To use this neovim configuration first install the dependencies

```bash
# Vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Runtimes
sudo apt install nodejs npm python3 python3-pip

# Packages
python3 -m pip install neovim
sudo npm i -g neovim
```

Now open neovim and execute :PlugInstall. Close neovim, and next time you open it all my configs should be applied.

## Remaps

| Key              | Action                               |
| ---------------- | ------------------------------------ |
| **jklñ**         | Navigate through the buffer          |
| **space + [jñ]** | Move to the next and previous buffer |
| **space + q**    | Close current buffer                 |
| **space + e**    | Open the init.vim file               |
| **ctrl + s**     | Save                                 |
| **ctrl + t**     | Open the terminal (bash)             |
| **vv**           | Open a vertical split                |
| **ss**           | Open a horizontal split              |
| **qq**           | Close split                          |

## Plugin keybinds

| Key              | Action                                     |
| ---------------- | ------------------------------------------ |
| **space + b**    | Open / Close Nerdtree                      |
| **space + B**    | Open NerdTree on the buffer you’re editing |
| **space + ff**   | Fuzzy Files                                |
| **space + fo**   | Fuzzy Buffers                              |
| **space + fl**   | Fuzzy Buffer Lines                         |
| **space + fs**   | Fuzzy Git Files                            |
| **space + fg**   | Fuzzy Git Branches                         |
| **ctrl + space** | Trigger completion                         |
| **gd**           | Go to definition                           |
| **gy**           | Go to type definition                      |
| **gi**           | Go to implementation                       |
| **gr**           | Go to references                           |
| **k**            | Show documentation                         |
| **F2**           | Rename current word                        |
| **ctrl + d**     | Simulating multiple cursors                |
| **space + x**    | Convert visual selected code to snippet    |

## References

- [https://github.com/stsewd/dotfiles](https://github.com/stsewd/dotfiles)
- [https://github.com/victormours/dotfiles](https://github.com/victormours/dotfiles)
- [https://github.com/nschurmann/configs](https://github.com/nschurmann/configs)
- [https://github.com/antoniosarosi/dotfiles](https://github.com/antoniosarosi/dotfiles)
