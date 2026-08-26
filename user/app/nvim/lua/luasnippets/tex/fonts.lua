-- Abbreviations used in the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else  -- If LS_SELECT_RAW is empty, return a blank insert node
        return sn(nil, i(1))
    end
end
local in_mathzone = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end



return {
    -- alpha
    s({trig=";a", snippetType="autosnippet"},
    t("\\alpha"),
    {condition=in_mathzone}),
    -- beta
    s({trig=";b", snippetType="autosnippet"},
    t("\\beta"),
    {condition=in_mathzone}),
    -- gamma
    s({trig=";g", snippetType="autosnippet"},
    t("\\gamma"),
    {condition=in_mathzone}),
    -- sigma
    s({trig=";s", snippetType="autosnippet"},
    t("\\sigma"),
    {condition=in_mathzone}),
    -- theta
    s({trig=";t", snippetType="autosnippet"},
    t("\\theta"),
    {condition=in_mathzone}),
    -- epsilon
    s({trig=";e", snippetType="autosnippet"},
    t("\\varepsilon"),
    {condition=in_mathzone}),
    -- Italicize
    s({trig = "tii", snippetType="autosnippet", dscr = "Expands 'tii' into textit{}"},
    fmta("\\textit{<>}",
    {
        d(1, get_visual),
    })),
    -- Bold
    s({trig = "bf", snippetType="autosnippet", dscr = "Expands 'bf' into textbf{}"},
    fmta("\\textbf{<>}",
    {
        d(1, get_visual),
    }))
}

