# 🌸 Lilac: Synthwave Neovim Theme

<div align="center">

[![Neovim](https://img.shields.io/badge/Neovim-0.8+-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![License](https://img.shields.io/badge/License-MIT-B48EAD?style=for-the-badge&logo=opensourceinitiative&logoColor=white)](https://opensource.org/licenses/MIT)
[![GitHub Release](https://img.shields.io/github/release/hyperb1iss/lilac-nvim.svg?style=for-the-badge&logo=github&logoColor=white&color=c792ea)](https://github.com/hyperb1iss/lilac-nvim/releases)
[![CI](https://img.shields.io/github/actions/workflow/status/hyperb1iss/lilac-nvim/ci.yml?style=for-the-badge&logo=github-actions&logoColor=white)](https://github.com/hyperb1iss/lilac-nvim/actions)

_A vibrant synthwave theme bringing cyberpunk aesthetics to your Neovim experience_ 💜

[Installation](#-installation) • [Configuration](#-configuration) • [Features](#-features) • [Screenshots](#-screenshots) • [Contributing](#-contributing)

</div>

<div align="center">
  <img src="https://raw.githubusercontent.com/hyperb1iss/lilac-nvim/main/assets/lilac-preview.png" alt="Lilac Theme Preview" width="90%">
</div>

## 🌟 Overview

Lilac is a meticulously crafted Neovim theme inspired by synthwave aesthetics and cyberpunk culture. Originally based on the VSCode Lilac theme, it brings vibrant purples, electric cyans, and neon pinks to your coding environment while maintaining excellent readability and semantic highlighting.

## ✨ Features

### 🎨 Visual Design

- **Synthwave Color Palette**: Carefully selected colors that evoke the cyberpunk aesthetic
- **Semantic Highlighting**: Colors chosen to enhance code comprehension
- **High Contrast Elements**: Important syntax elements pop without being overwhelming
- **Comfortable Dark Background**: Deep purple-black (#14111F) reduces eye strain

### 🚀 Technical Features

- **Tree-sitter Support**: Full integration with Neovim's advanced syntax highlighting
- **LSP Integration**: Thoughtfully styled diagnostics and hints
- **25+ Plugin Themes**: Native support for popular Neovim plugins
- **Performance Optimized**: Lazy-loadable with compilation support
- **Extensive Customization**: Override any aspect of the theme

### 🔧 Developer Experience

- **Terminal Colors**: Matching terminal palette for integrated experience
- **Multiple Formats**: Includes themes for Alacritty, Kitty, WezTerm, and Windows Terminal
- **Active Development**: Regular updates and community contributions

## 📦 Installation

### Prerequisites

- Neovim >= 0.8.0
- `termguicolors` enabled (add `vim.opt.termguicolors = true` to your config)
- Git (for plugin manager installation)

### Using [lazy.nvim](https://github.com/folke/lazy.nvim) (Recommended)

```lua
{
  "hyperb1iss/lilac-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("lilac").setup()
    vim.cmd.colorscheme("lilac")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "hyperb1iss/lilac-nvim",
  config = function()
    require("lilac").setup()
    vim.cmd.colorscheme("lilac")
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'hyperb1iss/lilac-nvim'

" After plug#end()
colorscheme lilac
```

### AstroNvim Installation

For AstroNvim v3+, add to your `plugins/` directory:

```lua
-- plugins/lilac.lua
return {
  "hyperb1iss/lilac-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("lilac").setup({
      -- Your Lilac config here
    })
  end,
}
```

Then update your `plugins/astroui.lua`:

```lua
-- plugins/astroui.lua
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = "lilac",
  },
}
```

For AstroNvim v4+, you can also add it to your community plugins:

```lua
-- lua/community.lua
return {
  { "hyperb1iss/lilac-nvim" },
}
```

### Local Installation

For development or testing from a local directory:

#### Using lazy.nvim

```lua
{
  dir = "~/dev/lilac-nvim",  -- Your local path
  lazy = false,
  priority = 1000,
  config = function()
    require("lilac").setup()
    vim.cmd.colorscheme("lilac")
  end,
}
```

#### Using packer.nvim

```lua
use {
  "~/dev/lilac-nvim",  -- Your local path
  config = function()
    require("lilac").setup()
    vim.cmd.colorscheme("lilac")
  end
}
```

#### Manual Installation

1. Clone to your local plugins directory:

   ```bash
   git clone https://github.com/hyperb1iss/lilac-nvim.git \
     ~/.local/share/nvim/site/pack/themes/start/lilac-nvim
   ```

2. Or symlink your development directory:

   ```bash
   ln -s ~/dev/lilac-nvim \
     ~/.local/share/nvim/site/pack/themes/start/lilac-nvim
   ```

3. Add to your Neovim config:

   ```lua
   vim.cmd.colorscheme("lilac")
   ```

## 🚀 Quick Start

After installation, add this minimal config to get started:

```lua
-- Enable 24-bit colors
vim.opt.termguicolors = true

-- Setup Lilac theme
require("lilac").setup({
  -- Leave empty for defaults or see Configuration section
})

-- Apply the colorscheme
vim.cmd.colorscheme("lilac")
```

### Verify Installation

Run `:checkhealth` in Neovim to verify:

- Neovim version is 0.8.0+
- `termguicolors` is enabled
- Theme loads without errors

You can also check the current colorscheme:

```vim
:echo g:colors_name
" Should output: lilac
```

## ⚙️ Configuration

Lilac offers extensive customization options to match your preferences:

### Basic Setup

```lua
require("lilac").setup({
  transparent = false,     -- Enable transparent background
  terminal_colors = true,  -- Set terminal colors
  dim_inactive = false,    -- Dim inactive windows
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { bold = false },
    variables = {},
  },
})
```

### Advanced Configuration

```lua
require("lilac").setup({
  -- Disable specific plugin integrations
  integrations = {
    telescope = true,
    nvimtree = true,
    treesitter = true,
    lsp = true,
    -- ... see documentation for full list
  },

  -- Override specific highlight groups
  on_highlights = function(highlights, colors)
    highlights.Function = { fg = colors.cyan, bold = true }
    highlights.Comment = { fg = colors.purple, italic = true }
  end,
})
```

### Transparent Background

Perfect for showcasing your terminal background:

```lua
require("lilac").setup({
  transparent = true,
})
```

### Performance Optimization

Compile the theme for faster startup:

```lua
require("lilac").compile()
```

### Lualine Integration

Lilac includes a custom Lualine theme. To use it:

```lua
require('lualine').setup {
  options = {
    theme = 'lilac',
    -- Other lualine options
  }
}
```

### Warp Terminal

For the best experience with Warp terminal:

1. Copy `extras/warp.yaml` to `~/.warp/themes/lilac.yaml`
2. In Warp settings, go to Appearance > Themes
3. Select "Lilac" from custom themes

This provides matching colors and UI elements for a cohesive experience.

### Rainbow Brackets

Lilac supports rainbow bracket plugins that color-match your bracket pairs:

```lua
-- For rainbow-delimiters.nvim
require('rainbow-delimiters.setup').setup {
  -- Your config
}

-- For nvim-ts-rainbow
require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    -- Use Lilac colors
  }
}
```

The theme provides neon colors for each nesting level, making it easy to match brackets in complex code.

## 🎯 Plugin Support

Lilac includes carefully designed themes for:

**UI Enhancements**

- Telescope - Fuzzy finder with custom borders
- NvimTree / Neo-tree - File explorers
- Which-Key - Keybinding display
- Notify - Notifications
- Noice - UI replacement

**Editor Features**

- Tree-sitter - Advanced syntax highlighting
- LSP - Diagnostics and code actions
- nvim-cmp - Completion menus
- GitSigns - Git integration
- Indent-Blankline - Indentation guides

**Status & Navigation**

- Lualine - Statusline (includes theme)
- BufferLine - Buffer tabs
- Dashboard / Alpha - Start screens
- Leap / Hop - Motion plugins

## 🎨 Color Palette

| Element | Color | Hex |
|---------|-------|-----|
| Background | ![#14111F](https://via.placeholder.com/15/14111F/14111F?text=+) | `#14111F` |
| Foreground | ![#eeffff](https://via.placeholder.com/15/eeffff/eeffff?text=+) | `#eeffff` |
| Purple | ![#c792ea](https://via.placeholder.com/15/c792ea/c792ea?text=+) | `#c792ea` |
| Cyan | ![#7fdbca](https://via.placeholder.com/15/7fdbca/7fdbca?text=+) | `#7fdbca` |
| Green | ![#addb67](https://via.placeholder.com/15/addb67/addb67?text=+) | `#addb67` |
| Blue | ![#82AAFF](https://via.placeholder.com/15/82AAFF/82AAFF?text=+) | `#82AAFF` |
| Pink | ![#ff5874](https://via.placeholder.com/15/ff5874/ff5874?text=+) | `#ff5874` |
| Orange | ![#ffcb8b](https://via.placeholder.com/15/ffcb8b/ffcb8b?text=+) | `#ffcb8b` |

## 📸 Screenshots

<details>
<summary>View more screenshots</summary>

### Lua Development

![Lua Screenshot](assets/screenshot-lua.png)

### TypeScript with Telescope

![TypeScript Screenshot](assets/screenshot-typescript.png)

### Python with Diagnostics

![Python Screenshot](assets/screenshot-python.png)

</details>

## 🛠️ Development

### Setup

```bash
# Clone the repository
git clone https://github.com/hyperb1iss/lilac-nvim.git
cd lilac-nvim

# Install development dependencies
make setup

# Run tests
make test

# Format code
make format

# Lint code
make lint
```

### Project Structure

```
lilac-nvim/
├── colors/              # Vim colorscheme files
├── lua/lilac/           # Main theme implementation
│   ├── init.lua        # Theme entry point
│   ├── config.lua      # Configuration handling
│   ├── palette.lua     # Color definitions
│   ├── theme.lua       # Highlight groups
│   └── integrations/   # Plugin-specific themes
├── extras/             # Terminal emulator themes
└── docs/               # Documentation
```

## 🔧 Troubleshooting

### Common Issues

**Theme not found error**

```
E185: Cannot find color scheme 'lilac'
```

- Ensure the plugin is installed and loaded before setting colorscheme
- For lazy.nvim, use `lazy = false` and `priority = 1000`
- Try `:Lazy sync` or `:PackerSync` to update

**Colors look wrong**

- Ensure `termguicolors` is enabled: `:set termguicolors?`
- Check your terminal supports 24-bit colors
- Some terminals need specific configuration (see `extras/` directory)

**Theme doesn't load in AstroNvim**

- Make sure to update both the plugin file and `astroui.lua`
- Run `:AstroUpdate` after adding the theme
- Check `:AstroNvimVersion` for compatibility

**Local installation not working**

- Verify the path is correct: `:echo &runtimepath`
- For symlinks, ensure they're not broken
- Try absolute paths instead of `~` in plugin specs

### Getting Help

1. Check `:checkhealth` for diagnostics
2. Review the [documentation](docs/)
3. Search [existing issues](https://github.com/hyperb1iss/lilac-nvim/issues)
4. Create a new issue with:
   - Neovim version: `nvim --version`
   - Config used to load theme
   - Error messages
   - Screenshots if visual issue

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

### Development Setup

```bash
# Clone for development
git clone https://github.com/hyperb1iss/lilac-nvim.git ~/dev/lilac-nvim
cd ~/dev/lilac-nvim

# Install dev dependencies
make setup

# Run tests and linting
make test
make lint

# Use your local version in Neovim
# Add to lazy.nvim: { dir = "~/dev/lilac-nvim" }
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Original [VSCode Lilac Theme](https://marketplace.visualstudio.com/items) for the color palette inspiration
- The Neovim community for continuous feedback and contributions
- All contributors who have helped improve this theme

## 💜 Author

Created by [Stefanie Jane](https://github.com/hyperb1iss) ([@hyperb1iss](https://twitter.com/hyperb1iss))

---

<div align="center">
  <sub>Built with 💜 in Seattle</sub>
</div>
