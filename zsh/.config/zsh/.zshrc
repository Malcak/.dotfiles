# Add locations to PATH
export PATH=/usr/local/bin:$PATH

# Set command completions
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Set case-insensitive completions
setopt NO_CASE_GLOB
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Set history configuration
HISTFILE=~/.cache/zsh/.zhistory
HISTSIZE=8192
SAVEHIST=8192

# execute vte.sh for tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# Prompt configuration
prefered_prompt="starship" # options: starship, ohmyzsh

config_starship() {
    # Starship prompt
    if command -v starship &> /dev/null; then
        eval "$(starship init zsh)"
    fi
}

config_omz() {
    # Path to your oh-my-zsh installation.
    export ZSH="$ZDOTDIR/ohmyzsh"

    # Set name of the theme
    ZSH_THEME="robbyrussell"
    # ZSH_THEME="malcak"

    # Uncomment the following line to use case-sensitive completion.
    # CASE_SENSITIVE="true"

    # Uncomment the following line if you want to disable marking untracked files
    # under VCS as dirty. This makes repository status check for large repositories
    # much, much faster.
    DISABLE_UNTRACKED_FILES_DIRTY="true"

    # Would you like to use another custom folder than $ZSH/custom?
    # ZSH_CUSTOM=/path/to/new-custom-folder

    # Which plugins would you like to load?
    # Standard plugins can be found in $ZSH/plugins/
    # Custom plugins may be added to $ZSH_CUSTOM/plugins/
    # Example format: plugins=(rails git textmate ruby lighthouse)
    # Add wisely, as too many plugins slow down shell startup.
    plugins=(
        git
        # docker
        # kubectl
        # python
        # virtualenv
    )

    # Python plugin configuration
    # Uncomment the following line to automatically activate the venv virtual
    # environment when entering a directory containing `<venv-name>/bin/activate`,
    # and automatically deactivate it when navigating out of it.
    # export PYTHON_AUTO_VRUN=true

    source $ZSH/oh-my-zsh.sh
}

case "${prefered_prompt}" in
    starship)
        config_starship ;;
    ohmyzsh)
        config_omz ;;
esac

# User configuration
## zsh-history-substring-search
if [ -f "/usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
    export HISTORY_SUBSTRING_SEARCH_FUZZY=true
    source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi
## zsh-autosuggestions
if [ -f "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    export ZSH_AUTOSUGGEST_STRATEGY=(completion history match_prev_cmd)
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
## zsh-syntax-highlighting
if [ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

## atuin history
if [ -f "$HOME/.atuin/bin/env" ]; then
    source "$HOME/.atuin/bin/env"
    eval "$(atuin init zsh --disable-up-arrow)"
fi

# Alias definitions.
if [ -f "$ZDOTDIR/.zaliases.zsh" ]; then
    source $ZDOTDIR/.zaliases.zsh
fi

# Variables ans Secrets
if [ -f "$ZDOTDIR/.zvariables.zsh" ]; then
    source $ZDOTDIR/.zvariables.zsh
fi

# Enable natural text editing
# Move to the beginning of the line. `ALT + LEFT ARROW`:
bindkey "^[[1;3D" beginning-of-line
# Move to the end of the line. `ALT + RIGHT ARROW`:
bindkey "^[[1;3C" end-of-line
# Move to the beginning of the previous word. `CTRL + LEFT ARROW`:
bindkey "^[[1;5D" backward-word
# Move to the beginning of the next word. `CTRL + RIGHT ARROW`:
bindkey "^[[1;5C" forward-word
# Delete the word behind the cursor. `CTRL + BACKSPACE`:
bindkey "^H" backward-kill-word
# Delete the next word after the cursor. `CTRL + DEL`:
bindkey "^[[3;5~" kill-word
# Delete the line behind the cursor. `ALT + BACKSPACE`:
bindkey "^[^?" backward-kill-line
# Delete the everything after the cursor. `ALT + DEL`:
bindkey "^[[3;3~" kill-line
