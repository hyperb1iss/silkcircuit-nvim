-- Full SilkCircuit theme integration for AstroNvim with all features
-- Drop this file in ~/.config/nvim/lua/plugins/silkcircuit.lua

return {
  -- SilkCircuit theme with full configuration
  {
    "silkcircuit/silkcircuit-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("silkcircuit").setup({
        compile = true,
        terminal_colors = true,
        integrations = {
          -- Core integrations
          treesitter = true,
          lsp = true,
          telescope = true,
          neotree = true,
          notify = true,
          which_key = true,
          dashboard = true,
          alpha = true,
          lualine = true,
          bufferline = true,
          gitsigns = true,
          indent_blankline = true,
          cmp = true,
          dap_ui = true,
          noice = true,
          hop = true,
          leap = true,
          rainbow_delimiters = true,
        },
        styles = {
          comments = { italic = true },
          keywords = { bold = true },
          functions = { bold = true, italic = true },
          variables = { italic = false },
          conditionals = { italic = true },
          loops = { italic = true },
          booleans = { bold = true },
          constants = { bold = true },
        },
        on_highlights = function(highlights, colors)
          -- Enhanced LSP highlights
          highlights.LspReferenceText = { bg = colors.bg_highlight }
          highlights.LspReferenceRead = { bg = colors.bg_highlight }
          highlights.LspReferenceWrite = { bg = colors.bg_highlight }

          -- Better search highlighting
          highlights.Search = { bg = colors.glow_purple, fg = colors.bg }
          highlights.IncSearch = { bg = colors.glow_pink, fg = colors.bg }

          -- Enhanced selection
          highlights.Visual = { bg = colors.purple_muted }

          -- Popup menu styling
          highlights.Pmenu = { bg = colors.bg_popup, fg = colors.fg }
          highlights.PmenuSel = { bg = colors.glow_purple, fg = colors.bg }
        end,
      })
    end,
  },

  -- Configure AstroUI with SilkCircuit theme
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = function()
      local get_hlgroup = require("astroui").get_hlgroup
      return {
        colorscheme = "silkcircuit",
        highlights = {
          init = {
            Normal = { bg = "NONE" }, -- Optional: transparency
          },
          silkcircuit = function(self)
            local colors = require("silkcircuit.palette").colors
            return {
              -- AstroNvim specific highlights
              StatusLine = { bg = colors.bg_highlight },
              StatusLineNC = { bg = colors.bg_dark },
              WinBar = { bg = "NONE" },
              WinBarNC = { bg = "NONE" },

              -- Telescope enhancements
              TelescopePromptBorder = { fg = colors.glow_pink },
              TelescopeResultsBorder = { fg = colors.purple },
              TelescopePreviewBorder = { fg = colors.glow_cyan },
              TelescopeSelection = { bg = colors.bg_highlight, bold = true },

              -- Neo-tree styling
              NeoTreeNormal = { bg = colors.bg_dark },
              NeoTreeNormalNC = { bg = colors.bg_dark },
              NeoTreeWinSeparator = { fg = colors.purple_muted, bg = "NONE" },

              -- Which-key styling
              WhichKeyFloat = { bg = colors.bg_dark },
              WhichKeyBorder = { fg = colors.purple },

              -- Dashboard/Alpha
              AlphaHeader = { fg = colors.glow_purple, bold = true },
              AlphaButtons = { fg = colors.pink },
              AlphaShortcut = { fg = colors.glow_cyan, bold = true },
              AlphaFooter = { fg = colors.purple_muted, italic = true },
            }
          end,
        },
        status = {
          separators = {
            left = { "", "" },
            right = { "", "" },
            tab = { "", "" },
          },
          colors = function(colors)
            local silkcircuit = require("silkcircuit.palette").colors
            return {
              -- Override status colors with SilkCircuit palette
              blue = silkcircuit.glow_purple,
              green = silkcircuit.green,
              yellow = silkcircuit.yellow_bright,
              orange = silkcircuit.orange,
              red = silkcircuit.glow_pink,
              purple = silkcircuit.purple,
              cyan = silkcircuit.glow_cyan,

              -- Git colors
              git_branch_fg = silkcircuit.glow_purple,
              git_added = silkcircuit.green,
              git_changed = silkcircuit.yellow_bright,
              git_removed = silkcircuit.glow_pink,
            }
          end,
        },
        icons = {
          -- Cyberpunk-style loading animation
          LSPLoading1 = "◢",
          LSPLoading2 = "◣",
          LSPLoading3 = "◤",
          LSPLoading4 = "◥",
        },
      }
    end,
  },

  -- Rainbow delimiters with SilkCircuit colors
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "silkcircuit/silkcircuit-nvim" },
    event = "User AstroFile",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      -- Define SilkCircuit rainbow colors
      vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#ff79c6" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#f1fa8c" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#80ffea" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#ffb86c" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#50fa7b" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#bd93f9" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#8be9fd" })

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

  -- Enhanced Neo-tree configuration (optional)
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        window = {
          width = 35,
          mappings = {
            ["Y"] = "copy_selector", -- Custom copy path functionality
          },
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        },
        -- Custom command to copy various path formats
        commands = {
          copy_selector = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local filename = node.name
            local modify = vim.fn.fnamemodify

            local results = {
              filepath,
              modify(filepath, ":."),
              modify(filepath, ":~"),
              filename,
              modify(filename, ":r"),
              modify(filename, ":e"),
            }

            vim.ui.select({
              "1. Absolute path: " .. results[1],
              "2. Path relative to CWD: " .. results[2],
              "3. Path relative to HOME: " .. results[3],
              "4. Filename: " .. results[4],
              "5. Filename without extension: " .. results[5],
              "6. Extension of the filename: " .. results[6],
            }, { prompt = "Choose to copy to clipboard:" }, function(choice)
              if choice then
                local i = tonumber(choice:sub(1, 1))
                if i then
                  vim.fn.setreg("+", results[i])
                  vim.notify("Copied: " .. results[i])
                end
              end
            end)
          end,
        },
      })
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
