local M = {}

function M.get(colors, _)
  return {
    -- Alpha dashboard highlights
    AlphaShortcut = { fg = colors.cyan, bold = true },
    AlphaHeader = { fg = colors.glow_purple, bold = true },
    AlphaHeaderLabel = { fg = colors.pink },
    AlphaFooter = { fg = colors.purple_muted, italic = true },
    AlphaButtons = { fg = colors.pink },
    AlphaButtonShortcut = { fg = colors.cyan, bold = true },
  }
end

return M
