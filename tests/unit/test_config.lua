-- Configuration tests

describe("Configuration", function()
  it("has correct defaults", function()
    package.loaded["silkcircuit.config"] = nil
    local config = require("silkcircuit.config")

    assert(config.defaults.transparent == false, "Transparent should default to false")
    assert(config.defaults.terminal_colors == true, "Terminal colors should default to true")
    assert(config.defaults.variant == "neon", "Default variant should be neon")
  end)

  it("setup merges options", function()
    package.loaded["silkcircuit.config"] = nil
    local config = require("silkcircuit.config")

    config.setup({ transparent = true, variant = "soft" })
    local opts = config.get()

    assert(opts.transparent == true, "Transparent should be overridden")
    assert(opts.variant == "soft", "Variant should be overridden")
    assert(opts.terminal_colors == true, "Terminal colors should keep default")
  end)
end)
