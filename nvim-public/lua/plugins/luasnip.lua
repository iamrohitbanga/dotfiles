return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    -- version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- do not install jsregexp (optional!).
    -- build = "make install_jsregexp",
    -- jsregexp comes in a submodule which may not be fetchable via a proxy
    -- see https://github.com/folke/lazy.nvim/issues/1295
    submodules = false,
}
