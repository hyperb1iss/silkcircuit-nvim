local M = {}

function M.get(colors)
  return {
    WhichKey = { link = "NormalFloat" },
    WhichKeyBorder = { link = "FloatBorder" },

    WhichKeyGroup = { fg = colors.cyan_bright },
    WhichKeySeparator = { fg = colors.gray },
    WhichKeyDesc = { fg = colors.pink },
    WhichKeyValue = { fg = colors.purple_muted },

    -- Additional which-key highlights
    WhichKeyFloat = { bg = colors.bg_highlight },
    WhichKeyIcon = { fg = colors.pink_bright },
  }
end

return M
