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
            g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
            b = { "<cmd>Telescope buffers<cr>", "Buffers" },
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
            n = { "<cmd>enew<cr>", "New File" },
          },

          n = { "<cmd>Neotree<cr>", "Neotree" },
          u = { "<cmd>Telescope undo<cr>", "Undo tree" },
        },

        ["<localleader>"] = {
          ["<localleader>"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover info" },
          d = {
            name = "+diag",
            d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostic under cursor" },
            n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diag" },
            p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev diag" },
            t = { "<cmd>lua require'telescope.builtin'.diagnostics{}<cr>", "Telescope diagnostics" },
          },
          ["."] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
          r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
          e = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        },
      })
    end,
    opts = {},
  },
}
