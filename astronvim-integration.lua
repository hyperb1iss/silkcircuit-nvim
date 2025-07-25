-- Minimal SilkCircuit theme integration for AstroNvim
-- Drop this file in ~/.config/nvim/lua/plugins/silkcircuit.lua

return {
  -- SilkCircuit theme
  {
    "silkcircuit/silkcircuit-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("silkcircuit").setup({
        compile = true,
        terminal_colors = true,
        integrations = {
          -- Essential AstroNvim integrations
          treesitter = true,
          lsp = true,
          telescope = true,
          neotree = true,
          notify = true,
          which_key = true,
          alpha = true,
          lualine = true,
          gitsigns = true,
          cmp = true,
          indent_blankline = true,
          rainbow_delimiters = true,
        },
        styles = {
          comments = { italic = true },
          keywords = { bold = true },
          functions = { bold = true, italic = true },
        },
      })
    end,
  },

  -- Configure AstroUI to use SilkCircuit
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "silkcircuit",
      highlights = {
        init = {
          Normal = { bg = "NONE" }, -- Optional: transparency
        },
      },
      -- Minimal status configuration for SilkCircuit colors
      status = {
        separators = {
          left = { "", "" },
          right = { "", "" },
        },
      },
    },
  },

  -- Rainbow delimiters (optional but recommended)
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "silkcircuit/silkcircuit-nvim" },
    event = "User AstroFile",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
        },
      }
    end,
  },

  -- Ensure termguicolors is enabled
  {
    "AstroNvim/astrocore",
    opts = {
      options = {
        opt = {
          termguicolors = true,
        },
      },
    },
  },
}
