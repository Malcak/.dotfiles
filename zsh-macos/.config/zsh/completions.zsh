# Load more completions from https://github.com/zsh-users/zsh-completions
# in case of zsh compinit: insecure directories, run compaudit for list.
# sudo chmod -R 755 $HOMEBREW_PREFIX/share
# sudo chown -R ${USER}:admin $HOMEBREW_PREFIX/share
fpath=($HOMEBREW_PREFIX/share/zsh-completions/ $fpath)

# Should be called before compinit
zmodload zsh/complist

autoload -U compinit; compinit
# autoload -U +X bashcompinit
_comp_options+=(globdots) # With hidden files

# Options

setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt NO_CASE_GLOB         # Case-insensitive globbing

# Zstyles

# Ztyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZCACHE/.zcompcache"

# Allow you to select in a menu
zstyle ':completion:*' menu select 
# zstyle ':completion:*' menu select search # for fuzzy-search within the completion menu

# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true

# Autocomplete files in modification order
# zstyle ':completion:*' file-sort modification

# Completion menu formats
zstyle ':completion:*:*:*:*:corrections'  format ' %F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format ' %F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages'     format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings'     format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
# zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''

zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# See ZSHCOMPWID "completion matching control"
# Used for case-insensitive, partial word completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Completion of files and directories like `ls -l`
# zstyle ':completion:*' file-list all 

zstyle ':completion:*' keep-prefix true

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
