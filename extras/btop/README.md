# SilkCircuit btop Theme

Electric system monitoring with vibrant purples, blazing pinks, and neon accents.

## Installation

1. Copy theme files to btop config directory:

```bash
# Linux/macOS
cp silkcircuit_*.theme ~/.config/btop/themes/

# Or create a symlink for automatic updates
ln -sf "$(pwd)/silkcircuit_*.theme" ~/.config/btop/themes/
```

2. Open btop and press `Esc` to open menu
3. Select `Options` → `Color theme`
4. Choose your preferred SilkCircuit variant

## Variants

### Neon (Default)

The original SilkCircuit experience with vibrant electric colors.

### Vibrant

Pure, saturated neon colors for maximum visual impact.

### Soft

Muted tones for comfortable extended monitoring sessions.

### Glow

Ultra-dark backgrounds with pure neon accents for OLED displays.

## Color Scheme

- **CPU Box**: Electric purple
- **Memory Box**: Neon cyan
- **Network Box**: Hot pink
- **Process Box**: Bright green
- **Graphs**: Smooth gradients between theme colors
- **Selected Items**: High contrast with pink/purple highlighting

## Customization

To modify colors, edit the theme files directly. Each color uses hex format:

```bash
theme[main_bg]="#12101a"  # Background color
theme[title]="#ff00ff"    # Box titles
theme[hi_fg]="#80ffea"    # Keyboard shortcuts
```

## Screenshots

The themes are designed to make system monitoring visually engaging while maintaining readability. CPU graphs flow from purple through pink to cyan, while network activity pulses with pink and cyan gradients.

## License

MIT - Same as SilkCircuit Neovim theme
