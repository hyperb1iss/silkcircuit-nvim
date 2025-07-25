# SilkCircuit for AstroNvim

SilkCircuit integrates seamlessly with AstroNvim, just like any other community colorscheme.

## Installation

Add these two lines to your AstroNvim configuration:

### 1. Add to `lua/community.lua`

```lua
return {
  "AstroNvim/astrocommunity",
  { "hyperb1iss/silkcircuit-nvim", name = "silkcircuit" },
  -- your other plugins...
}
```

### 2. Set in `lua/plugins/astroui.lua`

```lua
return {
  "AstroNvim/astroui",
  opts = {
    colorscheme = "silkcircuit",
  },
}
```

That's it! Restart Neovim and enjoy your new theme.

## Features

SilkCircuit automatically integrates with all AstroNvim components:

- ✨ Full integration with Telescope, Neo-tree, Alpha dashboard
- 🎨 Custom statusline colors with vibrant mode indicators
- 🌈 Rainbow delimiters with matching theme colors
- 💡 LSP and diagnostic highlighting
- 🔔 Notify, Which-key, and all other AstroNvim plugins

## Customization

Want to tweak the theme? Create `lua/plugins/silkcircuit.lua`:

```lua
return {
  "hyperb1iss/silkcircuit-nvim",
  name = "silkcircuit",
  opts = {
    -- Your custom options
    transparent = true,
    styles = {
      comments = { italic = true },
      keywords = { bold = true },
    },
  },
}
```

## Local Development

Using a local copy of SilkCircuit:

```lua
-- In lua/community.lua:
return {
  "AstroNvim/astrocommunity",
  { dir = "~/path/to/silkcircuit-nvim", name = "silkcircuit" },
}
```

## Troubleshooting

- Run `:Lazy sync` after adding the theme
- Ensure `colorscheme = "silkcircuit"` is set in astroui.lua
- Check `:AstroNvimVersion` for compatibility (requires AstroNvim v4+)
