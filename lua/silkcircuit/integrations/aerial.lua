local M = {}

-- Aerial.nvim integration: Code outline window
function M.highlights(colors, _opts)
  return {
    -- Aerial window
    AerialNormal = { bg = colors.bg_dark },
    AerialBorder = { fg = colors.purple_muted },

    -- Symbol highlights
    AerialClass = { fg = colors.yellow, bold = true },
    AerialClassIcon = { fg = colors.yellow },
    AerialFunction = { fg = colors.glow_purple, bold = true },
    AerialFunctionIcon = { fg = colors.glow_purple },
    AerialMethod = { fg = colors.purple },
    AerialMethodIcon = { fg = colors.purple },
    AerialVariable = { fg = colors.pink },
    AerialVariableIcon = { fg = colors.pink },
    AerialConstant = { fg = colors.orange },
    AerialConstantIcon = { fg = colors.orange },
    AerialString = { fg = colors.green },
    AerialStringIcon = { fg = colors.green },
    AerialNumber = { fg = colors.orange },
    AerialNumberIcon = { fg = colors.orange },
    AerialBoolean = { fg = colors.orange },
    AerialBooleanIcon = { fg = colors.orange },
    AerialArray = { fg = colors.cyan },
    AerialArrayIcon = { fg = colors.cyan },
    AerialObject = { fg = colors.cyan },
    AerialObjectIcon = { fg = colors.cyan },
    AerialKey = { fg = colors.pink },
    AerialKeyIcon = { fg = colors.pink },
    AerialNull = { fg = colors.gray },
    AerialNullIcon = { fg = colors.gray },
    AerialEnum = { fg = colors.yellow },
    AerialEnumIcon = { fg = colors.yellow },
    AerialEnumMember = { fg = colors.cyan },
    AerialEnumMemberIcon = { fg = colors.cyan },
    AerialStruct = { fg = colors.yellow },
    AerialStructIcon = { fg = colors.yellow },
    AerialEvent = { fg = colors.purple },
    AerialEventIcon = { fg = colors.purple },
    AerialOperator = { fg = colors.pink },
    AerialOperatorIcon = { fg = colors.pink },
    AerialInterface = { fg = colors.yellow },
    AerialInterfaceIcon = { fg = colors.yellow },
    AerialTypeParameter = { fg = colors.cyan },
    AerialTypeParameterIcon = { fg = colors.cyan },

    -- Navigation
    AerialLine = { bg = colors.bg_highlight },
    AerialLineNC = { bg = colors.bg_highlight },
    AerialGuide = { fg = colors.gray },
  }
end

return M
