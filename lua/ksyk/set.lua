vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- latex
vim.g.tex_flavor = 'latex'
vim.g.UltiSnipsExpandTrigger = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<C-f>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-b>'
vim.g.UltiSnipsSnippetDirectories = { '~/.config/nvim/snippets' }

-- silicon
vim.g.silicon = {
    ['theme']              = 'Dracula',
    ['font']               = 'Hack',
    ['background']         = '#AAAAFF',
    ['shadow-color']       = '#555555',
    ['line-pad']           = 2,
    ['pad-horiz']          = 40,
    ['pad-vert']           = 50,
    ['shadow-blur-radius'] = 0,
    ['shadow-offset-x']    = 0,
    ['shadow-offset-y']    = 0,
    ['line-number']        = true,
    ['round-corner']       = true,
    ['window-controls']    = true,
    ['output']             = '~/Pictures/silicon/silicon-{time:%Y-%m-%d-%H%M%S}-{file:%h}.png'
}
