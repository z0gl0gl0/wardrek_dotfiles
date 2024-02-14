function ColorMyPencils(color)
	color = color or "gruvbox-material"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#928374", bg = "none" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fabd2f", bg = "none", bold = true })
end

ColorMyPencils()
