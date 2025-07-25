-- AstroNvim plugin configuration for Lilac theme
-- Place this in your ~/.config/nvim/lua/plugins/lilac.lua

return {
  "hyperb1iss/lilac-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("lilac").setup({
      -- AstroNvim optimized settings
      transparent = false,
      terminal_colors = true,
      dim_inactive = false,

      -- Styles that work great with AstroNvim
      styles = {
        comments = { italic = true },
        keywords = { italic = false, bold = true },
        functions = { bold = true, italic = true },
        variables = {},
        operators = {},
        booleans = { bold = true },
        strings = { italic = true },
        types = { bold = true },
        constants = { bold = true },
      },

      -- Ensure all integrations are enabled for AstroNvim's plugins
      integrations = {
        treesitter = true,
        lsp = true,
        telescope = true,
        nvimtree = true,
        neotree = true,
        gitsigns = true,
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
        trouble = true,
        outline = true,
        illuminate = true,
        flash = true,
        rainbow_delimiters = true,
      },

      -- Custom highlights for AstroNvim specific elements
      on_highlights = function(highlights, colors)
        -- AstroNvim dashboard customization
        highlights.DashboardHeader = { fg = colors.glow_purple, bold = true }
        highlights.DashboardCenter = { fg = colors.pink }
        highlights.DashboardShortcut = { fg = colors.cyan, bold = true }
        highlights.DashboardFooter = { fg = colors.purple_muted, italic = true }

        -- Neo-tree enhancements
        highlights.NeoTreeDirectoryIcon = { fg = colors.purple }
        highlights.NeoTreeDirectoryName = { fg = colors.purple }
        highlights.NeoTreeFileIcon = { fg = colors.pink }
        highlights.NeoTreeFileName = { fg = colors.fg_dark }
        highlights.NeoTreeModified = { fg = colors.yellow }
        highlights.NeoTreeGitAdded = { fg = colors.green }
        highlights.NeoTreeGitDeleted = { fg = colors.pink }
        highlights.NeoTreeGitModified = { fg = colors.yellow }

        -- Which-key popup styling
        highlights.WhichKeyFloat = { bg = colors.bg_dark }
        highlights.WhichKeyBorder = { fg = colors.purple }
        highlights.WhichKeyGroup = { fg = colors.pink, bold = true }
        highlights.WhichKeyDesc = { fg = colors.cyan }
        highlights.WhichKeySeperator = { fg = colors.purple_muted }
        highlights.WhichKeyValue = { fg = colors.green }
      end,
    })
  end,
}
