vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.wrap = false

vim.opt.hlsearch = false -- don't hightlight searches
vim.opt.incsearch = true -- incremental search

vim.opt.textwidth = 100

vim.opt.termguicolors = true

local vim_cstmztn_files_dir = vim.fn.expand '~/.vim_swp'
local backup_dir = vim_cstmztn_files_dir .. '/vim_backup'

vim.api.nvim_set_option('directory', backup_dir)
vim.api.nvim_set_option('backupdir', backup_dir)

local os_name = vim.loop.os_uname().sysname

if os_name == 'Linux' then
  vim.cmd("let g:vimwiki_list = [{'path': '/home/bleart/documents/notes', 'path_html': '/home/bleart/documents/notes-html'}]")
elseif os_name == 'Darwin' then
  vim.cmd("let g:vimwiki_list = [{'path': '/Users/bleart/documents/notes', 'path_html': '/Users/bleart/documents/notes-html'}]")
end

vim.cmd('let g:vimwiki_url_maxsave=0')
vim.cmd('let g:goyo_width=102')

vim.cmd('set fillchars+=vert:\\ ') -- disable the line separator between splits
vim.cmd(':hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white')

vim.cmd [[
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

    autocmd Filetype gotmpl setlocal tabstop=2
    autocmd Filetype gotmpl setlocal shiftwidth=2
]]

vim.cmd(':ab green_check_mark ✅')
vim.cmd(':ab red_x ❌')
vim.cmd(':ab q_mark ❔')

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'vimwiki',
  callback = function()
    vim.opt_local.textwidth = 100
  end,
})

if vim.g.vscode then
  vim.o.cmdheight = 4
end

local function set_theme()
  local hour = tonumber(os.date("%H"))

  if hour >= 18 or hour < 6 then
    vim.cmd("colorscheme jellybeans")
  else
    vim.cmd("colorscheme flexoki-light")
  end
end

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = set_theme,
})
