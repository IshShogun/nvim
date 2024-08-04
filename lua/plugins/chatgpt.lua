return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim"
  },  -- Added comma here
  config = function()
    require("chatgpt").setup({
      openai_params = {
        model = "gpt-4o",
        max_tokens = 4096,
        temperature = 0.2,
      },
      api_key_cmd = nil, -- remove if setting via environment variable
    })
  end,
}



