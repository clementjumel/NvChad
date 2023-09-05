vim.opt.relativenumber = true
vim.opt.colorcolumn = "100"
vim.opt.scrolloff = 3

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = false }),
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 400,
			on_visual = true,
		})
	end,
})
