# 🌸 Lilac Theme - AstroNvim Integration

Complete guide for integrating the Lilac theme with AstroNvim for maximum femme cyberpunk vibes!

## 🚀 Quick Setup

### Option 1: Plugin-based Setup (Recommended)

1. **Add the theme plugin** - Copy `plugins/lilac.lua` to your AstroNvim config:

   ```bash
   cp extras/astronvim/plugins/lilac.lua ~/.config/nvim/lua/plugins/
   ```

2. **Configure AstroUI** - Copy `plugins/astroui.lua` to your config:

   ```bash
   cp extras/astronvim/plugins/astroui.lua ~/.config/nvim/lua/plugins/
   ```

3. **Restart Neovim** and run `:Lazy sync`

### Option 2: Community Config

1. **Update community.lua** - Add Lilac to your community imports:

   ```bash
   cp extras/astronvim/community.lua ~/.config/nvim/lua/
   ```

2. **Restart Neovim** and run `:Lazy sync`

## 🎨 What You Get

### Epic Visual Features

- **Neon mode indicators** in the statusline
- **Synthwave colors** throughout the interface
- **Custom dashboard** with purple/pink ASCII art
- **Enhanced Neo-tree** with cyberpunk file icons
- **Glowing Telescope** borders and selections
- **Rainbow brackets** with theme colors
- **LSP diagnostics** with neon highlights

### AstroNvim-Specific Integrations

- ✨ **AstroUI** integration with custom highlights
- 🌈 **StatusLine** with Lilac color scheme and neon mode indicators
- 📁 **Neo-tree** with femme cyberpunk styling
- 🔍 **Telescope** with neon borders
- ⌨️  **Which-Key** popup styling
- 📊 **Dashboard/Alpha** custom colors
- 🌟 **LSP** and diagnostic styling

## 🚀 Statusline Options

### Option 1: AstroNvim Default (Recommended)

Uses AstroNvim's built-in Lualine integration with Lilac colors:

- Automatic theme integration
- Works with all AstroNvim features
- Neon mode indicators
- Git and LSP integration

Just use the default `astroui.lua` config and you're set!

### Option 2: MAXIMUM EFFECT Mode

For maximum cyberpunk drama, use our custom Lualine config:

```bash
# Copy the epic config
cp extras/astronvim/plugins/lualine-max-effect.lua ~/.config/nvim/lua/plugins/
```

This gives you:

- ⏺ **Macro recording** indicator
- 🕐 **Clock display** (cyberpunk essential)
- 🔍 **Search count** with highlighting
- 📊 **Custom progress** formatting
- 🌈 **Animated separators**
- 💜 **Maximum neon glow** effects

**Note**: This replaces AstroNvim's default statusline entirely.

## 🛠️ Customization

### Custom Highlights

Add to your `astroui.lua` configuration:

```lua
highlights = {
  lilac = {
    -- Your custom highlights here
    ["@variable"] = { fg = "#ff79c6", italic = true },
    ["@function"] = { fg = "#e135ff", bold = true },
    -- etc...
  },
}
```

### Statusline Customization

The theme automatically configures Lualine with:

- Mode-specific neon colors
- Git integration with branch icons
- LSP status indicators
- Custom separators

### Transparency Support

Enable transparent background:

```lua
-- In your lilac plugin config
require("lilac").setup({
  transparent = true,
  -- other options...
})
```

## 🎯 Plugin Integration

### Telescope Enhancement

```lua
-- Custom Telescope styling is automatically applied
-- Includes neon borders and selection highlights
```

### Neo-tree Cyberpunk Vibes

```lua
-- File tree with:
-- - Purple directory icons
-- - Pink file icons
-- - Neon git status indicators
-- - Dark background with purple accents
```

### Rainbow Delimiters

```lua
-- Bracket pairs in rotating neon colors:
-- Pink → Purple → Cyan → Yellow → Orange → Green
```

## 🔧 Troubleshooting

### Theme Not Loading

1. Make sure `colorscheme = "lilac"` is set in `astroui.lua`
2. Check that the plugin is properly installed with `:Lazy`
3. Restart Neovim completely

### Colors Look Wrong

1. Ensure `termguicolors` is enabled (should be automatic in AstroNvim)
2. Check your terminal supports 24-bit colors
3. Try the Warp terminal theme for perfect color matching

### Statusline Issues

1. Make sure Lualine is using the "lilac" theme
2. Check that all dependencies are installed
3. The theme should auto-configure Lualine

## 📱 Terminal Integration

For the complete experience, use the matching terminal themes:

- **Warp**: Copy `extras/warp.yaml` to `~/.warp/themes/lilac.yaml`
- **Alacritty**: Use `extras/alacritty.yml`
- **Kitty**: Use `extras/kitty.conf`

## 🌟 Pro Tips

1. **Use a Nerd Font** for proper icon display
2. **Enable ligatures** in your terminal for programming symbols
3. **Set up transparent terminal** for layered effects
4. **Use matching terminal theme** for seamless integration
5. **Configure git symbols** to match the theme aesthetic

## 🎮 Keybindings

AstroNvim's default keybindings work perfectly with Lilac:

- `<leader>ft` - Telescope file finder (with neon borders)
- `<leader>e` - Neo-tree toggle (cyberpunk file tree)
- `<leader>fh` - Telescope help (glowing interface)

Enjoy your new femme cyberpunk AstroNvim setup! 💜✨
