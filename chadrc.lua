local M = {}

M.ui = {
}

M.mappings = require "custom.mappings"

M.plugins = {
  user = {
    ["goolord/alpha-nvim"] = {
      disable = false,
    },
    ["wcascades/vim-fugitive-toggle"] = {},
    ["tpope/vim-fugitive"] = {},
    ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
    },
  },
  override = {
    ["hrsh7th/nvim-cmp"] = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      }
    }
  }
}

return M
