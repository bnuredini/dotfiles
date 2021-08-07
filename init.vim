call plug#begin()
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-sensible'
    Plug 'junegunn/goyo.vim'
    Plug 'mattn/emmet-vim'
    Plug 'godlygeek/csapprox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'flazz/vim-colorschemes'
    Plug 'rakr/vim-one'
    Plug 'vimwiki/vimwiki'
    Plug 'leafgarland/typescript-vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'craigemery/vim-autotag'
call plug#end()

syntax on
filetype plugin indent on
colorscheme jellybeans
"set t_Co=256

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set clipboard=unnamed
set textwidth=88
set mouse=a
"  set colorcolumn=88

" replace 'w' with 'ë' 
nmap <F2>       :%s/w/ë/g<CR>
" replace '@' with 'ç' 
nmap <F3>       :%s/@/ç/g<CR>
" replace '&' with 'w' 
nmap <F4>       :%s/&/w/g<CR>
" replace 'W' with 'Ë' 
nmap <F9>       :%s/W/Ë/g<CR>
nmap <F8>       :w<CR>:!ls<CR>
" enable english spellchecker
map <leader>s   :setlocal spell! spelllang=en_us<CR>
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
" run commands
autocmd Filetype java nmap <F7>       :w<CR>:!javac % && java -cp %:p:h %:t:r<CR>
autocmd Filetype cs nmap <F7>         :w<CR>:!mcs -out:%:r.exe % && mono %:r.exe<CR>
autocmd Filetype c nmap <F7>          :w<CR>:!gcc % && ./a.out<CR>
autocmd Filetype tex nmap <F7>        :w<CR>:!pdflatex %<CR>

" java shorthands
inoremap `psvm<Tab>  public static void main(String[] args) {<CR>}<left><CR><up><Tab>
inoremap `sout<Tab>  System.out.println("");<left><left><left>
inoremap `pc<Tab>    public class {<CR>}<left><CR><up><up><Esc>eea<right>

"" sql snippets
autocmd Filetype sql inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd Filetype sql inoremap `ct<Tab>      CREATE TABLE <++> (<CR><++><CR>);<CR><CR><++>
autocmd Filetype sql inoremap `cti<Tab>     CREATE TABLE <++> (<CR>id INT NOT NULL PRIMARY KEY,<CR><++><CR>);<CR><CR><++>
autocmd Filetype sql inoremap `ctfk<Tab>    CREATE TABLE <++> (<CR>id INT NOT NULL PRIMARY KEY,<CR>FOREIGN KEY (fk) REFERENCES some_table(fk)<CR><++><CR>);<CR><CR><++>
autocmd Filetype sql inoremap `fk<Tab>      FOREIGN KEY (<++>) REFERENCES <++>(<++>)

" file specific
autocmd Filetype html setlocal tabstop=2
autocmd Filetype html setlocal shiftwidth=2
autocmd Filetype css setlocal tabstop=2
autocmd Filetype css setlocal shiftwidth=2
autocmd Filetype php setlocal tabstop=2
autocmd Filetype php setlocal shiftwidth=2
autocmd Filetype js setlocal tabstop=2
autocmd Filetype js setlocal shiftwidth=2


" vimwiki: change wiki directory
let g:vimwiki_list = [{'path': '~/documents/Dropbox/vimwiki'}]

" vimwiki: use markdown
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

" sudo save the file
command! W execute 'w'
command! Q execute 'q'
