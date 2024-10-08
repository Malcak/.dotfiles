#!/usr/bin/env bash

[[ -n "${ENABLE_DEBUG+x}" ]] && set -x

# functions
remove_previous() {
  # $1: file to remove
  # $2: dry mode flag. if it's set to true, no real action will be performed
  # $3: hard mode flag. if it's set to true, the existing config file will be
  # remove. if it's set to false, the existing config will be backup

  if [[ -f "${1}" ]]; then
    gum log -s -l info "Existing config file found." file "${1}"
    if [[ "${3}" == "true" ]]; then
      [[ -n "${ENABLE_DEBUG+x}" ]] && gum log -l debug "Hard mode is enabled."
      gum log -s -l info "Removing existing config file." file "${1}"
      [[ "${2}" != "true" ]] && rm -rf "${1}"
    else
      [[ -n "${ENABLE_DEBUG+x}" ]] && gum log -l debug "Hard mode is disabled."
      gum log -s -l info "Backing up existing config file." src "${1}" dst "${1}.backup"
      [[ "${2}" != "true" ]] && mv "${1}" "${1}.backup"
    fi
  fi
}

restore_previous() {
  # $1: symbolic link to remove
  # $2: dry mode flag. if it's set to true, no real action will be performed

  if [[ -h "${1}" ]]; then
    gum log -s -l info "Removing existing symbolic link." file "${1}"
    [[ "${2}" != "true" ]] && rm -f "${1}"

    if [[ -f "${1}.backup" ]]; then
      gum log -l info "Backup file found."
      gum log -s -l info "Restoring backup file." src "${1}.backup" dst "${1}"
      [[ "${2}" != "true" ]] && mv "${1}.backup" "${1}"
    else
      gum log -s -l info "Backup file not found." file "${1}.backup"
    fi
  else
    gum log -s -l warn "Symbolic link not found." file "${1}"
  fi
}

create_dir() {
  # $1: full path
  # $2: dry mode flag. if it's set to true, no real action will be performed
  gum log -s -l info "Creating directory." file "${1}"
  [[ "${2}" != "true" ]] && mkdir -p "${1}"
}

install_config() {
  # $1: source
  # $2: destination
  # $3: dry mode flag. if it's set to true, no real action will be performed

  gum log -s -l info "Creating symbolic link." src "${1}" dst "${2}"
  [[ "${3}" != "true" ]] && ln -s "${1}" "${2}"
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
      interactive_mode="true"; shift ;;
    -d|--dry|--dry-mode)
      is_dry_mode="true"; shift ;;
    -f|--hard|--hard-mode)
      is_hard_mode="true"; shift ;;
    -D|--debug|--debug-mode)
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
if [[ "${interactive_mode}" == "true" ]]; then
  [[ -n "${ENABLE_DEBUG+x}" ]] && gum log -l debug "Interactive mode is enabled."

  gum confirm "Do you want to run in dry-mode? (No real actions will be taken)" && is_dry_mode="true"
  [[ "${is_dry_mode}" == "true" ]] && gum log -l warn "Dry mode is enabled. No real action will be performed."

  gum confirm --default=false "Do you want to run in hard-mode (No backup mode >:^))?" && is_hard_mode="true"

  action=$(gum choose --limit 1 --header "What do you like to do?" "Install!" "Uninstall :c")
  [[ "${action}" == "Uninstall :c" ]] && uninstall="true"

  config_list=$(gum choose --no-limit --header "Which configs do you want to install?" "git" "zsh" "bash" "oh-my-zsh" "starship" "alacritty" "kitty" "tilix" "neofetch")
  while IFS= read -r tool; do
    case "${tool}" in
      git)
        git_config="true"; shift ;;
      zsh)
        zsh_config="true"; shift ;;
      bash)
        bash_config="true"; shift ;;
      oh-my-zsh)
        omz="true"; shift ;;
      starship)
        starship="true"; shift ;;
      alacritty)
        alacritty_config="true"; shift ;;
      kitty)
        kitty="true"; shift ;;
      tilix)
        tilix_theme="true"; shift ;;
      neofetch)
        neofetch_config="true"; shift ;;
    esac
  done <<< "$config_list"
fi

if [[ "${is_hard_mode}" == "true" ]]; then
  if [[ "${is_dry_mode}" == "true" ]]; then
    gum log -l info "Hard mode and Dry mode are enabled. No files will be deleted."
  else
    gum log -l warn "Hard mode is enabled. Existing config files for the selected tools will be removed."
  fi
fi

# git config
if [[ "${git_config}" == "true" ]]; then
  if [[ "${uninstall}" == "true" ]]; then
    gum log -l info "Uninstalling Git cofig."
    restore_previous "${HOME}/.gitconfig" "${is_dry_mode}"
    gum log -l info "Git config successfully uninstalled."
  else
    gum log -l info "Setting up Git cofig."
    remove_previous "${HOME}/.gitconfig" "${is_dry_mode}" "${is_hard_mode}"
    install_config "${DOTFILES_REPO_PATH}/home/.gitconfig" "${HOME}/.gitconfig" "${is_dry_mode}"
    gum log -l info "Git config is set up."
  fi
fi

