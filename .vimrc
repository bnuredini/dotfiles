" directory for plugins 
call plug#begin('~/.vim/plugged')

" plugins 
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
call plug#end()

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

" coloscheme pywal
    colorscheme wal
    " colorscheme gruvbox

" replace 'w' with 'ë' 
    nmap	<F2>	:%s/w/ë/g<CR>
    nmap	<F3>	:%s/@/ç/g<CR>
    nmap    <F4>    :%s/@/w/g<CR>
" enable english spellchecker
    map <leader>o   :setlocal spell! spelllang=en_us<CR>
" enabel distraction-free mode
    map <space>f    :Goyo<CR>   
    map <space>F    :Goyo!<CR>

" fzf
    map <space>o		:Files<CR>
"    map <space>o		:exe ":FZF " . expand("%:h")<CR>
"    map '/		:!fzf<CR>
"    set rtp+=~/.config/.fzf
"    map '/		:!fzf<CR>
