return {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
       require("mini.surround").setup({
           mappings = {
               add = "s",
               delete = "sd",
               replace = "sr",
               find = "",
               highlight = "",
               update_n_lines = "",
               suffix_last = "",
               suffix_next = "",
           },
       })
       vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
   end
}
