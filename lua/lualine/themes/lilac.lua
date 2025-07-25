-- Lualine theme for Lilac colorscheme
-- Femme cyberpunk synthwave statusline

local colors = require("lilac.palette").colors

local lilac = {}

-- Normal mode - Purple glow
lilac.normal = {
  a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
  b = { bg = colors.bg_highlight, fg = colors.purple },
  c = { bg = colors.bg_dark, fg = colors.fg_dark },
}

-- Insert mode - Hot pink
lilac.insert = {
  a = { bg = colors.pink, fg = colors.bg, gui = "bold" },
  b = { bg = colors.bg_highlight, fg = colors.pink },
  c = { bg = colors.bg_dark, fg = colors.fg_dark },
}

-- Visual mode - Neon cyan
lilac.visual = {
  a = { bg = colors.cyan, fg = colors.bg, gui = "bold" },
  b = { bg = colors.bg_highlight, fg = colors.cyan },
  c = { bg = colors.bg_dark, fg = colors.fg_dark },
}

-- Replace mode - Bright pink
lilac.replace = {
  a = { bg = colors.pink_bright, fg = colors.bg, gui = "bold" },
  b = { bg = colors.bg_highlight, fg = colors.pink_bright },
  c = { bg = colors.bg_dark, fg = colors.fg_dark },
}

-- Command mode - Electric purple
lilac.command = {
  a = { bg = colors.purple_dark, fg = colors.fg_light, gui = "bold" },
  b = { bg = colors.bg_highlight, fg = colors.purple_dark },
  c = { bg = colors.bg_dark, fg = colors.fg_dark },
}

-- Terminal mode - Neon green
lilac.terminal = {
  a = { bg = colors.green, fg = colors.bg, gui = "bold" },
  b = { bg = colors.bg_highlight, fg = colors.green },
  c = { bg = colors.bg_dark, fg = colors.fg_dark },
}

-- Inactive windows - Muted
lilac.inactive = {
  a = { bg = colors.bg_highlight, fg = colors.gray, gui = "bold" },
  b = { bg = colors.bg_dark, fg = colors.gray },
  c = { bg = colors.bg_dark, fg = colors.gray },
}

return lilac
