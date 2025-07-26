local M = {}

-- Blend two colors
function M.blend(color1, color2, amount)
  amount = amount or 0.5

  local c1 = M.hex_to_rgb(color1)
  local c2 = M.hex_to_rgb(color2)

  local r = math.floor(c1.r * (1 - amount) + c2.r * amount)
  local g = math.floor(c1.g * (1 - amount) + c2.g * amount)
  local b = math.floor(c1.b * (1 - amount) + c2.b * amount)

  return M.rgb_to_hex(r, g, b)
end

-- Convert hex color to RGB
function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return {
    r = tonumber(hex:sub(1, 2), 16),
    g = tonumber(hex:sub(3, 4), 16),
    b = tonumber(hex:sub(5, 6), 16),
  }
end

-- Convert RGB to hex
function M.rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", r, g, b)
end

-- Darken a color
function M.darken(color, amount)
  amount = amount or 0.1
  local rgb = M.hex_to_rgb(color)

  rgb.r = math.max(0, math.floor(rgb.r * (1 - amount)))
  rgb.g = math.max(0, math.floor(rgb.g * (1 - amount)))
  rgb.b = math.max(0, math.floor(rgb.b * (1 - amount)))

  return M.rgb_to_hex(rgb.r, rgb.g, rgb.b)
end

-- Lighten a color
function M.lighten(color, amount)
  amount = amount or 0.1
  local rgb = M.hex_to_rgb(color)

  rgb.r = math.min(255, math.floor(rgb.r + (255 - rgb.r) * amount))
  rgb.g = math.min(255, math.floor(rgb.g + (255 - rgb.g) * amount))
  rgb.b = math.min(255, math.floor(rgb.b + (255 - rgb.b) * amount))

  return M.rgb_to_hex(rgb.r, rgb.g, rgb.b)
end

-- Apply highlight group
function M.highlight(group, opts)
  local cmd

  if opts.link then
    cmd = "hi! link " .. group .. " " .. opts.link
  else
    -- Use hi! (with bang) to force override any existing highlights
    cmd = "hi! " .. group

    if opts.fg then
      cmd = cmd .. " guifg=" .. opts.fg
    end

    if opts.bg then
      cmd = cmd .. " guibg=" .. opts.bg
    end

    if opts.sp then
      cmd = cmd .. " guisp=" .. opts.sp
    end

    local gui_attrs = {}

    if opts.style then
      if type(opts.style) == "table" then
        for _, style in ipairs(opts.style) do
          table.insert(gui_attrs, style)
        end
      else
        table.insert(gui_attrs, opts.style)
      end
    end

    -- Collect individual attributes
    if opts.italic then
      table.insert(gui_attrs, "italic")
    end
    if opts.bold then
      table.insert(gui_attrs, "bold")
    end
    if opts.underline then
      table.insert(gui_attrs, "underline")
    end
    if opts.undercurl then
      table.insert(gui_attrs, "undercurl")
    end
    if opts.strikethrough then
      table.insert(gui_attrs, "strikethrough")
    end

    if #gui_attrs > 0 then
      cmd = cmd .. " gui=" .. table.concat(gui_attrs, ",")
    end
  end

  -- Execute highlight command with error handling
  -- Use silent! to suppress all output and errors
  pcall(vim.cmd, "silent! " .. cmd)
end

-- Load highlight groups
function M.load_highlights(highlights)
  for group, opts in pairs(highlights) do
    M.highlight(group, opts)
  end
end

-- Merge styles from config
function M.merge_styles(base, styles)
  if not styles or vim.tbl_isempty(styles) then
    return base
  end

  local result = vim.tbl_deep_extend("force", base, {})

  if styles.italic then
    result.style = result.style or {}
    table.insert(result.style, "italic")
  end

  if styles.bold then
    result.style = result.style or {}
    table.insert(result.style, "bold")
  end

  if styles.underline then
    result.style = result.style or {}
    table.insert(result.style, "underline")
  end

  return result
end

-- Get highlight definition for compilation
function M.get_highlight_def(group, opts)
  local _ = { group } -- unused, kept for potential future use

  if opts.link then
    return string.format('vim.cmd("silent! hi! link %s %s")', group, opts.link)
  end

  local attrs = {}

  if opts.fg then
    table.insert(attrs, string.format("guifg=%s", opts.fg))
  end

  if opts.bg then
    table.insert(attrs, string.format("guibg=%s", opts.bg))
  end

  if opts.sp then
    table.insert(attrs, string.format("guisp=%s", opts.sp))
  end

  if opts.style then
    local styles = type(opts.style) == "table" and table.concat(opts.style, ",") or opts.style
    table.insert(attrs, string.format("gui=%s", styles))
  elseif opts.italic then
    table.insert(attrs, "gui=italic")
  elseif opts.bold then
    table.insert(attrs, "gui=bold")
  elseif opts.underline then
    table.insert(attrs, "gui=underline")
  elseif opts.undercurl then
    table.insert(attrs, "gui=undercurl")
  end

  return string.format('vim.cmd("silent! hi %s %s")', group, table.concat(attrs, " "))
end

-- Hash a string using djb2 algorithm
local function hash_string(str)
  local hash = 5381
  for i = 1, #str do
    hash = ((hash * 33) + string.byte(str, i)) % 2 ^ 32
  end
  return string.format("%08x", hash)
end

-- Get hash of current configuration
local function get_config_hash()
  local config = require("silkcircuit.config").get()
  local config_str = vim.inspect(config)

  -- Include version and variant
  local version = "1.0.0"
  local variant = config.variant or "neon"

  return hash_string(version .. config_str .. variant)
end

