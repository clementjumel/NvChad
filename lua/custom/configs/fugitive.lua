local group = vim.api.nvim_create_augroup("Fugitive", { clear = false })
local pattern = { "fugitive", "fugitiveblame" }

vim.api.nvim_create_autocmd("FileType", {
	command = "nmap <buffer> q gq",
	group = group,
	pattern = pattern,
})
vim.api.nvim_create_autocmd("FileType", {
	command = "nmap <buffer> <CR> O",
	group = group,
	pattern = pattern,
})
vim.api.nvim_create_autocmd("FileType", {
	command = "nmap <buffer> <C-p> (",
	group = group,
	pattern = pattern,
})
vim.api.nvim_create_autocmd("FileType", {
	command = "nmap <buffer> <C-n> )",
	group = group,
	pattern = pattern,
})
vim.api.nvim_create_autocmd("FileType", {
	command = "nmap <buffer> <C-v> gO",
	group = group,
	pattern = pattern,
})
vim.api.nvim_create_autocmd("FileType", {
	command = "nmap <buffer> <C-s> o",
	group = group,
	pattern = pattern,
})
