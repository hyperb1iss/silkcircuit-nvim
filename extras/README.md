# 🌈 SilkCircuit Extras

Complete your neon-lit development environment with these additional configurations that perfectly complement the SilkCircuit theme.

## 📁 What's Included

### 🚀 AstroNvim Integration (`astronvim/`)

Complete AstroNvim setup with SilkCircuit styling:

- **Full AstroUI configuration** with neon-enhanced components
- **Custom Lualine theme** with electric visual elements
- **Neo-tree styling** with vibrant file icons
- **Community integration** setup files
- **Maximum effect mode** for the boldest experience

**Setup:**

```bash
# Copy all AstroNvim configs
cp -r extras/astronvim/* ~/.config/nvim/lua/
```

### ⚡ Git Configuration (`gitconfig`)

Transform your git experience with electric colors:

- **Neon magenta** commit hashes and important elements
- **Electric cyan** for dates and metadata
- **Bright yellow** for branch information
- **Matching colors** across `git log`, `git status`, and `git diff`
- **Delta integration** with SilkCircuit color palette

**Setup:**

```bash
# Option 1: Include in your existing .gitconfig
echo "[include]" >> ~/.gitconfig
echo "    path = $(pwd)/extras/gitconfig" >> ~/.gitconfig

# Option 2: Copy the relevant sections manually
cat extras/gitconfig >> ~/.gitconfig
```

### 🖥️ Terminal Themes

Native theme files for popular terminal emulators:

- **Alacritty** (`alacritty.yml`) - Fast GPU-accelerated terminal
- **Kitty** (`kitty.conf`) - Feature-rich terminal emulator
- **Warp** (`warp.yaml`) - Modern terminal with AI features
- **Windows Terminal** (`windows-terminal.json`) - Windows integrated terminal

**Setup:**

```bash
# Alacritty
cp extras/alacritty.yml ~/.config/alacritty/themes/silkcircuit.yml

# Kitty
cp extras/kitty.conf ~/.config/kitty/themes/silkcircuit.conf

# Warp
cp extras/warp.yaml ~/.warp/themes/silkcircuit.yaml

# Windows Terminal - import JSON manually in settings
```

### 🎨 Enhanced Tools

Additional tool configurations for the complete experience:

- **Lualine config** (`lualine-config.lua`) - Standalone statusline setup
- **FZF integration** (`fzf.sh`) - Fuzzy finder with SilkCircuit colors

## 🎨 Color Palette Reference

All configurations use these colors to maintain consistency:

| ANSI | Hex | Usage |
|------|-----|-------|
| `201` | `#ff00ff` | Neon magenta - Primary accents |
| `213` | `#ff79c6` | Bright magenta - Secondary elements |
| `51` | `#00ffff` | Electric cyan - Metadata |
| `220` | `#ffdd00` | Bright yellow - Branch info |
| `149` | `#50fa7b` | Green - Success/additions |
| `197` | `#ff5555` | Red - Errors/deletions |

## 🎯 Quick Setup

Get the full SilkCircuit experience instantly:

```bash
# Clone the theme
git clone https://github.com/hyperb1iss/silkcircuit-nvim.git
cd silkcircuit-nvim

# Install git colors
cat extras/gitconfig >> ~/.gitconfig

# Copy terminal theme (choose your terminal)
cp extras/kitty.conf ~/.config/kitty/themes/silkcircuit.conf
# OR
cp extras/alacritty.yml ~/.config/alacritty/themes/silkcircuit.yml

# For AstroNvim users
cp -r extras/astronvim/* ~/.config/nvim/lua/
```

## 🌟 Pro Tips

1. **Terminal Setup**: Enable true color support in your terminal for best results
2. **Git Aliases**: Use `git lg` for the beautiful one-line log format
3. **AstroNvim**: Try both default and "maximum effect" Lualine configs
4. **Consistency**: Use matching colors across all tools for cohesive aesthetic

---

*Experience the full SilkCircuit aesthetic across your entire development workflow.*
