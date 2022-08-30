local M = {}

M.mine = {
  n = {
    ["<leader>z"] = {"<cmd>lua require('custom.budgethelper').categories(require('telescope.themes').get_dropdown{})<cr>"},
    ["<leader>g"] = {"<cmd>lua require('vim-fugitive-toggle').toggle()<cr>"},
    ["<C-z>"] = {"<nop>"}
  },
  i = {
    ["<C-z>"] = {"<nop>"}
  },
  s = {
    ["<C-z>"] = {"<nop>"}
  },
  x = {
    ["<C-z>"] = {"<nop>"}
  },
  c = {
    ["<C-z>"] = {"<nop>"}
  },
  o = {
    ["<C-z>"] = {"<nop>"}
  },
  v = {
    ["<C-z>"] = {"<nop>"}
  },
}

return M
