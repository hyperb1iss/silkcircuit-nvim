# FZF Integration

Fuzzy finder with SilkCircuit colors.

## Installation

Source the FZF configuration in your shell:

```bash
# Add to .bashrc or .zshrc
source /path/to/silkcircuit-nvim/extras/fzf.sh
```

## Configuration

The `fzf.sh` file sets FZF environment variables:

```bash
export FZF_DEFAULT_OPTS="
  --color=bg+:#1a162a,bg:#12101a,spinner:#e135ff,hl:#ff79c6
  --color=fg:#f8f8f2,header:#ff79c6,info:#f1fa8c,pointer:#e135ff
  --color=marker:#50fa7b,fg+:#f8f8f2,prompt:#e135ff,hl+:#ff79c6
  --color=border:#80ffea
"
```

## Color Mapping

| Element | Color | Hex |
|---------|-------|-----|
| Background | Dark | `#12101a` |
| Foreground | Light | `#f8f8f2` |
| Selection bg | Highlight | `#1a162a` |
| Spinner | Purple | `#e135ff` |
| Highlight | Pink | `#ff79c6` |
| Info | Yellow | `#f1fa8c` |
| Pointer | Purple | `#e135ff` |
| Marker | Green | `#50fa7b` |
| Prompt | Purple | `#e135ff` |
| Border | Cyan | `#80ffea` |

## Neovim Integration

For Telescope with FZF extension:

```lua
require("telescope").setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})
```

SilkCircuit automatically themes Telescope if installed.

## Preview Colors

FZF can use bat for syntax-highlighted previews. Install the SilkCircuit bat theme:

```bash
# bat uses the same theme files as the terminal
# Just ensure your terminal is using SilkCircuit colors
```

## Usage Examples

```bash
# File search
fzf

# Search with preview
fzf --preview 'bat --color=always {}'

# Git branches
git branch | fzf

# Processes
ps aux | fzf
```

## Shell Integration

### Bash

```bash
# Add to .bashrc
source /path/to/silkcircuit-nvim/extras/fzf.sh

# Key bindings (if using fzf package)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
```

### Zsh

```zsh
# Add to .zshrc
source /path/to/silkcircuit-nvim/extras/fzf.sh

# Key bindings (if using fzf package)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```

### Fish

```fish
# Add to config.fish
set -gx FZF_DEFAULT_OPTS "--color=bg+:#1a162a,bg:#12101a,spinner:#e135ff,hl:#ff79c6 --color=fg:#f8f8f2,header:#ff79c6,info:#f1fa8c,pointer:#e135ff --color=marker:#50fa7b,fg+:#f8f8f2,prompt:#e135ff,hl+:#ff79c6 --color=border:#80ffea"
```

## Customization

Modify colors by editing the FZF options:

```bash
# Example: change pointer color
export FZF_DEFAULT_OPTS="
  --color=pointer:#00ffff
  $FZF_DEFAULT_OPTS
"
```
