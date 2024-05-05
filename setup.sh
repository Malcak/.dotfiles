export c_default="\033[0m"
export c_blue="\033[1;34m"
export c_magenta="\033[1;35m"
export c_cyan="\033[1;36m"
export c_green="\033[1;32m"
export c_red="\033[1;31m"
export c_yellow="\033[1;33m"

prompt() {
  case "${1}" in
    "-s")
      echo -e "  ${c_green}${2}${c_default}" ;;    # print success message
    "-e")
      echo -e "  ${c_red}${2}${c_default}" ;;      # print error message
    "-w")
      echo -e "  ${c_yellow}${2}${c_default}" ;;   # print warning message
    "-i")
      echo -e "  ${c_cyan}${2}${c_default}" ;;     # print info message
    "-t")
      echo -e "  ${c_magenta}${2}${c_default}" ;;     # print title message
  esac
}

remove_previous() {
  if [[ -f "${1}" ]]; then
    if [[ "${2}" == "true" ]]; then
      prompt -i "Removing previous file"
      rm -rf "${1}"
    else
      prompt -i "Backing up previous file"
      mv "${1}" "${1}.backup"
    fi
  fi
}

restore_previous() {
  if [[ -h "${1}" ]]; then
    prompt -i "Removing ${1} link"
    rm -f "${1}"

    if [[ -f "${1}.backup" ]]; then
      prompt -i "Restoring the backup file"
      mv "${1}.backup" "${1}"
    else
      prompt -i "Backup file not found"
    fi
  else
    prompt -w "Link ${1} not found"
  fi
}

prompt -t "Installing Malcak Dotfiles!"

readonly DOTFILES_REPO_DIR="$(dirname "$(readlink -m "${0}")")"

# argument parsing
while [[ $# -gt 0 ]]; do
  case "${1}" in
    -r|--remove|-u|--uninstall)
      uninstall="true"; shift ;;
    -f|--hard|--hard-mode)
      is_hard_mode="true"; shift ;;
    -g|--git|--gitconfig)
      git_config="true"; shift ;;
    -z|--zsh)
      zsh_config="true"; shift ;;
    -b|--bash)
      bash_config="true"; shift ;;
    -o|-omz|--oh-my-zsh-theme)
      omz_theme="true"; shift ;;
    -a|--alacritty|--alacritty-config)
      alacritty_config="true"; shift ;;
    -n|-neofetch|--neofetch-config)
      neofetch_config="true"; shift ;;
    -t|-tilix|--oh-my-zsh-theme)
      tilix_theme="true"; shift ;;
    *)
      prompt -e "ERROR: Unrecognized installation option "${1}"."
      prompt_error="true"; shift ;;
  esac
done

if [[ "${prompt_error}" == "true" ]]; then
  prompt -e "Argument parsing with errors, stopping execution"
  exit 1
fi

# git config
if [[ "${git_config}" == "true" ]]; then
  if [[ "${uninstall}" == "true" ]]; then
    prompt -i "Uninstalling git cofig"
    restore_previous "${HOME}/.gitconfig"
    prompt -s "Git config successfully uninstalled"
  else
    prompt -i "Setting up git cofig"
    remove_previous "${HOME}/.gitconfig" "${is_hard_mode}"
    ln -s "${DOTFILES_REPO_DIR}/home/.gitconfig" "${HOME}/.gitconfig"
    prompt -s "Git config set up correctly"
  fi
fi

# zsh
if [[ "${zsh_config}" == "true" ]]; then

  if [[ -z ${ZDOTDIR} ]]; then
    ZSH_CONFIG_DIR="${HOME}/.config/zsh"
  else
    ZSH_CONFIG_DIR="${ZDOTDIR}"
  fi

  if [[ "${uninstall}" == "true" ]]; then
    prompt -i "Uninstalling ZSH cofig"

    restore_previous "${HOME}/.zshenv"
    if [[ -d "${ZSH_CONFIG_DIR}" ]]; then
      restore_previous "${ZSH_CONFIG_DIR}/.zshrc"
      restore_previous "${ZSH_CONFIG_DIR}/.zaliases"
      restore_previous "${ZSH_CONFIG_DIR}/.zlogout"
    fi

    prompt -s "ZSH config successfully uninstalled"
  else
    prompt -i "Setting up ZSH cofig"
    remove_previous "${HOME}/.zshenv" "${is_hard_mode}"

    if [[ -d "${ZSH_CONFIG_DIR}" ]]; then
      remove_previous "${ZSH_CONFIG_DIR}/.zshrc" "${is_hard_mode}"
      remove_previous "${ZSH_CONFIG_DIR}/.zaliases" "${is_hard_mode}"
      remove_previous "${ZSH_CONFIG_DIR}/.zlogout" "${is_hard_mode}"
    else
      mkdir -p "${ZSH_CONFIG_DIR}"
    fi

    if [[ -d "${HOME}/.cache/zsh" ]]; then
      mkdir -p "${HOME}/.cache/zsh"
    fi

    ln -s "${DOTFILES_REPO_DIR}/shell/zsh/.zshenv" "${HOME}/.zshenv"
    ln -s "${DOTFILES_REPO_DIR}/shell/zsh/.zshrc" "${ZSH_CONFIG_DIR}/.zshrc"
    ln -s "${DOTFILES_REPO_DIR}/shell/zsh/.zaliases" "${ZSH_CONFIG_DIR}/.zaliases"
    ln -s "${DOTFILES_REPO_DIR}/shell/zsh/.zlogout" "${ZSH_CONFIG_DIR}/.zlogout"
    prompt -s "ZSH config set up correctly"
  fi
fi