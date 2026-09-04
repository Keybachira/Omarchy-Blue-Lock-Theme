# Blue Lock Facility Omarchy Theme

Blueprint for a full Omarchy desktop theme inspired by a Blue Lock monitoring facility.

## Directory Layout

```text
blue-lock-facility/
  colors.toml
  icons.theme
  shell.toml
  hyprland.lua
  ghostty.conf
  neovim.lua
  vscode.json
  backgrounds/
    blue-lock-monitoring.svg
    blue-lock-login.svg
    blue-lock-lock.svg
  sddm/
    omarchy/
      Main.qml
      metadata.desktop
      theme.conf
```

## Placement

Copy `blue-lock-facility/` to:

```text
~/.config/omarchy/themes/blue-lock-facility/
```

The app configs in this repository live under `config/` and should be copied to the matching `~/.config/...` paths listed in the file headers below.

## Recommended Identity

- Theme slug: `blue-lock-facility`
- Icon theme: `Papirus-Dark` as the safe default, or `Tela-circle-blue` if installed
- Cursor theme: `Bibata-Modern-Ice`
- UI font: `Space Grotesk`
- Terminal font: `JetBrains Mono Nerd Font`

## Apply

```bash
omarchy theme set blue-lock-facility
```

For the extra app configs:

```text
~/.config/waybar/
~/.config/rofi/
~/.config/wlogout/
~/.config/swayosd/
~/.config/gtk-3.0/
~/.config/gtk-4.0/
~/.config/qt5ct/
~/.config/qt6ct/
~/.config/starship.toml
```

Or install everything from this repo in one shot:

```bash
bash scripts/install.sh
```

Then reload the relevant apps:

```bash
omarchy restart shell
omarchy restart terminal
```

## Design Notes

- Left side of the wallpaper stays dark for terminal readability.
- All highlights stay in the blue range.
- Glass surfaces use low-opacity navy with crisp neon borders, not saturated RGB.
- The login screen reuses the same visual language as the lock screen and main wallpaper.
