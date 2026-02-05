-- plugins/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-lspconfig.nvim"
  },
  config = function()
    -- Set up each LSP server
    local lspconfig = require("lspconfig")
    
    -- Default capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    
    -- Add completion capabilities if nvim-cmp is installed
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end
    
    -- Configure servers
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" } -- Recognize 'vim' global in Lua
          }
        }
      }
    })
    
    lspconfig.tsserver.setup({
      capabilities = capabilities
    })
    
    lspconfig.gopls.setup({
      capabilities = capabilities
    })
    
    lspconfig.clangd.setup({
      capabilities = capabilities
    })

    lspconfig.basedpyright.setup({
      capabilities = capabilities
    })

    -- Set up key bindings for LSP functions
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        
        -- Go to definition, references, etc.
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        
        -- Hover documentation and signature help
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        
        -- Workspace management
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        
        -- Code actions, rename, format
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)

        -- Diagnostics
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      end,
    })
  end
}
