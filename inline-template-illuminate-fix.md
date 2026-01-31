# vim-illuminate Angular Component Fix

## Problem

vim-illuminate's LSP provider highlights entire inline templates in Angular component files (`*.component.ts`), making the highlighting unusable.

## Solution

Disable the LSP provider specifically for Angular component files while keeping it enabled for other files:

```lua
return {
    "RRethy/vim-illuminate",
    config = function()
        local illuminate = require("illuminate")

        illuminate.configure({
            providers = { "lsp", "treesitter", "regex" },
            delay = 100,
        })

        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*.component.ts",
            callback = function()
                illuminate.configure({
                    providers = { "treesitter", "regex" },
                    delay = 100,
                })
            end,
        })

        -- Restore LSP for other TS files
        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*.ts",
            callback = function()
                if not vim.fn.expand("%"):match("%.component%.ts$") then
                    illuminate.configure({
                        providers = { "lsp", "treesitter", "regex" },
                        delay = 100,
                    })
                end
            end,
        })
    end,
}
```

## Alternative: Disable LSP globally

If treesitter provides good enough highlighting, you can simply remove LSP:

```lua
providers = { "treesitter", "regex" },
```
