vim.cmd([[packadd packer.nvim]])
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use("gpanders/editorconfig.nvim")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = { enable = true },
      })
    end,
  })
  use({
    "ahmedkhalf/project.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("project_nvim").setup({})
      require("telescope").load_extension("projects")
    end,
  })
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("languages.typescript")()
    end,
  })

  -- Use neoformat until "formatter" accepts
  -- "try_node_modules"
  use({
    "sbdchd/neoformat",
    config = function()
      vim.cmd([[let g:neoformat_try_node_exe = 1]])
    end,
  })

  -- use({
  --   "mhartington/formatter.nvim",
  --   config = function()
  --     require("formatter").setup({
  --       filetype = {
  --         lua = {
  --           require("formatter.filetypes.lua").stylua,
  --         },

  --         ["*"] = {
  --           require("formatter.defaults.prettier")
  --         }
  --       },
  --     })
  --   end,
  -- })

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
  use({ "folke/which-key.nvim", config = require("user.which-key") })

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
