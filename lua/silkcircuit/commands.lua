local M = {}
local preferences = require("silkcircuit.preferences")

function M.setup()
  -- Check contrast command
  vim.api.nvim_create_user_command("SilkCircuitContrast", function()
    local colors = require("silkcircuit.palette").colors
    local color_utils = require("silkcircuit.utils.colors")

    local issues = color_utils.validate_theme_contrast(colors)

    if #issues == 0 then
      vim.notify("√ All colors pass WCAG AA contrast requirements!", vim.log.levels.INFO)
    else
      vim.notify("! Contrast issues found:", vim.log.levels.WARN)
      for _, issue in ipairs(issues) do
        local level = issue.severity == "error" and vim.log.levels.ERROR or vim.log.levels.WARN
        vim.notify("  " .. issue.message, level)
      end
    end
  end, { desc = "Check SilkCircuit theme contrast ratios" })

  -- Theme variant switcher
  vim.api.nvim_create_user_command("SilkCircuit", function(args)
    local variant = args.args
    local variants = require("silkcircuit.variants")

    if variant == "" then
      local current = variants.get_current_variant()
      vim.notify("Current variant: " .. current, vim.log.levels.INFO)
      vim.notify("Available variants: neon (default), vibrant, soft, glow", vim.log.levels.INFO)
      return
    end

    -- Validate variant
    if not variants.variants[variant] then
      vim.notify("Unknown variant: " .. variant, vim.log.levels.ERROR)
      return
    end

    -- Update config and reload
    local config = require("silkcircuit.config")
    config.options.variant = variant

    -- Save preference
    preferences.set("variant", variant)

    -- Force palette reload
    package.loaded["silkcircuit.palette"] = nil

    -- Reload theme
    vim.cmd("colorscheme silkcircuit")
    vim.notify(
      "Switched to '" .. variant .. "' variant → " .. variants.variants[variant].description,
      vim.log.levels.INFO
    )
  end, {
    nargs = "?",
    complete = function()
      return { "neon", "vibrant", "soft", "glow" }
    end,
    desc = "Switch SilkCircuit theme variant",
  })

  -- Compile command
  vim.api.nvim_create_user_command("SilkCircuitCompile", function()
    local util = require("silkcircuit.util")
    local success = util.compile(true)
    if success then
      vim.notify(
        "√ Theme compiled successfully! Reload with :colorscheme silkcircuit",
        vim.log.levels.INFO
      )
    end
  end, { desc = "Compile SilkCircuit theme for faster loading" })

  -- Integration status command
  vim.api.nvim_create_user_command("SilkCircuitIntegrations", function()
    local integrations = require("silkcircuit.integrations")
    integrations.debug()
  end, { desc = "Show detected plugin integrations" })

  -- Register health check
  vim.health = vim.health or require("health")
  if vim.health then
    -- Modern Neovim (0.9+)
    require("silkcircuit.health")
  end
end

return M
