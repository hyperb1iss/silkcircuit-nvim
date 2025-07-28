-- Run tests inside actual Neovim
vim.opt.runtimepath:prepend(vim.fn.getcwd())

-- Simple test framework
local tests = {}
local results = { passed = 0, failed = 0, errors = {} }

_G.describe = function(name, fn)
  print("\n→ " .. name)
  fn()
end

_G.it = function(name, fn)
  local ok, err = pcall(fn)
  if ok then
    print("  ✓ " .. name)
    results.passed = results.passed + 1
  else
    print("  ✗ " .. name)
    print("    • " .. err)
    results.failed = results.failed + 1
    table.insert(results.errors, { test = name, error = err })
  end
end

_G.assert = function(condition, message)
  if not condition then
    error(message or "Assertion failed", 2)
  end
end

-- Run all test files
local test_files = vim.fn.glob("tests/unit/*.lua", false, true)
for _, file in ipairs(test_files) do
  dofile(file)
end

-- Summary
print("\n" .. string.rep("═", 60))
print("★ TEST SUMMARY")
print(string.rep("═", 60))
print(string.format("\nTotal: %d passed, %d failed\n", results.passed, results.failed))

if results.failed > 0 then
  print("Failed tests:")
  for _, err in ipairs(results.errors) do
    print("  • " .. err.test .. ": " .. err.error)
  end
  vim.cmd("cquit 1")
else
  print("✓ All tests passed!")
  vim.cmd("quit")
end
