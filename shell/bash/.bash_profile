# ~/.profile: executed by the command interpreter for login shells.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Added by g-install (see https://github.com/stefanmaric/g).
# export GOPATH="$HOME/.devtools/Go"; export GOROOT="$HOME/.devtools/.go"; export PATH="$GOPATH/bin:$PATH";

# Added by pyenv install (see https://github.com/pyenv/pyenv)
# export PYENV_ROOT="$HOME/.pyenv"; export PATH="$PYENV_ROOT/bin:$PATH"; eval "$(pyenv init --path)";

# Added by n-install (see http://git.io/n-install-repo).
# export N_PREFIX="$HOME/.devtools/Node"; export PATH=":$N_PREFIX/bin:$PATH";

# Added by rustup install (see https://rustup.rs/)
# export RUSTUP_HOME="$HOME/.devtools/.rustup"; export CARGO_HOME="$HOME/.devtools/.cargo"; export PATH="$HOME/.devtools/.cargo/bin:$PATH";

# Added by kubectl install
# add kubectl completions
# source <(kubectl completion zsh)
