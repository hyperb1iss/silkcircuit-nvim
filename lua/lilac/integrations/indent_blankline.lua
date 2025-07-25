local M = {}

function M.highlights(colors, opts)
  return {
    -- Version 3
    IblIndent = { fg = colors.bg_highlight },
    IblIndentScope = { fg = colors.gray_dark },
    IblIndentScopeChar = { fg = colors.gray_dark },
    IblIndentScopeFirst = { fg = colors.gray_dark },
    
    -- Version 2 (for backwards compatibility)
    IndentBlanklineChar = { fg = colors.bg_highlight },
    IndentBlanklineContextChar = { fg = colors.gray_dark },
    IndentBlanklineContextStart = { sp = colors.gray_dark, underline = true },
    IndentBlanklineSpaceChar = { fg = colors.bg_highlight },
    IndentBlanklineSpaceCharBlankline = { fg = colors.bg_highlight },
    
    -- Rainbow indent
    IblIndent1 = { fg = colors.red },
    IblIndent2 = { fg = colors.yellow },
    IblIndent3 = { fg = colors.green },
    IblIndent4 = { fg = colors.cyan },
    IblIndent5 = { fg = colors.blue },
    IblIndent6 = { fg = colors.purple },
    
    IblIndentScope1 = { fg = colors.red },
    IblIndentScope2 = { fg = colors.yellow },
    IblIndentScope3 = { fg = colors.green },
    IblIndentScope4 = { fg = colors.cyan },
    IblIndentScope5 = { fg = colors.blue },
    IblIndentScope6 = { fg = colors.purple },
  }
end

return M