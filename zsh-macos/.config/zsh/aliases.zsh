# Alias definitions.

# enable color support of ls and also add handy aliases
if [ -x /opt/homebrew/bin/gdircolors ]; then
    test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
    alias gls='gls --color=auto'
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
alias k9s='k9s --readonly -n default'

# some more ls aliases
alias ll='gls -Alvh --group-directories-first --dereference'
alias lln='gls -Alvh --group-directories-first'

# some tree aliases
alias tree='tree -I node_modules'

# some bat aliases
alias bat='/bin/bat --paging=never'
alias batp='/bin/bat'

# terraform aliases
alias tfswitch='tfswitch -b "$HOME/.local/bin/terraform"'
