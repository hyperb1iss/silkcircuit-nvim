# SilkCircuit for AstroNvim

SilkCircuit integrates seamlessly with AstroNvim, just like any other community colorscheme.

## Installation

### Method 1: Simple (Recommended)

Add this to your `lua/community.lua`:

```lua
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin" }, -- your other colorschemes
  { "silkcircuit/silkcircuit-nvim", name = "silkcircuit" }, -- add SilkCircuit
}
```

Then set it as your colorscheme in `lua/plugins/astroui.lua`:

```lua
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = "silkcircuit",
  },
}
```

### Method 2: With Customization

If you want to customize the theme, create `lua/plugins/silkcircuit.lua`:

```lua
return {
  "silkcircuit/silkcircuit-nvim",
  name = "silkcircuit",
  opts = {
    -- your custom options here
    styles = {
      comments = { italic = true },
      keywords = { bold = true },
      functions = { bold = true, italic = true },
    },
  },
}
```

That's it! SilkCircuit will automatically integrate with all your AstroNvim plugins.

## Features

- Full integration with all AstroNvim plugins
- Automatic support for telescope, neo-tree, alpha dashboard, and more
- Rainbow delimiters with cyberpunk colors
- Optimized for readability with vibrant cyberpunk aesthetics

## Supported Integrations

All standard AstroNvim integrations are supported out of the box:

- aerial, alpha, cmp, dap, gitsigns, illuminate, indent-blankline
- lualine, mason, neo-tree, notify, semantic tokens, telescope
- treesitter, which-key, window-picker, and many more!

No additional configuration needed - it just works!
