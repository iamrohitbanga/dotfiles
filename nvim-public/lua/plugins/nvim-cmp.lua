local M = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',

        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',

        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',  -- auto-complete using the buffer sources
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline', -- auto-complete in command mode
    },
}

function M.config()
    local cmp = require'cmp'

    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
            end,
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            -- { name = 'vsnip' }, -- For vsnip users.
            { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
        }, {
                { name = 'buffer' },
            })
    })

    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
                { name = 'cmdline' }
            }),
        matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- Set up lspconfig.
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    --     capabilities = capabilities
    -- }




    -- -- [[ Configure nvim-cmp ]]
    -- -- See `:help cmp`
    -- local cmp = require 'cmp'
    -- local luasnip = require 'luasnip'
    -- require('luasnip.loaders.from_vscode').lazy_load()
    -- luasnip.config.setup {}
    --
    -- cmp.setup {
    --     snippet = {
    --         expand = function(args)
    --             luasnip.lsp_expand(args.body)
    --         end,
    --     },
    --     mapping = cmp.mapping.preset.insert {
    --         ['<C-n>'] = cmp.mapping.select_next_item(),
    --         ['<C-p>'] = cmp.mapping.select_prev_item(),
    --         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    --         ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --         ['<C-Space>'] = cmp.mapping.complete {},
    --         ['<CR>'] = cmp.mapping.confirm {
    --             behavior = cmp.ConfirmBehavior.Replace,
    --             select = true,
    --         },
    --         ['<Tab>'] = cmp.mapping(function(fallback)
    --             if cmp.visible() then
    --                 cmp.select_next_item()
    --             elseif luasnip.expand_or_locally_jumpable() then
    --                 luasnip.expand_or_jump()
    --             else
    --                 fallback()
    --             end
    --         end, { 'i', 's' }),
    --         ['<S-Tab>'] = cmp.mapping(function(fallback)
    --             if cmp.visible() then
    --                 cmp.select_prev_item()
    --             elseif luasnip.locally_jumpable(-1) then
    --                 luasnip.jump(-1)
    --             else
    --                 fallback()
    --             end
    --         end, { 'i', 's' }),
    --     },
    --     sources = {
    --         { name = 'nvim_lsp' },
    --         { name = 'luasnip' },
    --     },
    -- }
end

return M
