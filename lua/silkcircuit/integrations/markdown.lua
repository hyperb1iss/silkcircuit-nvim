local M = {}

-- Markdown integration
function M.highlights(colors, _opts)
  return {
    -- Headers
    markdownH1 = { fg = colors.glow_purple, bold = true },
    markdownH2 = { fg = colors.purple, bold = true },
    markdownH3 = { fg = colors.pink, bold = true },
    markdownH4 = { fg = colors.cyan, bold = true },
    markdownH5 = { fg = colors.yellow, bold = true },
    markdownH6 = { fg = colors.orange, bold = true },

    -- Delimiters
    markdownH1Delimiter = { fg = colors.purple_muted },
    markdownH2Delimiter = { fg = colors.purple_muted },
    markdownH3Delimiter = { fg = colors.purple_muted },
    markdownH4Delimiter = { fg = colors.purple_muted },
    markdownH5Delimiter = { fg = colors.purple_muted },
    markdownH6Delimiter = { fg = colors.purple_muted },

    -- Elements
    markdownCode = { fg = colors.green, bg = colors.bg_highlight },
    markdownCodeBlock = { fg = colors.green },
    markdownCodeDelimiter = { fg = colors.green },
    markdownBlockquote = { fg = colors.gray, italic = true },
    markdownListMarker = { fg = colors.cyan },
    markdownOrderedListMarker = { fg = colors.cyan },
    markdownRule = { fg = colors.purple_muted },
    markdownHeadingRule = { fg = colors.purple_muted },

    -- Links
    markdownUrl = { fg = colors.cyan, underline = true },
    markdownUrlDelimiter = { fg = colors.gray },
    markdownUrlTitleDelimiter = { fg = colors.green },
    markdownLinkText = { fg = colors.pink, underline = true },
    markdownLinkTextDelimiter = { fg = colors.gray },
    markdownLinkDelimiter = { fg = colors.gray },

    -- Formatting
    markdownItalic = { fg = colors.fg, italic = true },
    markdownBold = { fg = colors.fg, bold = true },
    markdownBoldItalic = { fg = colors.fg, bold = true, italic = true },
    markdownStrike = { fg = colors.gray, strikethrough = true },

    -- Special
    markdownFootnote = { fg = colors.orange },
    markdownFootnoteDefinition = { fg = colors.orange },
    markdownTodo = { fg = colors.yellow, bold = true },
    markdownCheckbox = { fg = colors.cyan },
    markdownCheckboxChecked = { fg = colors.green },
    markdownCheckboxUnchecked = { fg = colors.gray },
  }
end

return M
