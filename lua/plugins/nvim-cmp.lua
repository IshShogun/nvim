-- plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
    "hrsh7th/cmp-buffer",    -- Buffer source for nvim-cmp
    "hrsh7th/cmp-path",      -- Path source for nvim-cmp
  },
  config = function()
    local cmp = require("cmp")
    
    cmp.setup({
      -- Enable completion in these modes
      enabled = function()
        return vim.api.nvim_get_mode().mode == "i" -- Only enable in insert mode
      end,
      
      -- Window appearance
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      
      -- Key mappings
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
      },
      
      -- Completion sources (in priority order)
      sources = {
        { name = 'nvim_lsp' },  -- from language server
        { name = 'buffer' },    -- from current buffer
        { name = 'path' },      -- from file system path
      },
      
      -- Simple formatting
      formatting = {
        format = function(entry, vim_item)
          -- Add source name to the menu
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          
          return vim_item
        end,
      },
    })
  end
}
