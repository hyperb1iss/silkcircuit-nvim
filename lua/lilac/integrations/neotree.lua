local M = {}

function M.highlights(colors, opts)
  return {
    NeoTreeNormal = { fg = colors.fg, bg = opts.transparent and colors.none or colors.bg },
    NeoTreeNormalNC = { fg = colors.fg, bg = opts.transparent and colors.none or colors.bg },
    NeoTreeWinSeparator = { fg = colors.bg_highlight },
    NeoTreeEndOfBuffer = { fg = colors.bg },
    
    NeoTreeRootName = { fg = colors.purple, bold = true },
    NeoTreeGitAdded = { fg = colors.git_add },
    NeoTreeGitModified = { fg = colors.git_change },
    NeoTreeGitDeleted = { fg = colors.git_delete },
    NeoTreeGitRenamed = { fg = colors.git_change },
    NeoTreeGitUntracked = { fg = colors.git_add },
    NeoTreeGitIgnored = { fg = colors.gray },
    NeoTreeGitConflict = { fg = colors.git_delete, bold = true },
    
    NeoTreeIndentMarker = { fg = colors.bg_highlight },
    NeoTreeExpander = { fg = colors.gray },
    NeoTreeDimText = { fg = colors.gray },
    
    NeoTreeDirectoryIcon = { fg = colors.blue },
    NeoTreeDirectoryName = { fg = colors.blue },
    NeoTreeFileName = { fg = colors.fg },
    NeoTreeFileNameOpened = { fg = colors.green },
    NeoTreeSymbolicLinkTarget = { fg = colors.cyan },
    
    NeoTreeFloatBorder = { fg = colors.bg_highlight },
    NeoTreeFloatTitle = { fg = colors.purple, bold = true },
    NeoTreeTitleBar = { fg = colors.fg, bg = colors.bg_highlight },
    
    NeoTreeFileIcon = { fg = colors.fg },
    NeoTreeModified = { fg = colors.git_change },
    NeoTreeBufferNumber = { fg = colors.gray },
    NeoTreeCursorLine = { bg = colors.bg_highlight },
    
    NeoTreeTabActive = { fg = colors.fg, bg = colors.bg, bold = true },
    NeoTreeTabInactive = { fg = colors.gray, bg = colors.bg_highlight },
    NeoTreeTabSeparatorActive = { fg = colors.bg, bg = colors.bg },
    NeoTreeTabSeparatorInactive = { fg = colors.bg_highlight, bg = colors.bg_highlight },
  }
end

return M