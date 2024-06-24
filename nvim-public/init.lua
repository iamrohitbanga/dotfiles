-- nvim config
require("keymaps")
require("options")
require("settings")

-- require("plugins")

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info

-- path where lazy.nvim is installed
-- typically ~/.local/share/nvim/lazy/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
-- if lazypath does not exist then clone it from github
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end

vim.opt.runtimepath:prepend(lazypath)

-- This means that plugins configuration will be loaded from ~/.config/nvim/lua/plugins.lua or ~/.config/nvim/lua/plugins/init.lua.
-- Any lua file in ~/.config/nvim/lua/plugins/*.lua will be automatically merged in the main plugin spec
require("lazy").setup("plugins", {
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
    },
    install = { colorscheme = { "onedark" } },
    checker = {
        enabled = true,                     -- automatically check for plugin updates
        notify = true,
        frequency = 604800                  -- only check once a week
    },
    change_detection = { enabled = false }, -- pop-ups when editing nvim config
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                -- "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                -- "tarPlugin",
                -- "tohtml",
                -- "tutor",
                -- "zipPlugin",
            },
        },
    },
})
