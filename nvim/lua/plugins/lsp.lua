local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim", "williamboman/mason.nvim" },
    config = function()
      require("mason").setup({})
      -- First ensure installation of LSP servers
      require("mason-lspconfig").setup({
        -- ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "emmet-language-server", "jsonls" },
        automatic_installation = true,
      })
      require("lspconfig").rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {},
        },
      })
      require("lspconfig").emmet_language_server.setup({
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "pug",
          "typescriptreact",
        },
        init_options = {},
      })
      require("lspconfig").tsserver.setup({})
      require("lspconfig").jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            -- Schemas https://schemastore.org
            schemas = {
              {
                fileMatch = { "package.json" },
                url = "https://json.schemastore.org/package.json",
              },
              {
                fileMatch = { "tsconfig*.json" },
                url = "https://json.schemastore.org/tsconfig.json",
              },
              {
                fileMatch = {
                  ".prettierrc",
                  ".prettierrc.json",
                  "prettier.config.json",
                },
                url = "https://json.schemastore.org/prettierrc.json",
              },
              {
                fileMatch = { ".eslintrc", ".eslintrc.json" },
                url = "https://json.schemastore.org/eslintrc.json",
              },
              {
                fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
                url = "https://json.schemastore.org/babelrc.json",
              },
              {
                fileMatch = { "lerna.json" },
                url = "https://json.schemastore.org/lerna.json",
              },
              {
                fileMatch = { "now.json", "vercel.json" },
                url = "https://json.schemastore.org/now.json",
              },
              {
                fileMatch = {
                  ".stylelintrc",
                  ".stylelintrc.json",
                  "stylelint.config.json",
                },
                url = "http://json.schemastore.org/stylelintrc.json",
              },
            },
          },
        },
      })
    end,
  },
}
