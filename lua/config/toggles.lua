local M = {}

local function toggle_desc(base, is_enabled)
	return function()
		local state = is_enabled() and "●" or "○"
		local padding = 22 - #base - 1
		return base .. string.rep(" ", math.max(padding, 1)) .. state
	end
end

local map = vim.keymap.set

map("n", "<leader>tw", function()
	vim.wo.wrap = not vim.wo.wrap
	print("Line wrap " .. (vim.wo.wrap and "enabled" or "disabled"))
end)
map("n", "<leader>tf", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	print("Autoformat " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
end)
map("n", "<leader>ti", function()
	vim.g.disable_trouble_inline = not vim.g.disable_trouble_inline

	-- Toggle virtual text (inline diagnostics)
	vim.diagnostic.config({
		virtual_text = not vim.g.disable_trouble_inline,
	})

	print("Trouble inline diagnostics " .. (vim.g.disable_trouble_inline and "disabled" or "enabled"))
end)

M.keymaps = {
	{
		"<leader>tw",
		desc = toggle_desc("Line wrap", function() return vim.wo.wrap end),
	},
	{
		"<leader>tf",
		desc = toggle_desc("Autoformat", function() return not vim.g.disable_autoformat end),
	},
	{
		"<leader>ti",
		desc = toggle_desc("Trouble inline", function()
			return not vim.g.disable_trouble_inline
		end),
	},
}

return M
