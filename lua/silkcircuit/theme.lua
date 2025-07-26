local M = {}
local util = require("silkcircuit.util")
local config = require("silkcircuit.config")

-- Get highlights
function M.get_highlights(colors, opts)
  local sem = require("silkcircuit.palette").semantic
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
  highlights.FloatBorder =
    { fg = sem.border, bg = opts.transparent and colors.none or colors.bg_highlight }
  highlights.FloatTitle =
    { fg = colors.pink, bg = opts.transparent and colors.none or colors.bg_highlight, bold = true }
  highlights.WinBar = { fg = colors.pink_bright }
  highlights.WinBarNC = { fg = colors.purple_muted }
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
  highlights.PmenuExtra = { fg = colors.gray }
  highlights.PmenuExtraSel = { fg = colors.purple_muted }

  -- Tabs
  highlights.TabLine = { fg = colors.gray, bg = colors.bg_highlight }
  highlights.TabLineFill = { bg = colors.bg_highlight }
  highlights.TabLineSel = { fg = colors.fg_light, bg = colors.bg }

  -- Search & Selection
  highlights.Search = { fg = colors.bg, bg = colors.yellow }
  highlights.IncSearch = { fg = colors.bg, bg = colors.coral }
  highlights.CurSearch = { fg = colors.bg, bg = colors.pink }
  highlights.Visual = { bg = colors.selection }
  highlights.VisualNOS = { bg = colors.selection }
  highlights.Selection = { bg = colors.selection }
  highlights.MatchParen = { fg = colors.pink, bold = true }

  -- Diagnostics handled in integrations/native_lsp.lua

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
  highlights.TermCursor = { fg = colors.bg, bg = colors.pink }
  highlights.TermCursorNC = { fg = colors.bg, bg = colors.purple_muted }

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
  highlights.Comment = apply_style({ fg = sem.comment, italic = true }, "comments")
  highlights.SpecialComment = { fg = colors.purple_muted, italic = true, bold = true }
  highlights.Constant = apply_style({ fg = sem.constant }, "constants")
  highlights.String = apply_style({ fg = sem.string, italic = true }, "strings")
  highlights.Character = { fg = colors.cyan_bright }
  highlights.Number = { fg = sem.number }
  highlights.Boolean = apply_style({ fg = sem.boolean }, "booleans")
  highlights.Float = { fg = sem.number }

  highlights.Identifier = { fg = sem.variable }
  highlights.Function = apply_style({ fg = sem.func, bold = true, italic = true }, "functions")

  highlights.Statement = { fg = sem.keyword }
  highlights.Conditional = apply_style({ fg = sem.keyword }, "conditionals")
  highlights.Repeat = apply_style({ fg = sem.keyword }, "loops")
  highlights.Label = { fg = colors.cyan_bright }
  highlights.Operator = apply_style({ fg = sem.operator }, "operators")
  highlights.Keyword = apply_style({ fg = sem.keyword }, "keywords")
  highlights.Exception = { fg = colors.purple }

  highlights.PreProc = { fg = colors.pink_bright }
  highlights.Include = { fg = colors.purple }
  highlights.Define = { fg = colors.pink_bright }
  highlights.Macro = { fg = colors.purple }
  highlights.PreCondit = { fg = colors.pink_bright }

  highlights.Type = apply_style({ fg = sem.type }, "types")
  highlights.StorageClass = { fg = colors.yellow }
  highlights.Structure = { fg = colors.yellow }
  highlights.Typedef = { fg = colors.yellow }

  highlights.Special = { fg = colors.pink_bright }
  highlights.SpecialChar = { fg = colors.coral }
  highlights.Tag = { fg = colors.pink, bold = true }
  highlights.Delimiter = { fg = colors.fg_dark }
  highlights.Debug = { fg = colors.red }

  highlights.Underlined = { underline = true }
  highlights.Bold = { bold = true }
  highlights.Italic = { italic = true }
  highlights.Ignore = { fg = colors.gray }
  highlights.Error = { fg = colors.error }
  highlights.Todo = { fg = colors.bg, bg = colors.pink, bold = true }

  -- Additional vim syntax groups
  highlights.qfLineNr = { fg = colors.yellow }
  highlights.qfFileName = { fg = colors.cyan_bright }
  highlights.htmlH1 = { fg = colors.pink, bold = true }
  highlights.htmlH2 = { fg = colors.cyan_bright, bold = true }
  highlights.mkdCodeDelimiter = { bg = colors.bg, fg = colors.fg }
  highlights.mkdCodeStart = { fg = colors.pink, bold = true }
  highlights.mkdCodeEnd = { fg = colors.pink, bold = true }

  -- Health check
  highlights.healthError = { fg = colors.red }
  highlights.healthSuccess = { fg = colors.green_bright }
  highlights.healthWarning = { fg = colors.yellow }

  -- Illuminate
  highlights.illuminatedWord = { bg = colors.bg_highlight }
  highlights.illuminatedCurWord = { bg = colors.bg_highlight }

  -- Rainbow delimiters
  highlights.rainbow1 = { fg = colors.red }
  highlights.rainbow2 = { fg = colors.coral }
  highlights.rainbow3 = { fg = colors.yellow }
  highlights.rainbow4 = { fg = colors.green }
  highlights.rainbow5 = { fg = colors.cyan_bright }
  highlights.rainbow6 = { fg = colors.pink }

  -- TreeSitter highlights handled in integrations/treesitter.lua
  if false then
    -- Identifiers
    highlights["@variable"] = { fg = sem.variable }
    highlights["@variable.builtin"] = { fg = colors.cyan }
    highlights["@variable.parameter"] = { fg = sem.parameter }
    highlights["@variable.member"] = { fg = sem.property }

    highlights["@constant"] = apply_style({ fg = sem.constant }, "constants")
    highlights["@constant.builtin"] = { fg = colors.blue }
    highlights["@constant.macro"] = { fg = colors.blue }

    highlights["@module"] = { fg = sem.namespace }
    highlights["@module.builtin"] = { fg = sem.namespace }
    highlights["@label"] = { fg = colors.purple }

    -- Literals
    highlights["@string"] = apply_style({ fg = sem.string }, "strings") -- Hot pink strings!
    highlights["@string.documentation"] = { fg = colors.string }
    highlights["@string.regexp"] = { fg = colors.cyan_bright }
    highlights["@string.escape"] = { fg = colors.coral }
    highlights["@string.special"] = { fg = colors.coral }
    highlights["@string.special.symbol"] = { fg = colors.cyan }
    highlights["@string.plain"] = { fg = colors.pink_bright } -- Plain strings without quotes
    highlights["@string.special.path"] = { fg = colors.cyan }
    highlights["@string.special.url"] = { fg = colors.cyan, underline = true }

    highlights["@character"] = { fg = colors.string }
    highlights["@character.special"] = { fg = colors.coral }

    highlights["@boolean"] = apply_style({ fg = sem.boolean }, "booleans")
    highlights["@number"] = { fg = sem.number }
    highlights["@number.float"] = { fg = sem.number }

    -- Types
    highlights["@type"] = apply_style({ fg = sem.type }, "types")
    highlights["@type.builtin"] = { fg = sem.type }
    highlights["@type.definition"] = { fg = sem.type }
    highlights["@type.qualifier"] = { fg = colors.purple }

    highlights["@attribute"] = { fg = sem.attribute }
    highlights["@property"] = { fg = sem.property } -- Make properties bright cyan

    -- Functions
    highlights["@function"] = apply_style({ fg = sem.func }, "functions")
    highlights["@function.builtin"] = { fg = sem.func_call }
    highlights["@function.call"] = { fg = sem.func_call }
    highlights["@function.macro"] = { fg = colors.purple }
    highlights["@function.method"] = apply_style({ fg = sem.method }, "functions")
    highlights["@function.method.call"] = { fg = sem.func_call }

    highlights["@constructor"] = { fg = sem.type }
    highlights["@operator"] = apply_style({ fg = sem.operator }, "operators")

    -- Keywords
    highlights["@keyword"] = apply_style({ fg = sem.keyword }, "keywords")
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
    highlights["@punctuation.delimiter"] = { fg = sem.punctuation }
    highlights["@punctuation.bracket"] = { fg = sem.bracket }
    highlights["@punctuation.special"] = { fg = sem.punctuation }

    -- Comments
    highlights["@comment"] = apply_style({ fg = sem.comment }, "comments")
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

    highlights["@markup.heading"] = { fg = colors.pink_bright, bold = true }
    highlights["@markup.heading.1"] =
      { fg = colors.pink_bright, bold = true, bg = colors.bg_highlight }
    highlights["@markup.heading.2"] = { fg = colors.purple, bold = true }
    highlights["@markup.heading.3"] = { fg = colors.cyan_bright, bold = true }
    highlights["@markup.heading.4"] = { fg = colors.yellow, bold = true }
    highlights["@markup.heading.5"] = { fg = colors.green_bright, bold = true }
    highlights["@markup.heading.6"] = { fg = colors.coral, bold = true }

    highlights["@markup.quote"] =
      { fg = colors.purple_muted, bg = colors.bg_highlight, italic = true }
    highlights["@markup.math"] = { fg = colors.green_bright }
    highlights["@markup.environment"] = { fg = colors.purple }
    highlights["@markup.link"] = { fg = colors.cyan_bright, underline = true, bold = true }
    highlights["@markup.link.label"] = { fg = colors.pink }
    highlights["@markup.link.url"] = { fg = colors.cyan, underline = true, italic = true }
    highlights["@markup.raw"] = { fg = colors.yellow, bg = colors.bg_highlight }
    highlights["@markup.raw.block"] = { fg = colors.yellow, bg = colors.bg_dark }
    highlights["@markup.list"] = { fg = colors.pink_bright }
    highlights["@markup.list.checked"] = { fg = colors.green_bright, bold = true }
    highlights["@markup.list.unchecked"] = { fg = colors.purple }

    -- Tags (HTML/JSX)
    highlights["@tag"] = { fg = sem.tag }
    highlights["@tag.attribute"] = { fg = sem.attribute }
    highlights["@tag.delimiter"] = { fg = colors.cyan_bright }

    -- Diff
    highlights["@diff.plus"] = { fg = colors.git_add }
    highlights["@diff.minus"] = { fg = colors.git_delete }
    highlights["@diff.delta"] = { fg = colors.git_change }

    -- Language specific
    highlights["@lsp.type.namespace"] = { fg = sem.namespace }
    highlights["@lsp.type.type"] = { fg = sem.type }
    highlights["@lsp.type.class"] = { fg = sem.class }
    highlights["@lsp.type.enum"] = { fg = sem.type }
    highlights["@lsp.type.interface"] = { fg = colors.pink }
    highlights["@lsp.type.struct"] = { fg = sem.type }
    highlights["@lsp.type.parameter"] = { fg = sem.parameter }
    highlights["@lsp.type.variable"] = { fg = sem.variable }
    highlights["@lsp.type.property"] = { fg = sem.property }
    highlights["@lsp.type.enumMember"] = { fg = sem.constant }
    highlights["@lsp.type.function"] = { fg = sem.func }
    highlights["@lsp.type.method"] = { fg = sem.method }
    highlights["@lsp.type.macro"] = { fg = colors.purple }
    highlights["@lsp.type.decorator"] = { fg = sem.decorator }

    -- Semantic tokens
    highlights["@lsp.type.boolean"] = { link = "@boolean" }
    highlights["@lsp.type.builtinType"] = { link = "@type.builtin" }
    highlights["@lsp.type.comment"] = { link = "@comment" }
    highlights["@lsp.type.escapeSequence"] = { link = "@string.escape" }
    highlights["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" }
    highlights["@lsp.type.keyword"] = { link = "@keyword" }
    highlights["@lsp.type.number"] = { link = "@number" }
    highlights["@lsp.type.operator"] = { link = "@operator" }
    highlights["@lsp.type.selfKeyword"] = { link = "@variable.builtin" }
    highlights["@lsp.type.typeAlias"] = { link = "@type.definition" }
    highlights["@lsp.type.unresolvedReference"] = { link = "@error" }
    highlights["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" }
    highlights["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" }
    highlights["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" }
    highlights["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" }
    highlights["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" }
    highlights["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" }
    highlights["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" }
    highlights["@lsp.typemod.operator.injected"] = { link = "@operator" }
    highlights["@lsp.typemod.string.injected"] = { link = "@string" }
    highlights["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" }
    highlights["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" }
    highlights["@lsp.typemod.variable.injected"] = { link = "@variable" }

    -- Git commit specific
    highlights["@comment.warning.gitcommit"] = { fg = colors.yellow }
    highlights["@text.gitcommit"] = { fg = colors.pink_bright }
    highlights["@text.title.gitcommit"] = { fg = colors.pink_bright, bold = true }
    highlights["@keyword.gitcommit"] = { fg = colors.purple }
    highlights["gitcommitSummary"] = { fg = colors.pink_bright, italic = true, bold = true }
    highlights["gitcommitOverflow"] = { fg = colors.red }
    highlights["gitcommitBlank"] = { fg = colors.red }
    highlights["gitcommitFirstLine"] = { fg = colors.pink_bright }
    highlights["gitcommitBranch"] = { fg = colors.purple }
    highlights["gitcommitType"] = { fg = colors.purple, bold = true }
    highlights["gitcommitScope"] = { fg = colors.cyan_bright }
    highlights["gitcommitSubject"] = { fg = colors.pink }
    highlights["gitcommitHeader"] = { fg = colors.purple }
    highlights["gitcommitSelectedType"] = { fg = colors.cyan_bright }
    highlights["gitcommitSelectedFile"] = { fg = colors.pink }
    highlights["gitcommitDiscardedType"] = { fg = colors.red }
    highlights["gitcommitDiscardedFile"] = { fg = colors.red }
    highlights["gitcommitUntrackedFile"] = { fg = colors.yellow }
    highlights["gitcommitOnBranch"] = { fg = colors.purple_muted }
    highlights["gitcommitArrow"] = { fg = colors.cyan }
    highlights["gitcommitFile"] = { fg = colors.pink }
    highlights["gitcommitComment"] = { fg = colors.purple_muted, italic = true }
    highlights["gitcommitText"] = { fg = colors.pink } -- Make commit message text pink!

    -- Language specific highlights
    -- Bash
    highlights["@function.builtin.bash"] = { fg = colors.red, italic = true }

    -- Java
    highlights["@constant.java"] = { fg = colors.cyan_bright }

    -- CSS
    highlights["@property.css"] = { fg = colors.pink }
    highlights["@property.id.css"] = { fg = colors.cyan_bright }
    highlights["@property.class.css"] = { fg = colors.yellow }
    highlights["@type.css"] = { fg = colors.pink }
    highlights["@type.tag.css"] = { fg = colors.purple }
    highlights["@string.plain.css"] = { fg = colors.coral }
    highlights["@number.css"] = { fg = colors.purple_dark }

    -- TOML
    highlights["@property.toml"] = { fg = colors.cyan_bright }

    -- JSON
    highlights["@label.json"] = { fg = colors.cyan_bright }

    -- Lua
    highlights["@constructor.lua"] = { fg = colors.pink }

    -- TypeScript/TSX
    highlights["@property.typescript"] = { fg = colors.pink }
    highlights["@constructor.typescript"] = { fg = colors.pink }
    highlights["@constructor.tsx"] = { fg = colors.pink }
    highlights["@tag.attribute.tsx"] = { fg = colors.cyan_bright, italic = true }

    -- YAML (Enhanced for vibrant syntax)
    highlights["@variable.member.yaml"] = { fg = colors.cyan_bright }
    highlights["@field.yaml"] = { fg = colors.cyan_bright }
    highlights["@string.yaml"] = { fg = colors.pink_bright }
    highlights["@number.yaml"] = { fg = colors.purple_dark }
    highlights["@boolean.yaml"] = { fg = colors.pink }
    highlights["@constant.yaml"] = { fg = colors.purple }
    highlights["@constant.builtin.yaml"] = { fg = colors.coral } -- for null values
    highlights["@punctuation.delimiter.yaml"] = { fg = colors.purple }
    highlights["@punctuation.special.yaml"] = { fg = colors.yellow }
    highlights["@label.yaml"] = { fg = colors.pink, bold = true }
    highlights["@type.yaml"] = { fg = colors.yellow }
    highlights["@keyword.yaml"] = { fg = colors.purple }
    highlights["@string.special.yaml"] = { fg = colors.coral }
    highlights["@comment.yaml"] = { fg = colors.purple_muted, italic = true }
    highlights["@operator.yaml"] = { fg = colors.cyan } -- for merge operators like <<
    highlights["@variable.yaml"] = { fg = colors.pink } -- for anchors and aliases

    -- Ruby
    highlights["@string.special.symbol.ruby"] = { fg = colors.pink }

    -- PHP
    highlights["@function.method.php"] = { link = "Function" }
    highlights["@function.method.call.php"] = { link = "Function" }

    -- C/CPP
    highlights["@type.builtin.c"] = { fg = colors.yellow }
    highlights["@property.cpp"] = { fg = colors.fg }
    highlights["@type.builtin.cpp"] = { fg = colors.yellow }

    -- Python decorators
    highlights["@attribute.python"] = { fg = colors.green_bright }

    -- JavaScript/JSX
    highlights["@keyword.export"] = { fg = colors.cyan }

    -- Gitignore
    highlights["@string.special.path.gitignore"] = { fg = colors.fg }

    -- Misc
    highlights["zshKSHFunction"] = { link = "Function" }

    -- Add keyword modifiers and special operators
    highlights["@keyword.modifier"] = { fg = colors.purple }
    highlights["@keyword.type"] = { fg = colors.purple }
    highlights["@keyword.coroutine"] = { fg = colors.purple }
    highlights["@keyword.storage"] = { fg = colors.purple }

    -- Legacy mappings for backward compatibility
    highlights["@parameter"] = highlights["@variable.parameter"]
    highlights["@field"] = highlights["@variable.member"]
    highlights["@namespace"] = highlights["@module"]
    highlights["@float"] = highlights["@number.float"]
    highlights["@symbol"] = highlights["@string.special.symbol"]
    highlights["@string.regex"] = highlights["@string.regexp"]
    highlights["@text"] = highlights["@markup"]
    highlights["@text.strong"] = highlights["@markup.strong"]
    highlights["@text.emphasis"] = highlights["@markup.italic"]
    highlights["@text.underline"] = highlights["@markup.underline"]
    highlights["@text.strike"] = highlights["@markup.strikethrough"]
    highlights["@text.title"] = highlights["@markup.heading"]
    highlights["@text.literal"] = highlights["@markup.raw"]
    highlights["@text.uri"] = highlights["@markup.link.url"]
    highlights["@text.reference"] = highlights["@markup.link"]
    highlights["@method"] = highlights["@function.method"]
    highlights["@method.call"] = highlights["@function.method.call"]
  end

  -- Apply user overrides
  if opts.on_highlights then
    opts.on_highlights(highlights, colors)
  end

  return highlights
end

-- Apply the theme
function M.apply()
  local palette = require("silkcircuit.palette")
  local opts = config.get()
  local highlights = M.get_highlights(palette.colors, opts)

  -- Clear any existing autocmds that might interfere
  vim.api.nvim_create_augroup("SilkCircuit", { clear = true })

  util.load_highlights(highlights)

  -- Load plugin integrations
  if opts.integrations then
    require("silkcircuit.integrations").load(palette.colors, opts)
  else
    vim.notify("SilkCircuit: integrations disabled in config", vim.log.levels.WARN)
  end
end

-- Set terminal colors
function M.set_terminal_colors()
  local colors = require("silkcircuit.palette").colors

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
