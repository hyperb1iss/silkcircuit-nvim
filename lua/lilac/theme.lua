local M = {}
local util = require("lilac.util")
local config = require("lilac.config")

-- Get highlights
function M.get_highlights(colors, opts)
  local highlights = {}

  -- Merge user style preferences
  local function apply_style(base, style_key)
    return util.merge_styles(base, opts.styles[style_key])
  end

  -- Editor highlights
  highlights.Normal = { fg = colors.fg, bg = opts.transparent and colors.none or colors.bg }
  highlights.NormalFloat =
    { fg = colors.fg, bg = opts.transparent and colors.none or colors.bg_highlight }
  highlights.NormalNC = opts.dim_inactive and { fg = colors.fg, bg = colors.bg_dark }
    or { link = "Normal" }
  highlights.Cursor = { fg = colors.bg, bg = colors.fg }
  highlights.CursorIM = { link = "Cursor" }
  highlights.CursorLine = { bg = colors.bg_highlight }
  highlights.CursorLineNr = { fg = colors.fg_light, bg = colors.bg_highlight, bold = true }
  highlights.CursorColumn = { link = "CursorLine" }
  highlights.ColorColumn = { bg = colors.bg_highlight }
  highlights.LineNr = { fg = colors.gray }
  highlights.VertSplit = { fg = colors.bg_highlight }
  highlights.WinSeparator = { fg = colors.bg_highlight }
  highlights.SignColumn = { fg = colors.fg, bg = opts.transparent and colors.none or colors.bg }
  highlights.Folded = { fg = colors.gray, bg = colors.bg_highlight }
  highlights.FoldColumn = { fg = colors.gray }
  highlights.EndOfBuffer = { fg = colors.bg }

  -- Statusline
  highlights.StatusLine = { fg = colors.fg_light, bg = colors.bg_highlight }
  highlights.StatusLineNC = { fg = colors.gray, bg = colors.bg_highlight }

  -- Pmenu
  highlights.Pmenu = { fg = colors.fg, bg = colors.bg_highlight }
  highlights.PmenuSel = { fg = colors.bg, bg = colors.purple }
  highlights.PmenuSbar = { bg = colors.bg_highlight }
  highlights.PmenuThumb = { bg = colors.gray }

  -- Tabs
  highlights.TabLine = { fg = colors.gray, bg = colors.bg_highlight }
  highlights.TabLineFill = { bg = colors.bg_highlight }
  highlights.TabLineSel = { fg = colors.fg_light, bg = colors.bg }

  -- Search & Selection
  highlights.Search = { fg = colors.bg, bg = colors.yellow }
  highlights.IncSearch = { fg = colors.bg, bg = colors.coral }
  highlights.CurSearch = { link = "IncSearch" }
  highlights.Visual = { bg = colors.selection }
  highlights.VisualNOS = { bg = colors.selection }
  highlights.Selection = { bg = colors.selection }
  highlights.MatchParen = { fg = colors.pink, bold = true }

  -- Diagnostics
  highlights.DiagnosticError = { fg = colors.error }
  highlights.DiagnosticWarn = { fg = colors.warning }
  highlights.DiagnosticInfo = { fg = colors.info }
  highlights.DiagnosticHint = { fg = colors.hint }
  highlights.DiagnosticUnderlineError = { undercurl = true, sp = colors.error }
  highlights.DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning }
  highlights.DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info }
  highlights.DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint }
  highlights.DiagnosticVirtualTextError = { fg = colors.error, italic = true }
  highlights.DiagnosticVirtualTextWarn = { fg = colors.warning, italic = true }
  highlights.DiagnosticVirtualTextInfo = { fg = colors.info, italic = true }
  highlights.DiagnosticVirtualTextHint = { fg = colors.hint, italic = true }

  -- Misc
  highlights.Directory = { fg = colors.blue }
  highlights.NonText = { fg = colors.gray }
  highlights.SpecialKey = { fg = colors.gray }
  highlights.Title = { fg = colors.blue, bold = true }
  highlights.Conceal = { fg = colors.gray }
  highlights.Question = { fg = colors.green }
  highlights.MoreMsg = { fg = colors.green }
  highlights.WarningMsg = { fg = colors.warning }
  highlights.ErrorMsg = { fg = colors.error }
  highlights.WildMenu = { fg = colors.bg, bg = colors.purple }
  highlights.ModeMsg = { fg = colors.fg, bold = true }
  highlights.Whitespace = { fg = colors.gray }

  -- Diff
  highlights.DiffAdd = { bg = colors.diff_add }
  highlights.DiffChange = { bg = colors.diff_change }
  highlights.DiffDelete = { bg = colors.diff_delete }
  highlights.DiffText = { bg = colors.diff_text }
  highlights.diffAdded = { fg = colors.git_add }
  highlights.diffRemoved = { fg = colors.git_delete }
  highlights.diffChanged = { fg = colors.git_change }

  -- Spell
  highlights.SpellBad = { undercurl = true, sp = colors.error }
  highlights.SpellCap = { undercurl = true, sp = colors.warning }
  highlights.SpellLocal = { undercurl = true, sp = colors.info }
  highlights.SpellRare = { undercurl = true, sp = colors.hint }

  -- Syntax highlights
  highlights.Comment = apply_style({ fg = colors.purple_muted, italic = true }, "comments")
  highlights.Constant = apply_style({ fg = colors.constant }, "constants")
  highlights.String = apply_style({ fg = colors.pink_bright, italic = true }, "strings")
  highlights.Character = { fg = colors.string }
  highlights.Number = { fg = colors.number }
  highlights.Boolean = apply_style({ fg = colors.boolean }, "booleans")
  highlights.Float = { fg = colors.number }

  highlights.Identifier = { fg = colors.variable }
  highlights.Function =
    apply_style({ fg = colors.glow_purple, bold = true, italic = true }, "functions")

  highlights.Statement = { fg = colors.keyword }
  highlights.Conditional = { fg = colors.keyword }
  highlights.Repeat = { fg = colors.keyword }
  highlights.Label = { fg = colors.keyword }
  highlights.Operator = apply_style({ fg = colors.operator }, "operators")
  highlights.Keyword = apply_style({ fg = colors.keyword }, "keywords")
  highlights.Exception = { fg = colors.keyword }

  highlights.PreProc = { fg = colors.purple }
  highlights.Include = { fg = colors.purple }
  highlights.Define = { fg = colors.purple }
  highlights.Macro = { fg = colors.purple }
  highlights.PreCondit = { fg = colors.purple }

  highlights.Type = apply_style({ fg = colors.type }, "types")
  highlights.StorageClass = { fg = colors.purple }
  highlights.Structure = { fg = colors.type }
  highlights.Typedef = { fg = colors.type }

  highlights.Special = { fg = colors.blue }
  highlights.SpecialChar = { fg = colors.coral }
  highlights.Tag = { fg = colors.tag }
  highlights.Delimiter = { fg = colors.punctuation }
  highlights.SpecialComment = { fg = colors.gray, italic = true }
  highlights.Debug = { fg = colors.red }

  highlights.Underlined = { underline = true }
  highlights.Ignore = { fg = colors.gray }
  highlights.Error = { fg = colors.error }
  highlights.Todo = { fg = colors.bg, bg = colors.yellow, bold = true }

  -- TreeSitter highlights
  if opts.integrations.treesitter then
    -- Identifiers
    highlights["@variable"] = { fg = colors.variable }
    highlights["@variable.builtin"] = { fg = colors.cyan }
    highlights["@variable.parameter"] = { fg = colors.parameter }
    highlights["@variable.member"] = { fg = colors.property }

    highlights["@constant"] = apply_style({ fg = colors.constant }, "constants")
    highlights["@constant.builtin"] = { fg = colors.blue }
    highlights["@constant.macro"] = { fg = colors.blue }

    highlights["@module"] = { fg = colors.type }
    highlights["@module.builtin"] = { fg = colors.type }
    highlights["@label"] = { fg = colors.purple }

    -- Literals
    highlights["@string"] = apply_style({ fg = colors.string }, "strings")
    highlights["@string.documentation"] = { fg = colors.string }
    highlights["@string.regexp"] = { fg = colors.cyan_bright }
    highlights["@string.escape"] = { fg = colors.coral }
    highlights["@string.special"] = { fg = colors.coral }
    highlights["@string.special.symbol"] = { fg = colors.cyan }
    highlights["@string.special.path"] = { fg = colors.cyan }
    highlights["@string.special.url"] = { fg = colors.cyan, underline = true }

    highlights["@character"] = { fg = colors.string }
    highlights["@character.special"] = { fg = colors.coral }

    highlights["@boolean"] = apply_style({ fg = colors.boolean }, "booleans")
    highlights["@number"] = { fg = colors.number }
    highlights["@number.float"] = { fg = colors.number }

    -- Types
    highlights["@type"] = apply_style({ fg = colors.type }, "types")
    highlights["@type.builtin"] = { fg = colors.type }
    highlights["@type.definition"] = { fg = colors.type }
    highlights["@type.qualifier"] = { fg = colors.purple }

    highlights["@attribute"] = { fg = colors.attribute }
    highlights["@property"] = { fg = colors.property }

    -- Functions
    highlights["@function"] = apply_style({ fg = colors.func }, "functions")
    highlights["@function.builtin"] = { fg = colors.func_call }
    highlights["@function.call"] = { fg = colors.func_call }
    highlights["@function.macro"] = { fg = colors.purple }
    highlights["@function.method"] = apply_style({ fg = colors.method }, "functions")
    highlights["@function.method.call"] = { fg = colors.func_call }

    highlights["@constructor"] = { fg = colors.type }
    highlights["@operator"] = apply_style({ fg = colors.operator }, "operators")

    -- Keywords
    highlights["@keyword"] = apply_style({ fg = colors.keyword }, "keywords")
    highlights["@keyword.coroutine"] = { fg = colors.keyword }
    highlights["@keyword.function"] = { fg = colors.purple }
    highlights["@keyword.operator"] = { fg = colors.operator }
    highlights["@keyword.import"] = { fg = colors.purple }
    highlights["@keyword.storage"] = { fg = colors.purple }
    highlights["@keyword.repeat"] = { fg = colors.keyword }
    highlights["@keyword.return"] = { fg = colors.keyword }
    highlights["@keyword.debug"] = { fg = colors.red }
    highlights["@keyword.exception"] = { fg = colors.keyword }
    highlights["@keyword.conditional"] = { fg = colors.keyword }
    highlights["@keyword.conditional.ternary"] = { fg = colors.operator }
    highlights["@keyword.directive"] = { fg = colors.purple }
    highlights["@keyword.directive.define"] = { fg = colors.purple }

    -- Punctuation
    highlights["@punctuation.delimiter"] = { fg = colors.punctuation }
    highlights["@punctuation.bracket"] = { fg = colors.bracket }
    highlights["@punctuation.special"] = { fg = colors.punctuation }

    -- Comments
    highlights["@comment"] = apply_style({ fg = colors.comment }, "comments")
    highlights["@comment.documentation"] = apply_style({ fg = colors.comment }, "comments")
    highlights["@comment.error"] = { fg = colors.error }
    highlights["@comment.warning"] = { fg = colors.warning }
    highlights["@comment.todo"] = { fg = colors.bg, bg = colors.yellow }
    highlights["@comment.note"] = { fg = colors.bg, bg = colors.info }

    -- Markup
    highlights["@markup"] = { fg = colors.fg }
    highlights["@markup.strong"] = { bold = true }
    highlights["@markup.italic"] = { italic = true }
    highlights["@markup.strikethrough"] = { strikethrough = true }
    highlights["@markup.underline"] = { underline = true }

    highlights["@markup.heading"] = { fg = colors.blue_bright, bold = true }
    highlights["@markup.heading.1"] = { fg = colors.blue_bright, bold = true }
    highlights["@markup.heading.2"] = { fg = colors.blue_bright, bold = true }
    highlights["@markup.heading.3"] = { fg = colors.blue_bright, bold = true }
    highlights["@markup.heading.4"] = { fg = colors.blue_bright, bold = true }
    highlights["@markup.heading.5"] = { fg = colors.blue_bright, bold = true }
    highlights["@markup.heading.6"] = { fg = colors.blue_bright, bold = true }

    highlights["@markup.quote"] = { fg = colors.purple_muted, italic = true }
    highlights["@markup.math"] = { fg = colors.green }
    highlights["@markup.environment"] = { fg = colors.purple }
    highlights["@markup.link"] = { fg = colors.cyan, underline = true }
    highlights["@markup.link.label"] = { fg = colors.blue }
    highlights["@markup.link.url"] = { fg = colors.cyan, underline = true }
    highlights["@markup.raw"] = { fg = colors.cyan_light }
    highlights["@markup.raw.block"] = { fg = colors.cyan_light }
    highlights["@markup.list"] = { fg = colors.blue_bright }
    highlights["@markup.list.checked"] = { fg = colors.green }
    highlights["@markup.list.unchecked"] = { fg = colors.gray }

    -- Tags (HTML/JSX)
    highlights["@tag"] = { fg = colors.tag }
    highlights["@tag.attribute"] = { fg = colors.attribute }
    highlights["@tag.delimiter"] = { fg = colors.cyan_bright }

    -- Diff
    highlights["@diff.plus"] = { fg = colors.git_add }
    highlights["@diff.minus"] = { fg = colors.git_delete }
    highlights["@diff.delta"] = { fg = colors.git_change }

    -- Language specific
    highlights["@lsp.type.namespace"] = { fg = colors.type }
    highlights["@lsp.type.type"] = { fg = colors.type }
    highlights["@lsp.type.class"] = { fg = colors.class }
    highlights["@lsp.type.enum"] = { fg = colors.type }
    highlights["@lsp.type.interface"] = { fg = colors.type }
    highlights["@lsp.type.struct"] = { fg = colors.type }
    highlights["@lsp.type.parameter"] = { fg = colors.parameter }
    highlights["@lsp.type.variable"] = { fg = colors.variable }
    highlights["@lsp.type.property"] = { fg = colors.property }
    highlights["@lsp.type.enumMember"] = { fg = colors.constant }
    highlights["@lsp.type.function"] = { fg = colors.func }
    highlights["@lsp.type.method"] = { fg = colors.method }
    highlights["@lsp.type.macro"] = { fg = colors.purple }
    highlights["@lsp.type.decorator"] = { fg = colors.attribute }
  end

  -- Apply user overrides
  if opts.on_highlights then
    opts.on_highlights(highlights, colors)
  end

  return highlights
