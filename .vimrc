" enable pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on


autocmd Filetype html setlocal tabstop=4
autocmd Filetype css setlocal tabstop=4

set number
set relativenumber
set textwidth=88
set colorcolumn=88
set tabstop=4
set shiftwidth=4
set expandtab

" pywal
colorscheme wal
" colorscheme gruvbox

" keys
nnoremap '.		:exe ":FZF " . expand("%:h")<CR>
nnoremap '/		:!fzf<CR>
" replace 'w' with 'ë' 
nmap	<F2>	:%s/w/ë/g<CR>
nmap	<F3>	:%s/@/ç/g<CR>
nmap    <F4>    :%s/@/w/g<CR>

set rtp+=~/.fzf
