vim.g.mapleader = " "

-- go to complete terminal tree view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Remap :NvimTreeOpen to <leader>o
vim.api.nvim_set_keymap('n', '<leader>o', ':NvimTreeOpen<CR>', { noremap = true, silent = true })

-- Remap :NvimTreeClose to <leader>c
vim.api.nvim_set_keymap('n', '<leader>c', ':NvimTreeClose<CR>', { noremap = true, silent = true })


-- Remap yank to clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"*y', { noremap = true, silent = true })
