local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local omnisharp_bin = vim.fn.stdpath("data") .. "\\mason\\packages\\omnisharp\\omnisharp.exe"
local pid = vim.fn.getpid();

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "rust_analyzer", "pyright", "volar", "tsserver", "omnisharp", "jsonls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["omnisharp"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    -- Additional configuration can be added here
    enable_editorconfig_support = true,
    -- enable_roslyn_analyzers = true,
    -- TODO: this feels a little hacky, but it will get it working across all repos
    -- I think a better option is to regex the path for pymtiaa, pymtbaa, ... 
    root_dir = function()
      return vim.fn.getcwd()
    end,
}