# zsh config
if [[ "${zsh_config}" == "true" ]]; then

  ZSH_CONFIG_DIR="${ZDOTDIR:-${HOME}/.config/zsh}"

  if [[ "${uninstall}" == "true" ]]; then
    gum log -l info "Uninstalling ZSH cofig."

    restore_previous "${HOME}/.zshenv" "${is_dry_mode}"
    if [[ -d "${ZSH_CONFIG_DIR}" ]]; then
      gum log -s -l info "Config dir found." file "${ZSH_CONFIG_DIR}"
      restore_previous "${ZSH_CONFIG_DIR}/.zshrc" "${is_dry_mode}"
      restore_previous "${ZSH_CONFIG_DIR}/.zaliases" "${is_dry_mode}"
      restore_previous "${ZSH_CONFIG_DIR}/.zlogout" "${is_dry_mode}"
    fi

    gum log  -l info "ZSH config successfully uninstalled."
  else
    gum log -l info "Setting up ZSH cofig."
    remove_previous "${HOME}/.zshenv" "${is_dry_mode}" "${is_hard_mode}"

    if [[ -d "${ZSH_CONFIG_DIR}" ]]; then
      gum log -s -l info "Config dir found." file "${ZSH_CONFIG_DIR}"
      remove_previous "${ZSH_CONFIG_DIR}/.zshrc" "${is_dry_mode}" "${is_hard_mode}"
      remove_previous "${ZSH_CONFIG_DIR}/.zaliases" "${is_dry_mode}" "${is_hard_mode}"
      remove_previous "${ZSH_CONFIG_DIR}/.zlogout" "${is_dry_mode}" "${is_hard_mode}"
    else
      gum log -l info "Config dir not found."
      create_dir "${ZSH_CONFIG_DIR}" "${is_dry_mode}"
    fi

    if [[ ! -d "${HOME}/.cache/zsh" ]]; then
      gum log -l info "Cache dir not found."
      create_dir "${HOME}/.cache/zsh" "${is_dry_mode}"
    fi

    install_config "${DOTFILES_REPO_PATH}/shell/zsh/.zshenv" "${HOME}/.zshenv" "${is_dry_mode}"
    install_config "${DOTFILES_REPO_PATH}/shell/zsh/.zshrc" "${ZSH_CONFIG_DIR}/.zshrc" "${is_dry_mode}"
    install_config "${DOTFILES_REPO_PATH}/shell/zsh/.zaliases" "${ZSH_CONFIG_DIR}/.zaliases" "${is_dry_mode}"
    install_config "${DOTFILES_REPO_PATH}/shell/zsh/.zlogout" "${ZSH_CONFIG_DIR}/.zlogout" "${is_dry_mode}"
    gum log -l info "ZSH config is set up."
  fi
fi

# bash config
if [[ "${bash_config}" == "true" ]]; then

  if [[ "${uninstall}" == "true" ]]; then
    gum log -l info "Uninstalling Bash cofig."

    restore_previous "${HOME}/.bashrc" "${is_dry_mode}"
    restore_previous "${HOME}/.bash_profile" "${is_dry_mode}"
    restore_previous "${HOME}/.bash_aliases" "${is_dry_mode}"
    restore_previous "${HOME}/.bash_logout" "${is_dry_mode}"

    gum log  -l info "Bash config successfully uninstalled."
  else
  
    gum log -l info "Setting up Bash cofig."

    remove_previous "${HOME}/.bashrc" "${is_dry_mode}" "${is_hard_mode}"
    remove_previous "${HOME}/.bash_profile" "${is_dry_mode}" "${is_hard_mode}"
    remove_previous "${HOME}/.bash_aliases" "${is_dry_mode}" "${is_hard_mode}"
    remove_previous "${HOME}/.bash_logout" "${is_dry_mode}" "${is_hard_mode}"
    install_config "${DOTFILES_REPO_PATH}/shell/bash/.bashrc" "${HOME}/.bashrc" "${is_dry_mode}"
    install_config "${DOTFILES_REPO_PATH}/shell/bash/.bash_profile" "${HOME}/.bash_profile" "${is_dry_mode}"
    install_config "${DOTFILES_REPO_PATH}/shell/bash/.bash_aliases" "${HOME}/.bash_aliases" "${is_dry_mode}"
    install_config "${DOTFILES_REPO_PATH}/shell/bash/.bash_logout" "${HOME}/.bash_logout" "${is_dry_mode}"

    gum log -l info "Bash config is set up."
  fi
fi

# oh-my-zsh config
if [[ "${omz}" == "true" ]]; then
  if [[ -d "${ZSH}" ]]; then
    if [[ "${uninstall}" == "true" ]]; then
      gum log -l info "Uninstalling oh-my-zsh cofig."
      restore_previous "${ZSH}/themes/malcak.zsh-theme" "${is_dry_mode}"
      gum log -l info "Oh-my-zsh config successfully uninstalled."
    else
      gum log -l info "Setting up oh-my-zsh cofig."
      remove_previous "${ZSH}/themes/malcak.zsh-theme" "${is_dry_mode}" "${is_hard_mode}"
      install_config "${DOTFILES_REPO_PATH}/home/oh-my-zsh/themes/malcak.zsh-theme" "${ZSH}/themes/malcak.zsh-theme" "${is_dry_mode}"
      gum log -l info "Oh-my-zsh config is set up."
    fi
  else
    gum log -l error "Oh-my-zsh is not installed. Skipping this installation."
  fi
fi

# starship config
if [[ "${starship}" == "true" ]]; then
  if [[ "${uninstall}" == "true" ]]; then
    gum log -l info "Uninstalling Starship cofig."
    restore_previous "${HOME}/.config/starship.toml" "${is_dry_mode}"
    gum log -l info "Starship config successfully uninstalled."
  else
    gum log -l info "Setting up Starship cofig."
    remove_previous "${HOME}/.config/starship.toml" "${is_dry_mode}" "${is_hard_mode}"
    install_config "${DOTFILES_REPO_PATH}/config/starship.toml" "${HOME}/.config/starship.toml" "${is_dry_mode}"
    gum log -l info "Starship config is set up."
  fi
fi
