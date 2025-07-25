-- nvim-notify integration for silkcircuit

local M = {}

function M.highlights(colors)
  return {
    -- Base notification highlights
    NotifyBackground = { bg = colors.bg_highlight },
    NotifyTitle = { fg = colors.fg, bold = true },
    NotifyIcon = { fg = colors.cyan },

    -- Level-specific highlights
    NotifyErrorBorder = { fg = colors.error },
    NotifyErrorIcon = { fg = colors.error },
    NotifyErrorTitle = { fg = colors.error },
    NotifyErrorBody = { fg = colors.fg },

    NotifyWarnBorder = { fg = colors.warning },
    NotifyWarnIcon = { fg = colors.warning },
    NotifyWarnTitle = { fg = colors.warning },
    NotifyWarnBody = { fg = colors.fg },

    NotifyInfoBorder = { fg = colors.info },
    NotifyInfoIcon = { fg = colors.info },
    NotifyInfoTitle = { fg = colors.info },
    NotifyInfoBody = { fg = colors.fg },

    NotifyDebugBorder = { fg = colors.gray },
    NotifyDebugIcon = { fg = colors.gray },
    NotifyDebugTitle = { fg = colors.gray },
    NotifyDebugBody = { fg = colors.fg },

    NotifyTraceBorder = { fg = colors.purple_muted },
    NotifyTraceIcon = { fg = colors.purple_muted },
    NotifyTraceTitle = { fg = colors.purple_muted },
    NotifyTraceBody = { fg = colors.fg },
  }
end

return M
