local M = {}

M.colors = {
  -- Base colors
  bg = "#1a1626", -- Primary background - More purple tint
  bg_dark = "#120f1c", -- Darker variant for contrast
  bg_highlight = "#2d2640", -- Secondary background for UI elements - Purple tint
  bg_visual = "#1d3b53", -- Selection background

  fg = "#eeffff", -- Primary foreground
  fg_dark = "#d6deeb", -- Default text, punctuation
  fg_light = "#FBF5F3", -- Light accent text
  fg_gutter = "#637777", -- Line numbers, comments

  -- Primary syntax colors
  purple = "#bd93f9", -- Keywords, control flow - More vibrant
  purple_dark = "#9d79d6", -- Deep purple
  purple_muted = "#8b7c96", -- Muted purple for comments

  cyan = "#8be9fd", -- Operators, tags, properties - More vibrant
  cyan_bright = "#a4ffff", -- Brighter cyan
  cyan_light = "#9aedfe", -- Light cyan

  green = "#f1fa8c", -- Strings, variables - More yellow-green
  green_light = "#d9f5dd", -- Light green
  green_bright = "#50fa7b", -- Bright green

  blue = "#82AAFF", -- Constants, function calls
  blue_bright = "#82b1ff", -- Bright blue
  blue_light = "#8EACE3", -- Light blue
  blue_gray = "#5f7e97", -- Blue gray

  pink = "#ff79c6", -- Booleans, null - More vibrant pink
  pink_bright = "#ff92d0", -- Bright pink - Even more vibrant

  coral = "#F78C6C", -- Numbers
  red = "#ff6363", -- CSS selectors
  red_dark = "#d3423e", -- Dark red
  red_error = "#ec5f67", -- Error red

  orange = "#ffcb8b", -- Classes, types
  yellow = "#ecc48d", -- Golden yellow
  yellow_bright = "#FFEB95", -- Bright yellow
  yellow_light = "#faf39f", -- Light yellow

  -- UI colors
  selection = "#1d3b53",
  selection_highlight = "#5f7e9779",
  selection_inactive = "#7e57c25a",
  word_highlight = "#32374D",
  word_highlight_strong = "#2E3250",

  -- Special colors
  diff_add = "#addb67ff",
  diff_change = "#a2bffc",
  diff_delete = "#EF535090",
  diff_text = "#011627",

  -- Additional grays
  gray = "#637777",
  gray_light = "#d7dbe0",
  gray_dark = "#5f7e97",

  -- Terminal colors
  terminal_black = "#14111F",
  terminal_red = "#ff5874",
  terminal_green = "#addb67",
  terminal_yellow = "#ecc48d",
  terminal_blue = "#82AAFF",
  terminal_magenta = "#c792ea",
  terminal_cyan = "#7fdbca",
  terminal_white = "#d6deeb",
  terminal_bright_black = "#637777",
  terminal_bright_red = "#ff6363",
  terminal_bright_green = "#addb67",
  terminal_bright_yellow = "#FFEB95",
  terminal_bright_blue = "#82b1ff",
  terminal_bright_magenta = "#c792ea",
  terminal_bright_cyan = "#6ae9f0",
  terminal_bright_white = "#eeffff",

  -- Diagnostic colors
  error = "#ff5874",
  warning = "#ecc48d",
  info = "#82AAFF",
  hint = "#7fdbca",

  -- Git colors
  git_add = "#addb67",
  git_change = "#82AAFF",
  git_delete = "#ff5874",

  none = "NONE",
}

-- Semantic color mappings
M.semantic = {
  -- Syntax
  keyword = M.colors.purple,
  variable = M.colors.pink,
  string = M.colors.pink_bright,
  number = M.colors.purple_dark,
  boolean = M.colors.pink,
  constant = M.colors.purple,
  func = M.colors.purple,
  func_call = M.colors.cyan,
  method = M.colors.purple,
  class = M.colors.pink,
  type = M.colors.purple_dark,
  operator = M.colors.cyan,
  comment = M.colors.purple_muted,
  punctuation = M.colors.fg_dark,
  bracket = M.colors.purple,
  tag = M.colors.pink,
  attribute = M.colors.purple,
  property = M.colors.cyan,
  parameter = M.colors.pink,

  -- UI
  border = M.colors.bg_highlight,
  cursor_line = M.colors.bg_highlight,
  line_number = M.colors.gray,
  line_number_active = M.colors.fg_dark,
  indent_guide = M.colors.bg_highlight,
  indent_guide_active = M.colors.gray_dark,

  -- Diagnostics
  diag_error = M.colors.error,
  diag_warning = M.colors.warning,
  diag_info = M.colors.info,
  diag_hint = M.colors.hint,

  -- Diff
  diff_add_bg = M.colors.diff_add,
  diff_change_bg = M.colors.diff_change,
  diff_delete_bg = M.colors.diff_delete,
}

return M
