return { -- Fuzzy finder for files
  "ibhagwan/fzf-lua",
  opts = {
    files = {
      previewer = false,
    },
    -- This is required to support older version of fzf on remote devboxes
    fzf_opts = { ["--border"] = false },
    -- These settings reduce lag from slow git operations
    global_git_icons = false,
    git = {
      files = {
        previewer = false,
      },
    },
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
    vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "[F]ind [F]iles" })
  end,
}
