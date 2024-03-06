# purple username
username() {
  echo "%{$fg[magenta]%}@%n%{$reset_color%}"
}

# current dir
directory() {
  echo "%{$fg[cyan]%}%c%{$reset_color%}"
}

# sep
sep() {
  # echo "%(?:%{$fg_bold[green]%}🟢:%{$fg_bold[red]%}🔴)"
  echo "%(?:%{$fg_bold[green]%}●:%{$fg_bold[red]%}●)"
}

# git sep
giticon() {
  echo "%{$fg[red]%}" # git icon
  # echo "%{$fg[white]%}" # github icon
}

PROMPT='%B$(username) $(sep) $(directory) $(git_prompt_info)%b'

ZSH_THEME_GIT_PROMPT_PREFIX="$(giticon) %{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) ⚠️"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
