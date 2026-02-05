return {
	"gelguy/wilder.nvim",
	enabled = false, -- Disabled in favor of cmp-cmdline
	event = "CmdlineEnter",
	config = function()
		local wilder = require("wilder")
		wilder.setup({ modes = { ":", "/", "?" } })

		-- Configure popup menu renderer with positioning
		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				highlighter = wilder.basic_highlighter(),
				border = "rounded",
				pumblend = 20,
			}))
		)
	end,
}
