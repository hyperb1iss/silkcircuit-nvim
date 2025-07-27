# 🌈 SilkCircuit VSCode Themes

Electric dreams for Visual Studio Code. Experience the full SilkCircuit aesthetic with neon purples, blazing pinks, and glowing cyan accents.

## 🎨 Available Themes

### 🌟 SilkCircuit Neon

Maximum intensity electric colors - the original SilkCircuit experience

- Pure saturated neon colors (#e135ff, #ff00ff, #80ffea)
- Maximum contrast and vibrancy
- Perfect for those who love bold aesthetics

### ⚡ SilkCircuit Vibrant

Slightly toned down for extended coding sessions

- 85% intensity of neon variant
- Colors blended with gray for reduced saturation
- Great balance of style and comfort

### 🌸 SilkCircuit Soft

Gentle on the eyes for all-day coding

- 70% intensity with softer colors
- Comfortable for extended use
- Maintains the SilkCircuit aesthetic

### ✨ SilkCircuit Glow

Enhanced version with special brightness effects

- 30% brighter syntax elements
- Enhanced function and string highlighting
- Maximum visual impact (simulated glow via brightness)

## 📁 Files

- `silkcircuit-neon.json` - Main theme file
- `silkcircuit-vibrant.json` - 85% intensity variant
- `silkcircuit-soft.json` - 70% intensity variant
- `silkcircuit-glow.json` - Brightened variant
- `package.json` - VSCode extension manifest
- `README.md` - This file

## 🚀 Installation Options

### Option 1: VSCode Extension (Recommended)

If published to marketplace:

1. Search "SilkCircuit Theme" in VSCode Extensions
2. Install and select theme

### Option 2: Manual Installation

1. Copy the entire `vscode/` folder to VSCode extensions directory:
   - **Windows**: `%USERPROFILE%\\.vscode\\extensions\\silkcircuit-theme\\`
   - **macOS**: `~/.vscode/extensions/silkcircuit-theme/`
   - **Linux**: `~/.vscode/extensions/silkcircuit-theme/`
2. Restart VSCode
3. `Ctrl+Shift+P` → "Preferences: Color Theme"
4. Select your preferred SilkCircuit variant

### Option 3: Individual Theme Files

Just want one theme? Copy the JSON file to:

- **Windows**: `%APPDATA%\\Code\\User\\themes\\`
- **macOS**: `~/Library/Application Support/Code/User/themes/`
- **Linux**: `~/.config/Code/User/themes/`

## 🎯 True Glow Effects (Advanced)

VSCode themes are static JSON - no real glow effects possible. For actual glowing text:

### Using Custom CSS Extension

1. Install "Custom CSS and JS Loader" extension
2. Add to settings.json:

```json
{
  "vscode_custom_css.imports": ["file:///path/to/silkcircuit-glow.css"]
}
```

3. Create `silkcircuit-glow.css`:

```css
/* Functions with glow effect */
.token.function {
  text-shadow: 0 0 5px #80ffea, 0 0 10px #80ffea, 0 0 15px #80ffea;
}

/* Keywords with purple glow */
.token.keyword {
  text-shadow: 0 0 5px #e135ff, 0 0 10px #e135ff;
}

/* Strings with pink glow */
.token.string {
  text-shadow: 0 0 5px #ff99ff, 0 0 10px #ff99ff;
}
```

4. Reload VSCode with custom CSS enabled

### Creating Your Own Extension

For full control, create a VSCode extension that:

1. Applies the theme
2. Injects custom CSS for glow effects
3. Adds animation capabilities

## 🌈 Color Palette

| Element | Neon | Vibrant | Soft | Glow |
|---------|------|---------|------|------|
| Keywords | `#e135ff` | `#bc4dd9` | `#a766b3` | `#ec69ff` |
| Strings | `#ff99ff` | `#d9b3d9` | `#c199b3` | `#ffb3ff` |
| Functions | `#80ffea` | `#80d9c7` | `#80b3a1` | `#9dffed` |
| Comments | `#9580ff` | `#9180d9` | `#8d80b3` | `#a999ff` |

## 📝 Technical Notes

- **Theme Format**: VSCode Color Theme JSON v1.0
- **Base**: `vs-dark` UI theme
- **Scope**: Comprehensive syntax highlighting
- **Languages**: Optimized for JS/TS, Python, Rust, Go, CSS, JSON, Markdown
- **WCAG**: AA compliant contrast ratios

## 🔗 Related Projects

- **Neovim**: [silkcircuit-nvim](https://github.com/hyperb1iss/silkcircuit-nvim)
- **Terminal**: Included in main repo extras
- **Git**: Electric git configuration

---

*Pure electric energy for your code editor*
