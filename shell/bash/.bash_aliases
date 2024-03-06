# Alias definitions.

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# some more ls aliases
alias ll='ls -Alvh --group-directories-first --dereference'
alias lln='ls -Alvh --group-directories-first'

# some tree aliases
alias tree='tree -I node_modules'

# some cat aliases
# alias cat='/bin/bat --paging=never'
# alias cat='/bin/batcat --paging=never' # for ubuntu
# alias catn='/bin/cat'
# alias catp='/bin/bat'
# alias catp='/bin/batcat' # for ubuntu

# some version manager aliases
# alias gvm="$GOPATH/bin/g"
# alias nvm="$N_PREFIX/bin/n"
# alias pvm="$PYENV_ROOT/bin/pyenv"

# kitty aliases
# alias kssh="kitty +kitten ssh"
# alias icat="kitty +kitten icat"
# alias kdiff="kitty +kitten diff"
# alias ktheme="kitty +kitten themes"
