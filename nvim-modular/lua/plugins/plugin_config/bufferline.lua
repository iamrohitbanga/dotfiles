-- list all buffers at the top
return {
    "akinsho/nvim-bufferline.lua",
    lazy = false,
    enabled = false, -- keep disabled for now, confusion with tabs
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            view = "multiwindow",
            numbers = function(opts)
                return string.format("%s", opts.ordinal)
            end,
            modified_icon = "●",
            max_prefix_length = 5,
            tab_size = 18,
            diagnostics = "nvim_lsp",
            separator_style = { "|", "" },
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                },
            },
        },
    },
}
