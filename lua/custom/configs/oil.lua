local M = {
	default_file_explorer = false,
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["="] = "actions.select",
		["<C-v>"] = "actions.select_vsplit",
		["<C-s>"] = "actions.select_split",
		["<C-t>"] = "actions.select_tab",
		["<C-p>"] = "actions.preview",
		["q"] = "actions.close",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["H"] = "actions.toggle_hidden",
	},
	use_default_keymaps = false,
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, _)
			local always_hidden_names = {
				".DS_Store",
				".git",
				".idea",
				".mypy_cache",
				"__pycache__",
				".pytest_cache",
				".ruff_cache",
			}
			for _, always_hidden_name in ipairs(always_hidden_names) do
				if name == always_hidden_name then
					return true
				end
			end

			local always_hidden_name_starts = {
				".coverage",
			}
			for _, always_hidden_name_start in ipairs(always_hidden_name_starts) do
				if vim.startswith(name, always_hidden_name_start) then
					return true
				end
			end
		end,
	},
}

return M
