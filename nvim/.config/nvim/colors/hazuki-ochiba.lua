-- Hazuki Ochiba
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "ochiba"

local c = {
  bg_main    = "#1e1812",
  bg_ui      = "#26201a",
  bg_hl      = "#312820",
  bg_sel     = "#3d3025",
  fg         = "#ddd0c0",
  fg_dim     = "#9a8878",
  fg_subtle  = "#6a5a4a",
  ui_accent  = "#b56d2f",
  ui_border  = "#3a2e22",
  ui_error   = "#c43d10",
  ui_warn    = "#b59a30",
  ui_info    = "#4a9fd4",
  orange     = "#d4843a",
  yellow     = "#c9a84c",
  green      = "#8aab6a",
  blue       = "#4a9fd4",
  cyan       = "#5ec4a0",
  purple     = "#7d6ab0",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hi("Normal",          { fg = c.fg,        bg = c.bg_main })
hi("NormalFloat",     { fg = c.fg,        bg = c.bg_ui })
hi("CursorLine",      { bg = c.bg_hl })
hi("CursorLineNr",    { fg = c.ui_accent, bold = true })
hi("LineNr",          { fg = c.fg_subtle })
hi("SignColumn",      { bg = c.bg_main })
hi("ColorColumn",     { bg = c.bg_ui })
hi("Visual",          { bg = c.bg_sel })
hi("Search",          { fg = c.bg_main,   bg = c.ui_accent })
hi("IncSearch",       { fg = c.bg_main,   bg = c.yellow })
hi("MatchParen",      { fg = c.cyan,      bold = true })
hi("Pmenu",           { fg = c.fg,        bg = c.bg_ui })
hi("PmenuSel",        { fg = c.fg,        bg = c.bg_sel })
hi("PmenuSbar",       { bg = c.bg_ui })
hi("PmenuThumb",      { bg = c.ui_accent })
hi("StatusLine",      { fg = c.fg,        bg = c.bg_ui })
hi("StatusLineNC",    { fg = c.fg_dim,    bg = c.bg_ui })
hi("WinSeparator",    { fg = c.ui_border })
hi("FloatBorder",     { fg = c.ui_border, bg = c.bg_ui })

-- Syntax
hi("Comment",         { fg = c.fg_subtle, italic = true })
hi("String",          { fg = c.yellow })
hi("Number",          { fg = c.green })
hi("Boolean",         { fg = c.green })
hi("Float",           { fg = c.green })
hi("Keyword",         { fg = c.orange })
hi("Operator",        { fg = c.orange })
hi("Function",        { fg = c.blue })
hi("Identifier",      { fg = c.fg })
hi("Type",            { fg = c.cyan })
hi("Constant",        { fg = c.purple })
hi("PreProc",         { fg = c.purple })
hi("Special",         { fg = c.cyan })
hi("Delimiter",       { fg = c.fg_dim })
hi("Error",           { fg = c.ui_error })

-- Treesitter
hi("@keyword",        { fg = c.orange })
hi("@keyword.return", { fg = c.orange })
hi("@function",       { fg = c.blue })
hi("@method",         { fg = c.blue })
hi("@string",         { fg = c.yellow })
hi("@number",         { fg = c.green })
hi("@boolean",        { fg = c.green })
hi("@type",           { fg = c.cyan })
hi("@constant",       { fg = c.purple })
hi("@variable",       { fg = c.fg })
hi("@comment",        { fg = c.fg_subtle, italic = true })
hi("@punctuation",    { fg = c.fg_dim })
hi("@operator",       { fg = c.orange })

-- LSP diagnostics
hi("DiagnosticError", { fg = c.ui_error })
hi("DiagnosticWarn",  { fg = c.ui_warn })
hi("DiagnosticInfo",  { fg = c.ui_info })
hi("DiagnosticHint",  { fg = c.fg_dim })
