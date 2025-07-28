local M = {}
local color_utils = require("silkcircuit.utils.colors")

-- Base colors that stay consistent across variants
local base = {
  -- Terminals and special
  none = "NONE",
}

-- Create variant by adjusting saturation/brightness
local function create_variant(intensity, variant_name)
  -- Set base colors based on variant
  local backgrounds = {}
  if variant_name == "neon" then
    -- Use VSCode neon theme backgrounds
    backgrounds = {
      bg = "#12101a", -- VSCode editor.background
      bg_dark = "#0a0812", -- VSCode sideBar.background
      bg_highlight = "#1a162a", -- VSCode popup backgrounds
      bg_visual = "#44475a", -- VSCode selection
    }
  elseif variant_name == "soft" then
    -- Use VSCode soft theme backgrounds
    backgrounds = {
      bg = "#1a1626", -- VSCode editor.background
      bg_dark = "#141220", -- VSCode sideBar.background
      bg_highlight = "#3e3456", -- VSCode popup backgrounds
      bg_visual = "#44475a", -- VSCode selection
    }
  else
    -- Vibrant variant - Use VSCode vibrant theme backgrounds
    backgrounds = {
      bg = "#0f0c1a", -- VSCode editor background
      bg_dark = "#08060f", -- VSCode sidebar background
      bg_highlight = "#0a0614", -- VSCode popup background (ultra-dark)
      bg_visual = "#3a2e5a", -- VSCode selection
    }
  end

  local colors = vim.tbl_extend("force", base, backgrounds, {
    -- Foregrounds
    fg = "#f8f8f2",
    fg_dark = "#e9d5ff",
    fg_light = "#ffffff",
    fg_gutter = "#6272a4",

    -- Core grays
    gray = "#637777",
    gray_light = "#d7dbe0",
    gray_dark = "#5f7e97",
  })

  -- Neon colors with intensity adjustment
  local neon_colors = {}

  if variant_name == "soft" then
    -- Use exact VSCode soft theme colors
    neon_colors = {
      -- Purples (from VSCode soft)
      purple = "#e892ff", -- Keywords
      purple_dark = "#b199ff", -- Comments/muted
      purple_muted = "#b199ff", -- Comments

      -- Cyans (from VSCode soft)
      cyan = "#99ffee", -- Functions/operators
      cyan_bright = "#88ffff", -- Entity types
      cyan_light = "#b3ffea", -- Terminal bright cyan

      -- Greens (from VSCode soft)
      green = "#66ff99", -- Git added/markdown headings
      green_light = "#80ffb3", -- Terminal bright green
      green_bright = "#66ff99", -- Inserted markup

      -- Blues (from VSCode soft)
      blue = "#92aaff", -- Terminal ansi blue
      blue_bright = "#a2bbff", -- Terminal bright blue
      blue_light = "#88ffff", -- Entity types
      blue_gray = "#6272a4", -- Line numbers/borders

      -- Pinks (from VSCode soft)
      pink = "#ff99ff", -- Tags/entity names
      pink_bright = "#ffb3ff", -- Terminal bright magenta
      pink_soft = "#ffc2ff", -- Strings/symbols

      -- Others (from VSCode soft)
      coral = "#ff99dd", -- Numbers/constants
      red = "#ff6677", -- Errors/invalid
      red_dark = "#ff6677", -- Consistent red
      red_error = "#ff6677", -- Error foreground
      orange = "#ff99dd", -- Orange mapped to coral
      yellow = "#ffe699", -- Classes/types/warnings
      yellow_bright = "#ffffa5", -- Terminal bright yellow
      yellow_light = "#ffffcc", -- Light yellow
    }
  elseif variant_name == "vibrant" then
    -- Use exact VSCode vibrant theme colors
    neon_colors = {
      -- Purples (from VSCode vibrant)
      purple = "#ff00ff", -- Pure magenta
      purple_dark = "#b366ff", -- From VSCode
      purple_muted = "#b366ff",

      -- Cyans (from VSCode vibrant)
      cyan = "#00ffcc", -- Electric cyan
      cyan_bright = "#00ffff", -- Pure cyan
      cyan_light = "#66ffff",

      -- Greens (from VSCode vibrant)
      green = "#00ff66",
      green_light = "#66ff99",
      green_bright = "#66ff99",

      -- Blues (from VSCode vibrant)
      blue = "#6699ff",
      blue_bright = "#88aaff",
      blue_light = "#88aaff",
      blue_gray = "#6272a4",

      -- Pinks (from VSCode vibrant)
      pink = "#ff00cc", -- Electric pink
      pink_bright = "#ff66ff",
      pink_soft = "#ff99ff",

      -- Others (from VSCode vibrant)
      coral = "#F78C6C",
      red = "#ff3366",
      red_dark = "#ff3366",
      red_error = "#ff3366",
      orange = "#ff00aa",
      yellow = "#ffcc00",
      yellow_bright = "#ffff66",
      yellow_light = "#ffffcc",
    }
  else
    -- Default neon colors (from VSCode neon theme)
    neon_colors = {
      -- Purples
      purple = "#e135ff", -- Main purple from VSCode
      purple_dark = "#9580ff", -- VSCode comment/muted purple
      purple_muted = "#9580ff", -- VSCode comment/muted purple

      -- Cyans
      cyan = "#80ffea", -- Main cyan from VSCode
      cyan_bright = "#5fffff", -- Brighter cyan
      cyan_light = "#9ffcf9", -- Lighter cyan

      -- Greens
      green = "#50fa7b", -- VSCode green (terminal.ansiGreen)
      green_light = "#50fa7b", -- Keep consistent
      green_bright = "#50fa7b", -- VSCode green

      -- Blues
      blue = "#82AAFF", -- VSCode blue
      blue_bright = "#82b1ff", -- VSCode bright blue
      blue_light = "#82AAFF", -- Keep consistent
      blue_gray = "#6272a4", -- VSCode comment/gray

      -- Pinks/Magentas
      pink = "#ff00ff", -- Pure magenta from VSCode
      pink_bright = "#ff69ff", -- Bright variant
      pink_soft = "#ff99ff", -- VSCode string color

      -- Others
      coral = "#ff6ac1", -- VSCode orange/coral
      red = "#ff6363", -- VSCode error red
      red_dark = "#ff6363", -- Keep consistent
      red_error = "#ff6363", -- VSCode error
      orange = "#ff6ac1", -- VSCode number/constant color
      yellow = "#f1fa8c", -- VSCode class/type color
      yellow_bright = "#ffffa5", -- VSCode bright yellow (terminal)
      yellow_light = "#ffffcc", -- Light yellow
    }
  end

  -- Apply intensity adjustments (skip for soft and vibrant variants as we use exact colors)
  if intensity < 1.0 and variant_name ~= "soft" and variant_name ~= "vibrant" then
    for key, color in pairs(neon_colors) do
      -- Reduce saturation for softer variants by blending with gray
      neon_colors[key] = color_utils.blend(color, "#808080", intensity)
    end
  end

  -- Merge adjusted colors
  colors = vim.tbl_extend("force", colors, neon_colors)

  -- Add derived colors
  if variant_name == "vibrant" then
    -- Use VSCode vibrant selection colors
    colors.selection = "#3a2e5a"
    colors.selection_highlight = "#3a2e5a66"
    colors.selection_inactive = "#3a2e5a33"
    colors.word_highlight = "#3a2e5a66"
    colors.word_highlight_strong = "#ff00ff44"
  elseif variant_name == "neon" then
    -- Use VSCode neon selection colors
    colors.selection = "#44475a"
    colors.selection_highlight = "#44475a66"
    colors.selection_inactive = "#44475a66"
    colors.word_highlight = "#44475a66"
    colors.word_highlight_strong = "#e135ff44"
  else
    -- Soft variant selection colors (match VSCode soft theme)
    colors.selection = "#44475a"
    colors.selection_highlight = "#44475a66"
    colors.selection_inactive = "#44475a66"
    colors.word_highlight = "#44475a66"
    colors.word_highlight_strong = "#e892ff44"
  end

  -- Special colors
  colors.diff_add = "#50fa7b"
  colors.diff_change = "#ff79c6"
  colors.diff_delete = "#ff5555"
  colors.diff_text = "#44475a"

  -- Glow effects
  colors.glow_pink = colors.pink
  colors.glow_purple = colors.purple
  colors.glow_cyan = intensity > 0.8 and "#00ffff" or colors.cyan

  -- Terminal colors (updated for soft variant to match VSCode)
  if variant_name == "soft" then
    colors.terminal_black = "#141220" -- terminal.ansiBlack
    colors.terminal_red = "#ff6677" -- terminal.ansiRed
    colors.terminal_green = "#66ff99" -- terminal.ansiGreen
    colors.terminal_yellow = "#ffe699" -- terminal.ansiYellow
    colors.terminal_blue = "#92aaff" -- terminal.ansiBlue
    colors.terminal_magenta = "#ff99ff" -- terminal.ansiMagenta
    colors.terminal_cyan = "#99ffee" -- terminal.ansiCyan
    colors.terminal_white = "#f8f8f2" -- terminal.ansiWhite
    colors.terminal_bright_black = "#6272a4" -- terminal.ansiBrightBlack
    colors.terminal_bright_red = "#ff7788" -- terminal.ansiBrightRed
    colors.terminal_bright_green = "#80ffb3" -- terminal.ansiBrightGreen
    colors.terminal_bright_yellow = "#ffffa5" -- terminal.ansiBrightYellow
    colors.terminal_bright_blue = "#a2bbff" -- terminal.ansiBrightBlue
    colors.terminal_bright_magenta = "#ffb3ff" -- terminal.ansiBrightMagenta
    colors.terminal_bright_cyan = "#b3ffea" -- terminal.ansiBrightCyan
    colors.terminal_bright_white = "#ffffff" -- terminal.ansiBrightWhite
  else
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
  end

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

