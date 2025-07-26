local M = {}

-- nvim-dap integration for SilkCircuit theme
-- Provides colors for debugging UI elements

function M.get(colors, _)
  local highlights = {}

  -- DAP UI Elements
  highlights.DapBreakpoint = { fg = colors.red, bg = colors.bg }
  highlights.DapBreakpointCondition = { fg = colors.yellow, bg = colors.bg }
  highlights.DapBreakpointRejected = { fg = colors.gray, bg = colors.bg }
  highlights.DapLogPoint = { fg = colors.cyan_bright, bg = colors.bg }
  highlights.DapStopped = { fg = colors.green_bright, bg = colors.bg, bold = true }

  -- DAP Signs
  highlights.DapBreakpointSign = { fg = colors.red }
  highlights.DapBreakpointConditionSign = { fg = colors.yellow }
  highlights.DapBreakpointRejectedSign = { fg = colors.gray }
  highlights.DapLogPointSign = { fg = colors.cyan_bright }
  highlights.DapStoppedSign = { fg = colors.green_bright, bold = true }

  -- DAP Line highlights
  highlights.DapBreakpointLine = { bg = colors.bg_highlight }
  highlights.DapBreakpointConditionLine = { bg = colors.bg_highlight }
  highlights.DapBreakpointRejectedLine = { bg = colors.bg_dark }
  highlights.DapLogPointLine = { bg = colors.bg_highlight }
  highlights.DapStoppedLine = { bg = colors.selection }

  -- DAP UI specific (if dapui is installed)
  highlights.DapUIScope = { fg = colors.cyan_bright }
  highlights.DapUIType = { fg = colors.purple }
  highlights.DapUIDecoration = { fg = colors.cyan_bright }
  highlights.DapUIThread = { fg = colors.green_bright }
  highlights.DapUIStoppedThread = { fg = colors.cyan_bright }
  highlights.DapUISource = { fg = colors.purple }
  highlights.DapUILineNumber = { fg = colors.cyan }
  highlights.DapUIFloatBorder = { fg = colors.cyan_bright }
  highlights.DapUIWatchesEmpty = { fg = colors.red }
  highlights.DapUIWatchesValue = { fg = colors.pink }
  highlights.DapUIWatchesError = { fg = colors.red }
  highlights.DapUIBreakpointsPath = { fg = colors.cyan_bright }
  highlights.DapUIBreakpointsInfo = { fg = colors.green }
  highlights.DapUIBreakpointsCurrentLine = { fg = colors.green_bright, bold = true }
  highlights.DapUIBreakpointsDisabledLine = { fg = colors.gray }

  -- Variable types
  highlights.DapUIVariable = { fg = colors.pink }
  highlights.DapUIValue = { fg = colors.fg }
  highlights.DapUIModifiedValue = { fg = colors.cyan_bright, bold = true }

  -- Buttons
  highlights.DapUIPlayPause = { fg = colors.green_bright }
  highlights.DapUIRestart = { fg = colors.green }
  highlights.DapUIStop = { fg = colors.red }
  highlights.DapUIStepOver = { fg = colors.cyan }
  highlights.DapUIStepInto = { fg = colors.cyan }
  highlights.DapUIStepBack = { fg = colors.cyan }
  highlights.DapUIStepOut = { fg = colors.cyan }

  -- Debug Console
  highlights.DapUIConsoleInput = { fg = colors.pink_bright }
  highlights.DapUIConsoleOutput = { fg = colors.fg }
  highlights.DapUIConsoleError = { fg = colors.red }
  highlights.DapUIConsoleWarning = { fg = colors.yellow }
  highlights.DapUIConsoleInfo = { fg = colors.cyan }

  -- Frames
  highlights.DapUIFrameName = { fg = colors.purple }
  highlights.DapUICurrentFrameName = { fg = colors.purple, bold = true }

  -- Controls
  highlights.DapUIControlsDisabled = { fg = colors.gray }
  highlights.DapUIControlsEnabled = { fg = colors.green_bright }

  -- Progress
  highlights.DapProgressStart = { fg = colors.green_bright }
  highlights.DapProgressText = { fg = colors.purple }
  highlights.DapProgressPercent = { fg = colors.pink_bright }

  -- Status
  highlights.DapUIStatus = { fg = colors.pink_bright }
  highlights.DapUIStatusRunning = { fg = colors.green_bright }
  highlights.DapUIStatusStopped = { fg = colors.yellow }
  highlights.DapUIStatusError = { fg = colors.red }

  -- Window bars
  highlights.DapUIWinBar = { fg = colors.pink_bright, bold = true }
  highlights.DapUIWinBarInactive = { fg = colors.purple_muted }

  -- Repl
  highlights.DapUIReplPrompt = { fg = colors.cyan_bright }

  -- Icons
  highlights.DapUIBreakpointsLine = { fg = colors.cyan }
  highlights.DapUIBreakpointsFunc = { fg = colors.purple }

  -- Hover
  highlights.DapUIHoverNormal = { fg = colors.fg, bg = colors.bg_highlight }
  highlights.DapUIHoverBorder = { fg = colors.cyan_bright, bg = colors.bg_highlight }

  return highlights
end

-- Aliases for compatibility
M.highlights = M.get

return M
