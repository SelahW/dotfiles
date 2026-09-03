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
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)

        local nvimTreeFocusOrToggle = function()
            local nvimTree = require("nvim-tree.api")
            local currentBuf = vim.api.nvim_get_current_buf()
            local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
            if currentBufFt == "NvimTree" then
                nvimTree.tree.toggle()
            else
                nvimTree.tree.focus()
            end
        end
        vim.keymap.set("n", "<C-n>", nvimTreeFocusOrToggle)
    end
}
