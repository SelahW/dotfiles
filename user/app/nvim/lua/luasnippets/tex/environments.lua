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
local in_text = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 0
end
local in_mathzone = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
    -- Align
    s({trig="ali", snippetType = "autosnippet", dscr="Expands 'ali' into an align* environment"},
    fmta([[
    \begin{align*}
    <>&<>\\
    <>&<>\\
    <>&<>\\
    \end{align*}
    ]],
    {
        i(1),
        i(2),
        i(3),
        rep(2),
        i(4),
        rep(2)
    }),
    {condition=in_text}),
    -- Arbitrary environment
    s({trig="env", snippetType="autosnippet"},
    fmta([[
    \begin{<>}
    <>
    \end{<>}
    ]],
    {
        i(1),
        i(2),
        rep(1)  -- repeats insert node i(1)
    }),
    {condition=in_text}),
    -- Example
    s({trig="exm", snippetType="autosnippet"},
    fmta([[
    \begin{example}
    <>
    \end{example}
    ]],
    {
        i(1),
    }),
    {condition=in_text}),
    -- Itemize
    s({trig="-i", snippetType="autosnippet"},
    fmta([[
    \begin{itemize}
        \item <>
        \item <>
        \item <>
    \end{itemize}
    ]],
    {
        i(1),
        i(2),
        i(3)
    }),
    {condition=in_text}),
    -- Enumerate
    s({trig="-e", snippetType="autosnippet"},
    fmta([[
    \begin{enumerate}
        \item <>
        \item <>
        \item <>
    \end{enumerate}
    ]],
    {
        i(1),
        i(2),
        i(3)
    }),
    {condition=in_text}),
    -- Alphabetize
    s({trig="-a", snippetType="autosnippet"},
    fmta([[
    \begin{enumerate}[label=(\alph*).]
        \item <>
        \item <>
        \item <>
    \end{enumerate}
    ]],
    {
        i(1),
        i(2),
        i(3)
    }),
    {condition=in_text}),
    -- Theorem
    s({trig="thm", snippetType="autosnippet"},
    fmta([[
    \begin{theorem}
    <>
    \end{theorem}
    ]],
    {
        i(1),
    }),
    {condition=in_text}),
    -- Proof
    s({trig="pf", snippetType="autosnippet"},
    fmta([[
    \begin{proof}
    <>
    \end{proof}
    ]],
    {
        i(1),
    }),
    {condition=in_text}),
    -- Matrix
    s({trig="matr", snippetType="autosnippet"},
    fmta([[
    \begin{bmatrix}
    <> & <> \\
    <> & <> \\
    \end{bmatrix}
    ]],
    {
        i(1),
        i(2),
        i(3),
        i(4)
    }),
    {condition = in_mathzone}),
    -- Cases
    s({trig="cas", snippetType="autosnippet"},
    fmta([[
    \begin{cases}
    <> & \text{if <>}\\
    <> & \text{if <>}\\
    \end{cases}
    ]],
    {
        i(1),
        i(2),
        i(3),
        i(4)
    }),
    {condition = in_mathzone}),
}
