return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      local wk = require("which-key")

      vim.o.timeout = true
      vim.o.timeoutlen = 300

      wk.register({
        ["<leader>"] = {
          f = {
            name = "+file",
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            b = { "<cmd>Telescope buffers<cr>", "Buffers" },
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
            n = { "<cmd>enew<cr>", "New File" },
          },

          n = { "<cmd>Neotree<cr>", desc = "Neotree" },
        },

        ["<localleader>"] = {
          ["<localleader>"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover info" },
          r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        },
      })
    end,
    opts = {},
  },
}
