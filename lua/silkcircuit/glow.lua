local M = {}
local preferences = require("silkcircuit.preferences")

-- Glow Mode: Special visual effects for SilkCircuit
-- Adds glowing accents and enhanced highlights for a true neon experience

local glow_groups = {}
local glow_enabled = false
local glow_timer = nil

-- Calculate glow color (static for now, no pulsing)
local function get_glow_color(base_color, intensity)
  local color_utils = require("silkcircuit.utils.colors")

  -- Static glow intensity (no pulsing to avoid flicker)
  local glow_intensity = intensity

  -- Make color brighter and more saturated
  return color_utils.lighten(base_color, glow_intensity * 0.3)
end

-- Apply glow effects to highlight groups
local function apply_glow_highlights()
  local colors = require("silkcircuit.palette").colors
  local util = require("silkcircuit.util")

  -- Define which groups get glow effects
  local glow_targets = {
    -- Functions get purple glow
    {
      groups = { "Function", "@function", "@function.method" },
      color = colors.glow_purple,
      bg_glow = false,
    },

    -- Keywords get subtle purple glow
    { groups = { "Keyword", "@keyword" }, color = colors.purple, bg_glow = false },

    -- Strings get pink glow
    { groups = { "String", "@string" }, color = colors.glow_pink, bg_glow = false },

    -- Classes/Types get cyan glow
    {
      groups = { "Type", "@type", "@type.builtin" },
      color = colors.glow_cyan,
      bg_glow = false,
    },

    -- Important punctuation gets subtle glow
    {
      groups = { "@punctuation.bracket", "@tag.delimiter" },
      color = colors.cyan_bright,
      bg_glow = false,
    },
  }

  -- Apply glow effects
  for _, target in ipairs(glow_targets) do
    local glow_color = get_glow_color(target.color, 1.0)

    for _, group in ipairs(target.groups) do
      local hl = { fg = glow_color, bold = true }

      -- Skip background glow entirely (causes white highlighting)
      -- if target.bg_glow then
      --   local bg_glow = get_glow_color(target.color, 0.15)
      --   hl.bg = bg_glow
      -- end

      -- Special effects
      if group:match("Function") then
        hl.italic = true
        hl.bold = true
      end

      util.highlight(group, hl)
    end
  end

  -- Skip cursor line glow - keep original theme's cursor line

  -- Floating window borders get animated glow
  util.highlight("FloatBorder", {
    fg = get_glow_color(colors.cyan_bright, 1.2),
  })

  -- Keep original cursor line number styling
end

-- Pulse animation for glow effects (disabled due to command line flicker)
-- local function pulse_animation()
--   pulse_state = pulse_state + 0.1
--   if pulse_state > 2 * math.pi then
--     pulse_state = 0
--   end
--
--   -- Only update if glow is enabled
--   if glow_enabled then
--     apply_glow_highlights()
--   end
-- end

-- Enable glow mode
function M.enable()
  if glow_enabled then
    return
  end

  glow_enabled = true

  -- Store current highlights for restoration
  local current_highlights = vim.api.nvim_exec("highlight", true)
  glow_groups = {}

  -- Parse and store current highlights
  for line in current_highlights:gmatch("[^\r\n]+") do
    local group = line:match("^(%S+)%s+")
    if group and not group:match("^%-%-") then
      glow_groups[group] = line
    end
  end

  -- Apply initial glow
  apply_glow_highlights()

  -- Save preference
  preferences.set("glow_enabled", true)

  -- Disable animation for now - it causes command line flicker
  -- glow_timer = vim.loop.new_timer()
  -- if glow_timer then
  --   glow_timer:start(0, 100, vim.schedule_wrap(pulse_animation))
  -- end

  -- Silent activation
end

-- Disable glow mode
function M.disable()
  if not glow_enabled then
    return
  end

  glow_enabled = false

  -- Stop animation timer if it exists
  if glow_timer then
    glow_timer:stop()
    glow_timer:close()
    glow_timer = nil
  end

  -- Save preference
  preferences.set("glow_enabled", false)

  -- Reload the theme to restore original colors
  vim.cmd("colorscheme silkcircuit")

  -- Silent deactivation
end

-- Toggle glow mode
function M.toggle()
  if glow_enabled then
    M.disable()
  else
    M.enable()
  end
end

-- Check if glow mode is active
function M.is_enabled()
  return glow_enabled
end

-- Setup glow mode commands
function M.setup()
  -- Add commands
  vim.api.nvim_create_user_command("SilkCircuitGlow", function(opts)
    local action = opts.args
    if action == "on" then
      M.enable()
    elseif action == "off" then
      M.disable()
    elseif action == "toggle" or action == "" then
      M.toggle()
    else
      vim.notify("Usage: :SilkCircuitGlow [on|off|toggle]", vim.log.levels.WARN)
    end
  end, {
    nargs = "?",
    complete = function()
      return { "on", "off", "toggle" }
    end,
    desc = "Control SilkCircuit Glow Mode",
  })

  -- Removed startup tip message
end

return M
