" plugins
call plug#begin()
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-sensible'
    Plug 'junegunn/goyo.vim'
    Plug 'Shougo/deoplete.nvim'
    Plug 'mattn/emmet-vim'
    Plug 'godlygeek/csapprox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'flazz/vim-colorschemes'
    Plug 'rakr/vim-one'
call plug#end()

let g:deoplete#enable_at_startup = 1
syntax on
filetype plugin indent on
"set t_Co=256
colorscheme jellybeans

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamed
set textwidth=88
set mouse=a
" set colorcolumn=88

" replace 'w' with 'ë' 
nmap <F2>       :%s/w/ë/g<CR>
nmap <F3>       :%s/@/ç/g<CR>
nmap <F4>       :%s/@/w/g<CR>
nmap <F9>       :%s/W/Ë/g<CR>
nmap <F7>       :!javac % && java -cp %:p:h %:t:r<CR>
" enable english spellchecker
map <leader>o   :setlocal spell! spelllang=en_us<CR>
" enabel distraction-free mode
map <space>f    :Goyo<CR>   
map <space>F    :Goyo!<CR>
" fzf
map <space>o	:Files<CR>
" tabs
map <leader>n   :tabnew<CR>
map <leader>w   :tabclose<CR>
map <M-1>       1gt<CR>
map <M-2>       2gt<CR>
map <M-3>       3gt<CR>
map <M-4>       4gt<CR>
map <M-5>       5gt<CR>

" java shorthands
inoremap `psvm<Tab>  public static void main(String[] args) {<CR>}<left><CR><up><Tab>
inoremap `sout<Tab>  System.out.println("");<left><left><left>
inoremap `pc<Tab>    public class {<CR>}<left><CR><up><up><Esc>eea<right>

" file specific
autocmd Filetype html setlocal tabstop=2
autocmd Filetype html setlocal shiftwidth=2
autocmd Filetype css setlocal tabstop=2
autocmd Filetype css setlocal shiftwidth=2
autocmd Filetype php setlocal tabstop=2
autocmd Filetype php setlocal shiftwidth=2
