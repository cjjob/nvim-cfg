local M = {}

local colors = {
	black = "#000000",
	silver = "#cccccc",
	jet = "#696969",
	mint = "#6FC392",
}

local ui = { bg = colors.black, fg = colors.silver }
local code = { bg = colors.black, fg = colors.silver }
local comment = { bg = colors.black, fg = colors.jet, italic = true }
local accent = { bg = colors.black, fg = colors.mint }

local function set(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.setup_colorscheme()
	-- Clear existing highlights
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	local ui_groups = {
		"ColorColumn",
		"Conceal",
		"CursorColumn",
		"CursorLine",
		"CursorLineNr",
		"Directory",
		"EndOfBuffer",
		"ErrorMsg",
		"FloatBorder",
		"FloatTitle",
		"FoldColumn",
		"Folded",
		"IncSearch",
		"LineNr",
		"MatchParen",
		"ModeMsg",
		"MoreMsg",
		"MsgArea",
		"MsgSeparator",
		"NonText",
		"Normal",
		"NormalFloat",
		"NormalNC",
		"Pmenu",
		"PmenuSbar",
		"PmenuSel",
		"PmenuThumb",
		"Question",
		"QuickFixLine",
		"Search",
		"SignColumn",
		"SpecialKey",
		"StatusLine",
		"StatusLineNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"Title",
		"VertSplit",
		"Visual",
		"WarningMsg",
		"Whitespace",
		"WildMenu",
		"WinBar",
		"WinBarNC",
		"WinSeparator",
	}
	for _, group in ipairs(ui_groups) do
		set(group, ui)
	end

	set("Comment", comment)

	local syntax_groups = {
		"Boolean",
		"Character",
		"Conditional",
		"Constant",
		"Debug",
		"Define",
		"Delimiter",
		"Error",
		"Exception",
		"Float",
		"Function",
		"Identifier",
		"Ignore",
		"Include",
		"Keyword",
		"Label",
		"Macro",
		"Number",
		"Operator",
		"PreCondit",
		"PreProc",
		"Repeat",
		"Special",
		"SpecialChar",
		"SpecialComment",
		"Statement",
		"StorageClass",
		"String",
		"Structure",
		"Tag",
		"Todo",
		"Type",
		"Typedef",
		"Underlined",
	}
	for _, group in ipairs(syntax_groups) do
		set(group, code)
	end

	local accent_groups = {
		-- LSP/Diagnostics
		"DiagnosticError",
		"DiagnosticWarn",
		"DiagnosticInfo",
		"DiagnosticHint",
		"DiagnosticOk",
		"DiagnosticVirtualTextError",
		"DiagnosticVirtualTextWarn",
		"DiagnosticVirtualTextInfo",
		"DiagnosticVirtualTextHint",
		"DiagnosticVirtualTextOk",
		"DiagnosticUnderlineError",
		"DiagnosticUnderlineWarn",
		"DiagnosticUnderlineInfo",
		"DiagnosticUnderlineHint",
		"DiagnosticUnderlineOk",
		"LspReferenceText",
		"LspReferenceRead",
		"LspReferenceWrite",
		"LspSignatureActiveParameter",
		-- WhichKey
		"WhichKey",
		"WhichKeyGroup",
		"WhichKeySeparator",
		"WhichKeyDesc",
		"WhichKeyFloat",
		"WhichKeyBorder",
	}
	for _, group in ipairs(accent_groups) do
		set(group, accent)
	end
end

return M
