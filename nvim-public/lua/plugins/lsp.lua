local M = {
    'neovim/nvim-lspconfig',

    dependencies = {
        "williamboman/mason.nvim",
        'williamboman/mason-lspconfig.nvim',
        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    },

}

function M.config()
    vim.lsp.set_log_level('warn')
    local mason = require('mason')

    mason.setup({
        log_level = vim.log.levels.WARN,
        ui = {
            width = 0.5,
            height = 0.7,
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗",
            },
        },
    })

    require('lsp.attach')
    require('lsp')
end

return M
