-- Palette tests

-- Mock the config and variants modules
package.loaded["silkcircuit.config"] = {
  get = function()
    return { variant = "neon" }
  end,
}

package.loaded["silkcircuit.variants"] = {
  get_current_variant = function()
    return "neon"
  end,
  get_colors = function(variant)
    if variant == "neon" then
      return {
        bg = "#0a0a0f",
        fg = "#e0e0e0",
        purple = "#e135ff",
        purple_bright = "#ff6bff",
        purple_dark = "#b45bcf",
        purple_muted = "#9580ff",
        glow_purple = "#ff00ff",
        pink = "#ff79c6",
        pink_bright = "#ff92d7",
        cyan = "#80ffea",
        cyan_bright = "#5fffff",
        cyan_dark = "#40a8c4",
        green = "#50fa7b",
        yellow = "#f1fa8c",
        yellow_bright = "#ffffa5",
        yellow_dark = "#d4d464",
        orange = "#ffb86c",
        white = "#ffffff",
        border = "#44475a",
        comment = "#6272a4",
        none = "NONE",
      }
    end
  end,
}

local palette = require("silkcircuit.palette")

describe("Palette", function()
  it("loads colors from variant", function()
    assert(palette.colors, "Colors should be loaded")
    assert(palette.colors.purple == "#e135ff", "Purple should match variant")
    assert(palette.colors.bg == "#0a0a0f", "Background should match variant")
  end)

  it("has semantic color mappings", function()
    assert(palette.semantic, "Should have semantic mappings")
    assert(palette.semantic.keyword, "Should have keyword mapping")
    assert(palette.semantic["function"], "Should have function mapping")
    assert(palette.semantic.string, "Should have string mapping")
  end)

  it("update_semantic works", function()
    local new_colors = {
      purple = "#ff00ff",
      glow_purple = "#ff00ff",
      pink = "#ff1493",
    }
    palette.update_semantic(new_colors)
    assert(palette.semantic.keyword == new_colors.purple, "Keyword should update")
  end)
end)
