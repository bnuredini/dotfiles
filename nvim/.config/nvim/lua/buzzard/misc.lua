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
vim.cmd("let g:vimwiki_url_maxsave=0")

vim.cmd(":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white")
vim.cmd(":nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>")

vim.cmd([[
    autocmd FileType javascript setlocal tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript setlocal softtabstop=2

    autocmd FileType typescript setlocal tabstop=2
    autocmd FileType typescript setlocal shiftwidth=2
    autocmd FileType typescript setlocal softtabstop=2

    autocmd Filetype css setlocal tabstop=2
    autocmd Filetype css setlocal shiftwidth=2

    autocmd Filetype php setlocal tabstop=2
    autocmd Filetype php setlocal shiftwidth=2

    autocmd Filetype tmpl setlocal tabstop=2
    autocmd Filetype tmpl setlocal shiftwidth=2
]])

