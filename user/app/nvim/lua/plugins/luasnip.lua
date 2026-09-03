return {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    event = "InsertEnter",
    config = function ()
        require("luasnip").config.set_config({
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
            update_events = 'TextChanged,TextChangedI',
        })
        require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/lua/luasnippets/" })
    end,
}
