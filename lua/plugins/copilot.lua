return {
  -- Disable the default copilot extra if enabled
  { "zbirenbaum/copilot-cmp", enabled = false },

  -- Copilot with inline suggestions only
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          accept_word = "<M-w>",
          accept_line = "<M-e>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-c>",
        },
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        markdown = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        ["."] = false,
      },
    },
  },

  -- Make sure cmp doesn't conflict with Tab
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<Tab>"] = cmp.config.disable,
        ["<S-Tab>"] = cmp.config.disable,
      })
    end,
  },
}