-- Create glow variant with ultra-dark backgrounds and pure neon colors
local function create_glow_variant()
  -- Exact colors from VSCode glow theme
  local colors = {
    -- Ultra-dark backgrounds from VSCode
    bg = "#0a0816", -- editor.background
    bg_dark = "#000000", -- sideBar.background
    bg_highlight = "#1a0033", -- popup backgrounds
    bg_visual = "#ff00ff44", -- selection

    -- Pure white text for maximum contrast
    fg = "#ffffff", -- editor.foreground
    fg_dark = "#cc66ff", -- less important text
    fg_light = "#ffffff",
    fg_gutter = "#cc66ff", -- editorLineNumber.foreground

    -- Core grays
    gray = "#666666", -- terminal.ansiBrightBlack
    gray_light = "#cc66ff",
    gray_dark = "#666666",

    -- Pure neon colors from VSCode glow theme
    purple = "#ff00ff", -- Keywords (pure magenta)
    purple_dark = "#cc66ff", -- Comments/muted
    purple_muted = "#cc66ff", -- Comments

    cyan = "#00ffff", -- Functions/operators (pure cyan)
    cyan_bright = "#00ffff", -- Bright cyan
    cyan_light = "#66ffff", -- Light cyan

    green = "#00ff00", -- Git added/inserted (pure green)
    green_light = "#66ff66", -- Bright green
    green_bright = "#66ff66", -- Terminal bright green

    blue = "#0099ff", -- terminal.ansiBlue
    blue_bright = "#66ccff", -- terminal.ansiBrightBlue
    blue_light = "#66ccff",
    blue_gray = "#666666",

    pink = "#ff00ff", -- Tags/pure magenta
    pink_bright = "#ff66ff", -- Numbers/constants
    pink_soft = "#ff99ff", -- Strings (lighter pink)

    coral = "#ff66ff", -- Numbers/constants
    red = "#ff0066", -- Errors
    red_dark = "#ff0066",
    red_error = "#ff0066",
    orange = "#ff66ff", -- Orange mapped to pink variant
    yellow = "#ffff00", -- Classes/types (PURE YELLOW - the pop!)
    yellow_bright = "#ffff66", -- Bright yellow
    yellow_light = "#ffffcc",

    -- Selection and highlights from VSCode
    selection = "#ff00ff44", -- editor.selectionBackground
    selection_highlight = "#ff00ff22", -- editor.selectionHighlightBackground
    selection_inactive = "#ff00ff22",
    word_highlight = "#ff00ff22", -- editor.wordHighlightBackground
    word_highlight_strong = "#ff00ff44", -- editor.wordHighlightStrongBackground

    -- Diff colors from VSCode
    diff_add = "#00ff0022", -- diffEditor.insertedTextBackground
    diff_change = "#00ffff44", -- Match find colors
    diff_delete = "#ff006622", -- diffEditor.removedTextBackground
    diff_text = "#ff00ff44",

    -- Glow effects - pure neon
    glow_pink = "#ff00ff",
    glow_purple = "#ff00ff",
    glow_cyan = "#00ffff",

    -- Terminal colors from VSCode
    terminal_black = "#000000",
    terminal_red = "#ff0066",
    terminal_green = "#00ff00",
    terminal_yellow = "#ffff00",
    terminal_blue = "#0099ff",
    terminal_magenta = "#ff00ff",
    terminal_cyan = "#00ffff",
    terminal_white = "#ffffff",
    terminal_bright_black = "#666666",
    terminal_bright_red = "#ff6666",
    terminal_bright_green = "#66ff66",
    terminal_bright_yellow = "#ffff66",
    terminal_bright_blue = "#66ccff",
    terminal_bright_magenta = "#ff66ff",
    terminal_bright_cyan = "#66ffff",
    terminal_bright_white = "#ffffff",

    -- Diagnostic colors
    error = "#ff0066",
    warning = "#ffff00",
    info = "#00ffff",
    hint = "#66ffff",

    -- Git colors
    git_add = "#00ff00",
    git_change = "#00ffff",
    git_delete = "#ff0066",

    -- Special
    none = "NONE",
  }

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
  glow = {
    name = "glow",
    intensity = 1.0,
    description = "Ultra-dark backgrounds with pure neon colors - maximum contrast",
  },
}

-- Get colors for a specific variant
function M.get_colors(variant_name)
  variant_name = variant_name or "neon"
  local variant = M.variants[variant_name]

  if not variant then
    vim.notify("Unknown variant: " .. variant_name .. ", using 'neon'", vim.log.levels.WARN)
    variant = M.variants.neon
    variant_name = "neon"
  end

  -- Use special glow variant function
  if variant_name == "glow" then
    return create_glow_variant()
  end

  return create_variant(variant.intensity, variant_name)
end

-- Get current variant from config or default
function M.get_current_variant()
  local config = require("silkcircuit.config").get()
  return config.variant or "neon"
end

return M
