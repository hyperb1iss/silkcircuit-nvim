# Introduction

SilkCircuit pumps maximum visual voltage through your Neovim. Electric purples 💜, blazing pinks 🌸, and neon cyans 💎 create a coding environment that's both striking and readable.

## Why SilkCircuit?

### Electric Color System

Every color in SilkCircuit has semantic meaning. Keywords are always purple, functions are always cyan, strings are always pink. Once you learn the language, you can read any codebase faster.

### Performance First

Theme loads in under 5ms with bytecode compilation. No lag, no delays—just instant electric energy.

### Accessibility Built-In

All color combinations meet WCAG AA standards (4.5:1 contrast ratio minimum). Code longer without eye strain.

### 5 Variants for Every Mood

| Variant | Style | Best For |
|---------|-------|----------|
| **Neon** | 100% intensity | Maximum vibrancy |
| **Vibrant** | 85% intensity | Balanced energy |
| **Soft** | 70% intensity | Extended sessions |
| **Glow** | Ultra-dark | Low-light coding |
| **Dawn** | Light theme | Daytime & bright rooms |

## Features at a Glance

- 🎨 **40+ Plugin Integrations** — Auto-detected and themed
- 🏎️ **<5ms Load Time** — Bytecode compiled
- 👁️ **WCAG AA Compliant** — Validated contrast ratios
- 💾 **Persistent Preferences** — Settings survive across sessions
- 🔮 **Semantic Colors** — Consistent meanings everywhere

## Quick Start

```lua
-- lazy.nvim
{
  "hyperb1iss/silkcircuit-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("silkcircuit")
  end,
}
```

Then switch variants with `:SilkCircuit dawn` or any other variant name.

## Next Steps

- [Installation Guide](/guide/installation) — Get SilkCircuit running
- [Configuration](/guide/configuration) — Customize your experience
- [Theme Variants](/variants/) — Explore all 5 variants
- [Design System](/design/) — Understand the color philosophy
