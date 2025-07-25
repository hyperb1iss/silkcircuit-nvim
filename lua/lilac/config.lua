local M = {}

-- Default configuration
M.defaults = {
  transparent = false, -- Enable transparent background
  terminal_colors = true, -- Configure terminal colors
  dim_inactive = false, -- Dim inactive windows

  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { bold = false },
    variables = {},
    operators = {},
    booleans = {},
    strings = {},
    types = {},
    constants = {},
  },

  -- Custom highlight group overrides
  on_highlights = nil,

  -- Plugin integrations (all enabled by default)
  integrations = {
    treesitter = true,
    lsp = true,
    telescope = true,
    nvimtree = true,
    neotree = true,
    gitsigns = true,
    gitgutter = true,
    diffview = true,
    indent_blankline = true,
    bufferline = true,
    lualine = true,
    dashboard = true,
    alpha = true,
    which_key = true,
    cmp = true,
    notify = true,
    noice = true,
    hop = true,
    leap = true,
    lazy = true,
    mason = true,
    nvim_dap = true,
    nvim_dap_ui = true,
    trouble = true,
    outline = true,
    illuminate = true,
    flash = true,
    rainbow_delimiters = true,
  },
}

-- Current configuration
M.options = {}

-- Setup function
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", M.defaults, options or {})
end

-- Get the current configuration
function M.get()
  return M.options
end

-- Check if a plugin integration is enabled
function M.is_enabled(integration)
  return M.options.integrations[integration] ~= false
end

-- Get style for a syntax group
function M.get_style(group)
  return M.options.styles[group] or {}
end

return M
