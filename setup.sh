#!/usr/bin/env bash

[[ -n "${ENABLE_DEBUG+x}" ]] && set -x

# functions
remove_previous() {
  # $1: file to remove
  # $2: hard mode flag. if it's set to true, the existing config file will be
  # remove. if it's set to false, the existing config will be backup

  if [[ -f "${1}" ]]; then
    gum log -s -l info "Existing config file found." file "${1}"
    if [[ "${2}" == "true" ]]; then
      [[ -n "${ENABLE_DEBUG+x}" ]] && gum log -l debug "Hard mode is enabled."
      gum log -s -l info "Removing existing config file." file "${1}"
      rm -rf "${1}"
    else
      [[ -n "${ENABLE_DEBUG+x}" ]] && gum log -l debug "Hard mode is disabled."
      gum log -l info "Backing up existing config file." file "${1}.backup"
      mv "${1}" "${1}.backup"
    fi
  fi
}

restore_previous() {
  # $1: symbolic link to remove

  if [[ -h "${1}" ]]; then
    gum log -s -l info "Removing existing symbolic link." file "${1}"
    rm -f "${1}"

    if [[ -f "${1}.backup" ]]; then
      gum log -l info "Backup file found."
      gum log -s -l info "Restoring backup file." file "${1}.backup"
      mv "${1}.backup" "${1}"
    else
      gum log -s -l info "Backup file not found." file "${1}.backup"
    fi
  else
    gum log -s -l warn "Symbolic link not found." file "${1}"
  fi
}

install_config() {
  # $1: source
  # $2: destination

  gum log -s -l info "Creating symbolic link." file "${2}"
  ln -s "${1}" "${2}"
}

# pre-checks
if ! command -v gum &> /dev/null; then
    echo "gum is not installed."
    echo "gum is required, you can install gum from https://github.com/charmbracelet/gum"
    exit 1
fi

# variables
USER=${USER:-$(id -u -n)}
## POSIX
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
## macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"

# script start
gum style \
	--foreground 105 --border-foreground 057 --bold --border rounded \
	--align center --width 40 --margin "0 0" --padding "1 2" \
  'Installing Malcak Dotfiles!'

readonly DOTFILES_REPO_PATH="$(dirname "$(readlink -m "${0}")")"
gum log -s -l info "dotfiles repo directory found." path $DOTFILES_REPO_PATH

# argument parsing
while [[ $# -gt 0 ]]; do
  case "${1}" in
    -i|--interactive|--interactive-mode)
      interactive="true"; shift ;;
    -f|--hard|--hard-mode)
      is_hard_mode="true"; shift ;;
    -d|--debug|--debug-mode)
      ENABLE_DEBUG="true"; shift ;;
    -g|--git|--gitconfig)
      git_config="true"; shift ;;
    -z|--zsh)
      zsh_config="true"; shift ;;
    -b|--bash)
      bash_config="true"; shift ;;
    -o|--omz|--oh-my-zsh)
      omz="true"; shift ;;
    -s|--starship)
      starship="true"; shift ;;
    -a|--alacritty)
      alacritty_config="true"; shift ;;
    -k|--kitty)
      kitty="true"; shift ;;
    -t|--tilix)
      tilix_theme="true"; shift ;;
    -n|--neofetch)
      neofetch_config="true"; shift ;;
    -r|--remove|-u|--uninstall)
      uninstall="true"; shift ;;
    *)
      gum log -s -l error "Unrecognized installation argument." argument "'${1}'"
      prompt_error="true"; shift ;;
  esac
done

if [[ "${prompt_error}" == "true" ]]; then
  gum log -l fatal "Argument parsing with errors, stopping execution."
  exit 1
fi

# interactive mode
if [[ "${interactive}" == "true" ]]; then
  gum log -l debug "Interactive mode is enabled."

fi

if [[ "${is_hard_mode}" == "true" ]]; then
  gum log -l warn "Hard mode is enabled. Existing config files for the selected tools will be removed."
fi

# git config
if [[ "${git_config}" == "true" ]]; then
  if [[ "${uninstall}" == "true" ]]; then
    gum log -l info "Uninstalling Git cofig."
    restore_previous "${HOME}/.gitconfig"
    gum log -l info "Git config successfully uninstalled."
  else
    gum log -l info "Setting up Git cofig."
    remove_previous "${HOME}/.gitconfig" "${is_hard_mode}"
    install_config "${DOTFILES_REPO_PATH}/home/.gitconfig" "${HOME}/.gitconfig"
    gum log -l info "Git config is set up."
  fi
fi

# zsh config
if [[ "${zsh_config}" == "true" ]]; then

  ZSH_CONFIG_DIR="${ZDOTDIR:-${HOME}/.config/zsh}"

  if [[ "${uninstall}" == "true" ]]; then
    gum log -l info "Uninstalling ZSH cofig."

    restore_previous "${HOME}/.zshenv"
    if [[ -d "${ZSH_CONFIG_DIR}" ]]; then
      gum log -s -l info "Config dir found." file "${ZSH_CONFIG_DIR}"
      restore_previous "${ZSH_CONFIG_DIR}/.zshrc"
      restore_previous "${ZSH_CONFIG_DIR}/.zaliases"
      restore_previous "${ZSH_CONFIG_DIR}/.zlogout"
    fi

    gum log  -l info "ZSH config successfully uninstalled."
  else
    gum log -l info "Setting up ZSH cofig."
    remove_previous "${HOME}/.zshenv" "${is_hard_mode}"

    if [[ -d "${ZSH_CONFIG_DIR}" ]]; then
      gum log -s -l info "Config dir found." file "${ZSH_CONFIG_DIR}"
      remove_previous "${ZSH_CONFIG_DIR}/.zshrc" "${is_hard_mode}"
      remove_previous "${ZSH_CONFIG_DIR}/.zaliases" "${is_hard_mode}"
      remove_previous "${ZSH_CONFIG_DIR}/.zlogout" "${is_hard_mode}"
    else
      gum log -l info "Config dir not found."
      gum log -s -l info "Creating config dir." file "${ZSH_CONFIG_DIR}"
      mkdir -p "${ZSH_CONFIG_DIR}"
    fi

    if [[ -d "${HOME}/.cache/zsh" ]]; then
      gum log -l info "Cache dir not found."
      gum log -s -l info "Creating cache dir." file "${HOME}/.cache/zsh"
      mkdir -p "${HOME}/.cache/zsh"
    fi

    install_config "${DOTFILES_REPO_PATH}/shell/zsh/.zshenv" "${HOME}/.zshenv"
    install_config "${DOTFILES_REPO_PATH}/shell/zsh/.zshrc" "${ZSH_CONFIG_DIR}/.zshrc"
    install_config "${DOTFILES_REPO_PATH}/shell/zsh/.zaliases" "${ZSH_CONFIG_DIR}/.zaliases"
    install_config "${DOTFILES_REPO_PATH}/shell/zsh/.zlogout" "${ZSH_CONFIG_DIR}/.zlogout"
    gum log -l info "ZSH config is set up."
  fi
fi
