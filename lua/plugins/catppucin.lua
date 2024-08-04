return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        local frappe = require("catppuccin.palettes").get_palette("frappe")

        require("catppuccin").setup({
            flavour = "frappe",
            transparent_background = true,
            color_overrides = {},
            default_integrations = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                }
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })
	vim.cmd.colorscheme "catppuccin"
    end,
}


