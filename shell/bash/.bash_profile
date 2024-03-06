# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

# Added by jetbrains toolbox app
# export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
