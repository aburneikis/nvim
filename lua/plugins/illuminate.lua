return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			providers = { "treesitter", "regex" },
			delay = 100,
		})
	end,
}
