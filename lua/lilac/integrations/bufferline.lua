local M = {}

function M.highlights(colors, opts)
  return {
    BufferLineFill = { bg = colors.bg },
    BufferLineBackground = { fg = colors.gray, bg = colors.bg_highlight },
    BufferLineBuffer = { fg = colors.gray, bg = colors.bg_highlight },
    BufferLineBufferSelected = { fg = colors.fg, bg = colors.bg, bold = true },
    BufferLineBufferVisible = { fg = colors.fg_dark, bg = colors.bg },
    
    BufferLineCloseButton = { fg = colors.gray, bg = colors.bg_highlight },
    BufferLineCloseButtonSelected = { fg = colors.red, bg = colors.bg },
    BufferLineCloseButtonVisible = { fg = colors.red, bg = colors.bg },
    
    BufferLineTab = { fg = colors.gray, bg = colors.bg_highlight },
    BufferLineTabSelected = { fg = colors.purple, bg = colors.bg, bold = true },
    BufferLineTabClose = { fg = colors.red, bg = colors.bg_highlight },
    
    BufferLineDuplicate = { fg = colors.gray, bg = colors.bg_highlight, italic = true },
    BufferLineDuplicateSelected = { fg = colors.fg, bg = colors.bg, italic = true },
    BufferLineDuplicateVisible = { fg = colors.fg_dark, bg = colors.bg, italic = true },
    
    BufferLineSeparator = { fg = colors.bg, bg = colors.bg_highlight },
    BufferLineSeparatorSelected = { fg = colors.bg, bg = colors.bg },
    BufferLineSeparatorVisible = { fg = colors.bg, bg = colors.bg },
    
    BufferLineIndicatorSelected = { fg = colors.purple, bg = colors.bg },
    BufferLineIndicatorVisible = { fg = colors.bg, bg = colors.bg },
    
    BufferLineModified = { fg = colors.git_change, bg = colors.bg_highlight },
    BufferLineModifiedSelected = { fg = colors.git_change, bg = colors.bg },
    BufferLineModifiedVisible = { fg = colors.git_change, bg = colors.bg },
    
    BufferLinePick = { fg = colors.red, bg = colors.bg_highlight, bold = true },
    BufferLinePickSelected = { fg = colors.red, bg = colors.bg, bold = true },
    BufferLinePickVisible = { fg = colors.red, bg = colors.bg, bold = true },
    
    BufferLineNumbers = { fg = colors.gray, bg = colors.bg_highlight },
    BufferLineNumbersSelected = { fg = colors.fg, bg = colors.bg },
    BufferLineNumbersVisible = { fg = colors.fg_dark, bg = colors.bg },
    
    BufferLineDiagnostic = { fg = colors.gray, bg = colors.bg_highlight },
    BufferLineDiagnosticSelected = { fg = colors.fg, bg = colors.bg },
    BufferLineDiagnosticVisible = { fg = colors.fg_dark, bg = colors.bg },
    
    BufferLineError = { fg = colors.error, bg = colors.bg_highlight },
    BufferLineErrorSelected = { fg = colors.error, bg = colors.bg },
    BufferLineErrorVisible = { fg = colors.error, bg = colors.bg },
    BufferLineErrorDiagnostic = { fg = colors.error, bg = colors.bg_highlight },
    BufferLineErrorDiagnosticSelected = { fg = colors.error, bg = colors.bg },
    BufferLineErrorDiagnosticVisible = { fg = colors.error, bg = colors.bg },
    
    BufferLineWarning = { fg = colors.warning, bg = colors.bg_highlight },
    BufferLineWarningSelected = { fg = colors.warning, bg = colors.bg },
    BufferLineWarningVisible = { fg = colors.warning, bg = colors.bg },
    BufferLineWarningDiagnostic = { fg = colors.warning, bg = colors.bg_highlight },
    BufferLineWarningDiagnosticSelected = { fg = colors.warning, bg = colors.bg },
    BufferLineWarningDiagnosticVisible = { fg = colors.warning, bg = colors.bg },
    
    BufferLineInfo = { fg = colors.info, bg = colors.bg_highlight },
    BufferLineInfoSelected = { fg = colors.info, bg = colors.bg },
    BufferLineInfoVisible = { fg = colors.info, bg = colors.bg },
    BufferLineInfoDiagnostic = { fg = colors.info, bg = colors.bg_highlight },
    BufferLineInfoDiagnosticSelected = { fg = colors.info, bg = colors.bg },
    BufferLineInfoDiagnosticVisible = { fg = colors.info, bg = colors.bg },
    
    BufferLineHint = { fg = colors.hint, bg = colors.bg_highlight },
    BufferLineHintSelected = { fg = colors.hint, bg = colors.bg },
    BufferLineHintVisible = { fg = colors.hint, bg = colors.bg },
    BufferLineHintDiagnostic = { fg = colors.hint, bg = colors.bg_highlight },
    BufferLineHintDiagnosticSelected = { fg = colors.hint, bg = colors.bg },
    BufferLineHintDiagnosticVisible = { fg = colors.hint, bg = colors.bg },
    
    BufferLineGroupSeparator = { fg = colors.bg, bg = colors.purple },
    BufferLineGroupLabel = { fg = colors.bg, bg = colors.purple, bold = true },
    
    BufferLineOffsetSeparator = { fg = colors.bg, bg = colors.bg },
  }
end

return M