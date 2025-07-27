local M = {}

function M.get(colors, _)
  return {
    -- Main Noice UI
    NoiceCmdline = { fg = colors.fg, bg = colors.bg_float },
    NoiceCmdlineIcon = { fg = colors.purple, bg = colors.bg_float },
    NoiceCmdlineIconSearch = { fg = colors.yellow, bg = colors.bg_float },
    NoiceCmdlinePopup = { fg = colors.fg, bg = colors.bg_float },
    NoiceCmdlinePopupBorder = { fg = colors.border, bg = colors.bg_float },
    NoiceCmdlinePopupTitle = { fg = colors.pink, bold = true },
    NoiceCmdlinePrompt = { fg = colors.cyan, bold = true },

    -- Mini view (messages at top right)
    NoiceMini = { fg = colors.fg, bg = colors.bg_highlight },

    -- Popupmenu
    NoicePopupmenu = { fg = colors.fg, bg = colors.bg_float }, -- Normal for popupmenu
    NoicePopupmenuBorder = { fg = colors.border, bg = colors.bg_float },
    NoicePopupmenuSelected = { fg = colors.bg, bg = colors.purple, bold = true },
    NoicePopupmenuMatch = { fg = colors.pink, bold = true },

    -- Scrollbar
    NoiceScrollbar = { bg = colors.bg_highlight },
    NoiceScrollbarThumb = { bg = colors.gray },

    -- LSP Progress
    NoiceLspProgressTitle = { fg = colors.pink, bold = true },
    NoiceLspProgressClient = { fg = colors.purple },
    NoiceLspProgressSpinner = { fg = colors.cyan },
    NoiceLspProgressDone = { fg = colors.green, bold = true },

    -- Format groups
    NoiceFormatProgressDone = { fg = colors.green, bg = colors.bg_highlight, bold = true },
    NoiceFormatProgressTodo = { fg = colors.gray, bg = colors.bg_highlight },
    NoiceFormatEvent = { fg = colors.purple },
    NoiceFormatKind = { fg = colors.cyan },
    NoiceFormatDate = { fg = colors.gray },
    NoiceFormatLevel = { fg = colors.yellow },
    NoiceFormatLevelDebug = { fg = colors.gray },
    NoiceFormatLevelError = { fg = colors.error },
    NoiceFormatLevelInfo = { fg = colors.info },
    NoiceFormatLevelOff = { fg = colors.gray },
    NoiceFormatLevelTrace = { fg = colors.purple },
    NoiceFormatLevelWarn = { fg = colors.warning },
    NoiceFormatTitle = { fg = colors.pink, bold = true },

    -- Confirm/Input
    NoiceConfirm = { fg = colors.fg, bg = colors.bg_float },
    NoiceConfirmBorder = { fg = colors.border, bg = colors.bg_float },

    -- Split views
    NoiceSplit = { fg = colors.fg, bg = colors.bg },
    NoiceSplitBorder = { fg = colors.border },

    -- Virtual text
    NoiceVirtualText = { fg = colors.purple_muted, italic = true },

    -- Cursor
    NoiceCursor = { blend = 100 },
  }
end

return M
