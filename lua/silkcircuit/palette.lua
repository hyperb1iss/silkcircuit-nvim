local M = {}

-- Get colors based on current variant
function M.get_colors()
  local variants = require("silkcircuit.variants")
  local variant_name = variants.get_current_variant()
  return variants.get_colors(variant_name)
end

-- Get current colors (delegated to variants)
M.colors = nil

-- Update semantic mappings when colors change
function M.update_semantic(colors)
  colors = colors or M.get_colors()
  if not colors then
    -- Can't create semantic mappings without colors
    return
  end
  M.semantic = {
    -- Syntax (consistent across all languages)
    keyword = colors.purple,
    variable = colors.fg,
    string = colors.pink_soft,
    number = colors.coral,
    boolean = colors.pink,
    constant = colors.coral,
    func = colors.cyan,
    ["function"] = colors.cyan,
    function_builtin = colors.cyan_bright,
    func_call = colors.cyan,
    method = colors.cyan,
    class = colors.yellow,
    type = colors.yellow,
    type_builtin = colors.yellow_bright,
    operator = colors.fg_dark,
    comment = colors.purple_muted,
    punctuation = colors.fg_dark,
    bracket = colors.fg,
    tag = colors.pink,
    attribute = colors.purple,
    property = colors.cyan_bright,
    parameter = colors.fg,

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
