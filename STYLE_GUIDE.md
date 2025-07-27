# SilkCircuit Style Guide

> A comprehensive guide to the visual language and design principles of SilkCircuit

## Core Philosophy

SilkCircuit embodies the aesthetic of a neon-lit digital world. Think electric meets elegant - where vibrant colors guide your code journey without overwhelming your senses.

## Color Palette

### Primary Colors

**Purple** (`#c792ea`) - The heart of SilkCircuit

- Use for: Keywords, functions, primary UI elements
- Represents: Power, control flow, importance

**Pink** (`#ff79c6`) - The accent that pops

- Use for: Strings, important values, highlights
- Represents: Data, content, user focus

**Cyan** (`#7fdbca`) - The guide

- Use for: Properties, parameters, navigation
- Represents: Structure, relationships, paths

### Supporting Colors

**Coral** (`#f78c6c`) - The warmth

- Use for: Numbers, special values
- Represents: Precision, constants

**Yellow** (`#ffcb6b`) - The attention

- Use for: Warnings, classes, types
- Represents: Caution, definition

**Green** (`#addb67`) - The positive

- Use for: Success, additions, strings in some contexts
- Represents: Growth, confirmation

### Background Hierarchy

1. **Base** (`#1a1a2e`) - Main editor background
2. **Highlight** (`#252545`) - Current line, selections
3. **Float** (`#2d2d4d`) - Popups, floating windows
4. **Dark** (`#16161e`) - Sidebar, inactive areas

## Semantic Color Mapping

### Code Elements

```
Keywords       → Purple (bold)
Functions      → Purple (bold + italic)
Strings        → Pink (italic)
Properties     → Cyan
Numbers        → Coral
Booleans       → Pink
Types          → Yellow
Comments       → Purple Muted (italic)
Operators      → Cyan
```

### UI Elements

```
Borders        → Purple Muted (#5a4a78)
Selections     → Purple Dark with transparency
Cursor Line    → Subtle highlight (#252545)
Line Numbers   → Gray (inactive) / Light (active)
Git Added      → Green Bright
Git Modified   → Yellow
Git Deleted    → Red
```

## Design Principles

### 1. **Contrast is Queen**

- All color combinations meet WCAG AA standards
- Text must pop against backgrounds
- Use color to guide, not distract

### 2. **Hierarchy Through Color**

- Purple = Most important (keywords, functions)
- Pink = User content (strings, values)
- Cyan = Structure (properties, navigation)
- Muted = Less important (comments, inactive)

### 3. **Vibrancy with Purpose**

- Bright colors mark important elements
- Muted variants for secondary information
- Never use bright colors for large areas

### 4. **Consistency Across Contexts**

- A string is pink whether in code, JSON, or YAML
- Functions are always purple + bold + italic
- Maintain semantic meaning across languages

## Language-Specific Guidelines

### JavaScript/TypeScript

```javascript
// Keywords: purple
const function async await

// Functions: purple (bold+italic)
functionName()

// Strings: pink (italic)
"Hello, SilkCircuit!"

// Properties: cyan
object.property

// Types: yellow
interface TypeName
```

### YAML

```yaml
# Keys: cyan (bright)
key:
  # Values: pink
  value: "pink string"
  # Numbers: coral
  count: 42
  # Booleans: pink
  enabled: true
```

### Markdown

- **Headers**: Rainbow hierarchy (H1→Purple, H2→Pink, H3→Cyan...)
- **Links**: Cyan with underline
- **Code blocks**: Yellow background tint
- **Bold**: Keep original color, add bold
- **Italic**: Keep original color, add italic

## UI Component Styling

### Borders

- Default: Purple muted (`#5a4a78`)
- Active: Purple bright
- Error: Red
- Success: Green

### Buttons/Selections

- Hover: Add 10% brightness
- Active: Invert (bg→fg, fg→bg)
- Disabled: 50% opacity

### Status Indicators

- Info: Cyan
- Success: Green
- Warning: Yellow
- Error: Red
- Inactive: Gray

## Special Effects

### Glow Mode

When enabled, enhances:

- Functions get brighter purple
- Keywords become more vibrant
- Types get subtle cyan glow
- No background effects (avoid clutter)

### Transparency

- Selection: 30% opacity
- Inactive elements: 60% opacity
- Overlays: 90% opacity background

## Best Practices

### DO

- √ Use semantic colors consistently
- √ Maintain contrast ratios
- √ Use bold for emphasis
- √ Apply italic to strings and comments
- √ Use color to improve readability

### DON'T

- × Use more than 3 colors in one line
- × Apply bright backgrounds to text
- × Mix semantic meanings
- × Use pure white or black
- × Overwhelm with too many highlights

## Integration Guidelines

When creating new integrations:

1. **Study the plugin's UI structure**
2. **Map elements to semantic colors**
3. **Test contrast in all variants**
4. **Maintain consistency with core theme**
5. **Add only necessary highlights**

Example integration template:

```lua
local M = {}

function M.get(colors, opts)
  return {
    -- Primary elements use semantic colors
    PluginHeader = { fg = colors.purple, bold = true },
    PluginText = { fg = colors.fg },
    PluginSelection = { fg = colors.bg, bg = colors.purple },

    -- Status follows standard patterns
    PluginError = { fg = colors.error },
    PluginWarning = { fg = colors.warning },
    PluginInfo = { fg = colors.info },
  }
end

return M
```

## Accessibility

### Contrast Requirements

- Normal text: 4.5:1 minimum
- Large text: 3:1 minimum
- UI elements: 3:1 minimum

### Testing

Run `:SilkCircuitContrast` to validate all color pairs

### Variants

- **Neon**: Full vibrancy (100%)
- **Vibrant**: Slightly reduced (85%)
- **Soft**: Extended sessions (70%)

## Unicode Symbols

Preferred symbols for UI elements:

- `→` Navigation/continuation
- `▪` Bullet points
- `»` Prompts/tips
- `√` Success/checkmarks
- `×` Errors/close
- `!` Warnings
- `•` Neutral bullets
- `▶` Expanded
- `▼` Collapsed

---

_Remember: SilkCircuit is about enhancing focus through purposeful color, not creating a light show._
