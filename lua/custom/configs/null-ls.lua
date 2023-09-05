local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
	sources = {
		null_ls.builtins.diagnostics.mypy.with({
			extra_args = function()
				local virtual = os.getenv("VIRTUAL_ENV") or "/usr"
				return { "--python-executable", virtual .. "/bin/python3" }
			end,
		}),
		null_ls.builtins.diagnostics.ruff,
		null_ls.builtins.formatting.black.with({
			-- Using '~/.black.toml' in the configuration path below doesn't work for some reason
			-- Once https://github.com/psf/black/issues/1826 is solved, the need for the extra arguments
			-- and for the `~/.black.toml` file will disappear
			extra_args = { "--config", "/Users/clement/.black.toml" },
		}),
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"json",
				"markdown",
				"yaml",
			},
		}),
		null_ls.builtins.formatting.ruff,
		null_ls.builtins.formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
}

return opts
