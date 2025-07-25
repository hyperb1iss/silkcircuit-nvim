local M = {}

function M.highlights(colors, opts)
  return {
    -- Normal mode
    lualine_a_normal = { fg = colors.bg, bg = colors.purple, bold = true },
    lualine_b_normal = { fg = colors.fg, bg = colors.bg_highlight },
    lualine_c_normal = { fg = colors.gray, bg = opts.transparent and colors.none or colors.bg },
    
    -- Insert mode
    lualine_a_insert = { fg = colors.bg, bg = colors.green, bold = true },
    lualine_b_insert = { fg = colors.fg, bg = colors.bg_highlight },
    lualine_c_insert = { fg = colors.gray, bg = opts.transparent and colors.none or colors.bg },
    
    -- Visual mode
    lualine_a_visual = { fg = colors.bg, bg = colors.yellow, bold = true },
    lualine_b_visual = { fg = colors.fg, bg = colors.bg_highlight },
    lualine_c_visual = { fg = colors.gray, bg = opts.transparent and colors.none or colors.bg },
    
    -- Replace mode
    lualine_a_replace = { fg = colors.bg, bg = colors.red, bold = true },
    lualine_b_replace = { fg = colors.fg, bg = colors.bg_highlight },
    lualine_c_replace = { fg = colors.gray, bg = opts.transparent and colors.none or colors.bg },
    
    -- Command mode
    lualine_a_command = { fg = colors.bg, bg = colors.orange, bold = true },
    lualine_b_command = { fg = colors.fg, bg = colors.bg_highlight },
    lualine_c_command = { fg = colors.gray, bg = opts.transparent and colors.none or colors.bg },
    
    -- Terminal mode
    lualine_a_terminal = { fg = colors.bg, bg = colors.cyan, bold = true },
    lualine_b_terminal = { fg = colors.fg, bg = colors.bg_highlight },
    lualine_c_terminal = { fg = colors.gray, bg = opts.transparent and colors.none or colors.bg },
    
    -- Inactive
    lualine_a_inactive = { fg = colors.gray, bg = colors.bg_highlight },
    lualine_b_inactive = { fg = colors.gray, bg = colors.bg_highlight },
    lualine_c_inactive = { fg = colors.gray, bg = opts.transparent and colors.none or colors.bg },
    
    -- Transitional
    lualine_transitional_lualine_a_normal_to_lualine_b_normal = { fg = colors.purple, bg = colors.bg_highlight },
    lualine_transitional_lualine_b_normal_to_lualine_c_normal = { fg = colors.bg_highlight, bg = opts.transparent and colors.none or colors.bg },
    lualine_transitional_lualine_a_insert_to_lualine_b_insert = { fg = colors.green, bg = colors.bg_highlight },
    lualine_transitional_lualine_b_insert_to_lualine_c_insert = { fg = colors.bg_highlight, bg = opts.transparent and colors.none or colors.bg },
    lualine_transitional_lualine_a_visual_to_lualine_b_visual = { fg = colors.yellow, bg = colors.bg_highlight },
    lualine_transitional_lualine_b_visual_to_lualine_c_visual = { fg = colors.bg_highlight, bg = opts.transparent and colors.none or colors.bg },
    lualine_transitional_lualine_a_replace_to_lualine_b_replace = { fg = colors.red, bg = colors.bg_highlight },
    lualine_transitional_lualine_b_replace_to_lualine_c_replace = { fg = colors.bg_highlight, bg = opts.transparent and colors.none or colors.bg },
    lualine_transitional_lualine_a_command_to_lualine_b_command = { fg = colors.orange, bg = colors.bg_highlight },
    lualine_transitional_lualine_b_command_to_lualine_c_command = { fg = colors.bg_highlight, bg = opts.transparent and colors.none or colors.bg },
    lualine_transitional_lualine_a_terminal_to_lualine_b_terminal = { fg = colors.cyan, bg = colors.bg_highlight },
    lualine_transitional_lualine_b_terminal_to_lualine_c_terminal = { fg = colors.bg_highlight, bg = opts.transparent and colors.none or colors.bg },
    lualine_transitional_lualine_a_inactive_to_lualine_b_inactive = { fg = colors.bg_highlight, bg = colors.bg_highlight },
    lualine_transitional_lualine_b_inactive_to_lualine_c_inactive = { fg = colors.bg_highlight, bg = opts.transparent and colors.none or colors.bg },
  }
end

-- Lualine theme configuration
function M.get_theme()
  local colors = require("lilac.palette").colors
  
  return {
    normal = {
      a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
      b = { fg = colors.fg, bg = colors.bg_highlight },
      c = { fg = colors.gray, bg = colors.bg },
      x = { fg = colors.gray, bg = colors.bg },
      y = { fg = colors.fg, bg = colors.bg_highlight },
      z = { fg = colors.bg, bg = colors.purple, gui = "bold" },
    },
    insert = {
      a = { fg = colors.bg, bg = colors.green, gui = "bold" },
      z = { fg = colors.bg, bg = colors.green, gui = "bold" },
    },
    visual = {
      a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
      z = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
    },
    replace = {
      a = { fg = colors.bg, bg = colors.red, gui = "bold" },
      z = { fg = colors.bg, bg = colors.red, gui = "bold" },
    },
    command = {
      a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
      z = { fg = colors.bg, bg = colors.orange, gui = "bold" },
    },
    terminal = {
      a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
      z = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
    },
    inactive = {
      a = { fg = colors.gray, bg = colors.bg_highlight },
      b = { fg = colors.gray, bg = colors.bg_highlight },
      c = { fg = colors.gray, bg = colors.bg },
      x = { fg = colors.gray, bg = colors.bg },
      y = { fg = colors.gray, bg = colors.bg_highlight },
      z = { fg = colors.gray, bg = colors.bg_highlight },
    },
  }
end

return M