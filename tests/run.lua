-- SilkCircuit Theme Test Runner
-- Colorful test suite that matches our theme!

-- Test framework
local test_results = {}
local current_test = nil

-- Check if we can use colors
local function supports_color()
  -- Force colors unless explicitly disabled
  if os.getenv("NO_COLOR") then
    return false
  end

  -- Check common CI environments that support colors
  if os.getenv("CI") or os.getenv("GITHUB_ACTIONS") then
    return true
  end

  -- Check TERM environment variable
  local term = os.getenv("TERM")
  if term and term ~= "dumb" then
    return true
  end

  -- Default to true for local development
  return true
end

-- Color support
local use_colors = supports_color()
local colors = {
  -- SilkCircuit theme colors!
  purple = use_colors and "\27[38;2;225;53;255m" or "", -- #e135ff
  pink = use_colors and "\27[38;2;255;121;198m" or "", -- #ff79c6
  cyan = use_colors and "\27[38;2;128;255;234m" or "", -- #80ffea
  green = use_colors and "\27[38;2;80;250;123m" or "", -- #50fa7b
  yellow = use_colors and "\27[38;2;241;250;140m" or "", -- #f1fa8c
  reset = use_colors and "\27[0m" or "",
  bold = use_colors and "\27[1m" or "",
}

-- Symbols
local symbols = {
  check = "✓",
  cross = "✗",
  arrow = "→",
  dot = "•",
  lightning = "»",
  star = "★",
}

_G.describe = function(name, fn)
  current_test = name
  test_results[name] = { passed = 0, failed = 0, errors = {} }
  print(string.format("\n%s%s %s%s%s", colors.cyan, symbols.arrow, colors.bold, name, colors.reset))
  fn()
end

_G.it = function(test_name, fn)
  local ok, err = pcall(fn)
  if ok then
    test_results[current_test].passed = test_results[current_test].passed + 1
    print(string.format("  %s%s%s %s", colors.green, symbols.check, colors.reset, test_name))
  else
    test_results[current_test].failed = test_results[current_test].failed + 1
    table.insert(test_results[current_test].errors, { test = test_name, error = err })
    print(string.format("  %s%s%s %s", colors.pink, symbols.cross, colors.reset, test_name))
    print(string.format("    %s%s%s%s", colors.yellow, symbols.dot, colors.reset, tostring(err)))
  end
end

_G.assert = function(condition, message)
  if not condition then
    error(message or "Assertion failed", 2)
  end
end

-- Mock vim for tests that need it
_G.vim = {
  api = {
    nvim_set_hl = function() end,
  },
  notify = function() end,
  tbl_isempty = function(t)
    return next(t) == nil
  end,
  tbl_deep_extend = function(_, a, b)
    local result = {}
    for k, v in pairs(a or {}) do
      result[k] = v
    end
    for k, v in pairs(b or {}) do
      result[k] = v
    end
    return result
  end,
}

-- Header
print(
  string.format(
    "%s%s%s SilkCircuit Theme Test Suite %s%s%s",
    colors.purple,
    colors.bold,
    symbols.lightning,
    symbols.lightning,
    colors.reset,
    "\n"
  )
)

-- Add project to path
package.path = "./lua/?.lua;" .. package.path

-- Run tests
dofile("tests/unit/test_colors.lua")
dofile("tests/unit/test_palette.lua")
dofile("tests/unit/test_config.lua")

-- Summary
print(string.format("\n%s%s%s", colors.purple, string.rep("═", 60), colors.reset))
print(
  string.format(
    "%s%s%s TEST SUMMARY %s%s",
    colors.purple,
    colors.bold,
    symbols.star,
    colors.reset,
    ""
  )
)
print(string.format("%s%s%s", colors.purple, string.rep("═", 60), colors.reset))

local total_passed = 0
local total_failed = 0

for suite_name, results in pairs(test_results) do
  total_passed = total_passed + results.passed
  total_failed = total_failed + results.failed

  if results.failed > 0 then
    print(
      string.format(
        "\n%s%s%s: %s%d passed%s, %s%d failed%s",
        colors.cyan,
        suite_name,
        colors.reset,
        colors.green,
        results.passed,
        colors.reset,
        colors.pink,
        results.failed,
        colors.reset
      )
    )
  end
end

print(
  string.format(
    "\n%sTotal%s: %s%d passed%s, %s%d failed%s",
    colors.bold,
    colors.reset,
    colors.green,
    total_passed,
    colors.reset,
    colors.pink,
    total_failed,
    colors.reset
  )
)

if total_failed == 0 then
  print(
    string.format(
      "\n%s%s%s All tests passed!%s",
      colors.green,
      colors.bold,
      symbols.check,
      colors.reset
    )
  )
  os.exit(0)
else
  print(string.format("\n%s%s Some tests failed%s", colors.pink, colors.bold, colors.reset))
  os.exit(1)
end
