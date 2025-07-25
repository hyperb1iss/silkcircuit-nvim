-- Compilation script for SilkCircuit theme
-- This generates a pre-compiled theme file for faster loading

-- Add the plugin to runtime path
vim.opt.runtimepath:prepend(vim.fn.getcwd())

-- Load the theme
local silkcircuit = require("silkcircuit")

-- Setup with default configuration
silkcircuit.setup({})

-- Compile the theme
silkcircuit.compile()

-- Exit
vim.cmd("quit")
