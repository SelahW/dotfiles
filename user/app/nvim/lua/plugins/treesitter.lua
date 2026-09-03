return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        ignore_install = { "latex" },
        ensure_installed = { "julia", "markdown", "c", "lua", "vim", "vimdoc", "query", "haskell", "nix"},
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        auto_install = false,
        highlight = { enable = true, },
    },
}
