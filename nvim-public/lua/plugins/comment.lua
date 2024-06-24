return {
    -- use gc, gb to add line comment, and block comments respectively
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
        require("Comment").setup()
    end,
}
