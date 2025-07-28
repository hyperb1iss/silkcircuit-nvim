# SilkCircuit Tests

Simple, clean test suite that runs inside actual Neovim.

## Running Tests

```bash
make test
```

## Test Structure

Tests are organized in `unit/` directory:

- `test_colors.lua` - Color utility functions
- `test_config.lua` - Configuration system
- `test_palette.lua` - Color palette and variants

## Writing Tests

Tests use a minimal test framework built into `run.lua`:

```lua
describe("Feature", function()
  it("does something", function()
    assert(condition, "Error message")
  end)
end)
```

All tests run inside Neovim with full access to the vim API.
No mocking required!
