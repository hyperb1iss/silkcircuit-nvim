local M = {}

function M.get(colors, _)
  return {
    -- Flash jump labels
    FlashLabel = { fg = colors.bg, bg = colors.pink, bold = true },
    FlashMatch = { fg = colors.cyan, bg = colors.bg_highlight },
    FlashCurrent = { fg = colors.coral, bold = true },
    FlashBackdrop = { fg = colors.gray },
    FlashPrompt = { fg = colors.purple, bg = colors.bg_float, bold = true },
    FlashPromptIcon = { fg = colors.pink },
    FlashCursor = { reverse = true },
  }
end

return M
