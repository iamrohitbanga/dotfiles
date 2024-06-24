local M = {
    -- works along with vim-fugitive
    -- enables opening current file in browser using github url
    'tpope/vim-rhubarb',
    lazy = false,
    dependencies = "tpope/vim-fugitive",
}

function M.init()
    vim.g.github_enterprise_urls = "https://git.corp.iamrohitbanga.com"
end

return M
