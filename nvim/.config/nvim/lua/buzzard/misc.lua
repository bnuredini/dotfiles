vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false -- don't hightlight searches
vim.opt.incsearch = true  -- incremental search

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "100"
vim.opt.textwidth = 100

vim.cmd('colorscheme jellybeans')

local vim_cstmztn_files_dir = vim.fn.expand('~/.vim_swp')
local backup_dir = vim_cstmztn_files_dir .. '/vim_backup'

vim.api.nvim_set_option('directory', backup_dir)
vim.api.nvim_set_option('backupdir', backup_dir)

vim.cmd("let g:vimwiki_list = [{'path': '/Users/bleart/Documents/vimwiki'}]")
