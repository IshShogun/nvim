return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp") -- Ensure this is correctly loaded

    -- Initialize mason
    mason.setup()

    -- Automatically install LSP servers
    mason_lspconfig.setup({
      ensure_installed = { "clangd", "eslint", "html", "cssls" },
    })

    -- Set up LSP server capabilities for autocompletion
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Set up the clangd LSP server with autocompletion capabilities
    lspconfig.clangd.setup({
      capabilities = capabilities,
    })
  end,
}


