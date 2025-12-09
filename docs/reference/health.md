# Health Check

Diagnostics and troubleshooting for SilkCircuit.

## Running Health Check

```vim
:checkhealth silkcircuit
```

This command verifies your SilkCircuit installation and configuration.

## Check Categories

### Version Compatibility

Verifies Neovim version meets requirements:

- **Required:** Neovim 0.8.0+
- **Recommended:** Neovim 0.9.0+ for best experience

```
✓ Neovim version: 0.10.0 (OK)
```

### True Color Support

Checks if your terminal supports 24-bit colors:

```
✓ True colors enabled ($COLORTERM=truecolor)
✓ termguicolors is set
```

If true colors aren't working:

1. Add `vim.opt.termguicolors = true` to your config
2. Verify terminal supports true colors
3. Check `$COLORTERM` environment variable

### Theme Status

Confirms SilkCircuit is properly loaded:

```
✓ SilkCircuit theme loaded
✓ Current variant: neon
```

### Plugin Integrations

Lists detected plugin integrations:

```
✓ telescope.nvim: themed
✓ neo-tree.nvim: themed
✓ nvim-cmp: themed
✓ gitsigns.nvim: themed
```

### WCAG Compliance

Validates contrast ratios meet accessibility standards:

```
✓ All highlight groups meet WCAG AA contrast (4.5:1)
```

### Cache Status

Shows compilation cache status:

```
✓ Theme compiled to bytecode
✓ Cache location: ~/.cache/nvim/silkcircuit/
```

## Common Issues

### Theme Not Loading

**Symptoms:**

- Colors look wrong
- Default Neovim colors showing

**Solutions:**

1. Verify installation:

```vim
:Lazy
" Check SilkCircuit is installed
```

2. Load colorscheme:

```lua
vim.cmd.colorscheme("silkcircuit")
```

3. Check for errors:

```vim
:messages
```

### Wrong Colors

**Symptoms:**

- Colors appear washed out
- Colors don't match screenshots

**Solutions:**

1. Enable true colors:

```lua
vim.opt.termguicolors = true
```

2. Check terminal settings:

```bash
echo $COLORTERM
# Should show "truecolor"
```

3. Try a different terminal emulator

### Slow Loading

**Symptoms:**

- Theme takes more than 5ms to load
- Visible delay on startup

**Solutions:**

1. Compile the theme:

```vim
:SilkCircuitCompile
```

2. Check cache permissions:

```bash
ls -la ~/.cache/nvim/silkcircuit/
```

3. Clear and recompile:

```bash
rm -rf ~/.cache/nvim/silkcircuit/
```

Then restart Neovim.

### Plugin Not Themed

**Symptoms:**

- Specific plugin uses wrong colors
- Plugin highlights don't match

**Solutions:**

1. Check if plugin is supported:

```vim
:SilkCircuitIntegrations
```

2. Verify plugin is loaded before theme:

```lua
-- In lazy.nvim, set priority
{
  "hyperb1iss/silkcircuit-nvim",
  priority = 1000,
  lazy = false,
}
```

3. Report missing integrations on GitHub

### Contrast Issues

**Symptoms:**

- Text hard to read
- Health check shows contrast warnings

**Solutions:**

1. Try a different variant:

```vim
:SilkCircuit glow  " Maximum contrast
:SilkCircuit soft  " Gentler contrast
```

2. Override specific highlights:

```lua
require("silkcircuit").setup({
  on_highlights = function(hl, colors)
    hl.Comment = { fg = "#888888" }  -- Lighter comments
  end,
})
```

## Debug Mode

Enable debug logging:

```lua
vim.g.silkcircuit_debug = true
```

View debug output:

```vim
:messages
```

## Getting Help

1. Run `:checkhealth silkcircuit`
2. Check the [GitHub Issues](https://github.com/hyperb1iss/silkcircuit-nvim/issues)
3. Include health check output in bug reports

## Health Check Output Example

```
silkcircuit: require("silkcircuit.health").check()

SilkCircuit Theme Health Check
==============================

Environment
- OK Neovim version: 0.10.0
- OK True colors: enabled
- OK termguicolors: set

Theme Status
- OK SilkCircuit loaded
- OK Variant: neon
- OK Compiled: yes

Integrations
- OK telescope.nvim
- OK neo-tree.nvim
- OK nvim-cmp
- OK gitsigns.nvim
- OK lualine.nvim

Accessibility
- OK WCAG AA contrast: all groups pass

Commands
- OK :SilkCircuit [variant]
- OK :SilkCircuitGlow
- OK :SilkCircuitContrast
- OK :SilkCircuitCompile
- OK :SilkCircuitIntegrations
```
