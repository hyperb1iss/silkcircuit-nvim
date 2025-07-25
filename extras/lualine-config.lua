-- EPIC Lualine Configuration for Lilac Theme
-- This creates an absolutely stunning femme cyberpunk statusline!

-- Custom separators for that synthwave look
local separators = {
  section = { left = "", right = "" },
  component = { left = "", right = "" },
  arrow = { left = "", right = "" },
  slant = { left = "", right = "" },
  bubble = { left = "", right = "" },
}

-- Neon glow effect for mode indicator
local mode_map = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "V-LINE",
  [""] = "V-BLOCK",
  c = "COMMAND",
  s = "SELECT",
  S = "S-LINE",
  [""] = "S-BLOCK",
  t = "TERMINAL",
  R = "REPLACE",
  r = "REPLACE",
  ["!"] = "SHELL",
}

-- Custom components with icons
local components = {
  -- Mode with custom text
  mode = {
    function()
      return " " .. (mode_map[vim.fn.mode()] or "UNKNOWN")
    end,
    padding = { left = 1, right = 1 },
  },

  -- Git branch with icon
  branch = {
    "branch",
    icon = "",
    padding = { left = 1, right = 1 },
  },

  -- File info with icons
  filename = {
    "filename",
    path = 1, -- Relative path
    symbols = {
      modified = " ",
      readonly = " ",
      unnamed = " [No Name]",
      newfile = " [New]",
    },
  },

  -- Diagnostics with custom icons
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic", "nvim_lsp" },
    symbols = {
      error = " ",
      warn = " ",
      info = " ",
      hint = " ",
    },
  },

  -- LSP status with spinning animation
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
    cond = function()
      return #vim.lsp.get_active_clients() > 0
    end,
  },

  -- File format with icons
  fileformat = {
    "fileformat",
    symbols = {
      unix = " LF",
      dos = " CRLF",
      mac = " CR",
    },
  },

  -- Progress with custom format
  progress = {
    function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local percent = math.floor(current_line / total_lines * 100)
      return string.format("%3d%%%% %d/%d", percent, current_line, total_lines)
    end,
    icon = "",
  },

  -- Time display (because cyberpunk)
  time = {
    function()
      return os.date("%H:%M")
    end,
    icon = "",
  },

  -- Cool ASCII art for empty sections
  empty = {
    function()
      return "▁▂▃▄▅▆▇█▇▆▅▄▃▂▁"
    end,
    color = { fg = "#6272a4" },
  },
}

-- The actual config
return {
  options = {
    theme = "lilac",
    section_separators = separators.slant,
    component_separators = separators.component,
    globalstatus = true, -- Single statusline for all windows
    refresh = {
      statusline = 100, -- Refresh rate for animations
    },
  },

  sections = {
    lualine_a = {
      components.mode,
    },

    lualine_b = {
      components.branch,
      components.diagnostics,
    },

    lualine_c = {
      components.filename,
      {
        -- Show recording macro indicator
        function()
          local reg = vim.fn.reg_recording()
          if reg ~= "" then
            return "⏺ @" .. reg
          end
          return ""
        end,
        color = { fg = "#ff00ff", gui = "bold" },
      },
    },

    lualine_x = {
      components.lsp,
      "encoding",
      components.fileformat,
    },

    lualine_y = {
      components.progress,
    },

    lualine_z = {
      components.time,
    },
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
        mode = 2, -- Show tab number + name
        tabs_color = {
          active = "lualine_a_normal",
          inactive = "lualine_c_inactive",
        },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      components.empty,
    },
  },

  extensions = {
    "fugitive",
    "nvim-tree",
    "neo-tree",
    "lazy",
    "trouble",
    "quickfix",
  },
}
