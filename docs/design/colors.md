# Color System

SilkCircuit's color system provides consistent, accessible colors across all five variants.

## Variant Color Palettes

### Neon (100% intensity)

**Backgrounds:**

| Element | Hex | Usage |
|---------|-----|-------|
| Base | `#12101a` | Editor background |
| Dark | `#0a0812` | Sidebar, panels |
| Highlight | `#1a162a` | Popups, menus |

**Primary Colors:**

| Color | Hex | Usage |
|-------|-----|-------|
| Purple | `#e135ff` | Keywords, control flow |
| Cyan | `#80ffea` | Functions, methods |
| Pink | `#ff00ff` | Tags, booleans |
| Pink Soft | `#ff99ff` | Strings |
| Coral | `#ff6ac1` | Numbers, constants |
| Yellow | `#f1fa8c` | Classes, types |

### Vibrant (85% intensity)

**Backgrounds:**

| Element | Hex | Usage |
|---------|-----|-------|
| Base | `#0f0c1a` | Editor background |
| Dark | `#08060f` | Sidebar, panels |
| Highlight | `#0a0614` | Popups, menus |

**Primary Colors:**

| Color | Hex | Usage |
|-------|-----|-------|
| Purple | `#ff00ff` | Keywords, control flow |
| Cyan | `#00ffcc` | Functions, methods |
| Pink | `#ff00cc` | Tags, booleans |
| Pink Soft | `#ff99ff` | Strings |
| Coral | `#F78C6C` | Numbers, constants |
| Yellow | `#ffcc00` | Classes, types |

### Soft (70% intensity)

**Backgrounds:**

| Element | Hex | Usage |
|---------|-----|-------|
| Base | `#1a1626` | Editor background |
| Dark | `#141220` | Sidebar, panels |
| Highlight | `#3e3456` | Popups, menus |

**Primary Colors:**

| Color | Hex | Usage |
|-------|-----|-------|
| Purple | `#e892ff` | Keywords, control flow |
| Cyan | `#99ffee` | Functions, methods |
| Pink | `#ff99ff` | Tags, booleans |
| Pink Soft | `#ffc2ff` | Strings |
| Coral | `#ff99dd` | Numbers, constants |
| Yellow | `#ffe699` | Classes, types |

### Glow (Maximum contrast)

**Backgrounds:**

| Element | Hex | Usage |
|---------|-----|-------|
| Base | `#0a0816` | Editor background |
| Dark | `#000000` | Sidebar, panels |
| Highlight | `#1a0033` | Popups, menus |

**Primary Colors:**

| Color | Hex | Usage |
|-------|-----|-------|
| Purple | `#ff00ff` | Keywords, control flow |
| Cyan | `#00ffff` | Functions, methods |
| Pink | `#ff00ff` | Tags, booleans |
| Pink Soft | `#ff99ff` | Strings |
| Coral | `#ff66ff` | Numbers, constants |
| Yellow | `#ffff00` | Classes, types |

### Dawn (Light theme)

**Backgrounds:**

| Element | Hex | Usage |
|---------|-----|-------|
| Base | `#faf8ff` | Editor background |
| Dark | `#f1ecff` | Sidebar, panels |
| Highlight | `#e8e0ff` | Popups, menus |

**Primary Colors:**

| Color | Hex | Usage |
|-------|-----|-------|
| Purple | `#7e2bd5` | Keywords, control flow |
| Cyan | `#007f8e` | Functions, methods |
| Pink | `#b40077` | Tags, booleans |
| Pink Soft | `#9c4a88` | Strings |
| Coral | `#c74a8c` | Numbers, constants |
| Yellow | `#a88600` | Classes, types |

## Universal Supporting Colors

These colors maintain semantic meaning across all variants:

### Success

| Variant | Hex | Usage |
|---------|-----|-------|
| Neon/Vibrant | `#50fa7b` | Git add, success states |
| Soft | `#66ff99` | Git add, success states |
| Glow | `#00ff00` | Git add, success states |
| Dawn | `#2d8659` | Git add, success states |

### Warning

| Variant | Hex | Usage |
|---------|-----|-------|
| Neon/Vibrant | `#f1fa8c` | Caution, modified |
| Soft | `#ffe699` | Caution, modified |
| Glow | `#ffff00` | Caution, modified |
| Dawn | `#a88600` | Caution, modified |

### Error

| Variant | Hex | Usage |
|---------|-----|-------|
| Neon/Vibrant | `#ff6363` | Errors, deletions |
| Soft | `#ff6677` | Errors, deletions |
| Glow | `#ff0066` | Errors, deletions |
| Dawn | `#c1272d` | Errors, deletions |

## Interactive States

| State | Behavior |
|-------|----------|
| **Hover** | Add 10% brightness to base color |
| **Active** | Invert foreground/background |
| **Focus** | Add cyan glow (`0 0 0 2px #80ffea40`) |
| **Disabled** | 50% opacity |
| **Selection** | Variant-specific with transparency |

## CSS Variables

```css
/* Dark theme (Neon variant) */
:root {
  --sc-purple: #e135ff;
  --sc-cyan: #80ffea;
  --sc-pink: #ff00ff;
  --sc-pink-soft: #ff99ff;
  --sc-coral: #ff6ac1;
  --sc-yellow: #f1fa8c;
  --sc-green: #50fa7b;
  --sc-red: #ff6363;
  --sc-bg: #12101a;
  --sc-bg-dark: #0a0812;
  --sc-bg-highlight: #1a162a;
  --sc-fg: #f8f8f2;
}

/* Light theme (Dawn variant) */
:root.dawn {
  --sc-purple: #7e2bd5;
  --sc-cyan: #007f8e;
  --sc-pink: #b40077;
  --sc-pink-soft: #9c4a88;
  --sc-coral: #c74a8c;
  --sc-yellow: #a88600;
  --sc-green: #2d8659;
  --sc-red: #c1272d;
  --sc-bg: #faf8ff;
  --sc-bg-dark: #f1ecff;
  --sc-bg-highlight: #e8e0ff;
  --sc-fg: #2b2540;
}
```
