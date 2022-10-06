vim.o.showmatch = true
vim.o.number = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.showtabline = 2
require("plugins")

-- TODO
-- coq: Autocomplete https://github.com/ms-jpq/coq_nvim
-- Optional. legendary: search the which-key stuff. https://github.com/mrjones2014/legendary.nvim
-- Optional. hydra: https://github.com/anuvyklack/hydra.nvim
-- nvim-dap: Debug Adapter Protocol: https://github.com/mfussenegger/nvim-dap
-- vv: Neovim client for MacOS https://github.com/vv-vim/vv
--
-- Example dotfile: https://github.com/wbthomason/dotfiles/blob/linux/neovim/.config/nvim/lua/plugins.lua
