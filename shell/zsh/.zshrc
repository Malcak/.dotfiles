# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set command completions
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Set history configuration
HISTFILE=~/.cache/zsh/.zhistory
HISTSIZE=1024
SAVEHIST=1024

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Alias definitions.
if [ -f "$ZDOTDIR/.zaliases" ]; then
    . $ZDOTDIR/.zaliases
fi

# execute vte.sh
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi
