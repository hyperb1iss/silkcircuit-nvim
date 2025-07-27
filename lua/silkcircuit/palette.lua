local M = {}

-- Get colors based on current variant
local function get_variant_colors()
  local variants = require("silkcircuit.variants")
  local variant_name = variants.get_current_variant()
  return variants.get_colors(variant_name)
end

M.colors = get_variant_colors()
  or {
    -- Base colors
    bg = "#1e1a2e", -- Primary background - Deep purple base
    bg_dark = "#16131f", -- Darker variant for contrast
    bg_highlight = "#3b2d4f", -- Secondary background - Rich purple
    bg_visual = "#44475a", -- Selection background - Purple tinted

    fg = "#f8f8f2", -- Primary foreground - Slightly warmer
    fg_dark = "#e9d5ff", -- Default text - Light purple tint
    fg_light = "#ffffff", -- Light accent text
    fg_gutter = "#6272a4", -- Line numbers - Purple-blue

    -- Primary syntax colors
    purple = "#e135ff", -- Keywords - NEON PURPLE
    purple_bright = "#ff6bff", -- Bright purple
    purple_dark = "#b45bcf", -- Deep purple - More vibrant
    purple_muted = "#9580ff", -- Muted purple - Still vibrant for comments

    cyan = "#80ffea", -- Neon cyan - More green tinted
    cyan_bright = "#5fffff", -- Electric cyan
    cyan_dark = "#40a8c4", -- Dark cyan
    cyan_light = "#9ffcf9", -- Light neon cyan

    green = "#f1fa8c", -- Strings, variables - More yellow-green
    green_light = "#d9f5dd", -- Light green
    green_bright = "#50fa7b", -- Bright green

    blue = "#82AAFF", -- Constants, function calls
    blue_bright = "#82b1ff", -- Bright blue
    blue_light = "#8EACE3", -- Light blue
    blue_gray = "#5f7e97", -- Blue gray

    pink = "#ff00ff", -- PURE NEON MAGENTA
    pink_bright = "#ff69ff", -- Hot pink - Maximum vibrance

    coral = "#F78C6C", -- Numbers
    red = "#ff6363", -- CSS selectors
    red_dark = "#d3423e", -- Dark red
    red_error = "#ec5f67", -- Error red

    orange = "#ff6ac1", -- Pink-orange for classes
    yellow = "#ffff80", -- Neon yellow
    yellow_bright = "#ffffa5", -- Electric yellow
    yellow_dark = "#d4d464", -- Dark yellow
    yellow_light = "#ffffcc", -- Soft neon yellow

    -- UI colors
    selection = "#1d3b53",
    selection_highlight = "#5f7e97",
    selection_inactive = "#7e57c2",
    word_highlight = "#32374D",
    word_highlight_strong = "#2E3250",
    white = "#ffffff",
    black = "#000000",
    border = "#44475a",
    comment = "#6272a4",

    -- Special colors
    diff_add = "#50fa7b",
    diff_change = "#ff79c6",
    diff_delete = "#ff5555",
    diff_text = "#44475a",

    -- Glow effects (for special highlights)
    glow_pink = "#ff00ff",
    glow_purple = "#e135ff",
    glow_cyan = "#00ffff",

    -- Additional grays
    gray = "#637777",
    gray_light = "#d7dbe0",
    gray_dark = "#5f7e97",

    -- Terminal colors (matching Warp theme)
    terminal_black = "#1e1a2e",
    terminal_red = "#ff79c6",
    terminal_green = "#f1fa8c",
    terminal_yellow = "#ffff80",
    terminal_blue = "#e135ff",
    terminal_magenta = "#ff00ff",
    terminal_cyan = "#80ffea",
    terminal_white = "#f8f8f2",
    terminal_bright_black = "#6272a4",
    terminal_bright_red = "#ff5555",
    terminal_bright_green = "#50fa7b",
    terminal_bright_yellow = "#ffffa5",
    terminal_bright_blue = "#bd93f9",
    terminal_bright_magenta = "#ff69ff",
    terminal_bright_cyan = "#5fffff",
    terminal_bright_white = "#ffffff",

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

-- Update semantic mappings when colors change
function M.update_semantic(colors)
  colors = colors or M.colors
  M.semantic = {
    -- Syntax (consistent across all languages)
    keyword = colors.purple,
    variable = colors.pink,
    string = colors.pink_bright,
    number = colors.purple_dark,
    boolean = colors.pink,
    constant = colors.purple_dark,
    func = colors.glow_purple,
    ["function"] = colors.glow_purple,
    function_builtin = colors.purple_bright,
    func_call = colors.cyan,
    method = colors.glow_purple,
    class = colors.yellow,
    type = colors.yellow,
    type_builtin = colors.yellow_bright,
    operator = colors.cyan,
    comment = colors.purple_muted,
    punctuation = colors.fg_dark,
    bracket = colors.purple,
    tag = colors.pink,
    attribute = colors.purple,
    property = colors.cyan_bright,
    parameter = colors.pink,

    -- Special syntax elements
    namespace = colors.purple,
    decorator = colors.green_bright,
    annotation = colors.green_bright,
    preprocessor = colors.pink_bright,
    regex = colors.cyan_bright,
    escape = colors.coral,
    symbol = colors.cyan,
    field = colors.cyan_bright,

    -- UI Elements
    border = colors.cyan_bright,
    border_alt = colors.purple,
    cursor_line = colors.bg_highlight,
    line_number = colors.gray,
    line_number_active = colors.fg_light,
    indent_guide = colors.bg_highlight,
    indent_guide_active = colors.purple_muted,
    fold = colors.purple_muted,

    -- Selection and Search
    selection = colors.selection,
    selection_inactive = colors.selection_inactive,
    search = colors.yellow,
    search_current = colors.coral,
    match = colors.pink,

    -- Diagnostics (consistent everywhere)
    diag_error = colors.error,
    diag_warning = colors.warning,
    diag_info = colors.info,
    diag_hint = colors.hint,
    diag_ok = colors.green_bright,

    -- Diff (for all diff views)
    diff_add = colors.git_add,
    diff_change = colors.git_change,
    diff_delete = colors.git_delete,
    diff_add_bg = colors.diff_add,
    diff_change_bg = colors.diff_change,
    diff_delete_bg = colors.diff_delete,
    diff_text = colors.diff_text,

    -- Git
    git_add = colors.git_add,
    git_change = colors.git_change,
    git_delete = colors.git_delete,
    git_ignore = colors.gray,
    git_untracked = colors.yellow,

    -- Status indicators
    info = colors.info,
    success = colors.green_bright,
    warning = colors.warning,
    error = colors.error,
    hint = colors.hint,

    -- Special highlights
    todo = colors.yellow,
    note = colors.info,
    hack = colors.warning,
    fixme = colors.error,
  }
end

-- Initialize semantic colors
M.update_semantic()

return M
