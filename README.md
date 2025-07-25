# 🌸 Lilac Theme for Neovim

A beautiful synthwave-inspired femme cyberpunk theme for Neovim, ported from the popular VSCode Lilac theme.

![Lilac Theme Banner](https://via.placeholder.com/800x400/14111F/c792ea?text=Lilac+Theme)

## ✨ Features

- 🎨 Carefully crafted color palette with synthwave aesthetics
- 🌙 Dark theme optimized for long coding sessions
- 🔧 Full support for Tree-sitter highlighting
- 🧩 Integration with popular plugins (Telescope, NvimTree, LSP, etc.)
- ⚡ Optimized for performance
- 🎯 Semantic highlighting for better code comprehension
- 💜 Vibrant purples, cyans, and pinks for that cyberpunk vibe

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "bliss/lilac-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("lilac").setup({
      -- Configuration options
    })
    vim.cmd.colorscheme("lilac")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "bliss/lilac-nvim",
  config = function()
    require("lilac").setup({})
    vim.cmd.colorscheme("lilac")
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'bliss/lilac-nvim'

" In your init.vim
colorscheme lilac
```

## 🚀 Usage

Simply set the colorscheme in your Neovim configuration:

```lua
vim.cmd.colorscheme("lilac")
```

Or with setup options:

```lua
require("lilac").setup({
  transparent = false,     -- Enable transparent background
  italic_comments = true,  -- Enable italic comments
  dim_inactive = false,    -- Dim inactive windows
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { bold = false },
    variables = {},
  },
})

vim.cmd.colorscheme("lilac")
```

## 🎨 Color Palette

| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| Background | `#14111F` | ![](https://via.placeholder.com/20/14111F/14111F) | Main background |
| Foreground | `#eeffff` | ![](https://via.placeholder.com/20/eeffff/eeffff) | Default text |
| Purple | `#c792ea` | ![](https://via.placeholder.com/20/c792ea/c792ea) | Keywords, functions |
| Cyan | `#7fdbca` | ![](https://via.placeholder.com/20/7fdbca/7fdbca) | Operators, properties |
| Green | `#addb67` | ![](https://via.placeholder.com/20/addb67/addb67) | Strings, variables |
| Blue | `#82AAFF` | ![](https://via.placeholder.com/20/82AAFF/82AAFF) | Constants, calls |
| Pink | `#ff5874` | ![](https://via.placeholder.com/20/ff5874/ff5874) | Booleans, errors |
| Orange | `#ffcb8b` | ![](https://via.placeholder.com/20/ffcb8b/ffcb8b) | Classes, types |

## 🔌 Plugin Support

Lilac includes built-in support for:

- **Tree-sitter** - Enhanced syntax highlighting
- **LSP Diagnostics** - Clear error and warning indicators
- **Telescope** - Beautiful fuzzy finder integration
- **NvimTree** - File explorer theming
- **GitSigns** - Git integration
- **Indent-Blankline** - Indentation guides
- **BufferLine** - Tab styling
- **Lualine** - Status line theming
- **Dashboard** - Start screen theming
- **Which-Key** - Keybinding popup
- **Cmp** - Completion menu styling

## ⚙️ Configuration

### Default Configuration

```lua
{
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { bold = false },
    variables = {},
    operators = {},
    booleans = {},
    strings = {},
  },
  -- Override specific highlight groups
  on_highlights = function(highlights, colors)
    -- Example: Make comments more visible
    -- highlights.Comment = { fg = colors.comment, italic = true, bold = true }
  end,
}
```

### Transparent Background

```lua
require("lilac").setup({
  transparent = true,
})
```

### Dim Inactive Windows

```lua
require("lilac").setup({
  dim_inactive = true,
})
```

## 🎨 Extras

Additional configurations for other tools:

- **Alacritty** - `extras/alacritty.yml`
- **Kitty** - `extras/kitty.conf`
- **WezTerm** - `extras/wezterm.lua`
- **Windows Terminal** - `extras/windows_terminal.json`

## 👥 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🙏 Credits

- Original [VSCode Lilac Theme](https://github.com/example/lilac) for the inspiration
- The Neovim community for their amazing work

---

<p align="center">Made with 💜 for the Neovim community</p>