# Git Configuration

Transform your git experience with SilkCircuit colors.

## Installation

```bash
# Option 1: Include in existing .gitconfig
echo "[include]" >> ~/.gitconfig
echo "    path = /path/to/silkcircuit-nvim/extras/gitconfig" >> ~/.gitconfig

# Option 2: Append directly
cat extras/gitconfig >> ~/.gitconfig
```

## Features

### Colored Output

| Element | Color |
|---------|-------|
| Commit hashes | Neon Magenta |
| Dates | Electric Cyan |
| Author names | Bright Yellow |
| Branch names | Green |
| Additions | Green |
| Deletions | Red |

### Git Log Format

The config includes custom log formats:

```bash
# One-line format with colors
git lg

# Graph view
git lg --graph

# All branches
git lg --all
```

### Git Status Colors

| Status | Color |
|--------|-------|
| Untracked | Red |
| Modified | Yellow |
| Staged | Green |
| Branch | Cyan |

### Git Diff Colors

| Element | Color |
|---------|-------|
| Old (deleted) | Red |
| New (added) | Green |
| Meta info | Cyan |
| Frag info | Magenta |

## Delta Integration

If you use [delta](https://github.com/dandavison/delta) for git diffs, the config includes matching colors:

```gitconfig
[delta]
    navigate = true
    line-numbers = true
    syntax-theme = Dracula

[delta "silkcircuit"]
    minus-style = syntax "#3f1e1e"
    plus-style = syntax "#1e3f1e"
    minus-emph-style = syntax "#802020"
    plus-emph-style = syntax "#208020"
```

## Configuration Details

```gitconfig
[color]
    ui = auto

[color "branch"]
    current = cyan bold
    local = green
    remote = magenta

[color "status"]
    added = green bold
    changed = yellow bold
    untracked = red bold
    branch = cyan bold

[color "diff"]
    meta = cyan
    frag = magenta bold
    old = red bold
    new = green bold
    whitespace = red reverse

[alias]
    lg = log --color --graph --pretty=format:'%C(201)%h%Creset -%C(220)%d%Creset %s %C(51)(%cr) %C(bold 213)<%an>%Creset' --abbrev-commit
```

## Color Reference

| ANSI Code | Color | Usage |
|-----------|-------|-------|
| `201` | Neon Magenta | Commit hashes |
| `213` | Bright Magenta | Author names |
| `51` | Electric Cyan | Dates |
| `220` | Bright Yellow | Branch refs |
| `149` | Green | Additions |
| `197` | Red | Deletions |

## Git Aliases

The config includes helpful aliases:

```bash
# Beautiful log
git lg

# Log with stats
git lg --stat

# Last commit
git lg -1

# Graph of all branches
git lg --all --graph
```

## Customization

Override colors in your `.gitconfig`:

```gitconfig
[color "status"]
    # Use different color for staged files
    added = "#50fa7b" bold
```

## Integration with Other Tools

### tig

The git colors work with tig as well. Add to `~/.tigrc`:

```
set main-view-date = custom
set main-view-date-format = "%Y-%m-%d %H:%M"
```

### lazygit

lazygit picks up git colors automatically.

### GitHub CLI

Use with `gh` for consistent colors:

```bash
gh pr list --json title,url
```
