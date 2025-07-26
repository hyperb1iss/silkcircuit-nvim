local M = {}

-- Convert hex to RGB
local function hex_to_rgb(hex_str)
  local hex = "[abcdef0-9][abcdef0-9]"
  local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

  local red, green, blue = string.match(hex_str, pat)
  return { tonumber(red, 16), tonumber(green, 16), tonumber(blue, 16) }
end

-- Blend two colors together
-- @param fg string foreground color
-- @param bg string background color
-- @param alpha number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(fg, bg, alpha)
  bg = hex_to_rgb(bg)
  fg = hex_to_rgb(fg)

  local blend_channel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blend_channel(1), blend_channel(2), blend_channel(3))
end

-- Darken a color
function M.darken(hex, amount, bg)
  return M.blend(hex, bg or "#000000", math.abs(amount))
end

-- Lighten a color
function M.lighten(hex, amount, fg)
  return M.blend(hex, fg or "#ffffff", math.abs(amount))
end

-- Check if a color is bright
function M.is_bright(hex)
  local rgb = hex_to_rgb(hex)
  local r, g, b = rgb[1], rgb[2], rgb[3]

  -- Counting the perceptive luminance - human eye favors green color
  local luminance = (0.299 * r + 0.587 * g + 0.114 * b) / 255
  return luminance > 0.5
end

-- Add a glow effect to a color (for our neon theme!)
function M.glow(hex, amount)
  -- Make it brighter and more saturated
  return M.lighten(hex, amount or 0.2)
end

-- Create a neon variant of a color
function M.neonify(hex)
  -- Increase brightness significantly
  return M.lighten(hex, 0.3)
end

return M
