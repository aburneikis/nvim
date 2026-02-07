return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = function()
		local noice_search = {
			function() return require("noice").api.status.search.get() end,
			cond = function() return package.loaded["noice"] and require("noice").api.status.search.has() end,
		}

		return {
			options = {
				theme = "tokyonight",
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 0 } },
				lualine_x = {
					noice_search,
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			winbar = {
				lualine_c = { { "filename", path = 1 } },
			},
			inactive_winbar = {
				lualine_c = { { "filename", path = 1 } },
			},
			extensions = { "lazy", "trouble" },
		}
	end,
}
