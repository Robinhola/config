local set = vim.keymap.set

set("n", "<space>d", function() vim.diagnostic.open_float() end, { desc = "Open the float diagnostics" })
set("n", "<space><cr>", function() vim.diagnostic.goto_next() end, { desc = "Goto next diagnostics" })

set("n", "<space>x", ":.lua<CR>")
set("v", "<space>x", ":lua<CR>")
