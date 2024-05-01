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
        -- highlight = { enable = true },
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
      require("lspconfig").sumneko_lua.setup({
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })
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
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "vscode",
        },
      })
    end,
  })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  })
  use({
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
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
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      -- VSnip
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    config = require("user.cmp"),
  })
  --use({
  --  "akinsho/bufferline.nvim",
  --  tag = "v2.*",
  --  requires = "kyazdani42/nvim-web-devicons",
  --  config = function()
  --    require("bufferline").setup({})
  --  end,
  --:wbthomason})
end)
