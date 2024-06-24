local servers = require('lsp.servers')


local installable_servers = servers.installable
local installable_tools = servers.tools

-- Installer config
require("mason-lspconfig").setup({
    ensure_installed = installable_servers,
})

require("lsp.server_setup")
