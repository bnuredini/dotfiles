vim.keymap.set('n', '<F7>', '<Cmd>write<CR><Cmd>!pandoc -f markdown -t html %:p -o %:p:h/notes-html/%:t:r.html --css ~/code/tmp/styles/pandoc.css --standalone --quiet<CR>')
