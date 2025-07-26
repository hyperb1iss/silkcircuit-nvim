-- MAXIMUM EFFECT Lualine configuration for AstroNvim + Lilac
-- This replaces AstroNvim's default statusline with our EPIC custom one
-- Only use this if you want MAXIMUM CYBERPUNK DRAMA

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "silkcircuit-nvim" },
  event = "VeryLazy",
  opts = function()
    local silkcircuit_colors = require("silkcircuit.palette").colors

    -- Custom components with MAXIMUM DRAMA
    local components = {
      -- Epic mode indicator with glow
      mode = {
        function()
          local modes = {
            n = " NORMAL",
            i = " INSERT",
            v = " VISUAL",
            V = " V-LINE",
            [""] = " V-BLOCK",
            c = " COMMAND",
            s = " SELECT",
            S = " S-LINE",
            [""] = " S-BLOCK",
            t = " TERMINAL",
            R = " REPLACE",
            r = " REPLACE",
            ["!"] = " SHELL",
          }
          return modes[vim.fn.mode()] or " UNKNOWN"
        end,
        padding = { left = 1, right = 1 },
      },

      -- Git branch with cyberpunk icon
      branch = {
        "branch",
        icon = "",
        color = { fg = silkcircuit_colors.glow_purple, gui = "bold" },
        padding = { left = 1, right = 1 },
      },

      -- Filename with custom styling
      filename = {
        "filename",
        path = 1,
        symbols = {
          modified = " 󰷥",
          readonly = " ",
          unnamed = " [No Name]",
          newfile = " [New]",
        },
        color = { fg = silkcircuit_colors.pink, gui = "bold" },
      },

      -- Diagnostics with neon colors
      diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic", "nvim_lsp" },
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
        diagnostics_color = {
          error = { fg = silkcircuit_colors.error },
          warn = { fg = silkcircuit_colors.warning },
          info = { fg = silkcircuit_colors.info },
          hint = { fg = silkcircuit_colors.hint },
        },
      },

      -- LSP with spinning animation
      lsp = {
        function()
          local clients = vim.lsp.get_active_clients()
          if #clients == 0 then
            return ""
          end

          local names = {}
          for _, client in ipairs(clients) do
            table.insert(names, client.name)
          end
          return " " .. table.concat(names, ", ")
        end,
        color = { fg = silkcircuit_colors.cyan, gui = "italic" },
        cond = function()
          return #vim.lsp.get_active_clients() > 0
        end,
      },

      -- Progress with custom format
      progress = {
        function()
          local current = vim.fn.line(".")
          local total = vim.fn.line("$")
          local percent = math.floor(current / total * 100)
          return string.format("%3d%% %d/%d", percent, current, total)
        end,
        icon = "",
        color = { fg = silkcircuit_colors.purple_muted },
      },

      -- Clock for cyberpunk vibes
      clock = {
        function()
          return os.date("%H:%M")
        end,
        icon = "",
        color = { fg = silkcircuit_colors.yellow_bright, gui = "bold" },
      },

      -- Macro recording indicator
      macro = {
        function()
          local reg = vim.fn.reg_recording()
          if reg ~= "" then
            return "⏺ @" .. reg
          end
          return ""
        end,
        color = { fg = silkcircuit_colors.glow_pink, gui = "bold" },
      },

      -- Search count
      searchcount = {
        "searchcount",
        color = { fg = silkcircuit_colors.orange, gui = "bold" },
      },
    }

    return {
      options = {
        theme = "silkcircuit",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },

      sections = {
        lualine_a = { components.mode },
        lualine_b = {
          components.branch,
          components.diagnostics,
        },
        lualine_c = {
          components.filename,
          components.macro,
          components.searchcount,
        },
        lualine_x = {
          components.lsp,
          "encoding",
          {
            "fileformat",
            symbols = {
              unix = " LF",
              dos = " CRLF",
              mac = " CR",
            },
          },
        },
        lualine_y = { components.progress },
        lualine_z = { components.clock },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },

      tabline = {
        lualine_a = {
          {
            "tabs",
            mode = 2,
            tabs_color = {
              active = {
                fg = silkcircuit_colors.bg,
                bg = silkcircuit_colors.glow_purple,
                gui = "bold",
              },
              inactive = { fg = silkcircuit_colors.fg_dark, bg = silkcircuit_colors.bg_highlight },
            },
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            function()
              return "▁▂▃▄▅▆▇█▇▆▅▄▃▂▁"
            end,
            color = { fg = silkcircuit_colors.purple_muted },
          },
        },
      },

      extensions = {
        "neo-tree",
        "lazy",
        "trouble",
        "quickfix",
        "fugitive",
      },
    }
  end,
}
