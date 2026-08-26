vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
-- Open terminal in split buffer
vim.keymap.set("n", "<leader>t", "<cmd>vsplit<CR><C-w>l<cmd>terminal<CR>i")
-- Paste without overwriting register
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- Copy line to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Delete without overwriting register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- Unbind Q
vim.keymap.set("n", "Q", "<nop>")
-- Format buffer depending on lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- Move up/down list entries
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- Replace all instances of word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
-- Map jk to expand or jump through snippets
vim.cmd [[
imap <silent><expr> jk luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : 'jk'
]]
vim.cmd [[
smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
]]
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>gg', builtin.live_grep, {})
-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
