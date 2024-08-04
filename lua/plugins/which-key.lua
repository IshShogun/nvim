return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    wk.setup {
      -- Your which-key configuration options
    }

    -- Register mappings
    wk.register({
      t = {
        name = "ChatGPT", -- Group name
        c = { "<cmd>ChatGPT<CR>", "Open ChatGPT" }, -- Keymap for opening ChatGPT
        e = { "<cmd>ChatGPTEditWithInstructions<CR>", "Edit with instructions", mode = { "n", "v" } }, -- Keymap for editing with instructions
      },
    })
  end,
}

