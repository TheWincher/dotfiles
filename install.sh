#!/bin/bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"

link() {
  src="$DOTFILES_DIR/$1"
  dest="$HOME/$2"

  echo "Linking $dest -> $src"
  mkdir -p "$(dirname "$dest")"
  ln -sf "$src" "$dest"
}

link "wezterm/.wezterm.lua" ".wezterm.lua"
link "zsh/.zshrc" ".zshrc"
link "nvim/.config/nvim" ".config/nvim"
