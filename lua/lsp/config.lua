local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<C-m>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<C-x>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<C-b>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = capabilities,
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "gopls",
        "golangci_lint_ls",
        "lua_ls",
        "ts_ls",
        "templ",
        "tailwindcss",
        "terraformls",
        "svelte",
        "eslint",
        "html",
        "htmx",
        "cssls",
        "pyright",
        "ruff",
        "graphql",
    },
    handlers = {
        function(server)
            vim.lsp.config(server, {})
        end,
        ["ts_ls"] = function()
            vim.lsp.config("ts_ls", {
                settings = {
                    completions = {
                        completeFunctionCalls = true,
                    },
                },
            })
        end,
    },
})



vim.lsp.config("lua_ls", {
    on_init = function(client)
        lsp_zero.nvim_lua_settings(client, {})
    end,
})

vim.lsp.config("htmx", {
    capabilities = capabilities,
    filetypes = { "html", "templ" },
})


local cmp = require('cmp')

local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
})
