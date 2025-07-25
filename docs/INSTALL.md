# Installation Guide

## Prerequisites

- Neovim >= 0.8.0
- `termguicolors` enabled in your Neovim configuration

## Plugin Managers

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "hyperb1iss/silkcircuit-nvim",
  lazy = false,    -- Load during startup
  priority = 1000, -- Load before other plugins
  config = function()
    require("silkcircuit").setup({
      -- Your configuration here
    })
    vim.cmd.colorscheme("silkcircuit")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "hyperb1iss/silkcircuit-nvim",
  config = function()
    require("silkcircuit").setup({})
    vim.cmd("colorscheme silkcircuit")
  end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'hyperb1iss/silkcircuit-nvim'

" After plug#end()
colorscheme silkcircuit
```

### [dein.vim](https://github.com/Shougo/dein.vim)

```vim
call dein#add('hyperb1iss/silkcircuit-nvim')

" In your configuration
colorscheme silkcircuit
```

### Manual Installation

1. Clone the repository:

```bash
git clone https://github.com/hyperb1iss/silkcircuit-nvim.git \
  ~/.local/share/nvim/site/pack/silkcircuit/start/silkcircuit-nvim
```

2. Add to your Neovim configuration:

```lua
vim.cmd.colorscheme("silkcircuit")
```

## Basic Setup

Add this to your `init.lua`:

```lua
-- Enable 24-bit color
vim.opt.termguicolors = true

-- Setup and load the colorscheme
require("silkcircuit").setup({
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { bold = false },
    variables = {},
  },
})

vim.cmd.colorscheme("silkcircuit")
```

Or in `init.vim`:

```vim
" Enable 24-bit color
set termguicolors

" Load the colorscheme
colorscheme silkcircuit
```

## Verify Installation

After installation, you can verify that SilkCircuit is properly installed:

```vim
:colorscheme silkcircuit
:lua print(vim.g.colors_name)
```

This should output `silkcircuit`.

## Troubleshooting

### Colors don't look right

Make sure you have `termguicolors` enabled:

```lua
vim.opt.termguicolors = true
```

### Theme not found

Ensure the plugin is properly installed and loaded before trying to set the colorscheme. With lazy.nvim, use `lazy = false` and `priority = 1000`.

### Transparent background not working

The transparent background feature requires your terminal to support transparency. Also ensure:

```lua
require("silkcircuit").setup({
  transparent = true,
})
```

## Next Steps

- Check out the [Configuration Guide](../README.md#configuration) for customization options
- Explore [supported plugins](../README.md#plugin-support)
- Read about [creating custom highlights](../README.md#custom-highlights)
