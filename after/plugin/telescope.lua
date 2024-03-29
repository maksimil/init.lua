local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function() builtin.find_files({ hidden = true }) end, {})
vim.keymap.set('n', '<leader>pa', function() builtin.find_files({ hidden = true, no_ignore = true }) end, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
