local M = {}

function M.get(colors, _)
  return {
    -- Harpoon menu
    HarpoonBorder = { fg = colors.border },
    HarpoonWindow = { fg = colors.fg, bg = colors.bg_float },
    HarpoonTitle = { fg = colors.pink, bold = true },
    HarpoonCurrentFile = { fg = colors.purple, bg = colors.bg_highlight, bold = true },
    HarpoonNumberActive = { fg = colors.cyan, bold = true },
    HarpoonNumberInactive = { fg = colors.gray },
    HarpoonActive = { fg = colors.fg, bg = colors.bg_highlight },
    HarpoonInactive = { fg = colors.gray },

    -- Status line indicators
    HarpoonStatusActive = { fg = colors.purple, bold = true },
    HarpoonStatusInactive = { fg = colors.gray },
  }
end

return M
