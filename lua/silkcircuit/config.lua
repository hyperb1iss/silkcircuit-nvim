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
    -- Core integrations
    treesitter = true,
    lsp = true,
    native_lsp = { enabled = true }, -- Alias for lsp
    telescope = true,
    nvimtree = true,
    neotree = true,

    -- Git integrations
    gitsigns = true,
    gitgutter = true,
    diffview = true,

    -- UI integrations
    indent_blankline = true,
    bufferline = true,
    lualine = true,
    dashboard = true,
    alpha = true,
    which_key = true,

    -- Completion and snippets
    cmp = true,
    blink_cmp = true, -- Support for blink.cmp

    -- Notifications
    notify = true,
    noice = true,

    -- Navigation and motion
    hop = true,
    leap = true,
    flash = true,

    -- Development tools
    lazy = true,
    mason = true,
    dap = true, -- Alias for nvim_dap
    dap_ui = true, -- Alias for nvim_dap_ui
    nvim_dap = true,
    nvim_dap_ui = true,

    -- Code analysis
    trouble = true,
    outline = true,
    symbols_outline = true, -- Alias for outline
    illuminate = true,
    aerial = true,

    -- Visual enhancements
    rainbow_delimiters = true,
    ts_rainbow = false, -- Legacy rainbow support

    -- Folding
    ufo = true,

    -- Window management
    window_picker = true,
    colorful_winsep = { enabled = true, color = "purple" },

    -- Miscellaneous
    markdown = true,
    semantic_tokens = true,

    -- Snacks.nvim support
    snacks = {
      enabled = true,
      indent_scope_color = "purple",
    },
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
  -- If setup hasn't been called, use defaults
  if vim.tbl_isempty(M.options) then
    M.options = M.defaults
  end
  return M.options
end

-- Check if a plugin integration is enabled
function M.is_enabled(integration)
  local integrations = M.get().integrations

  -- Handle aliases
  local aliases = {
    native_lsp = "lsp",
    dap = "nvim_dap",
    dap_ui = "nvim_dap_ui",
    symbols_outline = "outline",
  }

  -- Check if this is an aliased integration
  local actual_integration = aliases[integration] or integration

  -- Check the integration status
  local status = integrations[actual_integration]

  -- Handle table-style integrations (like native_lsp = { enabled = true })
  if type(status) == "table" then
    return status.enabled ~= false
  end

  return status ~= false
end

-- Get style for a syntax group
function M.get_style(group)
  return M.options.styles[group] or {}
end

return M
