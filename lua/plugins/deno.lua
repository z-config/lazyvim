return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "deno")

      if type(opts.ensure_installed) == "deno" then
        local nvim_lsp = require("lspconfig")
        nvim_lsp.tsserver.setup({
          on_attach = on_attach,
          root_dir = nvim_lsp.util.root_pattern("package.json"),
          single_file_support = false,
        })

        nvim_lsp.denols.setup({
          on_attach = on_attach,
          root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
        })
      end
    end,
  },
}
