local M = {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    lazy = false
    -- See `:help lualine.txt`
}

function M.config()
    local default_config = {
        options = {
            theme = "onedark",
            icons_enabled = true,
            globalstatus = true,
            component_separators = { left = '|', right = '|'},
            section_separators = { left = '', right = ''},
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {
                {'filename', path = 1}, -- path 0=filename, 1=relative path, 2=fullpath
            },
            lualine_c = {'branch', 'diff', 'diagnostics'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'},
        }
    }

    require("lualine").setup(default_config)
end

return M
