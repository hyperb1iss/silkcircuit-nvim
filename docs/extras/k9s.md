# K9s Theme

Kubernetes dashboard with SilkCircuit style.

## Overview

K9s is a terminal-based Kubernetes dashboard. SilkCircuit provides themes for all five variants.

## Installation

```bash
# Create skins directory if needed
mkdir -p ~/.config/k9s/skins

# Copy all variants
cp extras/k9s/silkcircuit*.yaml ~/.config/k9s/skins/

# Or copy a specific variant
cp extras/k9s/silkcircuit.yaml ~/.config/k9s/skins/
```

## Available Themes

| File | Variant |
|------|---------|
| `silkcircuit.yaml` | Neon (default) |
| `silkcircuit-vibrant.yaml` | Vibrant |
| `silkcircuit-soft.yaml` | Soft |
| `silkcircuit-glow.yaml` | Glow |
| `silkcircuit-dawn.yaml` | Dawn (light) |

## Activation

Edit your K9s config `~/.config/k9s/config.yaml`:

```yaml
k9s:
  ui:
    skin: silkcircuit
    # Or for other variants:
    # skin: silkcircuit-vibrant
    # skin: silkcircuit-soft
    # skin: silkcircuit-glow
    # skin: silkcircuit-dawn
```

Or press `:skin` in K9s and type the skin name.

## Color Mapping

| Element | Color |
|---------|-------|
| Headers | Electric Purple |
| Selected row | Cyan highlight |
| Running pods | Green |
| Pending pods | Yellow |
| Failed pods | Red |
| Info text | Foreground |
| Help menu | Purple accents |

## Kubernetes Status Colors

| Status | Color | Meaning |
|--------|-------|---------|
| Running | Green | Healthy, operational |
| Pending | Yellow | Starting or waiting |
| Succeeded | Cyan | Completed successfully |
| Failed | Red | Error state |
| Unknown | Gray | Status unavailable |

## Screenshots

### Neon Variant

Maximum vibrancy for Kubernetes management.

### Dawn Variant

Light theme for bright environments and daytime use.

## Files

```
extras/k9s/
├── README.md
├── silkcircuit.yaml          # Neon (default)
├── silkcircuit-vibrant.yaml
├── silkcircuit-soft.yaml
├── silkcircuit-glow.yaml
└── silkcircuit-dawn.yaml
```

## Customization

Skin files use YAML format:

```yaml
k9s:
  body:
    fgColor: "#f8f8f2"
    bgColor: "#12101a"
    logoColor: "#e135ff"
  frame:
    border:
      fgColor: "#80ffea"
      focusColor: "#e135ff"
    menu:
      fgColor: "#f8f8f2"
      keyColor: "#e135ff"
      numKeyColor: "#ff79c6"
  info:
    fgColor: "#f8f8f2"
    sectionColor: "#80ffea"
```

## Troubleshooting

### Skin not loading

1. Verify file location: `ls ~/.config/k9s/skins/`
2. Check config syntax: `cat ~/.config/k9s/config.yaml`
3. Restart K9s after config changes

### Colors look different

K9s uses terminal colors. Ensure your terminal supports true color and has a compatible theme installed.
