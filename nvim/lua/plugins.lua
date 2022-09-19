vim.cmd([[packadd packer.nvim]])
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Format
  use("gpanders/editorconfig.nvim")
  use({
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
        },
      })
    end,
  })

  -- Theme and lualine
  use({
    "Mofiqul/vscode.nvim",
    config = function()
      require("vscode").setup({})
    end,
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true,
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "vscode",
        },
      })
    end,
  })

  -- Which key
  use({
    "folke/which-key.nvim",
    config = function()
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
      wk.register({
        ["<space>"] = {
          function()
            print("hello world")
          end,
          "Foobar",
        },
      }, { prefix = "<leader>" })
    end,
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("telescope").setup({})
    end,
  })
end)
