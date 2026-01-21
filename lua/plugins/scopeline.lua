return {
	-- Static indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "BufReadPost",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			indent = {
				char = "│",
			},
			scope = {
				enabled = false, -- We use mini.indentscope for this
			},
		},
	},

	-- Animated scope line
	{
		"echasnovski/mini.indentscope",
		event = "BufReadPost",
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			local excluded_filetypes = {
				"help",
				"dashboard",
				"snacks_dashboard",
				"lazy",
				"mason",
				"notify",
				"oil",
				"trouble",
			}

			vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
				callback = function()
					if vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then vim.b.miniindentscope_disable = true end
				end,
			})
		end,
	},
}
