-- INSTALL lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Start
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Will read `./lua/plugins.lua` OR `./lua/plugins/*.lua"
require("lazy").setup("plugins")
