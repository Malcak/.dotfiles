# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set history configuration
HISTFILE=~/.cache/zsh/.zhistory
HISTSIZE=512
SAVEHIST=512

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
export PYTHON_AUTO_VRUN=true

source $ZSH/oh-my-zsh.sh

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
