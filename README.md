# ⚡ SilkCircuit: A Vibrant Neovim Theme

<div align="center">

[![Neovim](https://img.shields.io/badge/Neovim-0.8+-e135ff?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![License](https://img.shields.io/badge/License-MIT-ff79c6?style=for-the-badge&logo=opensourceinitiative&logoColor=white)](https://opensource.org/licenses/MIT)
[![GitHub Stars](https://img.shields.io/github/stars/hyperb1iss/silkcircuit-nvim?style=for-the-badge&logo=github&logoColor=white&color=bd93f9)](https://github.com/hyperb1iss/silkcircuit-nvim/stargazers)
[![CI](https://img.shields.io/github/actions/workflow/status/hyperb1iss/silkcircuit-nvim/ci.yml?branch=main&style=for-the-badge&logo=github-actions&logoColor=white&label=CI&color=50fa7b)](https://github.com/hyperb1iss/silkcircuit-nvim/actions/workflows/ci.yml)

_A high-contrast theme featuring vibrant purples, electric pinks, and glowing accents_ ✨

[Installation](#-installation) • [Features](#-features) • [Configuration](#-configuration) • [Plugin Support](#-plugin-support)

</div>

<div align="center">
  <img src="https://raw.githubusercontent.com/hyperb1iss/silkcircuit-nvim/main/assets/silkcircuit-preview.png" alt="SilkCircuit Theme Preview" width="90%">
</div>

## 🌟 Overview

SilkCircuit is a carefully crafted Neovim colorscheme that combines vibrant colors with excellent readability. Featuring glowing purples, electric pinks, and bright cyans, it creates a visually striking coding environment while maintaining clarity and reducing eye strain.

## ✨ Features

- 🎨 **Vibrant Color Palette** - Eye-catching colors that make code elements distinct
- 🌲 **Full Tree-sitter Support** - Advanced syntax highlighting with semantic tokens
- 🔌 **40+ Plugin Integrations** - Native support for all popular Neovim plugins
- 🚀 **Zero Configuration** - Works out of the box with sensible defaults
- ⚙️ **Highly Customizable** - Tweak any aspect to match your preferences
- 🖥️ **Terminal Themes Included** - Matching themes for popular terminal emulators

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim) (Recommended)

```lua
{
  "hyperb1iss/silkcircuit-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("silkcircuit")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "hyperb1iss/silkcircuit-nvim",
  config = function()
    vim.cmd("colorscheme silkcircuit")
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'hyperb1iss/silkcircuit-nvim'
colorscheme silkcircuit
```

## 🚀 AstroNvim

SilkCircuit integrates seamlessly with AstroNvim, just like any community colorscheme:

```lua
-- In your lua/community.lua file:
return {
  "AstroNvim/astrocommunity",
  { "hyperb1iss/silkcircuit-nvim", name = "silkcircuit" },
}

-- In your lua/plugins/astroui.lua file:
return {
  "AstroNvim/astroui",
  opts = {
    colorscheme = "silkcircuit",
  },
}
```

That's it! No additional configuration needed.

## ⚙️ Configuration

### Default Setup

SilkCircuit works great out of the box, but you can customize it:

```lua
require("silkcircuit").setup({
  transparent = false,     -- Enable transparent background
  terminal_colors = true,  -- Configure terminal colors
  dim_inactive = false,    -- Dim inactive windows

  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = { bold = true, italic = true },
    variables = {},
    strings = { italic = true },
  },

  integrations = {
    -- All integrations are enabled by default
    telescope = true,
    neotree = true,
    notify = true,
    cmp = true,
    -- See :h silkcircuit-integrations for full list
  },
})
```

### Transparent Background

For a sleek, transparent look:

```lua
require("silkcircuit").setup({
  transparent = true,
})
```

### Custom Highlights

Override any highlight group:

```lua
require("silkcircuit").setup({
  on_highlights = function(highlights, colors)
    highlights.Function = { fg = colors.cyan, bold = true }
    highlights.Comment = { fg = colors.gray, italic = true }
  end,
})
```

## 🎯 Plugin Support

SilkCircuit includes thoughtfully designed integrations for 40+ plugins:

**Essential Plugins**

- 🔭 Telescope
- 🌳 Neo-tree / NvimTree
- 💡 LSP & Diagnostics
- 🔍 Treesitter
- ✨ nvim-cmp

**UI Enhancements**

- 💫 Lualine
- 📑 BufferLine
- 🔔 Notify
- 🎯 Which-Key
- 📊 Dashboard/Alpha

**Development Tools**

- 🔀 Gitsigns
- 🏃 Leap/Hop
- 🌈 Rainbow Delimiters
- 📝 Indent Blankline
- 🐛 DAP (Debugger)

And many more! All integrations work automatically when the plugins are installed.

## 🎨 Terminal Support

SilkCircuit includes matching themes for popular terminals:

```bash
# Copy the appropriate theme file from extras/
cp extras/alacritty.toml ~/.config/alacritty/themes/silkcircuit.toml
cp extras/kitty.conf ~/.config/kitty/themes/silkcircuit.conf
cp extras/wezterm.lua ~/.config/wezterm/colors/silkcircuit.lua
```

## 🎨 Color Palette

| Color | Hex | Preview |
|-------|-----|---------|
| Background | `#0a0a0f` | ![#0a0a0f](https://via.placeholder.com/20/0a0a0f/0a0a0f?text=+) |
| Foreground | `#e0e0e0` | ![#e0e0e0](https://via.placeholder.com/20/e0e0e0/e0e0e0?text=+) |
| Purple | `#e135ff` | ![#e135ff](https://via.placeholder.com/20/e135ff/e135ff?text=+) |
| Pink | `#ff79c6` | ![#ff79c6](https://via.placeholder.com/20/ff79c6/ff79c6?text=+) |
| Cyan | `#80ffea` | ![#80ffea](https://via.placeholder.com/20/80ffea/80ffea?text=+) |
| Green | `#50fa7b` | ![#50fa7b](https://via.placeholder.com/20/50fa7b/50fa7b?text=+) |
| Yellow | `#f1fa8c` | ![#f1fa8c](https://via.placeholder.com/20/f1fa8c/f1fa8c?text=+) |
| Orange | `#ffb86c` | ![#ffb86c](https://via.placeholder.com/20/ffb86c/ffb86c?text=+) |

## 🔧 Troubleshooting

**Theme not loading?**

- Ensure Neovim version is 0.8.0 or higher
- Add `vim.opt.termguicolors = true` to your config
- Check that the plugin is installed: `:Lazy` or `:PackerStatus`

**Colors look wrong?**

- Verify your terminal supports true colors
- Try a different terminal emulator
- Check terminal color settings

**Need help?**

- Run `:checkhealth` for diagnostics
- Check [Issues](https://github.com/hyperb1iss/silkcircuit-nvim/issues)
- Create a new issue with your config and error messages

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

```bash
# Clone the repo
git clone https://github.com/hyperb1iss/silkcircuit-nvim.git
cd silkcircuit-nvim

# Install dev dependencies
make setup

# Run tests and linting
make test
make lint
```

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

---

<div align="center">

Created by [Stefanie Jane 🌠](https://github.com/hyperb1iss)

If you love SilkCircuit, [buy me a Monster Ultra Violet ⚡️](https://ko-fi.com/hyperb1iss)

</div>
