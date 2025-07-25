local M = {}

-- Load modules
local config = require("lilac.config")
local theme = require("lilac.theme")
local util = require("lilac.util")

-- Setup function
function M.setup(options)
  config.setup(options)
end

-- Load the theme
function M.load()
  -- Check if termguicolors is enabled
  if not vim.o.termguicolors then
    vim.notify("lilac.nvim: termguicolors must be enabled", vim.log.levels.ERROR)
    return
  end
  
  -- Reset highlighting
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  -- Set theme name
  vim.g.colors_name = "lilac"
  
  -- Apply theme
  theme.apply()
  
  -- Set terminal colors if enabled
  if config.get().terminal_colors then
    theme.set_terminal_colors()
  end
end

-- Get color palette
function M.get_colors()
  return require("lilac.palette").colors
end

-- Compile theme for better performance
function M.compile()
  util.compile()
end

-- Apply colorscheme
function M.colorscheme()
  M.load()
end

return M