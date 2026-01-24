return {
    "burneikis/nodejumper.nvim",
    event = "VeryLazy",
    opts = {
      -- dim_background = false,
    },
    config = function(_, opts)
      require("nodejumper").setup(opts)
      vim.api.nvim_set_hl(0, "NodejumperLabel", { fg = "#7aa2f7", bold = true }) -- tokyonight blue highlight
    end,
    keys = {
      { "S", mode = { "n", "x", "o" }, function() require("nodejumper").jump() end, desc = "Jump to treesitter node" },
    },
}
