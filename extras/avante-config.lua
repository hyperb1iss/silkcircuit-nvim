-- Avante.nvim configuration for SilkCircuit theme
-- Add this to your Avante setup to match the vibrant aesthetic

return {
  -- Use vibrant borders that match SilkCircuit
  windows = {
    -- Keep default position/size, customize appearance
    position = "right",
    width = 30,

    -- Enhanced sidebar header with SilkCircuit style
    sidebar_header = {
      enabled = true,
      align = "center",
      rounded = false, -- Sharp edges for electric feel
    },

    -- Vibrant spinners with neon colors
    spinner = {
      -- Electric purple dots for editing
      editing = { "⚡", "✦", "◆", "✧", "♦", "✦" },
      -- Cyan animation for generating
      generating = { "◐", "◓", "◑", "◒" },
      -- Pink thinking indicators
      thinking = { "✨", "💭", "🔮", "💫" },
    },

    -- Enhanced input styling
    input = {
      prefix = "▸ ", -- Sharp electric arrow
      height = 8, -- More space for code
    },

    -- Edit window with electric borders
    edit = {
      -- Vibrant double-line borders
      border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
      start_insert = true,
    },

    -- Ask window with glowing style
    ask = {
      floating = true, -- Float for modern feel
      -- Rounded neon borders
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      start_insert = true,
      focus_on_apply = "ours",
    },
  },

  -- Use vibrant diff highlights
  highlights = {
    diff = {
      current = "DiffDelete", -- Red for current (matches SilkCircuit)
      incoming = "DiffAdd", -- Green for incoming
    },
  },

  -- Enhanced behavior settings
  behavior = {
    auto_set_highlight_group = true,
    auto_suggestions = true,
    support_paste_from_clipboard = true,
  },

  -- Optional: Customize keymaps with consistent style
  mappings = {
    edit = "<C-a>", -- Electric keybinds
    submit = {
      normal = "<CR>",
      insert = "<C-CR>",
    },
  },
}

-- Alternative minimal config if you prefer subtler customization:
-- return {
--   windows = {
--     sidebar_header = { rounded = false },
--     spinner = {
--       editing = { "⚡", "✦", "◆", "✧" },
--       generating = { "◐", "◓", "◑", "◒" },
--     },
--     input = { prefix = "▸ " },
--     edit = { border = "rounded" },
--     ask = { border = "rounded", floating = true },
--   },
-- }
