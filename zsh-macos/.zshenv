# ~/.zshenv: executed by the command interpreter for login shells.
# if $ZDOTDIR is not set, $HOME is used instead.

# If running zsh
if [ -n "$ZSH_VERSION" ]; then
    export ZDOTDIR="$HOME/.config/zsh";
    export ZCACHE="$HOME/.cache/zsh";
    mkdir -p "$ZCACHE"
    mkdir -p "$ZDOTDIR"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Added by rustup install (see https://rustup.rs/)
export RUSTUP_HOME="$HOME/.rustup"; export CARGO_HOME="$HOME/.cargo"; export PATH="$HOME/.cargo/bin:$PATH";

# Added by homebrew install
if command -v /opt/homebrew/bin/brew &> /dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export HOMEBREW_PREFIX=$(brew --prefix)

    # most programs
    export PATH="${HOMEBREW_PREFIX}/bin:$PATH"
    export MANPATH="${HOMEBREW_PREFIX}/share/man:$MANPATH"
    export INFOPATH="${HOMEBREW_PREFIX}/share/info:$INFOPATH"

    # coreutils
    export PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnuman:$MANPATH"

    # make
    export PATH="${HOMEBREW_PREFIX}/opt/make/libexec/gnubin:$PATH"
    export MANPATH="${HOMEBREW_PREFIX}/opt/make/libexec/gnuman:$MANPATH"

    # m4
    export PATH="${HOMEBREW_PREFIX}/opt/m4/bin:$PATH"

    # file-formula
    export PATH="${HOMEBREW_PREFIX}/opt/file-formula/bin:$PATH"

    # unzip
    export PATH="${HOMEBREW_PREFIX}/opt/unzip/bin:$PATH"

    # python
    export PATH="${HOMEBREW_PREFIX}/opt/python/libexec/bin:$PATH"

    # flex
    export PATH="${HOMEBREW_PREFIX}/opt/flex/bin:$PATH"
    export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/flex/lib"
    export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/flex/include"

    # bison
    export PATH="${HOMEBREW_PREFIX}/opt/bison/bin:$PATH"
    export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/bison/lib"

    # libressl
    export PATH="${HOMEBREW_PREFIX}/opt/libressl/bin:$PATH"
    export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/libressl/lib"
    export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/libressl/include"
    export PKG_CONFIG_PATH="${HOMEBREW_PREFIX}/opt/libressl/lib/pkgconfig"

    # ed
    export PATH="${HOMEBREW_PREFIX}/opt/ed/libexec/gnubin:$PATH"

    # findutils
    export PATH="${HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin:$PATH"

    # gnu-indent
    export PATH="${HOMEBREW_PREFIX}/opt/gnu-indent/libexec/gnubin:$PATH"

    # gnu-sed
    export PATH="${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:$PATH"

    # gnu-tar
    export PATH="${HOMEBREW_PREFIX}/opt/gnu-tar/libexec/gnubin:$PATH"

    # gnu-which
    export PATH="${HOMEBREW_PREFIX}/opt/gnu-which/libexec/gnubin:$PATH"

    # grep
    export PATH="${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin:$PATH"
fi
