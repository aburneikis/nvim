return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"angular",
				"bash",
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"tsx",
				"typescript",
				"yaml",
			},
		})

		-- Enable treesitter-based highlighting (built into Neovim 0.11+)
		vim.api.nvim_create_autocmd("FileType", {
			callback = function() pcall(vim.treesitter.start) end,
		})
	end,
}
