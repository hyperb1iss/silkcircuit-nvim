-- AstroNvim Community configuration for Lilac theme
-- Place this in your ~/.config/nvim/lua/community.lua

return {
  -- Add the import for the community plugins
  { import = "astrocommunity.pack.lua" }, -- Example: if you want Lua support
  { import = "astrocommunity.pack.typescript" }, -- Example: if you want TS support

  -- Import Lilac theme from community (when available) or use custom
  {
    "hyperb1iss/lilac-nvim",
    name = "lilac",
    lazy = false,
    priority = 1000,
  },

  -- Configure rainbow brackets with Lilac colors
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "lilac" },
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

  -- Enhance Telescope with Lilac theme
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "lilac" },
    opts = function(_, opts)
      local lilac_colors = require("lilac.palette").colors
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
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.8,
            preview_cutoff = 120,
          },
        },
      })
    end,
  },

  -- Configure Neo-tree with Lilac styling
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "lilac" },
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
        mappings = {
          ["o"] = "open",
        },
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
