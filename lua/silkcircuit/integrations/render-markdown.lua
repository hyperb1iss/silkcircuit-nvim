local M = {}

function M.get(colors)
  return {
    -- Headings
    RenderMarkdownH1 = { fg = colors.pink, bold = true },
    RenderMarkdownH1Bg = { bg = colors.bg_highlight },
    RenderMarkdownH2 = { fg = colors.purple, bold = true },
    RenderMarkdownH2Bg = { bg = colors.bg_dark },
    RenderMarkdownH3 = { fg = colors.cyan, bold = true },
    RenderMarkdownH3Bg = { bg = colors.bg_dark },
    RenderMarkdownH4 = { fg = colors.yellow, bold = true },
    RenderMarkdownH4Bg = { bg = colors.bg_dark },
    RenderMarkdownH5 = { fg = colors.green, bold = true },
    RenderMarkdownH5Bg = { bg = colors.bg_dark },
    RenderMarkdownH6 = { fg = colors.blue, bold = true },
    RenderMarkdownH6Bg = { bg = colors.bg_dark },

    -- Code
    RenderMarkdownCode = { bg = colors.bg_dark },
    RenderMarkdownCodeInline = { fg = colors.cyan, bg = colors.bg_highlight },

    -- Lists
    RenderMarkdownBullet = { fg = colors.purple },
    RenderMarkdownDash = { fg = colors.purple_muted },

    -- Checkboxes
    RenderMarkdownUnchecked = { fg = colors.red },
    RenderMarkdownChecked = { fg = colors.green },
    RenderMarkdownTodo = { fg = colors.yellow },

    -- Quotes
    RenderMarkdownQuote = { fg = colors.purple_muted, italic = true },

    -- Tables
    RenderMarkdownTableHead = { fg = colors.purple, bold = true },
    RenderMarkdownTableRow = { fg = colors.fg },
    RenderMarkdownTableFill = { fg = colors.purple_muted },

    -- Links
    RenderMarkdownLink = { fg = colors.cyan, underline = true },

    -- Callouts
    RenderMarkdownInfo = { fg = colors.cyan },
    RenderMarkdownSuccess = { fg = colors.green },
    RenderMarkdownHint = { fg = colors.yellow },
    RenderMarkdownWarn = { fg = colors.yellow },
    RenderMarkdownError = { fg = colors.red },
  }
end

return M
