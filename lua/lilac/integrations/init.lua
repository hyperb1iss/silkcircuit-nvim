local M = {}
local config = require("lilac.config")
local util = require("lilac.util")

-- Load all enabled integrations
function M.load(colors, opts)
  local integrations = {
    "telescope",
    "nvimtree",
    "neotree",
    "gitsigns",
    "gitgutter",
    "diffview",
    "indent_blankline",
    "bufferline",
    "lualine",
    "dashboard",
    "alpha",
    "which_key",
    "cmp",
    "notify",
    "noice",
    "hop",
    "leap",
    "lazy",
    "mason",
    "nvim_dap",
    "trouble",
    "outline",
    "illuminate",
    "flash",
    "rainbow_delimiters",
  }

  for _, integration in ipairs(integrations) do
    if config.is_enabled(integration) then
      local ok, module = pcall(require, "lilac.integrations." .. integration)
      if ok and module.highlights then
        local highlights = module.highlights(colors, opts)
        util.load_highlights(highlights)
      end
    end
  end
end

return M
