-- Nerd font
vim.g.have_nerd_font = true

-- VimTeX
vim.g.vimtex_compiler_latexmk = {
    aux_dir = function()
        return vim.fn.expand('%:t:r') .. "aux"
    end
}
vim.g.vimtex_view_method = 'zathura_simple'
vim.g.vimtex_zathura_options = '--fork'

-- NvimTree
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

-- Harpoon Setup
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- Move up/down harpoon list
vim.keymap.set("n", "<C-k>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():next() end)

-- LSP Setup
vim.lsp.enable('hls')
vim.lsp.enable('luals')

-- Completion
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<return>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})
-- Luasnip
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/luasnippets/" })
require("luasnip").config.set_config({
    -- Auto snippets
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    update_events = 'TextChanged,TextChangedI',
})
-- Treesitter
require 'nvim-treesitter.config'.setup {
    ignore_install = { "latex" },
    ensure_installed = { "julia", "python", "c", "lua", "vim", "vimdoc", "query", "haskell" },
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = false,
    highlight = { enable = true, },
}
