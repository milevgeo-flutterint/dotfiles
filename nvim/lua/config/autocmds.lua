-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local transparent_groups = {
	"Normal",
	"NormalNC",
	"NormalSB",
	"NormalFloat",
	"FloatBorder",
	"SignColumn",
	"SignColumnSB",
	"EndOfBuffer",
	"StatusLine",
	"StatusLineNC",
	"WinSeparator",
	"NeoTreeNormal",
	"NeoTreeNormalNC",
	"NeoTreeEndOfBuffer",
	"NeoTreeWinSeparator",
	"NeoTreeFloatNormal",
	"NeoTreeFloatBorder",
}

local function apply_transparency()
	for _, group in ipairs(transparent_groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none" })
	end
end

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("user_transparent_bg", { clear = true }),
	callback = apply_transparency,
})

apply_transparency()
