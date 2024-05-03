# ~/.zshenv: executed by the command interpreter for login shells.
# if $ZDOTDIR is not set, $HOME is used instead.

# if running zsh
if [ -n "$ZSH_VERSION" ]; then
    export ZDOTDIR="$HOME/.config/zsh";
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Added by g-install (see https://github.com/stefanmaric/g).
# export GOPATH="$HOME/.devtools/Go"; export GOROOT="$HOME/.devtools/.go"; export PATH="$GOPATH/bin:$PATH";

# Added by n-install (see http://git.io/n-install-repo).
# export N_PREFIX="$HOME/.devtools/Node"; export PATH=":$N_PREFIX/bin:$PATH";

# Added by dvm-install (see https://github.com/justjavac/dvm).
# export DENO_INSTALL="$HOME/.devtools/.deno"; export DVM_DIR="$HOME/.devtools/.dvm"; export PATH="$DENO_INSTALL/bin:$DVM_DIR/bin:$PATH"

# Added by pyenv install (see https://github.com/pyenv/pyenv)
# export PYENV_ROOT="$HOME/.pyenv"; export PATH="$PYENV_ROOT/bin:$PATH"; eval "$(pyenv init --path)";

# Added by rustup install (see https://rustup.rs/)
# export RUSTUP_HOME="$HOME/.devtools/.rustup"; export CARGO_HOME="$HOME/.devtools/.cargo"; export PATH="$HOME/.devtools/.cargo/bin:$PATH";

# Added by flutter install (see https://docs.flutter.dev/get-started/install/linux)
# export FLUTTER_PATH="$HOME/.local/bin/flutter"; export PATH="$FLUTTER_PATH/bin:$PATH";

# Added by linuxbrew install
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Added by kubectl install
# add kubectl completions
# source <(kubectl completion zsh)