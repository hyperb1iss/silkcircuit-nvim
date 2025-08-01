return {
  "silkcircuit/silkcircuit-nvim",
  name = "silkcircuit",
  lazy = true,
  opts = {
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dap = true,
      dap_ui = true,
      gitsigns = true,
      illuminate = true,
      indent_blankline = true,
      markdown = true,
      mason = true,
      native_lsp = { enabled = true },
      neotree = true,
      notify = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = true,
      treesitter = true,
      rainbow_delimiters = true,
      ufo = true,
      which_key = true,
      window_picker = true,
    },
  },
}
