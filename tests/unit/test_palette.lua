-- Palette tests
local palette = require("silkcircuit.palette")

describe("Palette", function()
  it("loads colors from variant", function()
    local colors = palette.get_colors()
    assert(colors, "Colors should be loaded")
    assert(colors.purple, "Should have purple color")
    assert(colors.bg, "Should have background color")
  end)

  it("has semantic color mappings", function()
    -- Ensure semantic is initialized
    if not palette.semantic then
      palette.update_semantic(palette.get_colors())
    end
    assert(palette.semantic, "Should have semantic mappings")
    assert(palette.semantic.keyword, "Should have keyword mapping")
    assert(palette.semantic["function"], "Should have function mapping")
    assert(palette.semantic.string, "Should have string mapping")
  end)

  it("update_semantic works", function()
    local colors = palette.get_colors()
    palette.update_semantic(colors)
    assert(palette.semantic.keyword == colors.purple, "Keyword should use purple")
  end)
end)
