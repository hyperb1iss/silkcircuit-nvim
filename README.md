# ⚡ SilkCircuit: Femme Cyberpunk Neovim Theme

<div align="center">

[![Neovim](https://img.shields.io/badge/Neovim-0.8+-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![License](https://img.shields.io/badge/License-MIT-B48EAD?style=for-the-badge&logo=opensourceinitiative&logoColor=white)](https://opensource.org/licenses/MIT)
[![GitHub Release](https://img.shields.io/github/release/hyperb1iss/silkcircuit-nvim.svg?style=for-the-badge&logo=github&logoColor=white&color=e135ff)](https://github.com/hyperb1iss/silkcircuit-nvim/releases)
[![CI](https://img.shields.io/github/actions/workflow/status/hyperb1iss/silkcircuit-nvim/ci.yml?style=for-the-badge&logo=github-actions&logoColor=white)](https://github.com/hyperb1iss/silkcircuit-nvim/actions)

_Where silk meets circuit: A vibrant femme cyberpunk theme with neon purple glow and electric aesthetics_ 💜⚡

[Installation](#-installation) • [Configuration](#-configuration) • [Features](#-features) • [Screenshots](#-screenshots) • [Contributing](#-contributing)

</div>

<div align="center">
  <img src="https://raw.githubusercontent.com/hyperb1iss/silkcircuit-nvim/main/assets/silkcircuit-preview.png" alt="SilkCircuit Theme Preview" width="90%">
</div>

## 🌟 Overview

SilkCircuit is an evolution of femme cyberpunk aesthetics, blending the softness of silk with the electric energy of circuits. This meticulously crafted Neovim theme features neon purple glows, electric pinks, and synthwave vibes that create a stunning coding environment while maintaining excellent readability and semantic highlighting.

**Originally inspired by the VSCode Lilac theme** by [Kush](https://marketplace.visualstudio.com/items?itemName=MHMKE.lilac) - evolved into its own unique aesthetic with maximum cyberpunk drama and femme energy.

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
  "hyperb1iss/silkcircuit-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("silkcircuit").setup()
    vim.cmd.colorscheme("silkcircuit")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "hyperb1iss/silkcircuit-nvim",
  config = function()
    require("silkcircuit").setup()
    vim.cmd.colorscheme("silkcircuit")
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'hyperb1iss/silkcircuit-nvim'

" After plug#end()
colorscheme lilac
```

### AstroNvim Installation

SilkCircuit has **complete AstroNvim integration** with custom configs for enhanced cyberpunk vibes!

**Quick Setup:**

1. Copy the AstroNvim configs:

   ```bash
   # Copy plugin configurations
   cp extras/astronvim/plugins/*.lua ~/.config/nvim/lua/plugins/

   # Copy community config (optional)
   cp extras/astronvim/community.lua ~/.config/nvim/lua/
   ```

2. Restart Neovim and run `:Lazy sync`

**Manual Setup:**

```lua
-- plugins/lilac.lua
return {
  "hyperb1iss/silkcircuit-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("silkcircuit").setup({
      -- AstroNvim optimized settings included
    })
  end,
}
```

```lua
-- plugins/astroui.lua
return {
  "AstroNvim/astroui",
  opts = {
    colorscheme = "silkcircuit",
    -- Custom highlights and status config included
  },
}
```

**What you get:**

- 🌈 Custom statusline with neon mode indicators
- 📁 Neo-tree with cyberpunk styling
- 🔍 Telescope with glowing borders
- ⌨️ Which-Key popup theming
- 📊 Dashboard with purple/pink aesthetics
- 🌟 Complete LSP integration

See `extras/astronvim/README.md` for full setup guide and customization options.

### Local Installation

For development or testing from a local directory:

#### Using lazy.nvim

```lua
{
  dir = "~/dev/silkcircuit-nvim",  -- Your local path
  lazy = false,
  priority = 1000,
  config = function()
    require("silkcircuit").setup()
    vim.cmd.colorscheme("silkcircuit")
  end,
}
```

#### Using packer.nvim

```lua
use {
  "~/dev/silkcircuit-nvim",  -- Your local path
  config = function()
    require("silkcircuit").setup()
    vim.cmd.colorscheme("silkcircuit")
  end
}
```

#### Manual Installation

1. Clone to your local plugins directory:

   ```bash
   git clone https://github.com/hyperb1iss/silkcircuit-nvim.git \
     ~/.local/share/nvim/site/pack/themes/start/silkcircuit-nvim
   ```

2. Or symlink your development directory:

   ```bash
   ln -s ~/dev/silkcircuit-nvim \
     ~/.local/share/nvim/site/pack/themes/start/silkcircuit-nvim
   ```

3. Add to your Neovim config:

   ```lua
   vim.cmd.colorscheme("silkcircuit")
   ```

## 🚀 Quick Start

After installation, add this minimal config to get started:

```lua
-- Enable 24-bit colors
vim.opt.termguicolors = true

-- Setup SilkCircuit theme
require("silkcircuit").setup({
  -- Leave empty for defaults or see Configuration section
})

-- Apply the colorscheme
vim.cmd.colorscheme("silkcircuit")
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

SilkCircuit offers extensive customization options to match your preferences:

### Basic Setup

```lua
require("silkcircuit").setup({
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
require("silkcircuit").setup({
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
require("silkcircuit").setup({
  transparent = true,
})
```

### Performance Optimization

Compile the theme for faster startup:

```lua
require("silkcircuit").compile()
```

### Lualine Integration

SilkCircuit includes a custom Lualine theme with neon mode indicators and synthwave aesthetics.

**Basic setup:**

```lua
require('lualine').setup {
  options = {
    theme = 'lilac',
    globalstatus = true, -- Single statusline
  }
}
```

**Epic cyberpunk setup:**
Copy `extras/lualine-config.lua` to your config and modify as needed. This includes:

- Animated mode indicators with glow effects
- Custom separators and icons
- LSP status with client names
- Git integration with branch icons
- Macro recording indicator
- Time display (because cyberpunk)
- Neon color transitions between modes

```lua
-- Load the epic config
require('lualine').setup(require('path.to.extras.lualine-config'))
```

### Warp Terminal

For the best experience with Warp terminal:

1. Copy `extras/warp.yaml` to `~/.warp/themes/lilac.yaml`
2. In Warp settings, go to Appearance > Themes
3. Select "SilkCircuit" from custom themes

This provides matching colors and UI elements for a cohesive experience.

### Rainbow Brackets

SilkCircuit supports rainbow bracket plugins that color-match your bracket pairs:

```lua
-- For rainbow-delimiters.nvim
require('rainbow-delimiters.setup').setup {
  -- Your config
}

-- For nvim-ts-rainbow
require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    -- Use SilkCircuit colors
  }
}
```

The theme provides neon colors for each nesting level, making it easy to match brackets in complex code.

## 🎯 Plugin Support

SilkCircuit includes carefully designed themes for:

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
git clone https://github.com/hyperb1iss/silkcircuit-nvim.git
cd silkcircuit-nvim

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
silkcircuit-nvim/
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
3. Search [existing issues](https://github.com/hyperb1iss/silkcircuit-nvim/issues)
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
git clone https://github.com/hyperb1iss/silkcircuit-nvim.git ~/dev/silkcircuit-nvim
cd ~/dev/silkcircuit-nvim

# Install dev dependencies
make setup

# Run tests and linting
make test
make lint

# Use your local version in Neovim
# Add to lazy.nvim: { dir = "~/dev/silkcircuit-nvim" }
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
