return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			win = {
				border = "rounded",
			},
			layout = {
				height = { min = 4, max = 15 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 0,
				align = "left",
			},
		},
		keys = {},
	},
}
