# Contributing to SilkCircuit Theme

First off, thank you for considering contributing to SilkCircuit! It's people like you that make SilkCircuit such a great theme.

## Code of Conduct

By participating in this project, you are expected to uphold our Code of Conduct:

- Be respectful and inclusive
- Welcome newcomers and help them get started
- Focus on what is best for the community
- Show empathy towards other community members

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates. When creating a bug report, include:

- **Clear title and description**
- **Steps to reproduce**
- **Expected behavior**
- **Actual behavior**
- **Screenshots** (if applicable)
- **System information:**
  - Neovim version: `nvim --version`
  - OS and version
  - Terminal emulator
  - Configuration (minimal reproducible config preferred)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, include:

- **Clear title and description**
- **Use case** - Why is this enhancement needed?
- **Examples** - If possible, provide examples of how it would work
- **Alternative solutions** - What alternatives have you considered?

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test your changes thoroughly
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Development Setup

1. Clone your fork:

```bash
git clone https://github.com/your-username/silkcircuit-nvim.git
cd silkcircuit-nvim
```

2. Create a test configuration:

```lua
-- test/init.lua
vim.opt.runtimepath:prepend(vim.fn.getcwd())
vim.opt.termguicolors = true

require("silkcircuit").setup({
  -- Test configuration
})

vim.cmd.colorscheme("silkcircuit")
```

3. Test your changes:

```bash
nvim -u test/init.lua
```

## Style Guidelines

### Lua Style

- Use 2 spaces for indentation
- Use meaningful variable names
- Comment complex logic
- Follow existing code style

Example:

```lua
local M = {}

-- Clear, descriptive function name
function M.apply_highlights(colors, opts)
  local highlights = {}

  -- Group related highlights
  highlights.Normal = { fg = colors.fg, bg = colors.bg }
  highlights.Comment = { fg = colors.comment, italic = opts.italic_comments }

  return highlights
end

return M
```

### Color Guidelines

When adding or modifying colors:

1. **Maintain contrast ratios** - Ensure text is readable
2. **Follow the theme aesthetic** - Synthwave/cyberpunk style
3. **Test in different scenarios:**
   - Light and dark backgrounds
   - Different file types
   - Various plugins
4. **Document color choices** - Explain why a color was chosen

### Commit Messages

- Use present tense ("Add feature" not "Added feature")
- Keep the first line under 50 characters
- Reference issues and pull requests when applicable
- Examples:
  - `Add support for nvim-dap highlights`
  - `Fix transparent background in telescope`
  - `Update installation documentation`

## Adding Plugin Support

To add support for a new plugin:

1. Create a new file in `lua/silkcircuit/integrations/`:

```lua
-- lua/silkcircuit/integrations/plugin_name.lua
local M = {}

function M.highlights(colors, opts)
  return {
    PluginHighlight1 = { fg = colors.purple },
    PluginHighlight2 = { fg = colors.cyan, bg = colors.bg_highlight },
    -- Add all plugin-specific highlights
  }
end

return M
```

2. Add the plugin to the integrations list in `lua/silkcircuit/config.lua`:

```lua
integrations = {
  -- ... existing integrations
  plugin_name = true,
}
```

3. Update documentation with the new plugin support

## Testing

Before submitting a PR:

1. **Test basic functionality:**
   - Theme loads without errors
   - Colors appear correctly
   - No Lua errors in `:messages`

2. **Test with different configurations:**
   - Transparent background on/off
   - Different style options
   - Various plugin combinations

3. **Test file types:**
   - Lua, JavaScript, Python, HTML, CSS
   - Markdown, JSON, YAML
   - Any specific file types you've modified

4. **Check plugin integrations:**
   - Ensure modified plugins still work
   - Verify new plugins integrate properly

## Documentation

- Update README.md if adding new features
- Document new configuration options
- Include examples where helpful
- Keep documentation concise and clear

## Questions?

Feel free to open an issue for:

- Questions about the codebase
- Clarification on contribution process
- Discussion about potential features

Thank you for contributing! 💜
