local M = {}

function M.get(colors, _)
  return {
    -- Main UI
    NeogitBranch = { fg = colors.purple, bold = true },
    NeogitRemote = { fg = colors.pink, bold = true },
    NeogitObjectId = { fg = colors.yellow },
    NeogitStash = { fg = colors.gray },
    NeogitFold = { fg = colors.gray },

    -- Header sections
    NeogitSectionHeader = { fg = colors.pink, bold = true },
    NeogitUnstagedchanges = { fg = colors.red, bold = true },
    NeogitUntrackedfiles = { fg = colors.yellow, bold = true },
    NeogitUnmergedInto = { fg = colors.purple, bold = true },
    NeogitUnpulledFrom = { fg = colors.cyan, bold = true },
    NeogitRecentcommits = { fg = colors.green, bold = true },

    -- Diff view
    NeogitDiffContext = { fg = colors.fg },
    NeogitDiffContextHighlight = { fg = colors.fg, bg = colors.bg_highlight },
    NeogitDiffAdd = { fg = colors.git_add, bg = colors.diff_add },
    NeogitDiffAddHighlight = { fg = colors.git_add, bg = colors.diff_add, bold = true },
    NeogitDiffDelete = { fg = colors.git_delete, bg = colors.diff_delete },
    NeogitDiffDeleteHighlight = { fg = colors.git_delete, bg = colors.diff_delete, bold = true },
    NeogitDiffHeader = { fg = colors.purple, bg = colors.bg_highlight, bold = true },
    NeogitDiffHeaderHighlight = { fg = colors.pink, bg = colors.bg_highlight, bold = true },
    NeogitHunkHeader = { fg = colors.cyan, bg = colors.bg_highlight },
    NeogitHunkHeaderHighlight = { fg = colors.cyan_bright, bg = colors.bg_highlight, bold = true },

    -- Status
    NeogitChangeModified = { fg = colors.yellow, bold = true },
    NeogitChangeAdded = { fg = colors.green, bold = true },
    NeogitChangeDeleted = { fg = colors.red, bold = true },
    NeogitChangeRenamed = { fg = colors.purple, bold = true },
    NeogitChangeUpdated = { fg = colors.coral, bold = true },
    NeogitChangeCopied = { fg = colors.cyan, bold = true },
    NeogitChangeBothModified = { fg = colors.yellow, bold = true },
    NeogitChangeNewFile = { fg = colors.green, bold = true },

    -- Commit view
    NeogitCommitViewHeader = { fg = colors.purple, bg = colors.bg_highlight, bold = true },
    NeogitFilePath = { fg = colors.blue, italic = true },

    -- Popup
    NeogitPopupSectionTitle = { fg = colors.pink, bold = true },
    NeogitPopupBranchName = { fg = colors.purple },
    NeogitPopupBold = { bold = true },
    NeogitPopupSwitchKey = { fg = colors.cyan },
    NeogitPopupSwitchEnabled = { fg = colors.green },
    NeogitPopupSwitchDisabled = { fg = colors.gray },
    NeogitPopupOptionKey = { fg = colors.cyan },
    NeogitPopupOptionEnabled = { fg = colors.green },
    NeogitPopupOptionDisabled = { fg = colors.gray },
    NeogitPopupConfigKey = { fg = colors.cyan },
    NeogitPopupConfigEnabled = { fg = colors.green },
    NeogitPopupConfigDisabled = { fg = colors.gray },
    NeogitPopupActionKey = { fg = colors.purple },
    NeogitPopupActionDisabled = { fg = colors.gray },

    -- Signs
    NeogitClosed = { fg = colors.red },
    NeogitOpen = { fg = colors.green },
  }
end

return M
