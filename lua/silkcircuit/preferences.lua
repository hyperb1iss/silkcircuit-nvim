local M = {}

-- Get preferences file path
local function get_preferences_file()
  return vim.fn.stdpath("data") .. "/silkcircuit_preferences.json"
end

-- Load preferences from disk
function M.load()
  local file_path = get_preferences_file()
  if vim.fn.filereadable(file_path) == 0 then
    return {}
  end

  local file = io.open(file_path, "r")
  if not file then
    return {}
  end

  local content = file:read("*a")
  file:close()

  local ok, prefs = pcall(vim.json.decode, content)
  if ok then
    return prefs
  else
    return {}
  end
end

-- Save preferences to disk
function M.save(prefs)
  local file_path = get_preferences_file()
  local file = io.open(file_path, "w")
  if not file then
    vim.notify("Failed to save SilkCircuit preferences", vim.log.levels.ERROR)
    return false
  end

  file:write(vim.json.encode(prefs))
  file:close()
  return true
end

-- Get a preference value
function M.get(key, default)
  local prefs = M.load()
  return prefs[key] or default
end

-- Set a preference value
function M.set(key, value)
  local prefs = M.load()
  prefs[key] = value
  return M.save(prefs)
end

-- Apply saved preferences
function M.apply()
  local prefs = M.load()

  -- Apply variant if saved
  if prefs.variant then
    local config = require("silkcircuit.config")
    config.get().variant = prefs.variant
    -- Don't reload colorscheme here, let init.lua handle it
  end

  -- Apply glow mode if saved
  if prefs.glow_enabled then
    vim.defer_fn(function()
      require("silkcircuit.glow").enable()
    end, 200)
  end
end

return M
