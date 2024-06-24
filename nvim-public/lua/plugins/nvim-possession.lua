local M = {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
        "ibhagwan/fzf-lua",
    },
    config = true,
    init = function()
        local possession = require("nvim-possession")
        vim.keymap.set("n", "<leader>sl", possession.list, { desc = '[S]ession [L]ist' })
        vim.keymap.set("n", "<leader>sn", possession.new, { desc = '[S]ession [N]ew' })
        vim.keymap.set("n", "<leader>su", possession.update, { desc = '[S]ession [U]pdate' })
        vim.keymap.set("n", "<leader>sd", possession.delete, { desc = '[S]ession [D]elete' })
    end,
}

function M.config()
    require("nvim-possession").setup({
        sessions = {
            sessions_path = vim.fn.expand("$HOME/nvim_sessions/") -- folder to look for sessions, must be a valid existing path
            -- sessions_variable = ...           -- defines vim.g[sessions_variable] when a session is loaded
            -- sessions_icon = ...               -- string: shows icon both in the prompt and in the statusline
            -- sessions_prompt = ...             -- fzf prompt string
        },

        autoload = false,    -- whether to autoload sessions in the cwd at startup
        autosave = true,     -- whether to autosave loaded sessions before quitting
        autoswitch = {
            enable = false,  -- whether to enable autoswitch
            exclude_ft = {}, -- list of filetypes to exclude from autoswitch
        },

        save_hook = nil, -- callback, function to execute before saving a session
        -- useful to update or cleanup global variables for example
        post_hook = nil, -- callback, function to execute after loading a session
        -- useful to restore file trees, file managers or terminals
        -- function()
        --     require('FTerm').open()
        --     require('nvim-tree').toggle(false, true)
        -- end

        fzf_winopts = {
            -- any valid fzf-lua winopts options, for instance
            width = 0.5,
            preview = {
                vertical = "right:30%"
            }
        }
    })
end

return M
