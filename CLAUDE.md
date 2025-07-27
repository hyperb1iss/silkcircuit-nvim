# Claude Coding Guidelines for SilkCircuit

> Instructions for AI assistants working on the SilkCircuit theme

## Project Overview

SilkCircuit is a vibrant Neovim theme featuring neon purples, electric pinks, and glowing cyan accents. The theme prioritizes performance, accessibility, and comprehensive plugin support.

## Core Principles

1. **Performance First** - Theme loads in <5ms with bytecode compilation
2. **Accessibility** - All colors meet WCAG AA contrast standards
3. **Plugin Auto-Detection** - Automatically detect and theme installed plugins
4. **User Choice** - Three variants (neon/vibrant/soft) with persistent preferences

## Code Style Guidelines

### Lua Conventions

```lua
-- Module structure
local M = {}

-- Function definitions
function M.function_name(param1, param2)
  -- Implementation
end

return M
```

### Naming Conventions

- Files: `snake_case.lua`
- Functions: `snake_case`
- Local variables: `snake_case`
- Constants: `UPPER_SNAKE_CASE` (rare)
- Highlight groups: `PascalCase`

### Comments

- Avoid unnecessary comments
- Document complex logic only
- Use present tense ("Returns" not "Will return")
- No decorative comments

## Key Files and Their Purposes

### Core Files

- `init.lua` - Entry point, loads theme
- `palette.lua` - Color definitions and semantic mappings
- `theme.lua` - Core highlight group definitions
- `config.lua` - Configuration management
- `util.lua` - Utility functions and compilation

### Integration System

- `integrations/init.lua` - Plugin detection and loading
- `integrations/{plugin}.lua` - Individual plugin themes

### User Features

- `commands.lua` - User commands (`:SilkCircuit`, etc.)
- `preferences.lua` - Persistent settings
- `glow.lua` - Glow mode implementation
- `variants.lua` - Theme variant system

## Adding New Features

### New Integration

1. Create `integrations/{plugin}.lua`
2. Add to detection in `integrations/init.lua`
3. Add to integration list
4. Test with and without plugin

Template:

```lua
local M = {}

function M.get(colors, opts)
  return {
    PluginElement = { fg = colors.purple },
    -- Map plugin UI to semantic colors
  }
end

return M
```

### New Command

1. Add to `commands.lua`
2. Follow naming pattern `:SilkCircuit{Feature}`
3. Add to `:checkhealth` documentation
4. Update help docs

## Testing Guidelines

### Before Committing

1. Run `make lint` - Must pass
2. Test all variants - `:SilkCircuit neon/vibrant/soft`
3. Check compilation - `:SilkCircuitCompile`
4. Verify contrast - `:SilkCircuitContrast`
5. Run checkhealth - `:checkhealth silkcircuit`

### Manual Testing

- Open various file types (Lua, JS, YAML, Markdown)
- Test with neo-tree open
- Verify git status colors
- Check floating windows

## Performance Considerations

### Do

- Use `vim.tbl_deep_extend` for merging
- Cache expensive operations
- Compile regex patterns once
- Use early returns

### Don't

- Parse files repeatedly
- Create unnecessary tables
- Use global variables
- Block the main thread

## Color Usage

### Semantic Mapping

Always use semantic colors from `palette.lua`:

```lua
-- Good
{ fg = sem.keyword }

-- Bad
{ fg = colors.purple }
```

### Contrast

All foreground/background pairs must meet WCAG AA (4.5:1 ratio).

## User Communication

### Notifications

```lua
-- Use vim.notify with appropriate level
vim.notify("Message", vim.log.levels.INFO)
```

### Unicode Symbols

- `→` for arrows/flow
- `√` for success
- `!` for warnings
- `»` for tips
- Avoid emojis

## Common Tasks

### Update Existing Highlight

1. Find in `theme.lua` or relevant integration
2. Modify using semantic colors
3. Test in all variants

### Fix Contrast Issue

1. Run `:SilkCircuitContrast`
2. Identify failing pair
3. Adjust in `palette.lua`
4. Re-test

### Add Config Option

1. Add to defaults in `config.lua`
2. Document in README
3. Handle in relevant module
4. Add to `:checkhealth`

## Git Workflow

### Commit Messages

- Use conventional commits
- Be specific about changes
- Reference issues if applicable

Examples:

- `fix: correct YAML key highlighting`
- `feat: add mason.nvim integration`
- `perf: optimize theme compilation`

### Pull Requests

- Update CHANGELOG.md
- Run all tests
- Include before/after screenshots for visual changes

## Debugging

### Common Issues

1. **Highlights not applying**: Check `:hi {GroupName}`
2. **Plugin not detected**: Verify in `:SilkCircuitIntegrations`
3. **Slow loading**: Run `:SilkCircuitCompile`
4. **Colors look wrong**: Check terminal true color support

### Debug Mode

```lua
vim.g.silkcircuit_debug = true
```

## Don'ts

- × Don't add emojis to code
- × Don't create files unless necessary
- × Don't use hard-coded colors
- × Don't skip contrast validation
- × Don't add verbose comments
- × Don't break existing functionality

## Quick Reference

### Commands

- `:SilkCircuit {variant}` - Switch variant
- `:SilkCircuitGlow` - Toggle glow mode
- `:SilkCircuitContrast` - Check WCAG compliance
- `:SilkCircuitCompile` - Compile for performance
- `:SilkCircuitIntegrations` - Show detected plugins
- `:checkhealth silkcircuit` - Full diagnostics

### File Locations

- Colors: `lua/silkcircuit/palette.lua`
- Highlights: `lua/silkcircuit/theme.lua`
- Plugin themes: `lua/silkcircuit/integrations/`
- User config: `~/.config/nvim/lua/plugins/silkcircuit.lua`

---

*When in doubt, prioritize user experience and maintain the vibrant aesthetic.*
