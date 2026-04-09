-- AstroNvim Community configuration for SilkCircuit theme
-- Place this in your ~/.config/nvim/lua/community.lua

return {
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },

  -- SilkCircuit theme
  {
    "hyperb1iss/silkcircuit",
    name = "silkcircuit",
    lazy = false,
    priority = 1000,
  },

  -- Rainbow brackets — colors are provided by the theme's integration
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "silkcircuit" },
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  -- Telescope — layout preferences (colors handled by theme integration)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "silkcircuit" },
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        defaults = {
          prompt_prefix = "  ",
          selection_caret = "  ",
          entry_prefix = "  ",
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.8,
            preview_cutoff = 120,
          },
        },
      })
    end,
  },

  -- Neo-tree — behavior config (colors handled by theme integration)
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "silkcircuit" },
    opts = {
      default_component_configs = {
        git_status = {
          symbols = {
            added = " ",
            modified = " ",
            deleted = " ",
            renamed = " ",
            untracked = " ",
            ignored = " ",
            unstaged = " ",
            staged = " ",
            conflict = " ",
          },
        },
      },
      window = {
        width = 30,
        mappings = { ["o"] = "open" },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
}
