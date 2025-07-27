-- Color utility tests
local colors = require("silkcircuit.utils.colors")

describe("Color Utilities", function()
  it("hex_to_rgb converts colors correctly", function()
    local r, g, b = colors.hex_to_rgb("#ff0000")
    assert(r == 255, "Red channel should be 255")
    assert(g == 0, "Green channel should be 0")
    assert(b == 0, "Blue channel should be 0")

    r, g, b = colors.hex_to_rgb("#00ff00")
    assert(r == 0, "Red channel should be 0")
    assert(g == 255, "Green channel should be 255")
    assert(b == 0, "Blue channel should be 0")
  end)

  it("rgb_to_hex converts colors correctly", function()
    local hex = colors.rgb_to_hex(255, 0, 0)
    assert(hex == "#ff0000", "Should convert to red")

    hex = colors.rgb_to_hex(0, 255, 0)
    assert(hex == "#00ff00", "Should convert to green")

    hex = colors.rgb_to_hex(0, 0, 255)
    assert(hex == "#0000ff", "Should convert to blue")
  end)

  it("blend mixes colors correctly", function()
    local result = colors.blend("#ff0000", "#0000ff", 0.5)
    assert(result:lower() == "#800080", "50% blend of red and blue should be purple")

    result = colors.blend("#ffffff", "#000000", 0.5)
    assert(result:lower() == "#808080", "50% blend of white and black should be gray")
  end)

  it("darken reduces brightness", function()
    local result = colors.darken("#ffffff", 0.5)
    assert(result:lower() == "#808080", "50% darken of white should be gray")
  end)

  it("lighten increases brightness", function()
    local result = colors.lighten("#808080", 0.5)
    assert(result:lower() == "#c0c0c0", "50% lighten should increase brightness")
  end)

  it("get_luminance calculates correctly", function()
    local lum = colors.get_luminance("#ffffff")
    assert(lum > 0.99, "White should have maximum luminance")

    lum = colors.get_luminance("#000000")
    assert(lum < 0.01, "Black should have minimum luminance")
  end)

  it("meets_wcag_aa validates correctly", function()
    local passes = colors.meets_wcag_aa("#ffffff", "#000000")
    assert(passes == true, "White on black should pass WCAG AA")

    passes = colors.meets_wcag_aa("#777777", "#888888")
    assert(passes == false, "Similar grays should fail WCAG AA")
  end)
end)
