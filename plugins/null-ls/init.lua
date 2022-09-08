local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {
  b.formatting.stylua,
  b.formatting.fixjson,
  b.formatting.csharpier
}

null_ls.setup {
   debug = true,
   sources = sources,
   on_attach = function(client)
     if client.server_capabilities.document_formatting then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
     end
  end
}