-- Check if compiled cache is valid
local function is_cache_valid()
  local cache_dir = vim.fn.stdpath("cache")
  local hash_file = cache_dir .. "/silkcircuit_hash"
  local compiled_file = cache_dir .. "/silkcircuit_compiled.lua"

  -- Check if files exist
  if vim.fn.filereadable(hash_file) == 0 or vim.fn.filereadable(compiled_file) == 0 then
    return false
  end

  -- Read stored hash
  local file = io.open(hash_file, "r")
  if not file then
    return false
  end
  local stored_hash = file:read("*a")
  file:close()

  -- Compare with current hash
  return stored_hash == get_config_hash()
end

-- Compile theme to a file for faster loading
function M.compile(force)
  -- Check if compilation is needed
  if not force and is_cache_valid() then
    return true
  end

  local start_time = vim.loop.hrtime()

  local config = require("silkcircuit.config")
  local palette = require("silkcircuit.palette")
  local theme = require("silkcircuit.theme")

  local lines = {
    "-- This file is auto-generated by silkcircuit.nvim",
    "-- DO NOT EDIT THIS FILE DIRECTLY",
    "",
    'vim.cmd("hi clear")',
    'if vim.fn.exists("syntax_on") then',
    '  vim.cmd("syntax reset")',
    "end",
    "",
    'vim.g.colors_name = "silkcircuit"',
    "",
  }

  -- Get all highlights
  local highlights = theme.get_highlights(palette.colors, config.get())

  -- Add highlight commands
  for group, opts in pairs(highlights) do
    table.insert(lines, M.get_highlight_def(group, opts))
  end

  -- Add terminal colors
  if config.get().terminal_colors then
    table.insert(lines, "")
    table.insert(lines, "-- Terminal colors")
    local colors = palette.colors
    table.insert(lines, string.format('vim.g.terminal_color_0 = "%s"', colors.terminal_black))
    table.insert(lines, string.format('vim.g.terminal_color_1 = "%s"', colors.terminal_red))
    table.insert(lines, string.format('vim.g.terminal_color_2 = "%s"', colors.terminal_green))
    table.insert(lines, string.format('vim.g.terminal_color_3 = "%s"', colors.terminal_yellow))
    table.insert(lines, string.format('vim.g.terminal_color_4 = "%s"', colors.terminal_blue))
    table.insert(lines, string.format('vim.g.terminal_color_5 = "%s"', colors.terminal_magenta))
    table.insert(lines, string.format('vim.g.terminal_color_6 = "%s"', colors.terminal_cyan))
    table.insert(lines, string.format('vim.g.terminal_color_7 = "%s"', colors.terminal_white))
    table.insert(
      lines,
      string.format('vim.g.terminal_color_8 = "%s"', colors.terminal_bright_black)
    )
    table.insert(lines, string.format('vim.g.terminal_color_9 = "%s"', colors.terminal_bright_red))
    table.insert(
      lines,
      string.format('vim.g.terminal_color_10 = "%s"', colors.terminal_bright_green)
    )
    table.insert(
      lines,
      string.format('vim.g.terminal_color_11 = "%s"', colors.terminal_bright_yellow)
    )
    table.insert(
      lines,
      string.format('vim.g.terminal_color_12 = "%s"', colors.terminal_bright_blue)
    )
    table.insert(
      lines,
      string.format('vim.g.terminal_color_13 = "%s"', colors.terminal_bright_magenta)
    )
    table.insert(
      lines,
      string.format('vim.g.terminal_color_14 = "%s"', colors.terminal_bright_cyan)
    )
    table.insert(
      lines,
      string.format('vim.g.terminal_color_15 = "%s"', colors.terminal_bright_white)
    )
  end

  -- Create the theme function
  local theme_code = table.concat(lines, "\n")

  -- Try to compile to bytecode
  local success, theme_func = pcall(loadstring, theme_code)
  if not success then
    vim.notify("Failed to compile theme code: " .. tostring(theme_func), vim.log.levels.ERROR)
    return false
  end

  local cache_dir = vim.fn.stdpath("cache")

  -- Write bytecode if possible
  local bytecode_file = cache_dir .. "/silkcircuit_compiled.luac"
  if theme_func and string.dump then
    local bytecode = string.dump(theme_func)
    local file = io.open(bytecode_file, "wb")
    if file then
      file:write(bytecode)
      file:close()
    end
  end

  -- Always write the lua source as fallback
  local file = io.open(cache_dir .. "/silkcircuit_compiled.lua", "w")
  if file then
    file:write(theme_code)
    file:close()

    -- Save hash
    local hash_file = io.open(cache_dir .. "/silkcircuit_hash", "w")
    if hash_file then
      hash_file:write(get_config_hash())
      hash_file:close()
    end

    local load_time = (vim.loop.hrtime() - start_time) / 1e6
    vim.notify(string.format("SilkCircuit compiled in %.2fms!", load_time), vim.log.levels.INFO)
    return true
  else
    vim.notify("Failed to compile SilkCircuit theme", vim.log.levels.ERROR)
    return false
  end
end

-- Load compiled theme if available
function M.load_compiled()
  local cache_dir = vim.fn.stdpath("cache")
  local bytecode_file = cache_dir .. "/silkcircuit_compiled.luac"
  local lua_file = cache_dir .. "/silkcircuit_compiled.lua"

  -- Try bytecode first
  if vim.fn.filereadable(bytecode_file) == 1 then
    local file = io.open(bytecode_file, "rb")
    if file then
      local bytecode = file:read("*a")
      file:close()

      local success, theme_func = pcall(loadstring, bytecode)
      if success and theme_func then
        local ok = pcall(theme_func)
        if ok then
          return true
        end
      end
    end
  end

  -- Fall back to lua source
  if vim.fn.filereadable(lua_file) == 1 then
    local success = pcall(dofile, lua_file)
    return success
  end

  return false
end

return M
