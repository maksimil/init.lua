vim.g.NERDCreateDefaultMappings = 0
vim.g.NERDSpaceDelims = 1
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDToggleCheckAllLines = 1
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDCustomDelimiters = { ["rust"] = { ["left"] = '//' } }

vim.keymap.set({ "n", "v" }, "<leader>cc", "<plug>NERDCommenterToggle<CR>")
