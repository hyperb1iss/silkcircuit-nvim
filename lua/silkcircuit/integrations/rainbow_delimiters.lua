local M = {}

function M.highlights(colors, _)
  -- Rainbow delimiters with neon colors for femme cyberpunk vibes
  return {
    RainbowDelimiterRed = { fg = colors.pink },
    RainbowDelimiterYellow = { fg = colors.yellow_bright },
    RainbowDelimiterBlue = { fg = colors.purple },
    RainbowDelimiterOrange = { fg = colors.orange },
    RainbowDelimiterGreen = { fg = colors.green },
    RainbowDelimiterViolet = { fg = colors.purple_dark },
    RainbowDelimiterCyan = { fg = colors.cyan },

    -- Alternative naming (some plugins use these)
    rainbowcol1 = { fg = colors.pink },
    rainbowcol2 = { fg = colors.purple },
    rainbowcol3 = { fg = colors.cyan },
    rainbowcol4 = { fg = colors.yellow_bright },
    rainbowcol5 = { fg = colors.orange },
    rainbowcol6 = { fg = colors.green },
    rainbowcol7 = { fg = colors.pink_bright },

    -- For ts-rainbow
    TSRainbowRed = { fg = colors.pink },
    TSRainbowYellow = { fg = colors.yellow_bright },
    TSRainbowBlue = { fg = colors.purple },
    TSRainbowOrange = { fg = colors.orange },
    TSRainbowGreen = { fg = colors.green },
    TSRainbowViolet = { fg = colors.purple_dark },
    TSRainbowCyan = { fg = colors.cyan },
  }
end

return M