end

-- Apply the theme
function M.apply()
  local palette = require("lilac.palette")
  local opts = config.get()
  local highlights = M.get_highlights(palette.colors, opts)

  util.load_highlights(highlights)

  -- Load plugin integrations
  if opts.integrations then
    require("lilac.integrations").load(palette.colors, opts)
  end
end

-- Set terminal colors
function M.set_terminal_colors()
  local colors = require("lilac.palette").colors

  vim.g.terminal_color_0 = colors.terminal_black
  vim.g.terminal_color_1 = colors.terminal_red
  vim.g.terminal_color_2 = colors.terminal_green
  vim.g.terminal_color_3 = colors.terminal_yellow
  vim.g.terminal_color_4 = colors.terminal_blue
  vim.g.terminal_color_5 = colors.terminal_magenta
  vim.g.terminal_color_6 = colors.terminal_cyan
  vim.g.terminal_color_7 = colors.terminal_white
  vim.g.terminal_color_8 = colors.terminal_bright_black
  vim.g.terminal_color_9 = colors.terminal_bright_red
  vim.g.terminal_color_10 = colors.terminal_bright_green
  vim.g.terminal_color_11 = colors.terminal_bright_yellow
  vim.g.terminal_color_12 = colors.terminal_bright_blue
  vim.g.terminal_color_13 = colors.terminal_bright_magenta
  vim.g.terminal_color_14 = colors.terminal_bright_cyan
  vim.g.terminal_color_15 = colors.terminal_bright_white
end

return M
