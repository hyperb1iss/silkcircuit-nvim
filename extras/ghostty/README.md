# SilkCircuit for Ghostty

Terminal color themes for [Ghostty](https://ghostty.org/).

## Variants

| File | Description |
|------|-------------|
| `silkcircuit-neon` | Maximum neon intensity - the original experience |
| `silkcircuit-vibrant` | Slightly toned down - easier on the eyes |
| `silkcircuit-soft` | Softer colors - comfortable for extended use |
| `silkcircuit-glow` | Ultra-dark with pure neon - maximum contrast |
| `silkcircuit-dawn` | Light theme for daytime use |

## Installation

Copy the desired theme file to your Ghostty themes directory:

```sh
mkdir -p ~/.config/ghostty/themes
cp silkcircuit-neon ~/.config/ghostty/themes/
```

Then activate it in `~/.config/ghostty/config`:

```
theme = silkcircuit-neon
```

For automatic light/dark switching:

```
theme = dark:silkcircuit-neon,light:silkcircuit-dawn
```
