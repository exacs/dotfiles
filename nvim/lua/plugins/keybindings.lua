return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      local wk = require("which-key")

      vim.o.timeout = true
      vim.o.timeoutlen = 300
      wk.add({
        { "<leader>f", group = "file" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
        { "<leader>n", "<cmd>Neotree<cr>", desc = "Neotree" },
        { "<leader>u", "<cmd>Telescope undo<cr>", desc = "Undo tree" },
        { "<localleader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code action" },
        { "<localleader><localleader>", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover info" },
        { "<localleader>d", group = "diag" },
        { "<localleader>dd", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show diagnostic under cursor" },
        { "<localleader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next diag" },
        { "<localleader>dp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev diag" },
        { "<localleader>dt", "<cmd>lua require'telescope.builtin'.diagnostics{}<cr>", desc = "Telescope diagnostics" },
        { "<localleader>e", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References" },
        { "<localleader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
      })

      -- Only if "nvim-cmp" is installed
      wk.add({
        {
          "<leader>a",
          function()
            vim.b.cmp_enabled = not vim.b.cmp_enabled
            require("cmp").setup.buffer({ enabled = vim.b.cmp_enabled })
          end,
          desc = "Toggle autocomplete",
        },
      })
    end,
    opts = {},
  },
}
