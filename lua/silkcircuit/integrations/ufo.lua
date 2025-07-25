local M = {}

-- nvim-ufo integration: Better folding
function M.highlights(colors, _opts)
  return {
    -- Fold indicators
    UfoFoldedFg = { fg = colors.purple_muted },
    UfoFoldedBg = { bg = colors.bg_highlight },
    UfoCursorFoldedLine = { bg = colors.bg_highlight, bold = true },
    UfoPreviewSbar = { bg = colors.bg_highlight },
    UfoPreviewThumb = { bg = colors.purple },
    UfoPreviewWinBar = { bg = "NONE" },
    UfoFoldedEllipsis = { fg = colors.glow_purple },

    -- Virtual text
    UfoVirtText = { fg = colors.purple_muted, italic = true },
    UfoVirtTextChunk = { fg = colors.purple_muted },

    -- Fold preview
    UfoPreviewCursorLine = { bg = colors.bg_highlight },
    UfoPreviewNormal = { bg = colors.bg_dark },
    UfoPreviewBorder = { fg = colors.purple_muted },
  }
end

return M
