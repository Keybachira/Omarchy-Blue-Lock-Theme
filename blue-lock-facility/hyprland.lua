-- BLUE LOCK FACILITY — Egoist Edition
-- Facility brutalista + holograma hexagonal. Bordas = neon de estádio.
local active_border_color = {
  colors = { "rgba(0066FFF8)", "rgba(00E5FFF2)", "rgba(7B61FFEE)" },
  angle = 35,
}

local inactive_border_color = "rgba(7AA0C82E)"

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 14,
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
    rounding = 14,
    shadow = {
      enabled = true,
      range = 32,
      render_power = 4,
      color = "rgba(00030AEE)",
      color_inactive = "rgba(00030A66)",
    },
    blur = {
      enabled = true,
      size = 7,
      passes = 2,
      vibrancy = 0.22,
      vibrancy_darkness = 0.88,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
    groupbar = {
      font_size = 12,
      font_family = "Space Grotesk",
      font_weight_active = "bold",
      font_weight_inactive = "normal",
      indicator_height = 3,
      indicator_gap = 6,
      height = 26,
      gaps_in = 6,
      gaps_out = 0,
      text_color = "rgb(E6F0FF)",
      text_color_inactive = "rgba(E6F0FF88)",
      col = {
        active = "rgba(0066FF2E)",
        inactive = "rgba(010A1E55)",
      },
      gradients = true,
      gradient_rounding = 14,
      gradient_round_only_edges = false,
    },
  },

  animations = {
    enabled = true,
  },
})

-- Curvas: facility doors = snap seco, ego aura = overshoot
hl.curve("egoSnap", { type = "bezier", points = { { 0.22, 1 }, { 0.36, 1 } } })
hl.curve("egoStrike", { type = "bezier", points = { { 0.08, 0.9 }, { 0.14, 1.1 } } })
hl.curve("egoLinear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 9, bezier = "egoSnap" })
hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "egoSnap" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.6, bezier = "egoStrike" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.0, bezier = "egoStrike", style = "popin 94%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.5, bezier = "egoLinear", style = "popin 90%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.6, bezier = "egoSnap" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.35, bezier = "egoSnap" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.8, bezier = "egoSnap" })
hl.animation({ leaf = "fadeSwitch", enabled = false })
hl.animation({ leaf = "layers", enabled = true, speed = 3.6, bezier = "egoSnap" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.8, bezier = "egoSnap", style = "slide top" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "egoLinear", style = "slide top" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.8, bezier = "egoSnap" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.3, bezier = "egoSnap" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4.2, bezier = "egoStrike", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.2, bezier = "egoStrike", style = "slidevert" })

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
  rounding = 18,
  opacity = "0.98 0.92",
})

o.window({ tag = "pop" }, {
  rounding = 14,
  opacity = "0.98 0.94",
})

o.window(
  "^(org\\.omarchy\\.terminal|org\\.codeberg\\.dnkl\\.foot|com\\.mitchellh\\.ghostty|kitty|alacritty|foot)$",
  {
    opacity = "0.98 0.95",
  }
)

o.window(
  "^(org\\.omarchy\\.screensaver|org\\.omarchy\\.about|xdg-desktop-portal-gtk|imv|mpv|org\\.gnome\\.NautilusPreviewer)$",
  {
    tag = "+floating-window",
  }
)
