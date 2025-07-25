local M = {}

-- nvim-window-picker integration
function M.highlights(colors, _opts)
  return {
    -- Window picker highlights
    WindowPickerStatusLine = { fg = colors.bg, bg = colors.glow_purple, bold = true },
    WindowPickerStatusLineNC = { fg = colors.bg, bg = colors.purple, bold = true },
    WindowPickerWinBar = { fg = colors.bg, bg = colors.glow_purple, bold = true },
    WindowPickerWinBarNC = { fg = colors.bg, bg = colors.purple, bold = true },
  }
end

return M
