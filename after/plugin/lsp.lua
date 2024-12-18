local lsp = require("lsp-zero")

lsp.preset({
    name = "recommended",
    manage_nvim_cmp = {
        set_sources = 'recommended',
        set_basic_mappings = false,
        set_extra_mappings = false,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
    },
})
lsp.ensure_installed({
    "lua_ls"
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

require("lspconfig").clangd.setup({
    cmd = { "clangd", "--enable-config", "--query-driver=/usr/bin/g++" }
})

-- cmp setup with snippets

local cmp = require('cmp')
local cmp_action = lsp.cmp_action()
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'orgmode' },
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select_opts),
        ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp_action.luasnip_jump_forward(),
        ['<S-Tab>'] = cmp_action.luasnip_jump_backward(),
    }
})

vim.g.zig_fmt_autosave = 0

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
});
