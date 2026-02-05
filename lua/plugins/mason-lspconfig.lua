-- plugins/mason-lspconfig.lua
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "mason.nvim"
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",      -- Lua
        "tsserver",    -- TypeScript/JavaScript
        "gopls",       -- Go
        "clangd",      -- C/C++
        "basedpyright" -- Python
      }
    })
  end
}
