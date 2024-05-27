return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {},
        },
      })

      require("lspconfig").tsserver.setup({})
    end,
  },
}
