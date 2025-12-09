# Slack Theme

Transform your Slack workspace with SilkCircuit colors.

## Overview

Slack allows custom sidebar themes using hex colors. SilkCircuit provides a four-color theme that brings electric energy to your workspace.

## Installation

1. Open Slack
2. Go to **Preferences** → **Themes**
3. Scroll to **Colors**
4. Click each color circle and paste the corresponding hex value

## Color Values

| Element | Hex | Description |
|---------|-----|-------------|
| Column BG | `#2E1B7A` | Deep purple navigation |
| Active Item | `#E135FF` | Electric purple highlight |
| Active Presence | `#50FA7B` | Neon green online indicator |
| Mentions | `#FF79C6` | Hot pink notifications |

## One-Line Theme

Copy this to quickly apply the theme:

```
#2E1B7A,#121212,#E135FF,#FFFFFF,#3E2990,#FFFFFF,#50FA7B,#FF79C6,#2E1B7A,#F8F8F2
```

## Visual Effect

| Element | Appearance |
|---------|-----------|
| Sidebar | Deep purple background |
| Selected channel | Electric purple highlight |
| Online users | Neon green dot |
| Unread mentions | Hot pink badge |
| Text | Light foreground |

## Pro Tips

1. **Enable Window Gradient** for subtle visual depth
2. **Use Dark Mode** for best results with SilkCircuit
3. **Combine with Dark Reader** for consistent theming

## Limitations

- Slack only allows sidebar theming
- Message area uses system theme
- Some elements cannot be customized

## Files

```
extras/
└── slack-theme.txt    # Color values and instructions
```

## Alternative: Dark Reader

For complete Slack theming, use Dark Reader browser extension with custom CSS:

```css
/* Slack message area */
.c-message_kit__background {
  background-color: #12101a !important;
}

.c-message__body {
  color: #f8f8f2 !important;
}
```

## Workspace-Wide Theme

To set this theme for your entire workspace (admin required):

1. Go to Workspace Settings
2. Navigate to Customize
3. Set default theme for all members

Note: Individual users can still override with their preferences.
