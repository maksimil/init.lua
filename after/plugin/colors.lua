vim.opt.termguicolors = true

function ThemeDark()
    vim.cmd('colorscheme base16-tomorrow-night')
end

function ThemeLight()
    vim.cmd('colorscheme base16-gruvbox-light-hard')
end

ThemeDark()
