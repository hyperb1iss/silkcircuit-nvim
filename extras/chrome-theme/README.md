# SilkCircuit Chrome Theme

A vibrant Chrome theme featuring neon purples, electric pinks, and glowing cyan accents to match your SilkCircuit Neovim experience.

## Installation

### Method 1: Developer Mode (Recommended)

1. Open Chrome and navigate to `chrome://extensions/`
2. Enable "Developer mode" in the top right
3. Click "Load unpacked"
4. Select the `silkcircuit-nvim/extras/chrome-theme` directory
5. The theme will be applied immediately

### Method 2: Direct Installation

1. Open Chrome and navigate to `chrome://extensions/`
2. Drag and drop the `chrome-theme` folder onto the page
3. Click "Add theme" when prompted

## Color Scheme

The theme uses SilkCircuit's signature neon palette:

- **Frame**: Deep purple background (#12101a)
- **Toolbar**: Matching dark purple
- **Tabs**: Light text on dark background
- **Accents**: Electric purple tints
- **Links**: Glowing cyan (#80ffea)
- **Headers**: Pure magenta (#ff00ff)

## Customization

To modify the colors, edit `manifest.json`:

- `frame`: Browser frame background
- `toolbar`: Toolbar and bookmark bar
- `tab_text`: Active tab text color
- `ntp_background`: New tab page background
- `ntp_link`: New tab page link colors

## Compatibility

- Chrome 88+
- Chromium-based browsers (Edge, Brave, etc.)

## Advanced Theming

### DevTools Theme

To theme Chrome DevTools with SilkCircuit colors:

1. Install a DevTools theme extension like [DevTools Theme: Zero Dark Matrix](https://chrome.google.com/webstore/detail/devtools-theme-zero-dark/bomhdjeadceaggdgfoefmpeafkjhegbo)
2. Open DevTools → Settings → Experiments
3. Enable "Allow extensions to load custom stylesheets"
4. Load the `devtools-theme.css` file through the extension

### Chrome Internal Pages

To theme Chrome's settings, extensions, and other internal pages:

1. Install [Stylus](https://chrome.google.com/webstore/detail/stylus/clngdbkpkpeebahjckkjfobafhncgmne) extension
2. Click the Stylus icon → "Manage"
3. Create new style → Import the `chrome-pages.css` file
4. Add URL patterns:
   - `chrome://*`
   - `chrome-extension://*`

### Complete Integration

For the full SilkCircuit experience across Chrome:

1. **Base theme**: Load via chrome://extensions/
2. **DevTools**: Apply via DevTools theme extension
3. **Internal pages**: Apply via Stylus or similar

This gives you consistent neon aesthetics throughout your entire browser!

## License

MIT - Same as SilkCircuit Neovim theme
