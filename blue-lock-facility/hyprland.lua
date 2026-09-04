local active_border_color = {
  colors = { "rgba(197DFFF8)", "rgba(65D9FFF2)" },
  angle = 45,
}

local inactive_border_color = "rgba(9AB5D63D)"

hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 10,
    border_size = 2,
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 12,
    shadow = {
      enabled = true,
      range = 24,
      render_power = 3,
      color = "rgba(02040B9E)",
      color_inactive = "rgba(02040B5C)",
    },
    blur = {
      enabled = true,
      size = 6,
      passes = 2,
      vibrancy = 0.18,
      vibrancy_darkness = 0.9,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
    groupbar = {
      font_size = 12,
      font_family = "JetBrains Mono Nerd Font",
      font_weight_active = "ultraheavy",
      font_weight_inactive = "normal",
      indicator_height = 2,
      indicator_gap = 5,
      height = 24,
      gaps_in = 5,
      gaps_out = 0,
      text_color = "rgb(F4F8FF)",
      text_color_inactive = "rgba(F4F8FFA3)",
      col = {
        active = "rgba(050B1870)",
        inactive = "rgba(050B1838)",
      },
      gradients = true,
      gradient_rounding = 12,
      gradient_round_only_edges = false,
    },
  },

  animations = {
    enabled = true,
  },
})

hl.curve("blueLockEase", { type = "bezier", points = { { 0.18, 1 }, { 0.22, 1 } } })
hl.curve("blueLockSnap", { type = "bezier", points = { { 0.16, 0 }, { 0.12, 1 } } })
hl.curve("blueLockLinear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 8, bezier = "blueLockEase" })
hl.animation({ leaf = "border", enabled = true, speed = 4.6, bezier = "blueLockEase" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.4, bezier = "blueLockEase" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.8, bezier = "blueLockEase", style = "popin 92%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.35, bezier = "blueLockLinear", style = "popin 92%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.5, bezier = "blueLockSnap" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.28, bezier = "blueLockSnap" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.6, bezier = "blueLockSnap" })
hl.animation({ leaf = "fadeSwitch", enabled = false })
hl.animation({ leaf = "layers", enabled = true, speed = 3.4, bezier = "blueLockEase" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.6, bezier = "blueLockEase", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.35, bezier = "blueLockLinear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.6, bezier = "blueLockSnap" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.24, bezier = "blueLockSnap" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.0, bezier = "blueLockEase" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.8, bezier = "blueLockEase", style = "slidevert" })

hl.config({
  dwindle = {
    preserve_split = true,
    force_split = 2,
  },

  scrolling = {
    column_width = 0.49,
  },

  master = {
    new_status = "master",
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    disable_scale_notification = true,
    focus_on_activate = true,
    anr_missed_pings = 3,
    on_focus_under_fullscreen = 1,
    initial_workspace_tracking = 0,
    allow_session_lock_restore = true,
  },

  cursor = {
    hide_on_key_press = true,
    warp_on_change_workspace = 1,
  },

  binds = {
    hide_special_on_workspace_change = true,
  },
})

o.window({ tag = "floating-window" }, {
  rounding = 16,
  opacity = "0.98 0.93",
})

o.window({ tag = "pop" }, {
  rounding = 12,
  opacity = "0.98 0.94",
})

o.window(
  "^(org\\.omarchy\\.terminal|org\\.codeberg\\.dnkl\\.foot|com\\.mitchellh\\.ghostty|kitty|alacritty|foot)$",
  {
    opacity = "0.99 0.96",
  }
)

o.window(
  "^(org\\.omarchy\\.screensaver|org\\.omarchy\\.about|xdg-desktop-portal-gtk|imv|mpv|org\\.gnome\\.NautilusPreviewer)$",
  {
    tag = "+floating-window",
  }
)
