local M = {}

M.colors = {
  -- Base colors
  bg = "#14111F", -- Primary background
  bg_dark = "#0d0a14", -- Darker variant for contrast
  bg_highlight = "#292633", -- Secondary background for UI elements
  bg_visual = "#1d3b53", -- Selection background

  fg = "#eeffff", -- Primary foreground
  fg_dark = "#d6deeb", -- Default text, punctuation
  fg_light = "#FBF5F3", -- Light accent text
  fg_gutter = "#637777", -- Line numbers, comments

  -- Primary syntax colors
  purple = "#c792ea", -- Keywords, control flow
  purple_dark = "#7e57c2", -- Deep purple
  purple_muted = "#697098", -- Muted purple for quotes

  cyan = "#7fdbca", -- Operators, tags, properties
  cyan_bright = "#6ae9f0", -- Brighter cyan
  cyan_light = "#57eaf1", -- Light cyan

  green = "#addb67", -- Strings, variables
  green_light = "#d9f5dd", -- Light green
  green_bright = "#31e1eb", -- Bright green

  blue = "#82AAFF", -- Constants, function calls
  blue_bright = "#82b1ff", -- Bright blue
  blue_light = "#8EACE3", -- Light blue
  blue_gray = "#5f7e97", -- Blue gray

  pink = "#ff5874", -- Booleans, null
  pink_bright = "#ff2c83", -- Bright pink

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
  variable = M.colors.green,
  string = M.colors.green,
  number = M.colors.coral,
  boolean = M.colors.pink,
  constant = M.colors.blue,
  func = M.colors.purple,
  func_call = M.colors.blue,
  method = M.colors.purple,
  class = M.colors.orange,
  type = M.colors.orange,
  operator = M.colors.cyan,
  comment = M.colors.gray,
  punctuation = M.colors.fg_dark,
  bracket = M.colors.fg_dark,
  tag = M.colors.cyan,
  attribute = M.colors.green,
  property = M.colors.cyan,
  parameter = M.colors.cyan,

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
