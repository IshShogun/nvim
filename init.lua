require("config.lazy")
require("mason").setup()

--vim options
vim.opt.number = true
-- Set reasonable tab settings
vim.opt.tabstop =  2      -- Width of a tab character
vim.opt.softtabstop = 2   -- Number of spaces inserted when you press Tab
vim.opt.shiftwidth = 2    -- Number of spaces for indentation
vim.opt.expandtab = true  -- Use spaces instead of tabs


vim.opt.relativenumber = true

-- Map <leader>pv to :Ex
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', ':Ex<CR>', { noremap = true, silent = true })


---- transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
