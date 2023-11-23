vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "sv", ":vsplit<CR>")
vim.keymap.set("n", "sh", ":split<CR>")

vim.keymap.set("n", "\\s", ":setlocal spell! spelllang=en_us<CR>")

vim.keymap.set("n", "<F2>", ":%s/w/ë/g<CR>")
vim.keymap.set("n", "<F3>", ":%s/@/ç/g<CR>")
vim.keymap.set("n", "<F4>", ":%s/&/w/g<CR>")
vim.keymap.set("n", "<F9>", ":%s/W/Ë/g<CR>")
vim.keymap.set("n", "<F10>", ":w<CR>:VimwikiAll2HTML<CR>")
vim.keymap.set("n", "<F7>" ,":!./%<CR>")

vim.keymap.set("n", "<leader>f", vim.cmd.Goyo)
vim.keymap.set("n", "<leader>n", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>w", vim.cmd.tabclose)
vim.keymap.set("n", "<leader>b", ":Fern .<CR>")
-- vim.keymap.set("n", "<leader>c", "ysiw`");

vim.keymap.set("n", "<leader>ts", "m'A<C-R>=strftime('%Y%m%dT%H%M%S')<CR>")
vim.keymap.set("n", "<leader>td", "a### <C-R>=strftime('%Y-%m-%d')<CR>")
vim.keymap.set("n", "~", "i`")

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
]])

vim.cmd([[
  autocmd FileType java nmap <F7> :w<CR>:!javac % && java -cp %:p:h %:t:r<CR>
]])

vim.cmd([[
  autocmd Filetype c nmap <F7> :w<CR>:!gcc % && ./a.out<CR>
]])

vim.cmd([[
  autocmd Filetype sh nmap <F7>:w<CR>!./%<CR>
]])

vim.cmd([[
  autocmd Filetype javascript nmap <F7> :w<CR>:!node %<CR>
]])

