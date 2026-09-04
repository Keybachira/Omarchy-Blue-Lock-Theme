#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
theme_src="$repo_root/blue-lock-facility"
config_src="$repo_root/config"

install_dir() {
  local src="$1"
  local dst="$2"
  mkdir -p "$dst"
  cp -R "$src"/. "$dst"/
}

echo "Installing Omarchy theme to ~/.config/omarchy/themes/blue-lock-facility"
install_dir "$theme_src" "$HOME/.config/omarchy/themes/blue-lock-facility"

echo "Installing app configs"
install_dir "$config_src/waybar" "$HOME/.config/waybar"
install_dir "$config_src/rofi" "$HOME/.config/rofi"
install_dir "$config_src/wlogout" "$HOME/.config/wlogout"
install_dir "$config_src/swayosd" "$HOME/.config/swayosd"
install_dir "$config_src/gtk-3.0" "$HOME/.config/gtk-3.0"
install_dir "$config_src/gtk-4.0" "$HOME/.config/gtk-4.0"
install_dir "$config_src/qt5ct" "$HOME/.config/qt5ct"
install_dir "$config_src/qt6ct" "$HOME/.config/qt6ct"
install_dir "$config_src/btop" "$HOME/.config/btop"
install_dir "$config_src/foot" "$HOME/.config/foot"

cp "$config_src/starship.toml" "$HOME/.config/starship.toml"

echo "Done."
