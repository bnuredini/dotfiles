vim.g.mapleader = ' '

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '~', 'i`')

--
-- Moving around...
--
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<leader>[', ':bp<CR>')
vim.keymap.set('n', '<leader>]', ':bn<CR>')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')
vim.keymap.set('n', 'sv', ':vsplit<CR>')
vim.keymap.set('n', 'sh', ':split<CR>')

--
-- Text operations.
-- 
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = "Yank to the system clipboard" })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = "Yank to current line to the system clipboard" })
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = "Paste from the system clipboard" })
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = "Next quickfix" })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = "Previous quickfix" })
vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select the entire file" })
vim.keymap.set("n", "gs", "ciW``<Esc>P", { noremap = true }, { desc = "Surround the current word with backticks" })

vim.keymap.set("v", "<", "<gv", { desc = "Keep visual selections after increasing indention" })
vim.keymap.set("v", ">", ">gv", { desc = "Keep visual selections after decreasing indention" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Don't lose your place when joining lines" })

vim.keymap.set('n', '<leader>o.', ':Oil .<CR>', { desc = "Open Oil in the current file's directory" })
vim.keymap.set('n', '<leader>oh', ':Oil<CR>', { desc = "Open Oil in the current working directory" })

--
-- Enabling stuff.
-- 
vim.keymap.set('n', '<leader>eg', ":Goyo<CR>")
vim.keymap.set('n', '<leader>ec', ':set cursorline! cursorcolumn!<CR>')
vim.keymap.set('n', '<leader>es', ':setlocal spell! spelllang=en_us<CR>')
vim.keymap.set('n', '<leader>el', ':Limelight!!<CR>')
vim.keymap.set('n', '<leader>en', ':set number!<CR>:set relativenumber!<CR>')

vim.keymap.set('n', '<leader>ts', "m'A<C-R>=strftime('%Y%m%dT%H%M%S')<CR>")
vim.keymap.set('n', '<leader>td', "a<C-R>=strftime('%Y-%m-%d')<CR>")

--
-- Inserting some special characters.
-- 
vim.keymap.set('i', ';;k', '✅', { noremap = true })
vim.keymap.set('i', ';;x', '❌', { noremap = true })
vim.keymap.set('i', ';;q', '❔', { noremap = true })


local function new_daily_note()
  local date = os.date("%Y-%m-%d")
  local filename = date .. ".md"

  vim.cmd("edit " .. filename)

  vim.api.nvim_buf_set_lines(0, 0, -1, false, {
    "# " .. date,
    "",
    "",
  })

  -- Put the cursor on the third line and enter Insert mode.
  vim.api.nvim_win_set_cursor(0, { 3, 0 })
  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>nn", new_daily_note, { desc = "New daily note" })

if vim.g.vscode then
  local vscode = require 'vscode-neovim'

  vim.keymap.set('n', 'sv', function()
    vscode.action 'workbench.action.splitEditorRight'
  end, { desc = 'Split vertically' })

  vim.keymap.set('n', 'sh', function()
    vscode.action 'workbench.action.splitEditorDown'
  end, { desc = 'Split horizontally' })
end
