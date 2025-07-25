local M = {}

function M.highlights(colors, opts)
  return {
    -- Main Neo-tree window with cyberpunk background
    NeoTreeNormal = { fg = colors.fg, bg = opts.transparent and colors.none or colors.bg_dark },
    NeoTreeNormalNC = {
      fg = colors.fg_dark,
      bg = opts.transparent and colors.none or colors.bg_darker,
    },
    NeoTreeWinSeparator = { fg = colors.glow_purple, bg = colors.none },
    NeoTreeEndOfBuffer = { fg = colors.bg_dark },

    -- Root directory with neon glow
    NeoTreeRootName = { fg = colors.glow_purple, bold = true, italic = true },

    -- Git status with cyberpunk colors
    NeoTreeGitAdded = { fg = colors.green, bold = true },
    NeoTreeGitModified = { fg = colors.yellow_bright, bold = true },
    NeoTreeGitDeleted = { fg = colors.glow_pink, bold = true },
    NeoTreeGitRenamed = { fg = colors.glow_cyan, bold = true },
    NeoTreeGitUntracked = { fg = colors.pink, italic = true },
    NeoTreeGitIgnored = { fg = colors.gray, italic = true },
    NeoTreeGitConflict = { fg = colors.red, bold = true, bg = colors.red .. "20" },
    NeoTreeGitStaged = { fg = colors.green, bold = true },
    NeoTreeGitUnstaged = { fg = colors.orange, bold = true },

    -- Tree structure with neon accents
    NeoTreeIndentMarker = { fg = colors.purple_muted },
    NeoTreeExpander = { fg = colors.glow_purple, bold = true },
    NeoTreeDimText = { fg = colors.gray },

    -- Directories with femme purple styling
    NeoTreeDirectoryIcon = { fg = colors.glow_purple, bold = true },
    NeoTreeDirectoryName = { fg = colors.purple, bold = true },

    -- Files with cyberpunk styling
    NeoTreeFileName = { fg = colors.fg },
    NeoTreeFileNameOpened = { fg = colors.glow_cyan, bold = true, italic = true },
    NeoTreeSymbolicLinkTarget = { fg = colors.cyan, italic = true },

    -- Floating windows with neon borders
    NeoTreeFloatBorder = { fg = colors.glow_purple, bg = colors.none },
    NeoTreeFloatTitle = { fg = colors.glow_pink, bold = true, bg = colors.bg_dark },
    NeoTreeTitleBar = { fg = colors.glow_purple, bg = colors.bg_highlight, bold = true },

    -- File icons and modifiers
    NeoTreeFileIcon = { fg = colors.cyan },
    NeoTreeModified = { fg = colors.orange, bold = true },
    NeoTreeBufferNumber = { fg = colors.purple_muted, italic = true },
    NeoTreeCursorLine = { bg = colors.bg_highlight },

    -- Tabs with cyberpunk styling
    NeoTreeTabActive = { fg = colors.bg, bg = colors.glow_purple, bold = true },
    NeoTreeTabInactive = { fg = colors.fg_dark, bg = colors.bg_highlight },
    NeoTreeTabSeparatorActive = { fg = colors.glow_purple, bg = colors.glow_purple },
    NeoTreeTabSeparatorInactive = { fg = colors.bg_highlight, bg = colors.bg_highlight },

    -- Preview window
    NeoTreePreviewBorder = { fg = colors.glow_cyan },
    NeoTreePreviewTitle = { fg = colors.glow_cyan, bold = true },

    -- Message and status
    NeoTreeMessage = { fg = colors.fg_dark, italic = true },
    NeoTreeStats = { fg = colors.purple_muted, italic = true },

    -- File type specific colors
    NeoTreeFileStatsIcon = { fg = colors.yellow },
    NeoTreeFileStatsSize = { fg = colors.yellow_bright },
    NeoTreeFileStatsDate = { fg = colors.cyan },

    -- Diagnostic integration
    NeoTreeDiagnosticError = { fg = colors.error, bold = true },
    NeoTreeDiagnosticWarn = { fg = colors.warning, bold = true },
    NeoTreeDiagnosticInfo = { fg = colors.info },
    NeoTreeDiagnosticHint = { fg = colors.hint },

    -- Filter and search
    NeoTreeFilterTerm = { fg = colors.glow_pink, bold = true, italic = true },
    NeoTreeDotfile = { fg = colors.gray, italic = true },

    -- Special file types with cyberpunk colors
    NeoTreeExecutable = { fg = colors.green, bold = true },
    NeoTreeHiddenFile = { fg = colors.gray, italic = true },
    NeoTreeImageFile = { fg = colors.pink },
    NeoTreeMarkdownFile = { fg = colors.purple },
    NeoTreeConfigFile = { fg = colors.yellow },
    NeoTreeLockFile = { fg = colors.orange },

    -- Enhanced folder states
    NeoTreeFolderIcon = { fg = colors.glow_purple },
    NeoTreeFolderName = { fg = colors.purple },
    NeoTreeFolderEmpty = { fg = colors.purple_muted, italic = true },

    -- Window picker integration
    NeoTreeWindowsHidden = { fg = colors.gray, italic = true },

    -- Bookmarks and marks
    NeoTreeBookmark = { fg = colors.glow_cyan, bold = true },
    NeoTreeBookmarkIcon = { fg = colors.glow_cyan },
  }
end

return M
