local M = {}

function M.get(colors, _)
  return {
    -- Dashboard
    SnacksDashboardHeader = { fg = colors.purple, bold = true },
    SnacksDashboardDesc = { fg = colors.cyan },
    SnacksDashboardKey = { fg = colors.pink, bold = true },
    SnacksDashboardIcon = { fg = colors.purple },
    SnacksDashboardFooter = { fg = colors.purple_muted, italic = true },

    -- Notifications
    SnacksNotifierTitle = { fg = colors.purple, bold = true },
    SnacksNotifierBorder = { fg = colors.purple_muted },
    SnacksNotifierInfo = { fg = colors.cyan },
    SnacksNotifierWarn = { fg = colors.yellow },
    SnacksNotifierError = { fg = colors.red },
    SnacksNotifierDebug = { fg = colors.gray },
    SnacksNotifierTrace = { fg = colors.gray_muted },

    -- Indent scope
    SnacksIndent = { fg = colors.bg_highlight },
    SnacksIndentScope = { fg = colors.purple_muted },

    -- Scroll
    SnacksScroll = { fg = colors.purple, bg = colors.bg_dark },
    SnacksScrollHandle = { fg = colors.purple, bg = colors.bg_highlight },

    -- Picker
    SnacksPickerTitle = { fg = colors.purple, bold = true },
    SnacksPickerBorder = { fg = colors.purple_muted },
    SnacksPickerPrompt = { fg = colors.pink },
    SnacksPickerSelection = { fg = colors.bg, bg = colors.purple },
    SnacksPickerMatch = { fg = colors.pink, bold = true },

    -- Terminal
    SnacksTerminalTitle = { fg = colors.purple, bold = true },
    SnacksTerminalBorder = { fg = colors.purple_muted },

    -- Input
    SnacksInputTitle = { fg = colors.purple, bold = true },
    SnacksInputBorder = { fg = colors.purple_muted },
    SnacksInputPrompt = { fg = colors.pink },

    -- Profiler
    SnacksProfilerTime = { fg = colors.yellow },
    SnacksProfilerTimeHigh = { fg = colors.red, bold = true },
    SnacksProfilerModule = { fg = colors.cyan },
    SnacksProfilerFunction = { fg = colors.purple },
  }
end

return M
