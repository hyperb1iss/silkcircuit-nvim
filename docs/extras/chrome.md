# Chrome Theme

SilkCircuit for Google Chrome.

## Overview

Bring SilkCircuit's vibrant colors to your browser with a custom Chrome theme.

## Installation

### Developer Mode

1. Open Chrome and navigate to `chrome://extensions/`
2. Enable "Developer mode" (toggle in top right)
3. Click "Load unpacked"
4. Select the `extras/chrome-theme` directory

### Drag & Drop

1. Open `chrome://extensions/`
2. Drag the `extras/chrome-theme` folder onto the page

### Pre-packaged

A pre-built `.zip` is available:

```bash
# Extract and install
unzip extras/chrome-theme/silkcircuit-chrome-theme-1.0.2.zip
# Then use Developer Mode installation above
```

## Features

### Browser Frame

| Element | Color |
|---------|-------|
| Frame | Neon Purple |
| Toolbar | Dark background |
| Tab background | Highlight color |
| Active tab | Lighter accent |

### DevTools

The theme includes custom DevTools styling:

- **Console** — SilkCircuit-styled output
- **Elements** — Syntax highlighting matching Neovim
- **Sources** — Code editor colors

## Files

```
extras/chrome-theme/
├── manifest.json           # Chrome extension manifest
├── chrome-pages.css        # New tab page styling
├── devtools-theme.css      # Developer tools styling
├── README.md
└── silkcircuit-chrome-theme-1.0.2.zip
```

## DevTools Customization

The DevTools CSS includes:

```css
/* Console colors */
.console-message-text {
  color: #f8f8f2;
}

/* Error messages */
.console-error-level .console-message-text {
  color: #ff6363;
}

/* Network panel */
.network-log-grid {
  background-color: #12101a;
}
```

## Manifest Structure

```json
{
  "manifest_version": 3,
  "name": "SilkCircuit",
  "version": "1.0.2",
  "theme": {
    "colors": {
      "frame": [18, 16, 26],
      "toolbar": [26, 22, 42],
      "tab_background_text": [248, 248, 242],
      "ntp_background": [18, 16, 26],
      "ntp_text": [248, 248, 242]
    },
    "tints": {
      "buttons": [0.85, 0.5, 0.75]
    }
  }
}
```

## Limitations

- Chrome themes have limited customization options
- Some UI elements cannot be themed
- DevTools styling requires manual CSS injection

## Updating

To update the theme:

1. Make changes to theme files
2. Reload the extension in `chrome://extensions/`
3. Or re-package and reinstall

## Troubleshooting

### Theme not applying

1. Verify the extension is enabled
2. Restart Chrome
3. Check for conflicting themes

### DevTools colors missing

DevTools styling requires additional setup. The CSS file provides a starting point for customization.
