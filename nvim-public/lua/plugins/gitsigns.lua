local M = {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = "BufReadPre",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        change = { text = '~' },
        add = { text = '+' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      max_file_length = 20000, -- Disable if file is longer than this (in lines)
      watch_gitdir = { interval = 1000 },
      sign_priority = 6,
      update_debounce = 200,
      status_formatter = nil,
    }

    require("gitsigns").setup(opts)
end

return M
