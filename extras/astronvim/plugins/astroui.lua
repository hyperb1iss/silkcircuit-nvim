-- AstroUI configuration for Lilac theme
-- Place this in your ~/.config/nvim/lua/plugins/astroui.lua

return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- Set Lilac as the colorscheme
    colorscheme = "lilac",

    -- Configure highlights that integrate with Lilac theme
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- AstroNvim specific UI elements with Lilac colors
        Normal = { bg = "NONE" }, -- For transparency if desired
      },

      lilac = { -- this table overrides highlights when lilac is active
        -- Customize specific highlights for perfect integration
        ["@variable"] = { fg = "#ff79c6" }, -- Use Lilac pink for variables
        ["@function"] = { fg = "#e135ff", bold = true, italic = true }, -- Glowing purple functions
        ["@keyword"] = { fg = "#bd93f9", bold = true }, -- Purple keywords
        ["@string"] = { fg = "#ff92d0", italic = true }, -- Pink strings
        ["@comment"] = { fg = "#9580ff", italic = true }, -- Muted purple comments

        -- Status line integration
        StatusLine = { bg = "#3b2d4f" },
        StatusLineNC = { bg = "#1e1a2e" },

        -- Telescope integration with Lilac colors
        TelescopePromptBorder = { fg = "#ff00ff" },
        TelescopeResultsBorder = { fg = "#bd93f9" },
        TelescopePreviewBorder = { fg = "#80ffea" },
        TelescopeSelection = { bg = "#44475a", fg = "#f8f8f2", bold = true },

        -- Neo-tree with femme cyberpunk vibes
        NeoTreeNormal = { bg = "#1e1a2e" },
        NeoTreeNormalNC = { bg = "#16131f" },
        NeoTreeWinSeparator = { fg = "#6272a4", bg = "NONE" },

        -- Which-key popup
        WhichKeyFloat = { bg = "#1e1a2e" },
        WhichKeyBorder = { fg = "#bd93f9" },

        -- Dashboard/Alpha styling
        AlphaHeader = { fg = "#e135ff", bold = true },
        AlphaButtons = { fg = "#ff79c6" },
        AlphaShortcut = { fg = "#80ffea", bold = true },
        AlphaFooter = { fg = "#9580ff", italic = true },
      },
    },

    -- Status configuration for epic Lualine integration
    status = {
      -- Use our custom Lilac Lualine theme
      colorscheme = "lilac",

      -- Separator styles for maximum cyberpunk vibes
      separators = {
        left = { "", "" }, -- Neon arrow separators
        right = { "", "" },
        tab = { "", "" },
        breadcrumbs = "  ",
        path = "  ",
      },

      -- Custom colors that integrate with Lilac theme
      colors = function(colors)
        local lilac_colors = require("lilac.palette").colors
        return {
          -- Base colors
          fg = lilac_colors.fg,
          bg = lilac_colors.bg,
          dark_bg = lilac_colors.bg_dark,

          -- Mode colors (these get used by AstroNvim's mode indicator)
          blue = lilac_colors.glow_purple, -- Normal mode
          green = lilac_colors.green, -- Terminal mode
          yellow = lilac_colors.yellow_bright, -- Command mode
          yellow_1 = lilac_colors.yellow, -- Alt yellow
          orange = lilac_colors.orange, -- Replace mode
          red = lilac_colors.glow_pink, -- Insert mode
          red_1 = lilac_colors.pink, -- Alt red
          purple = lilac_colors.purple, -- Visual mode
          cyan = lilac_colors.glow_cyan, -- Select mode

          -- Core status colors (fallbacks)
          section_fg = lilac_colors.fg,
          section_bg = lilac_colors.bg_highlight,
          normal = lilac_colors.fg,
          insert = lilac_colors.glow_pink,
          visual = lilac_colors.purple,
          replace = lilac_colors.orange,
          command = lilac_colors.yellow_bright,
          terminal = lilac_colors.green,

          -- UI element colors
          bright_bg = lilac_colors.bg_highlight,
          bright_fg = lilac_colors.fg_light,

          -- Diagnostic colors
          diag_ERROR = lilac_colors.error,
          diag_WARN = lilac_colors.warning,
          diag_INFO = lilac_colors.info,
          diag_HINT = lilac_colors.hint,

          -- Git colors with branch
          git_branch_fg = lilac_colors.glow_purple,
          git_added = lilac_colors.green,
          git_changed = lilac_colors.yellow_bright,
          git_removed = lilac_colors.glow_pink,

          -- LSP and treesitter colors
          lsp = lilac_colors.cyan,
          treesitter_fg = lilac_colors.cyan,

          -- Complete buffer color set
          buffer_fg = lilac_colors.fg_dark,
          buffer_bg = lilac_colors.bg_highlight,
          buffer_path_fg = lilac_colors.purple_muted,
          buffer_close_fg = lilac_colors.gray,

          buffer_active_fg = lilac_colors.bg,
          buffer_active_bg = lilac_colors.glow_purple,
          buffer_active_path_fg = lilac_colors.bg,
          buffer_active_close_fg = lilac_colors.bg,

          buffer_visible_fg = lilac_colors.fg,
          buffer_visible_bg = lilac_colors.purple_muted,
          buffer_visible_path_fg = lilac_colors.fg_light,
          buffer_visible_close_fg = lilac_colors.fg_dark,

          buffer_overflow_fg = lilac_colors.bg,
          buffer_overflow_bg = lilac_colors.pink,
          buffer_picker_fg = lilac_colors.glow_cyan,

          -- Tab colors
          tab_fg = lilac_colors.fg_dark,
          tab_bg = lilac_colors.bg_highlight,
          tab_active_fg = lilac_colors.bg,
          tab_active_bg = lilac_colors.glow_purple,
          tab_close_fg = lilac_colors.fg_dark,
          tab_close_bg = lilac_colors.bg_highlight,

          -- Special UI colors
          winbar = lilac_colors.fg_dark,
          winbar_fg = lilac_colors.fg_dark,
          winbar_bg = lilac_colors.bg,
          winbar_nc = lilac_colors.gray,
          winbarnc_fg = lilac_colors.gray,
          winbarnc_bg = lilac_colors.bg_dark,
          tabline_bg = lilac_colors.bg_dark,
          tabline_fg = lilac_colors.fg_dark,
          scrollbar = lilac_colors.purple_muted,

          -- Status colors
          status_bg = lilac_colors.bg_highlight,
          status_fg = lilac_colors.fg,

          -- Additional colors that might be needed
          none = "NONE",
          text = lilac_colors.fg,
          text_active = lilac_colors.fg_light,
          text_inactive = lilac_colors.fg_dark,
          bg_active = lilac_colors.bg_highlight,
          bg_inactive = lilac_colors.bg_dark,

          -- LSP and diagnostic backgrounds
          lsp_bg = lilac_colors.bg_highlight,
          diag_ERROR_bg = lilac_colors.bg_highlight,
          diag_WARN_bg = lilac_colors.bg_highlight,
          diag_INFO_bg = lilac_colors.bg_highlight,
          diag_HINT_bg = lilac_colors.bg_highlight,

          -- Additional mode colors
          select = lilac_colors.glow_cyan,

          -- Component specific colors
          file_info_bg = lilac_colors.bg_highlight,
          file_info_fg = lilac_colors.fg,
          nav_bg = lilac_colors.bg_highlight,
          nav_fg = lilac_colors.fg,
          folder_closed = lilac_colors.purple,
          folder_open = lilac_colors.glow_purple,

          -- Completion menu
          pmenu_bg = lilac_colors.bg_popup,
          pmenu_fg = lilac_colors.fg,
          pmenu_sel_bg = lilac_colors.glow_purple,
          pmenu_sel_fg = lilac_colors.bg,
        }
      end,
    },
  },
}
