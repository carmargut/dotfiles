#!/usr/bin/env bash

set -e

DOTFILES_REPO="https://github.com/carmargut/dotfiles"
DOTFILES_DIR="$HOME/.dotfiles"

is_executable() {
  type "$1" > /dev/null 2>&1
}

detect_os() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macos"
  elif [[ -f /etc/debian_version ]]; then
    echo "ubuntu"
  else
    echo "unknown"
  fi
}

install_deps_macos() {
  if ! is_executable brew; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  brew install zsh starship zsh-autosuggestions zsh-completions zsh-syntax-highlighting

  if ! is_executable nvm; then
    brew install nvm
  fi
}

install_deps_ubuntu() {
  sudo apt update
  sudo apt install -y zsh curl zsh-autosuggestions zsh-syntax-highlighting

  if [[ ! -d "${ZSH_COMPLETIONS_DIR:-/usr/local/share/zsh-completions}" ]]; then
    sudo git clone https://github.com/zsh-users/zsh-completions /usr/local/share/zsh-completions
  fi

  if ! is_executable starship; then
    curl -sS https://starship.rs/install.sh | sh -s -- --yes
  fi

  if [[ ! -d "$HOME/.nvm" ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  fi
}

clone_dotfiles() {
  if [[ -d "$DOTFILES_DIR" ]]; then
    echo "Dotfiles already cloned, pulling latest..."
    git -C "$DOTFILES_DIR" pull
  elif is_executable git; then
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
  elif is_executable curl; then
    mkdir -p "$DOTFILES_DIR"
    curl -#L "$DOTFILES_REPO/tarball/master" | tar -xzv -C "$DOTFILES_DIR" --strip-components=1 --exclude='.gitignore'
  elif is_executable wget; then
    mkdir -p "$DOTFILES_DIR"
    wget --no-check-certificate -O - "$DOTFILES_REPO/tarball/master" | tar -xzv -C "$DOTFILES_DIR" --strip-components=1 --exclude='.gitignore'
  else
    echo "No git, curl or wget available. Aborting."
    exit 1
  fi
}

link_dotfiles() {
  local files=(.zshrc .vimrc .gitconfig)

  for file in "${files[@]}"; do
    local src="$DOTFILES_DIR/$file"
    local dst="$HOME/$file"
    if [[ -f "$src" ]]; then
      ln -sf "$src" "$dst"
      echo "Linked $file"
    fi
  done

  mkdir -p "$HOME/.config"
  ln -sf "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
  echo "Linked starship.toml"
}

set_default_shell() {
  local zsh_path
  zsh_path=$(which zsh)

  if [[ "$SHELL" != "$zsh_path" ]]; then
    if ! grep -qF "$zsh_path" /etc/shells; then
      echo "$zsh_path" | sudo tee -a /etc/shells
    fi
    chsh -s "$zsh_path"
    echo "Default shell set to zsh"
  fi
}

main() {
  local os
  os=$(detect_os)

  echo "Detected OS: $os"

  case "$os" in
    macos)  install_deps_macos ;;
    ubuntu) install_deps_ubuntu ;;
    *)      echo "Unsupported OS. Install zsh and starship manually." ;;
  esac

  clone_dotfiles
  link_dotfiles
  set_default_shell

  echo ""
  echo "Done. Open a new terminal or run: exec zsh"
}

main
