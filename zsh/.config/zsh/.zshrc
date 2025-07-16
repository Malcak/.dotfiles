# Add locations to PATH
export PATH=/usr/local/bin:$PATH

# Set history configuration
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

HISTFILE=$HOME/.cache/zsh/.zhistory
HISTSIZE=16384
SAVEHIST=16384

# Starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# User configuration

# Variables and Secrets
if [ -f "$ZDOTDIR/variables.zsh" ]; then
    source $ZDOTDIR/variables.zsh
fi

# Alias definitions.
if [ -f "$ZDOTDIR/aliases.zsh" ]; then
    source $ZDOTDIR/aliases.zsh
fi

# Functions
if [ -f "$ZDOTDIR/functions.zsh" ]; then
    source $ZDOTDIR/functions.zsh
fi

# Completions
if [ -f "$ZDOTDIR/completions.zsh" ]; then
    source $ZDOTDIR/completions.zsh
fi

## Set zsh-history-substring-search
if [ -f "/usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
    export HISTORY_SUBSTRING_SEARCH_FUZZY=true
    source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi
## Set zsh-autosuggestions
if [ -f "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    export ZSH_AUTOSUGGEST_STRATEGY=(completion history match_prev_cmd)
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
## Set zsh-syntax-highlighting
if [ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

## Set Atuin history
if [ -f "$HOME/.atuin/bin/env" ]; then
    source "$HOME/.atuin/bin/env"
    eval "$(atuin init zsh --disable-up-arrow)"
fi

## Set key bindings
if [ -f "$ZDOTDIR/bindings.zsh" ]; then
    source $ZDOTDIR/bindings.zsh
fi
