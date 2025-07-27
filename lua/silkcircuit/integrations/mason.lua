local M = {}

function M.get(colors, _)
  return {
    -- Mason window
    MasonNormal = { fg = colors.fg, bg = colors.bg_float },
    MasonHeader = { fg = colors.bg, bg = colors.purple, bold = true },
    MasonHeaderSecondary = { fg = colors.bg, bg = colors.pink, bold = true },
    MasonHighlight = { fg = colors.cyan },
    MasonHighlightBlock = { fg = colors.bg, bg = colors.cyan },
    MasonHighlightBlockBold = { fg = colors.bg, bg = colors.cyan, bold = true },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonHighlightBlockSecondary = { fg = colors.bg, bg = colors.yellow },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg, bg = colors.yellow, bold = true },
    MasonMuted = { fg = colors.gray },
    MasonMutedBlock = { fg = colors.bg, bg = colors.gray },
    MasonMutedBlockBold = { fg = colors.bg, bg = colors.gray, bold = true },
    MasonError = { fg = colors.error },
    MasonWarning = { fg = colors.warning },
    MasonHeading = { fg = colors.pink, bold = true },
    MasonLink = { fg = colors.cyan, underline = true },

    -- Status indicators
    MasonHighlightGreen = { fg = colors.green },
    MasonHighlightOrange = { fg = colors.coral },
    MasonHighlightRed = { fg = colors.red },
    MasonHighlightViolet = { fg = colors.purple },
    MasonHighlightCyan = { fg = colors.cyan_bright },
  }
end

return M
