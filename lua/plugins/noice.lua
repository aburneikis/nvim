return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		cmdline = {
			enabled = true,
			-- view handled by command_palette preset
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
			},
		},
		messages = {
			enabled = true,
			view = "mini", -- use mini view for messages
			view_error = "mini",
			view_warn = "mini",
		},
		popupmenu = {
			enabled = false, -- cmp handles cmdline completion
		},
		lsp = {
			progress = {
				enabled = false, -- Use fidget.nvim instead
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			command_palette = true, -- use centered command palette
			long_message_to_split = true,
			lsp_doc_border = true,
		},
	},
}
