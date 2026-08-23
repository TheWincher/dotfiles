#!/bin/bash
set -euo pipefail
echo "--- Starting dotfiles installation ---"

echo "Linux (COSMIC) détecté..."
sudo apt update

# Oh My Zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Homebrew (Linuxbrew)
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zshrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
brew analytics off
brew update

# Paquets CLI (identiques à macOS)
echo "Installing packages..."
brew install zsh-autosuggestions zsh-syntax-highlighting stow fzf bat fd \
  zoxide lua luajit luarocks prettier make ripgrep git lazygit tmux \
  neovim starship tree-sitter tree node nvm sqlite

# Terminal graphique : ghostty et wezterm sont dispo sous Linux
brew install --cask ghostty
# Ou via apt/flatpak selon dispo sur ta distro

# Polices Nerd Font
brew install --cask font-hack-nerd-font font-jetbrains-mono-nerd-font

# Clone dotfiles
if [[ ! -d "$HOME/dotfiles" ]]; then
  git clone https://github.com/TheWincher/dotfiles.git "$HOME/dotfiles"
else
  cd "$HOME/dotfiles" && git pull
fi

cd "$HOME/dotfiles" || exit

stow -R -t ~ nvim starship ghostty tmux zsh fastfetch atuin mpd scripts

echo "Dotfiles setup complete!"
