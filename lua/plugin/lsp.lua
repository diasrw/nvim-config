return {
  {
    'neovim/nvim-lspconfig',
    config = function ()
            -- lua/config/lsp.lua (or wherever your lsp config lives)
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local bufnr = args.buf
                    local opts = { buffer = bufnr, silent = true }

                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
                    vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, opts)
                    vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)

                    -- diagnostics
                    vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
                    vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
                    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

                    -- inlay hints (toggle, since some people find them noisy)
                    if vim.lsp.inlay_hint then
                        vim.keymap.set('n', '<leader>th', function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
                        end, opts)
                    end
                end,
            })
    end
  },
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'lua_ls', 'pyright' },
    },
  },
}
