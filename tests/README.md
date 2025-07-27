# SilkCircuit Theme Tests

This directory contains the test suite for the SilkCircuit Neovim theme.

## Running Tests

```bash
# Run all tests
make test
```

## Test Structure

### Unit Tests

- **Color Utilities** (`unit/test_colors.lua`)
  - Tests color conversion functions (hex/rgb)
  - Tests color blending and manipulation
  - Tests WCAG contrast validation
  - Tests luminance calculations

- **Palette** (`unit/test_palette.lua`)
  - Tests variant color loading
  - Tests semantic color mappings
  - Tests color presence and naming

- **Configuration** (`unit/test_config.lua`)
  - Tests default configuration values
  - Tests setup and option merging
  - Tests configuration getters

### Test Runner

The test suite uses a simple custom test runner (`run.lua`) that:

- Runs in plain Lua without requiring Neovim
- Provides minimal test framework with `describe` and `it` functions
- Outputs colorful test results
- Tracks pass/fail statistics

## Writing New Tests

Tests follow a simple structure:

```lua
describe("Feature Name", function()
  it("should do something", function()
    local result = some_function()
    assert(result == expected_value, "Error message if fails")
  end)
end)
```

## Test Coverage

Current test coverage includes:

- ✅ Color manipulation utilities (7 tests)
- ✅ Palette loading and variants (3 tests)
- ✅ Configuration management (2 tests)

## Notes

- Tests run in isolation without user configuration
- Mock vim API is provided for testing Neovim-specific code
- Tests are designed to be fast and reliable
