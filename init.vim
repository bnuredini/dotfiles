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
    Plug 'craigemery/vim-autotag'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'lervag/vimtex'
    " Plug 'godlygeek/tabular'
    " Plug 'plasticboy/vim-markdown'
    " Plug 'vim-pandoc/vim-pandoc'
    " Plug 'vim-pandoc/vim-pandoc-syntax' 
    Plug 'lambdalisue/fern.vim'
call plug#end()

syntax on
filetype plugin indent on
colorscheme jellybeans

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set clipboard=unnamed
set textwidth=88
set mouse=a
highlight Search cterm=italic

" == KEYBINDINGS ==
" replace 'w' with 'ë' 
nmap <F2>       :%s/w/ë/g<CR>

" replace '@' with 'ç' 
nmap <F3>       :%s/@/ç/g<CR>

" replace '&' with 'w' 
nmap <F4>       :%s/&/w/g<CR>

" replace 'W' with 'Ë' 
nmap <F9>       :%s/W/Ë/g<CR>

" enable english spellchecker
map <leader>s   :setlocal spell! spelllang=en_us<CR>

" enabel distraction-free mode
map <space>f    :Goyo<CR>   
map <space>F    :Goyo!<CR>

" fzf
map <space>o	:Files<CR>
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

" fern
map <space>b    :Fern .<CR>

" config file
map <space>c    :e ~/.config/nvim/init.vim<CR>
map <space>s    :so ~/.config/nvim/init.vim<CR>

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
autocmd Filetype tex nmap <F7>        :w<CR>:!cd %:p:h && pdflatex %:p<CR>
autocmd Filetype markdown nmap <F7>   :w<CR>:!pandoc -o %:r.pdf % && mupdf %:r.pdf<CR>
nmap <F10> :w<CR>:VimwikiAll2HTML<CR>

" java shorthands
inoremap `psvm<Tab>  public static void main(String[] args) {<CR>}<left><CR><up><Tab>
inoremap `sout<Tab>  System.out.println();<left><left>
inoremap `pc<Tab>    public class {<CR>}<left><CR><up><up><Esc>eea<right>

" sql snippets
autocmd Filetype sql inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd Filetype sql inoremap `ct<Tab>      CREATE TABLE <++> (<CR><++><CR>);<CR><CR><++>
autocmd Filetype sql inoremap `cti<Tab>     CREATE TABLE <++> (<CR>id INT NOT NULL PRIMARY KEY,<CR><++><CR>);<CR><CR><++>
autocmd Filetype sql inoremap `ctfk<Tab>    CREATE TABLE <++> (<CR>id INT NOT NULL PRIMARY KEY,<CR>FOREIGN KEY (fk) REFERENCES some_table(fk)<CR><++><CR>);<CR><CR><++>
autocmd Filetype sql inoremap `fk<Tab>      FOREIGN KEY (<++>) REFERENCES <++>(<++>)

" timestamp
nnoremap <C-t><C-s> m'A<C-R>=strftime('%Y%m%dT%H%M%S')<CR>
nnoremap <Space>t a\section*{<C-R>=strftime('%Y-%m-%d')<CR>}

" splits
nnoremap sv :vsplit<CR>
nnoremap sh :split<CR>

" == OPTIONS == 
" file specific
autocmd Filetype html setlocal tabstop=2
autocmd Filetype html setlocal shiftwidth=2
autocmd Filetype css setlocal tabstop=2
autocmd Filetype css setlocal shiftwidth=2
autocmd Filetype php setlocal tabstop=2
autocmd Filetype php setlocal shiftwidth=2
autocmd Filetype js setlocal tabstop=2
autocmd Filetype js setlocal shiftwidth=2
autocmd Filetype tex setlocal textwidth=80

" vimwiki: use markdown
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

" use .md for markdown files
autocmd BufNewFile,BufRead *.md set filetype=markdown

" use .wiki for vimwiki files
autocmd BufNewFile,BufRead *.wiki set filetype=vimwiki

" sudo save the file
command! W execute 'w'
command! Q execute 'q'

if !exists("g:os")
   let g:os = substitute(system('uname'), '\n', '', '')
endif

" vimwiki: change wiki directory
if g:os == "Darwin"
    let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
else
    let g:vimwiki_list = [{'path': '~/documents/Dropbox/vimwiki'}]
endif

