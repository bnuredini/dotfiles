vim.keymap.set('n', '<F7>', '<Cmd>write<CR><Cmd>!javac % && java -cp %:p:h %:t:r<CR>')
