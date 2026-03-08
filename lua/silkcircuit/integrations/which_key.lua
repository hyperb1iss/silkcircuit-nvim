local M = {}

function M.get(colors)
  return {
    WhichKey = { link = "NormalFloat" },
    WhichKeyBorder = { fg = colors.purple },

    WhichKeyGroup = { fg = colors.pink, bold = true },
    WhichKeySeparator = { fg = colors.purple_muted },
    WhichKeySeperator = { fg = colors.purple_muted },
    WhichKeyDesc = { fg = colors.cyan },
    WhichKeyValue = { fg = colors.green },

    WhichKeyFloat = { bg = colors.bg_dark },
    WhichKeyIcon = { fg = colors.pink_bright },
  }
end

return M
