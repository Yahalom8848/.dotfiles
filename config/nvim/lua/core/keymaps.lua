vim.g.mapleader = " "

vim.keymap.set("n", "<leader>l", vim.cmd.Lazy, { desc = "[l]azy" })

vim.keymap.set("n", "<leader>s", vim.cmd.w, { desc = "[s]ave" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
