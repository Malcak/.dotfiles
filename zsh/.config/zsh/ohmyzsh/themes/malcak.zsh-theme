# execute `spectrum_ls` to get the full color range by number

username() {
  echo "%{$FG[005]%}@%n%{$reset_color%}"
}

directory() {
  current_path=$(pwd)
  case "$current_path" in
    /etc*)
      folder_icon="󱧼 ";;
    /tmp*)
      folder_icon="󰪺 ";;
    $HOME/.config*)
      folder_icon="󱁿 ";;
    $HOME/.ssh*)
      folder_icon="󰉐 ";;
    $HOME/Desktop*)
      folder_icon="󱂵 ";;
    $HOME/Documents*)
      folder_icon="󱧶 ";;
    $HOME/Downloads*)
      folder_icon="󰉍 ";;
    $HOME/Music*)
      folder_icon="󱍙 ";;
    $HOME/Pictures*)
      folder_icon="󰉏 ";;
    $HOME/Public*)
      folder_icon="󱞊 ";;
    $HOME/Templates*)
      folder_icon="󱞞 ";;
    $HOME/Videos*)
      folder_icon="󱧺 ";;
    *)
      folder_icon="󰉋 ";;
  esac
  echo "%{$FG[003]%}$folder_icon%{$FG[004]%}%2~%{$reset_color%}"
}

return_status() {
  # # font safe (dot = \u25cf)
  echo "%(?:%{$FG[002]%}\u25cf:%{$FG[001]%}\u25cf)"
  # nerd fonts (octoicons)
  # echo "%(?:%{$FG[002]%}:%{$FG[001]%})"
}

current_time() {
  echo "%{$FG[007]%}%T%{$reset_color%}"
}

prompt_indicator() {
  echo "%{$FG[008]%}%(!.#.»)%{$reset_color%}"
}

python_version() {
  echo $(python --version | sed 's,Python ,,')
}

line_break() {
  term_name=$(basename "/"$(ps -o cmd -f -p $(cat /proc/$(echo $$)/stat | cut -d \  -f 4) | tail -1 | sed 's/ .*$//'))
  if [[ "$term_name" != "warp" ]]; then
    echo "
\b"
  else
    echo ""
  fi
}

# git prompt info
# keep a white space in the end of the suffix
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[009]%}󰊢 %{$FG[242]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[009]%}%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[003]%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[002]%} "

# virtualenv prompt info
ZSH_THEME_VIRTUALENV_PREFIX="via %{$FG[003]%}py $(python_version) ("
ZSH_THEME_VIRTUALENV_SUFFIX=")%{$reset_color%} "

PROMPT='$(username) $(return_status) $(directory) %B$(git_prompt_info)%b$(virtualenv_prompt_info)$(line_break)$(prompt_indicator) '

# current time in the right prompt
# RPROMPT='$(current_time)'

# total execution time in the right prompt
function preexec() {
  timer="$(print -P %D{%s%3.})"
}

function precmd() {
  timeprompt=""	
  if [ "$timer" ]; then
    now="$(print -P %D{%s%3.})"
    local d_ms="$(($now - $timer))"
    local d_s="$((d_ms / 1000))"
    local ms="$((d_ms % 1000))"
    local s="$((d_s % 60))"
    local m="$(((d_s / 60) % 60))"
    local h="$((d_s / 3600))"

    if   ((h > 0)); then timeprompt=${h}h${m}m${s}s
    elif ((m > 0)); then timeprompt=${m}m${s}.$(printf $(($ms / 100)))s # 1m12.3s
    elif ((s > 9)); then timeprompt=${s}.$(printf %02d $(($ms / 10)))s # 12.34s
    elif ((s > 0)); then timeprompt=${s}.$(printf %03d $ms)s # 1.234s
    else timeprompt=${ms}ms
    fi
    timeprompt="took %B%{$FG[003]%}${timeprompt}%{$reset_color%}"
    unset timer
  else
    timeprompt="%B%{$FG[003]%} %f%b"
  fi
  export RPROMPT="${timeprompt} - $(current_time) "
}