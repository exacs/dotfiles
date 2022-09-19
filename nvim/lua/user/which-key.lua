return function()
  local wk = require("which-key")
  wk.setup({
    key_labels = {
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<esc>"] = "ESC",
      ["<bs>"] = "BACK",
      ["<tab>"] = "TAB",
    },
  })

  -- <leader>f = file
  wk.register({
    name = "file",
    f = { "<cmd>Telescope find_files<cr>", "Find files (Telescope)" },
    F = { "<cmd>Telescope git_files<cr>", "Git files (Telescope)" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers (Telescope)" },
  }, { prefix = "<leader>f" })

  -- <leader>c = nvim configuration
  wk.register({
    name = "nvim config",
    c = {
      function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.fnamemodify(vim.env.MYVIMRC, ":h"),
        })
      end,
      "Open conf directory",
    },
    i = { "<cmd>:e $MYVIMRC<cr>", "Open 'init.lua'" },
  }, { prefix = "<leader>c" })

  -- <leader>P = Packer
  wk.register({
    name = "Packer",
    P = { "<cmd>PackerCompile<cr>", "PackerCompile" },
    C = { "<cmd>PackerClean<cr>", "PackerClean" },
    S = { "<cmd>PackerSync<cr>", "PackerSync" },
    I = { "<cmd>PackerInstall<cr>", "PackerInstall" },
    U = { "<cmd>PackerUpdate<cr>", "PackerUpdate" },
  }, { prefix = "<leader>P" })

  -- Hello world
  wk.register({
    ["<space>"] = {
      function()
        print("hello world")
      end,
      "Foobar",
    },
  }, { prefix = "<leader>" })
end
