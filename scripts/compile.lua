-- Compilation script for Lilac theme
-- This generates a pre-compiled theme file for faster loading

-- Add the plugin to runtime path
vim.opt.runtimepath:prepend(vim.fn.getcwd())

-- Load the theme
local lilac = require("lilac")

-- Setup with default configuration
lilac.setup({})

-- Compile the theme
lilac.compile()

-- Exit
vim.cmd("quit")
