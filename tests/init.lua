-- Test initialization for SilkCircuit theme
-- This file tests that the theme loads without errors

-- Add the plugin to runtime path
vim.opt.runtimepath:prepend(vim.fn.getcwd())

-- Enable termguicolors
vim.opt.termguicolors = true

-- Test function
local function test_theme()
  local status_ok, silkcircuit = pcall(require, "silkcircuit")
  if not status_ok then
    vim.api.nvim_err_writeln("Failed to load silkcircuit module: " .. silkcircuit)
    vim.cmd("cquit 1")
    return
  end

  -- Test setup function
  local setup_ok, err = pcall(silkcircuit.setup, {
    transparent = false,
    terminal_colors = true,
    dim_inactive = false,
    styles = {
      comments = { italic = true },
      keywords = { italic = false },
    },
  })

  if not setup_ok then
    vim.api.nvim_err_writeln("Failed to setup silkcircuit: " .. err)
    vim.cmd("cquit 1")
    return
  end

  -- Test loading colorscheme
  local colorscheme_ok, err2 = pcall(vim.cmd.colorscheme, "silkcircuit")
  if not colorscheme_ok then
    vim.api.nvim_err_writeln("Failed to load colorscheme: " .. err2)
    vim.cmd("cquit 1")
    return
  end

  -- Verify theme is loaded
  if vim.g.colors_name ~= "silkcircuit" then
    vim.api.nvim_err_writeln(
      "Theme name mismatch: expected 'silkcircuit', got '" .. (vim.g.colors_name or "nil") .. "'"
    )
    vim.cmd("cquit 1")
    return
  end

  -- Test color palette access
  local colors = silkcircuit.get_colors()
  if not colors or not colors.bg or not colors.fg then
    vim.api.nvim_err_writeln("Failed to get colors from theme")
    vim.cmd("cquit 1")
    return
  end

  -- Test highlight groups exist
  local test_highlights = {
    "Normal",
    "Comment",
    "String",
    "Function",
    "Keyword",
    "Type",
    "Identifier",
  }

  for _, hl in ipairs(test_highlights) do
    local hl_def = vim.api.nvim_get_hl(0, { name = hl })
    if vim.tbl_isempty(hl_def) then
      vim.api.nvim_err_writeln("Highlight group '" .. hl .. "' is not defined")
      vim.cmd("cquit 1")
      return
    end
  end

  -- Test plugin integration loading
  local integrations = require("silkcircuit.integrations")
  local palette = require("silkcircuit.palette")
  local config = require("silkcircuit.config")

  -- All tests passed
  print("All tests passed!")
  vim.cmd("quit")
end

-- Run tests
vim.defer_fn(test_theme, 100)
