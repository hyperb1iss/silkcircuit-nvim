local M = {}

function M.highlights(colors, _)
  return {
    GitSignsAdd = { fg = colors.git_add },
    GitSignsAddNr = { fg = colors.git_add },
    GitSignsAddLn = { fg = colors.git_add },
    GitSignsAddInline = { fg = colors.git_add },

    GitSignsChange = { fg = colors.git_change },
    GitSignsChangeNr = { fg = colors.git_change },
    GitSignsChangeLn = { fg = colors.git_change },
    GitSignsChangeInline = { fg = colors.git_change },

    GitSignsDelete = { fg = colors.git_delete },
    GitSignsDeleteNr = { fg = colors.git_delete },
    GitSignsDeleteLn = { fg = colors.git_delete },
    GitSignsDeleteInline = { fg = colors.git_delete },

    GitSignsChangedelete = { fg = colors.git_change },
    GitSignsChangedeleteNr = { fg = colors.git_change },
    GitSignsChangedeleteLn = { fg = colors.git_change },
    GitSignsChangedeleteInline = { fg = colors.git_change },

    GitSignsTopdelete = { fg = colors.git_delete },
    GitSignsTopdeleteNr = { fg = colors.git_delete },
    GitSignsTopdeleteLn = { fg = colors.git_delete },
    GitSignsTopdeleteInline = { fg = colors.git_delete },

    GitSignsUntracked = { fg = colors.git_add },
    GitSignsUntrackedNr = { fg = colors.git_add },
    GitSignsUntrackedLn = { fg = colors.git_add },
    GitSignsUntrackedInline = { fg = colors.git_add },

    GitSignsAddPreview = { bg = colors.diff_add },
    GitSignsDeletePreview = { bg = colors.diff_delete },

    GitSignsCurrentLineBlame = { fg = colors.gray, italic = true },
    GitSignsStagedAdd = { fg = colors.git_add },
    GitSignsStagedChange = { fg = colors.git_change },
    GitSignsStagedDelete = { fg = colors.git_delete },
    GitSignsStagedChangedelete = { fg = colors.git_change },
    GitSignsStagedTopdelete = { fg = colors.git_delete },
  }
end

return M
