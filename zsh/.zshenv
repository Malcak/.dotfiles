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

# Added by rustup install (see https://rustup.rs/)
export RUSTUP_HOME="$HOME/.rustup"; export CARGO_HOME="$HOME/.cargo"; export PATH="$HOME/.cargo/bin:$PATH";
