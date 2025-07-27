local M = {}
local color_utils = require("silkcircuit.utils.colors")

-- Base colors that stay consistent across variants
local base = {
  -- Backgrounds
  bg = "#1e1a2e",
  bg_dark = "#16131f",
  bg_highlight = "#3b2d4f",
  bg_visual = "#44475a",

  -- Core grays
  gray = "#637777",
  gray_light = "#d7dbe0",
  gray_dark = "#5f7e97",

  -- Terminals and special
  none = "NONE",
}

-- Create variant by adjusting saturation/brightness
local function create_variant(intensity)
  local colors = vim.tbl_extend("force", base, {
    -- Foregrounds
    fg = "#f8f8f2",
    fg_dark = "#e9d5ff",
    fg_light = "#ffffff",
    fg_gutter = "#6272a4",
  })

  -- Neon colors with intensity adjustment
  local neon_colors = {
    -- Purples
    purple = "#e135ff",
    purple_dark = "#b45bcf",
    purple_muted = "#9580ff",

    -- Cyans
    cyan = "#80ffea",
    cyan_bright = "#5fffff",
    cyan_light = "#9ffcf9",

    -- Greens
    green = "#f1fa8c",
    green_light = "#d9f5dd",
    green_bright = "#50fa7b",

    -- Blues
    blue = "#82AAFF",
    blue_bright = "#82b1ff",
    blue_light = "#8EACE3",
    blue_gray = "#5f7e97",

    -- Pinks
    pink = "#ff00ff",
    pink_bright = "#ff69ff",
    pink_soft = "#ff99ff",

    -- Others
    coral = "#F78C6C",
    red = "#ff6363",
    red_dark = "#d3423e",
    red_error = "#ec5f67",
    orange = "#ff6ac1",
    yellow = "#ffff80",
    yellow_bright = "#ffffa5",
    yellow_light = "#ffffcc",
  }

  -- Apply intensity adjustments
  if intensity < 1.0 then
    for key, color in pairs(neon_colors) do
      -- Reduce saturation for softer variants by blending with gray
      neon_colors[key] = color_utils.blend(color, "#808080", intensity)
    end
  end

  -- Merge adjusted colors
  colors = vim.tbl_extend("force", colors, neon_colors)

  -- Add derived colors
  colors.selection = "#1d3b53"
  colors.selection_highlight = "#5f7e9779"
  colors.selection_inactive = "#7e57c25a"
  colors.word_highlight = "#32374D"
  colors.word_highlight_strong = "#2E3250"

  -- Special colors
  colors.diff_add = "#50fa7b"
  colors.diff_change = "#ff79c6"
  colors.diff_delete = "#ff5555"
  colors.diff_text = "#44475a"

  -- Glow effects
  colors.glow_pink = colors.pink
  colors.glow_purple = colors.purple
  colors.glow_cyan = intensity > 0.8 and "#00ffff" or colors.cyan

  -- Terminal colors
  colors.terminal_black = colors.bg
  colors.terminal_red = colors.pink_bright
  colors.terminal_green = colors.green
  colors.terminal_yellow = colors.yellow
  colors.terminal_blue = colors.purple
  colors.terminal_magenta = colors.pink
  colors.terminal_cyan = colors.cyan
  colors.terminal_white = colors.fg
  colors.terminal_bright_black = colors.gray
  colors.terminal_bright_red = colors.red
  colors.terminal_bright_green = colors.green_bright
  colors.terminal_bright_yellow = colors.yellow_bright
  colors.terminal_bright_blue = colors.blue_bright
  colors.terminal_bright_magenta = colors.pink_bright
  colors.terminal_bright_cyan = colors.cyan_bright
  colors.terminal_bright_white = "#ffffff"

  -- Diagnostic colors
  colors.error = "#ff5874"
  colors.warning = "#ecc48d"
  colors.info = "#82AAFF"
  colors.hint = "#7fdbca"

  -- Git colors
  colors.git_add = "#addb67"
  colors.git_change = "#82AAFF"
  colors.git_delete = "#ff5874"

  return colors
end

-- Define variants
M.variants = {
  neon = {
    name = "neon",
    intensity = 1.0,
    description = "Maximum neon intensity - the original SilkCircuit experience",
  },
  vibrant = {
    name = "vibrant",
    intensity = 0.85,
    description = "Slightly toned down - easier on the eyes for longer sessions",
  },
  soft = {
    name = "soft",
    intensity = 0.7,
    description = "Softer colors - comfortable for extended coding",
  },
}

-- Get colors for a specific variant
function M.get_colors(variant_name)
  variant_name = variant_name or "neon"
  local variant = M.variants[variant_name]

  if not variant then
    vim.notify("Unknown variant: " .. variant_name .. ", using 'neon'", vim.log.levels.WARN)
    variant = M.variants.neon
  end

  return create_variant(variant.intensity)
end

-- Get current variant from config or default
function M.get_current_variant()
  local config = require("silkcircuit.config").get()
  return config.variant or "neon"
end

return M
