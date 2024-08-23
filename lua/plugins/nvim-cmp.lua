return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/vim-vsnip", -- Optional: For snippet support
    "hrsh7th/cmp-vsnip", -- Optional: For snippet completion
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }, {
        { name = "buffer" },
      }),
    })
  end,
}

