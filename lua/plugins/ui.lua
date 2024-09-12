return {
	-- Key Mappings Hint
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			win = {
				border = "rounded",
			padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
			},
			layout = {
				width = { min = 20, max = 50 }, -- min and max width of the columns
				height = { min = 4, max = 15 }, -- min and max height of the columns
				spacing = 0,
			},
		},
		keys = {},
	},
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				icons_enabled = true,
				-- theme = 'dracula-nvim',
				theme = 'catppuccin',
				component_separators = '│',
				section_separators = { left = "", right = "" },
				ignore_focus = {},
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				-- lualine_b = { "string.format('R:%3d C:%-2d', vim.fn.line('.'), vim.fn.virtcol('.'))" },
				lualine_b = {
					{
						function()
							local loc = require("lualine.components.location")()
							local sel = require("lualine.components.selectioncount")()
							if sel ~= "" then
								loc = loc .. " (" .. sel .. " sel)"
							end
							return loc
						end,
						separator = { right = "" },
						left_padding = 2,
					},
				},
				lualine_c = { 'filename' },
				lualine_x = {},
				lualine_y = { 'branch', 'diff', 'diagnostics' },
				lualine_z = {
					{ "filesize", separator = { right = "" }, left_padding = 2 },
				},
			},
			extensions = {
				"neo-tree",
			},
		},
	},
}
