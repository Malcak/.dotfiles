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

# general aliases
alias now='date -u "+%Y-%m-%dT%H-%M-%S%Z"'
alias ff='fastfetch'
alias diff='diff -u'

# some more ls aliases
alias ll='ls -Alvh --group-directories-first --dereference'
alias lln='ls -Alvh --group-directories-first'

# some tree aliases
alias tree='tree -I node_modules'

# some bat aliases
alias bat='/bin/bat --paging=never'
alias batp='/bin/bat'

# kitty aliases
alias kssh="kitty +kitten ssh"
alias icat="kitty +kitten icat"
alias kdiff="kitty +kitten diff"
alias ktheme="kitty +kitten themes"

# terraform aliases
alias tfswitch='tfswitch -b "$HOME/.local/bin/terraform"'
