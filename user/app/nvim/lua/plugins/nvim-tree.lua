return {
    'nvim-tree/nvim-tree.lua',
    version = "*",
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        sort = {sorter = "case_sensitive"},
        view = {width = 30, side = "right"},
        renderer = {
            indent_markers = {
                enable = true
            },
            group_empty = true,
            highlight_git = true,
            icons = {
                show = {
                    git = true,
                }
            }
        }
    }
}
