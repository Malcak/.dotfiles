### posh config file
# follow this tutorial to install all deps
# https://www.youtube.com/watch?v=5-aK2_WwrmM 
# install oh-my-posh and add a security exclution to
# remove the lagged prompt
# exclude "oh-my-posh" process
# exclude "C:\Users\User\scoop" folder
# exclude "C:\Users\User\AppData\oh-my-posh" folder
# in your $PROFILE set the next line
# . $env:USERPROFILE\.dotfiles\shell\posh\user_profile.ps1
# in oh-my-posh execution expression set the next flag
# --config "~/.dotfiles/home/oh-my-posh/malcak.omp.json"
# or the path in which you have the theme

# Prompt
Import-Module posh-git

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
