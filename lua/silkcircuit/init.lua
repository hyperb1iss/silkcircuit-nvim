local M = {}

-- Load modules
local config = require("silkcircuit.config")
local theme = require("silkcircuit.theme")
local util = require("silkcircuit.util")
local preferences = require("silkcircuit.preferences")

-- Setup function
function M.setup(options)
  config.setup(options)
end

-- Load the theme
function M.load()
  -- Check if termguicolors is enabled
  if not vim.o.termguicolors then
    vim.notify("silkcircuit.nvim: termguicolors must be enabled", vim.log.levels.ERROR)
    return
  end

  local start_time = vim.loop.hrtime()

  -- Try to load compiled version first
  local loaded = util.load_compiled()

  if not loaded then
    -- Fall back to regular loading
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
      vim.cmd("syntax reset")
    end

    -- Set theme name
    vim.g.colors_name = "silkcircuit"

    -- Apply theme
    theme.apply()

    -- Auto-compile for next time
    vim.defer_fn(function()
      util.compile()
    end, 100)
  else
    -- Compiled theme loaded successfully, but we still need to load integrations!
    local palette = require("silkcircuit.palette")
    local opts = config.get()

    -- Load plugin integrations (this was missing!)
    if opts.integrations then
      require("silkcircuit.integrations").load(palette.colors, opts)
    end
  end

  local load_time = (vim.loop.hrtime() - start_time) / 1e6
  if load_time < 10 then -- Only show for fast loads
    vim.notify(string.format("» SilkCircuit loaded in %.2fms", load_time), vim.log.levels.INFO)
  end

  -- Set terminal colors if enabled
  if config.get().terminal_colors then
    theme.set_terminal_colors()
  end

  -- Setup commands
  require("silkcircuit.commands").setup()

  -- Setup glow mode
  require("silkcircuit.glow").setup()

  -- Apply saved preferences
  preferences.apply()

  -- Generate help tags for documentation
  local doc_path =
    vim.fn.expand(debug.getinfo(1, "S").source:sub(2):match("(.*/)") .. "../../../doc")
  if vim.fn.isdirectory(doc_path) == 1 then
    vim.cmd.helptags(doc_path)
  end
end

-- Get color palette
function M.get_colors()
  return require("silkcircuit.palette").colors
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
