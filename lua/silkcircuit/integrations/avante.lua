local M = {}

function M.get(colors, _)
  return {
    -- Title highlights
    AvanteTitle = { fg = colors.bg, bg = colors.green, bold = true },
    AvanteReversedTitle = { fg = colors.green, bg = colors.bg_highlight },
    AvanteSubtitle = { fg = colors.bg, bg = colors.cyan, bold = true },
    AvanteReversedSubtitle = { fg = colors.cyan, bg = colors.bg_highlight },
    AvanteThirdTitle = { fg = colors.fg, bg = colors.bg_visual },
    AvanteReversedThirdTitle = { fg = colors.bg_visual, bg = colors.bg },

    -- Functional highlights
    AvanteSuggestion = { fg = colors.purple_muted, italic = true },
    AvanteAnnotation = { fg = colors.purple_muted, italic = true },
    AvantePopupHint = { fg = colors.fg, bg = colors.bg_float },
    AvanteInlineHint = { fg = colors.purple, bold = true },

    -- Button highlights
    AvanteButtonDefault = { fg = colors.bg, bg = colors.gray },

    -- Diff/Conflict highlights
    AvanteToBeDeleted = { fg = colors.red, bg = colors.bg_highlight, strikethrough = true },
    AvanteConflictCurrent = { bg = colors.diff_delete, bold = true },
    AvanteConflictIncoming = { bg = colors.diff_add, bold = true },
    AvanteConflictCurrentLabel = { fg = colors.bg, bg = colors.red, bold = true },
    AvanteConflictIncomingLabel = { fg = colors.bg, bg = colors.green, bold = true },

    -- Message/Content highlights
    AvanteMessageContent = { fg = colors.fg, bg = colors.bg_float },
    AvanteMessageRole = { fg = colors.purple, bold = true },

    -- Code block highlights
    AvanteCodeBlock = { bg = colors.bg_visual },
    AvanteCodeBlockBorder = { fg = colors.border },

    -- Prompt highlights
    AvantePrompt = { fg = colors.cyan, bold = true },
    AvantePromptPrefix = { fg = colors.purple },

    -- Cursor highlights
    AvanteCursor = { bg = colors.pink, fg = colors.bg },

    -- Additional UI elements
    AvanteMarkdown = { fg = colors.fg },
    AvanteHelp = { fg = colors.cyan_bright },
    AvanteHelpKey = { fg = colors.purple, bold = true },
    AvanteHelpCommand = { fg = colors.cyan },

    -- Status indicators
    AvanteStatusLine = { fg = colors.purple, bg = colors.bg_statusline },
    AvanteProgressBar = { fg = colors.cyan, bg = colors.bg_highlight },

    -- Error/Warning/Info
    AvanteErrorText = { fg = colors.error },
    AvanteWarningText = { fg = colors.warning },
    AvanteInfoText = { fg = colors.info },
  }
end

return M
