-- Lualine theme for Lilac colorscheme
-- EPIC femme cyberpunk synthwave statusline with MAXIMUM DRAMA

local colors = require("lilac.palette").colors

local lilac = {}

-- Normal mode - Electric purple with glow effect
lilac.normal = {
  a = { bg = colors.glow_purple, fg = colors.bg, gui = "bold" },
  b = { bg = colors.purple_dark, fg = colors.fg_light, gui = "bold" },
  c = { bg = colors.bg_highlight, fg = colors.fg_dark },
  x = { bg = colors.bg_highlight, fg = colors.purple },
  y = { bg = colors.purple_dark, fg = colors.fg_light, gui = "bold" },
  z = { bg = colors.glow_purple, fg = colors.bg, gui = "bold" },
}

-- Insert mode - NEON PINK EXPLOSION
lilac.insert = {
  a = { bg = colors.glow_pink, fg = colors.bg, gui = "bold" },
  b = { bg = colors.pink, fg = colors.bg, gui = "bold" },
  c = { bg = colors.bg_highlight, fg = colors.fg_dark },
  x = { bg = colors.bg_highlight, fg = colors.pink },
  y = { bg = colors.pink, fg = colors.bg, gui = "bold" },
  z = { bg = colors.glow_pink, fg = colors.bg, gui = "bold" },
}

-- Visual mode - ELECTRIC CYAN VIBES
lilac.visual = {
  a = { bg = colors.glow_cyan, fg = colors.bg, gui = "bold" },
  b = { bg = colors.cyan, fg = colors.bg, gui = "bold" },
  c = { bg = colors.bg_highlight, fg = colors.fg_dark },
  x = { bg = colors.bg_highlight, fg = colors.cyan },
  y = { bg = colors.cyan, fg = colors.bg, gui = "bold" },
  z = { bg = colors.glow_cyan, fg = colors.bg, gui = "bold" },
}

-- Replace mode - MAXIMUM PINK INTENSITY
lilac.replace = {
  a = { bg = colors.pink_bright, fg = colors.bg, gui = "bold" },
  b = { bg = colors.glow_pink, fg = colors.bg, gui = "bold" },
  c = { bg = colors.bg_highlight, fg = colors.fg_dark },
  x = { bg = colors.bg_highlight, fg = colors.pink_bright },
  y = { bg = colors.glow_pink, fg = colors.bg, gui = "bold" },
  z = { bg = colors.pink_bright, fg = colors.bg, gui = "bold" },
}

-- Command mode - COMMANDING PURPLE PRESENCE
lilac.command = {
  a = { bg = colors.purple_dark, fg = colors.fg_light, gui = "bold" },
  b = { bg = colors.glow_purple, fg = colors.bg, gui = "bold" },
  c = { bg = colors.bg_highlight, fg = colors.fg_dark },
  x = { bg = colors.bg_highlight, fg = colors.purple_dark },
  y = { bg = colors.glow_purple, fg = colors.bg, gui = "bold" },
  z = { bg = colors.purple_dark, fg = colors.fg_light, gui = "bold" },
}

-- Terminal mode - MATRIX GREEN GLOW
lilac.terminal = {
  a = { bg = colors.green, fg = colors.bg, gui = "bold" },
  b = { bg = colors.green_bright, fg = colors.bg, gui = "bold" },
  c = { bg = colors.bg_highlight, fg = colors.fg_dark },
  x = { bg = colors.bg_highlight, fg = colors.green },
  y = { bg = colors.green_bright, fg = colors.bg, gui = "bold" },
  z = { bg = colors.green, fg = colors.bg, gui = "bold" },
}

-- Inactive windows - Muted
lilac.inactive = {
  a = { bg = colors.bg_highlight, fg = colors.gray, gui = "bold" },
  b = { bg = colors.bg_dark, fg = colors.gray },
  c = { bg = colors.bg_dark, fg = colors.gray },
}

return lilac
