-- AstroUI configuration for Lilac theme
-- Place this in your ~/.config/nvim/lua/plugins/astroui.lua

return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- Set Lilac as the colorscheme
    colorscheme = "silkcircuit",

    -- Configure highlights that integrate with Lilac theme
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- AstroNvim specific UI elements with Lilac colors
        Normal = { bg = "NONE" }, -- For transparency if desired
      },

      silkcircuit = { -- this table overrides highlights when silkcircuit is active
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
      colorscheme = "silkcircuit",

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
        local silkcircuit_colors = require("silkcircuit.palette").colors
        return {
          -- Base colors
          fg = silkcircuit_colors.fg,
          bg = silkcircuit_colors.bg,
          dark_bg = silkcircuit_colors.bg_dark,

          -- Mode colors (these get used by AstroNvim's mode indicator)
          blue = silkcircuit_colors.glow_purple, -- Normal mode
          green = silkcircuit_colors.green, -- Terminal mode
          yellow = silkcircuit_colors.yellow_bright, -- Command mode
          yellow_1 = silkcircuit_colors.yellow, -- Alt yellow
          orange = silkcircuit_colors.orange, -- Replace mode
          red = silkcircuit_colors.glow_pink, -- Insert mode
          red_1 = silkcircuit_colors.pink, -- Alt red
          purple = silkcircuit_colors.purple, -- Visual mode
          cyan = silkcircuit_colors.glow_cyan, -- Select mode

          -- Core status colors (fallbacks)
          section_fg = silkcircuit_colors.fg,
          section_bg = silkcircuit_colors.bg_highlight,
          normal = silkcircuit_colors.fg,
          insert = silkcircuit_colors.glow_pink,
          visual = silkcircuit_colors.purple,
          replace = silkcircuit_colors.orange,
          command = silkcircuit_colors.yellow_bright,
          terminal = silkcircuit_colors.green,

          -- UI element colors
          bright_bg = silkcircuit_colors.bg_highlight,
          bright_fg = silkcircuit_colors.fg_light,

          -- Diagnostic colors
          diag_ERROR = silkcircuit_colors.error,
          diag_WARN = silkcircuit_colors.warning,
          diag_INFO = silkcircuit_colors.info,
          diag_HINT = silkcircuit_colors.hint,

          -- Git colors with branch
          git_branch_fg = silkcircuit_colors.glow_purple,
          git_added = silkcircuit_colors.green,
          git_changed = silkcircuit_colors.yellow_bright,
          git_removed = silkcircuit_colors.glow_pink,

          -- LSP and treesitter colors
          lsp = silkcircuit_colors.cyan,
          treesitter_fg = silkcircuit_colors.cyan,

          -- Complete buffer color set
          buffer_fg = silkcircuit_colors.fg_dark,
          buffer_bg = silkcircuit_colors.bg_highlight,
          buffer_path_fg = silkcircuit_colors.purple_muted,
          buffer_close_fg = silkcircuit_colors.gray,

          buffer_active_fg = silkcircuit_colors.bg,
          buffer_active_bg = silkcircuit_colors.glow_purple,
          buffer_active_path_fg = silkcircuit_colors.bg,
          buffer_active_close_fg = silkcircuit_colors.bg,

          buffer_visible_fg = silkcircuit_colors.fg,
          buffer_visible_bg = silkcircuit_colors.purple_muted,
          buffer_visible_path_fg = silkcircuit_colors.fg_light,
          buffer_visible_close_fg = silkcircuit_colors.fg_dark,

          buffer_overflow_fg = silkcircuit_colors.bg,
          buffer_overflow_bg = silkcircuit_colors.pink,
          buffer_picker_fg = silkcircuit_colors.glow_cyan,

          -- Tab colors
          tab_fg = silkcircuit_colors.fg_dark,
          tab_bg = silkcircuit_colors.bg_highlight,
          tab_active_fg = silkcircuit_colors.bg,
          tab_active_bg = silkcircuit_colors.glow_purple,
          tab_close_fg = silkcircuit_colors.fg_dark,
          tab_close_bg = silkcircuit_colors.bg_highlight,

          -- Special UI colors
          winbar = silkcircuit_colors.fg_dark,
          winbar_fg = silkcircuit_colors.fg_dark,
          winbar_bg = silkcircuit_colors.bg,
          winbar_nc = silkcircuit_colors.gray,
          winbarnc_fg = silkcircuit_colors.gray,
          winbarnc_bg = silkcircuit_colors.bg_dark,
          tabline_bg = silkcircuit_colors.bg_dark,
          tabline_fg = silkcircuit_colors.fg_dark,
          scrollbar = silkcircuit_colors.purple_muted,

          -- Status colors
          status_bg = silkcircuit_colors.bg_highlight,
          status_fg = silkcircuit_colors.fg,

          -- Additional colors that might be needed
          none = "NONE",
          text = silkcircuit_colors.fg,
          text_active = silkcircuit_colors.fg_light,
          text_inactive = silkcircuit_colors.fg_dark,
          bg_active = silkcircuit_colors.bg_highlight,
          bg_inactive = silkcircuit_colors.bg_dark,

          -- LSP and diagnostic backgrounds
          lsp_bg = silkcircuit_colors.bg_highlight,
          diag_ERROR_bg = silkcircuit_colors.bg_highlight,
          diag_WARN_bg = silkcircuit_colors.bg_highlight,
          diag_INFO_bg = silkcircuit_colors.bg_highlight,
          diag_HINT_bg = silkcircuit_colors.bg_highlight,

          -- Additional mode colors
          select = silkcircuit_colors.glow_cyan,

          -- Component specific colors
          file_info_bg = silkcircuit_colors.bg_highlight,
          file_info_fg = silkcircuit_colors.fg,
          nav_bg = silkcircuit_colors.bg_highlight,
          nav_fg = silkcircuit_colors.fg,
          folder_closed = silkcircuit_colors.purple,
          folder_open = silkcircuit_colors.glow_purple,

          -- Completion menu
          pmenu_bg = silkcircuit_colors.bg_popup,
          pmenu_fg = silkcircuit_colors.fg,
          pmenu_sel_bg = silkcircuit_colors.glow_purple,
          pmenu_sel_fg = silkcircuit_colors.bg,
        }
      end,
    },
  },
}
